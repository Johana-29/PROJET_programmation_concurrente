-- Création de la base de données
CREATE DATABASE RestaurantManagement;
USE RestaurantManagement;

-- Table pour les catégories de recettes
CREATE TABLE CategoriesRecettes (
    CategorieID INT AUTO_INCREMENT PRIMARY KEY,
    NomCategorie VARCHAR(100) NOT NULL -- Exemple : Entrée, Plat, Dessert
);

-- Table pour les recettes
CREATE TABLE Recettes (
    RecetteID INT AUTO_INCREMENT PRIMARY KEY,
    NomRecette VARCHAR(100) NOT NULL,
    CategorieID INT NOT NULL, -- Lien vers la catégorie
    NombrePersonnes INT NOT NULL,
    TempsPreparation TIME NOT NULL, -- Temps de préparation en heures:minutes:secondes
    TempsCuisson TIME,
    TempsRepos TIME,
    FOREIGN KEY (CategorieID) REFERENCES CategoriesRecettes(CategorieID)
);

-- Table pour les ingrédients des recettes
CREATE TABLE IngredientsRecettes (
    IngredientID INT AUTO_INCREMENT PRIMARY KEY,
    RecetteID INT NOT NULL, -- Lien vers la recette
    NomIngredient VARCHAR(100) NOT NULL,
    Quantite VARCHAR(50), -- Exemple : "200g", "2 cuillères"
    FOREIGN KEY (RecetteID) REFERENCES Recettes(RecetteID)
);

-- Table pour les étapes des recettes
CREATE TABLE EtapesRecettes (
    EtapeID INT AUTO_INCREMENT PRIMARY KEY,
    RecetteID INT NOT NULL, -- Lien vers la recette
    OrdreEtape INT NOT NULL, -- Numéro de l'étape
    DescriptionEtape TEXT NOT NULL, -- Description détaillée de l'étape
    FOREIGN KEY (RecetteID) REFERENCES Recettes(RecetteID)
);

-- Table pour les employés
CREATE TABLE Employes (
    EmployeID INT AUTO_INCREMENT PRIMARY KEY,
    NomEmploye VARCHAR(100) NOT NULL,
    Role ENUM('MaitreHotel', 'ChefRang', 'Serveur', 'CommisSalle', 'ChefCuisine', 'ChefPartie', 'CommisCuisine', 'Plongeur') NOT NULL,
    Salaire DECIMAL(10, 2),
    HoraireEmploye ENUM('Matin', 'Soir'),
    SecteurID INT NULL,
    FOREIGN KEY (SecteurID) REFERENCES Secteurs(SecteurID)
);

-- Table pour les secteurs (carrés) dans la salle
CREATE TABLE Secteurs (
    SecteurID INT AUTO_INCREMENT PRIMARY KEY,
    NomSecteur VARCHAR(50),
    NombreDeTables INT
);

-- Table pour les tables
CREATE TABLE Tables (
    TableID INT AUTO_INCREMENT PRIMARY KEY,
    Capacite INT NOT NULL,
    SecteurID INT NOT NULL,
    Statut ENUM('Libre', 'Occupée', 'Réservée') DEFAULT 'Libre',
    FOREIGN KEY (SecteurID) REFERENCES Secteurs(SecteurID)
);

-- Table pour les clients
CREATE TABLE Clients (
    ClientID INT AUTO_INCREMENT PRIMARY KEY,
    NomClient VARCHAR(100),
    ReservationID INT NOT NULL,
    FOREIGN KEY (ReservationID) REFERENCES Reservations(ReservationID)
);

-- Table pour les réservations
CREATE TABLE Reservations (
    ReservationID INT AUTO_INCREMENT PRIMARY KEY,
    NomClient VARCHAR(100) NOT NULL,
    DateReservation DATE NOT NULL,
    HeureReservation TIME NOT NULL,
    NombrePersonnes INT NOT NULL,
    TableID INT NOT NULL,
    FOREIGN KEY (TableID) REFERENCES Tables(TableID)
);

-- Table pour les stocks
CREATE TABLE Inventaire (
    ProduitID INT AUTO_INCREMENT PRIMARY KEY,
    NomProduit VARCHAR(100) NOT NULL,
    Categorie ENUM('Surgelé', 'Frais', 'LongueConservation') NOT NULL,
    Quantite INT NOT NULL,
    DateExpiration DATE
);

-- Table pour les commandes
CREATE TABLE Commandes (
    CommandeID INT AUTO_INCREMENT PRIMARY KEY,
    TableID INT NOT NULL,
    HeureCommande DATETIME NOT NULL,
    Statut ENUM('EnAttente', 'EnPréparation', 'Servie') DEFAULT 'EnAttente',
    FOREIGN KEY (TableID) REFERENCES Tables(TableID)
);

-- Table pour les plats dans les commandes
CREATE TABLE DetailsCommandes (
    DetailsID INT AUTO_INCREMENT PRIMARY KEY,
    CommandeID INT NOT NULL,
    NomPlat VARCHAR(100),
    NombrePlats INT,
    FOREIGN KEY (CommandeID) REFERENCES Commandes(CommandeID)
);

-- Table pour les équipements
CREATE TABLE Equipements (
    EquipementID INT AUTO_INCREMENT PRIMARY KEY,
    NomEquipement VARCHAR(100) NOT NULL,
    Quantite INT,
    Localisation ENUM('Cuisine', 'Salle') NOT NULL
);

-- Suivi des tâches (logs des flux d'activités)
CREATE TABLE LogsTaches (
    TacheID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeID INT NOT NULL,
    Description TEXT, -- Détail de la tâche effectuée
    Timestamp DATETIME DEFAULT CURRENT_TIMESTAMP, -- Horodatage automatique
    FOREIGN KEY (EmployeID) REFERENCES Employes(EmployeID)
);

-- Table pour les ingrédients (relier recettes et stocks)
CREATE TABLE IngredientsInventaire (
    IngredientID INT AUTO_INCREMENT PRIMARY KEY,
    RecetteID INT NOT NULL,
    ProduitID INT NOT NULL, -- Lien vers la table Inventaire
    Quantite INT NOT NULL, -- Quantité nécessaire par préparation
    FOREIGN KEY (RecetteID) REFERENCES Recettes(RecetteID),
    FOREIGN KEY (ProduitID) REFERENCES Inventaire(ProduitID)
);
