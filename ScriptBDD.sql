-- Création de la base de données
CREATE DATABASE RestaurantManagement;
USE RestaurantManagement;

-- Table pour les employés
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Position ENUM('MaitreHotel', 'ChefRang', 'Serveur', 'CommisSalle', 'ChefCuisine', 'ChefPartie', 'CommisCuisine', 'Plongeur') NOT NULL,
    Salary DECIMAL(10, 2),
    Shift ENUM('Matin', 'Soir'),
    SectorID INT NULL
);

-- Table pour les secteurs (carrés) dans la salle
CREATE TABLE Sectors (
    SectorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    NumberOfTables INT
);

-- Table pour les tables
CREATE TABLE Tables (
    TableID INT AUTO_INCREMENT PRIMARY KEY,
    Capacity INT NOT NULL,
    SectorID INT NOT NULL,
    Status ENUM('Libre', 'Occupée', 'Réservée') DEFAULT 'Libre',
    FOREIGN KEY (SectorID) REFERENCES Sectors(SectorID)
);

-- Table pour les clients
CREATE TABLE Clients (
    ClientID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    ReservationID INT NULL,
    FOREIGN KEY (ReservationID) REFERENCES Reservations(ReservationID)
);

-- Table pour les réservations
CREATE TABLE Reservations (
    ReservationID INT AUTO_INCREMENT PRIMARY KEY,
    ClientName VARCHAR(100) NOT NULL,
    ReservationDate DATE NOT NULL,
    ReservationTime TIME NOT NULL,
    NumberOfPeople INT NOT NULL,
    TableID INT NOT NULL,
    FOREIGN KEY (TableID) REFERENCES Tables(TableID)
);

-- Table pour les stocks
CREATE TABLE Inventory (
    ItemID INT AUTO_INCREMENT PRIMARY KEY,
    ItemName VARCHAR(100) NOT NULL,
    Category ENUM('Surgelé', 'Frais', 'LongueConservation') NOT NULL,
    Quantity INT NOT NULL,
    ExpirationDate DATE
);

-- Table pour les commandes
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    TableID INT NOT NULL,
    OrderDateTime DATETIME NOT NULL,
    Status ENUM('EnAttente', 'EnPréparation', 'Servie') DEFAULT 'EnAttente',
    FOREIGN KEY (TableID) REFERENCES Tables(TableID)
);

-- Table pour les plats dans les commandes
CREATE TABLE OrderDetails (
    DetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    DishName VARCHAR(100),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Table pour les équipements
CREATE TABLE Equipment (
    EquipmentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Quantity INT,
    Location ENUM('Cuisine', 'Salle') NOT NULL
);

-- Ajout des recettes
CREATE TABLE Recipes (
    RecipeID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    PreparationSteps TEXT NOT NULL,
    TimeToPrepare INT NOT NULL, -- Temps de préparation en minutes
    TimeToCook INT, -- Temps de cuisson en minutes
    TimeToRest INT -- Temps de repos en minutes
);

-- Ajout des étapes des recettes pour gestion fine
CREATE TABLE RecipeSteps (
    StepID INT AUTO_INCREMENT PRIMARY KEY,
    RecipeID INT NOT NULL,
    StepDescription TEXT NOT NULL,
    OrderNumber INT NOT NULL, -- Numéro de l'étape
    CanBeParallelized BOOLEAN DEFAULT FALSE, -- Indique si l'étape peut être faite en parallèle
    FOREIGN KEY (RecipeID) REFERENCES Recipes(RecipeID)
);

-- Suivi des tâches (logs des flux d'activités)
CREATE TABLE TaskLogs (
    TaskID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT,
    Description TEXT, -- Détail de la tâche effectuée
    Timestamp DATETIME DEFAULT CURRENT_TIMESTAMP, -- Horodatage automatique
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Exemple de table pour relier recettes et stocks (gestion des ingrédients)
CREATE TABLE RecipeIngredients (
    RecipeIngredientID INT AUTO_INCREMENT PRIMARY KEY,
    RecipeID INT NOT NULL,
    ItemID INT NOT NULL, -- Lien vers la table Inventory
    Quantity INT NOT NULL, -- Quantité nécessaire par préparation
    FOREIGN KEY (RecipeID) REFERENCES Recipes(RecipeID),
    FOREIGN KEY (ItemID) REFERENCES Inventory(ItemID)
);
