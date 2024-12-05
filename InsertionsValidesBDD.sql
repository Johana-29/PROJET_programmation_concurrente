-- Insertion des catégories de recettes
INSERT INTO CategoriesRecettes (NomCategorie)
VALUES 
('Entrée'),
('Plat'),
('Dessert');

-- Insertion des recettes
INSERT INTO Recettes (NomRecette, CategorieID, NombrePersonnes, TempsPreparation, TempsCuisson, TempsRepos)
VALUES
('Feuilleté au crabe', 1, 4, '00:10:00', '00:20:00', NULL),
('Tiramisu', 3, 4, '00:10:00', NULL, '01:00:00'),
('Blanquette de veau', 2, 5, '00:10:00', '02:00:00', NULL),
('Quiche Lorraine', 1, 6, '00:15:00', '00:35:00', NULL);

-- Insertion des ingrédients pour les recettes
INSERT INTO IngredientsRecettes (RecetteID, NomIngredient, Quantite)
VALUES
(1, 'Pâte feuilletée', '300g'),
(1, 'Chair de crabe', '120g'),
(1, 'Jus de citron', '1'),
(1, 'Persil haché', '3 cuillères à soupe'),
(2, 'Mascarpone', '250g'),
(2, 'Café noir', '1/2 litre'),
(2, 'Biscuits à la cuillère', '24'),
(2, 'Cacao en poudre', '30g'),
(3, 'Viande de veau', '1kg'),
(3, 'Bouillon de poule', '1 cube'),
(3, 'Carottes', '2'),
(3, 'Vin blanc', '25cl'),
(4, 'Lardons fumés', '300g'),
(4, 'Crème fraîche', '30cl'),
(4, 'Pâte feuilletée', '1 rouleau'),
(4, 'Emmental râpé', '150g');

-- Insertion des étapes pour les recettes
INSERT INTO EtapesRecettes (RecetteID, OrdreEtape, DescriptionEtape)
VALUES
(1, 1, 'Préchauffer le four à 180°'),
(1, 2, 'Mélanger la chair de crabe avec le jus de citron et les herbes'),
(1, 3, 'Former les feuilletés et enfourner 20 minutes'),
(2, 1, 'Préparer une crème avec mascarpone, œufs, et sucre'),
(2, 2, 'Alterner couches de biscuits imbibés de café et de crème'),
(2, 3, 'Saupoudrer de cacao et mettre au réfrigérateur'),
(3, 1, 'Faire revenir la viande avec du beurre'),
(3, 2, 'Ajouter les légumes et cuire à feu doux pendant 2 heures'),
(3, 3, 'Ajouter la crème en fin de cuisson'),
(4, 1, 'Précuire la pâte feuilletée'),
(4, 2, 'Préparer un mélange avec les œufs, la crème et le lait'),
(4, 3, 'Ajouter les lardons sur la pâte, verser le mélange, et cuire 35 minutes à 180°');

-- Insertion des employés
INSERT INTO Employes (NomEmploye, Role, Salaire, HoraireEmploye, SecteurID)
VALUES
('Jean Dupont', 'ChefCuisine', 2500.00, 'Matin', NULL),
('Marie Curie', 'Serveur', 1800.00, 'Soir', NULL),
('Paul Martin', 'MaitreHotel', 3000.00, 'Matin', 1);

-- Insertion des secteurs
INSERT INTO Secteurs (NomSecteur, NombreDeTables)
VALUES
('Secteur A', 10),
('Secteur B', 15);

-- Insertion des tables
INSERT INTO Tables (Capacite, SecteurID, Statut)
VALUES
(4, 1, 'Libre'),
(6, 1, 'Occupée'),
(2, 2, 'Réservée');

-- Insertion des clients
INSERT INTO Clients (NomClient, ReservationID)
VALUES
('Alice Dupont', 1),
('Bernard Lemoine', 2);

-- Insertion des réservations
INSERT INTO Reservations (NomClient, DateReservation, HeureReservation, NombrePersonnes, TableID)
VALUES
('Alice Dupont', '2024-12-04', '19:00:00', 4, 1),
('Bernard Lemoine', '2024-12-04', '20:00:00', 6, 2);

-- Insertion dans l'inventaire
INSERT INTO Inventaire (NomProduit, Categorie, Quantite, DateExpiration)
VALUES
('Farine', 'LongueConservation', 50, '2025-01-01'),
('Oeufs', 'Frais', 200, '2024-12-10'),
('Beurre', 'Frais', 30, '2024-12-08');

-- Insertion des commandes
INSERT INTO Commandes (TableID, HeureCommande, Statut)
VALUES
(1, '2024-12-04 19:30:00', 'EnAttente'),
(2, '2024-12-04 20:15:00', 'EnPréparation');

-- Insertion des détails des commandes
INSERT INTO DetailsCommandes (CommandeID, NomPlat, NombrePlats)
VALUES
(1, 'Feuilleté au crabe', 2),
(2, 'Blanquette de veau', 1);

-- Insertion des équipements
INSERT INTO Equipements (NomEquipement, Quantite, Localisation)
VALUES
('Four', 2, 'Cuisine'),
('Poêle', 5, 'Cuisine'),
('Table de service', 3, 'Salle');

-- Insertion des tâches dans les logs
INSERT INTO LogsTaches (EmployeID, Description)
VALUES
(1, 'Préparation des feuilletés au crabe'),
(2, 'Service des entrées pour la table 1');
