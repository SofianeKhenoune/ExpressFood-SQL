-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 11, 2019 at 10:13 AM
-- Server version: 5.7.26
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `expressfood`
--

-- --------------------------------------------------------

--
-- Table structure for table `adresse`
--

CREATE TABLE `adresse` (
  `IDadresse` int(11) NOT NULL,
  `rue` varchar(100) NOT NULL,
  `complement_adresse` varchar(255) DEFAULT NULL,
  `code_postal` int(11) NOT NULL,
  `ville` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `adresse`
--

INSERT INTO `adresse` (`IDadresse`, `rue`, `complement_adresse`, `code_postal`, `ville`) VALUES
(1, '10 rue de montmartre', NULL, 75019, 'paris'),
(2, '20 rue des cités', 'rdc', 93300, 'aubervilliers'),
(3, '11 rue d commaille ', '6 ème étage', 75006, 'paris'),
(4, '56 rue de presbourg', NULL, 13000, 'marseille'),
(5, '109 rue de l\'université', '1 er étage', 75016, 'paris');

-- --------------------------------------------------------

--
-- Table structure for table `commande`
--

CREATE TABLE `commande` (
  `IDcommande` int(11) NOT NULL,
  `panier_id` int(11) NOT NULL,
  `adresse_id` int(11) NOT NULL,
  `date_creation` datetime NOT NULL,
  `total` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `commande`
--

INSERT INTO `commande` (`IDcommande`, `panier_id`, `adresse_id`, `date_creation`, `total`) VALUES
(1, 1, 2, '2019-10-29 00:00:00', '32.00'),
(2, 3, 2, '2019-10-29 00:00:00', '20.00'),
(3, 4, 3, '2019-11-03 00:00:00', '32.00'),
(4, 2, 4, '2019-11-03 00:00:00', '45.00'),
(5, 5, 2, '2019-11-04 00:00:00', '12.00'),
(6, 5, 5, '2019-10-05 00:00:00', '12.00');

-- --------------------------------------------------------

--
-- Table structure for table `livreur`
--

CREATE TABLE `livreur` (
  `IDlivreur` int(11) NOT NULL,
  `commande_id` int(11) DEFAULT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `statut` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `livreur`
--

INSERT INTO `livreur` (`IDlivreur`, `commande_id`, `longitude`, `latitude`, `statut`) VALUES
(1, 2, '48.90591800', '2.38570600', 0),
(2, 3, '48.84005800', '2.30530400', 1),
(3, 6, '49.43752200', '2.06380300', 1),
(4, 5, '48.84889800', '2.35461700', 0),
(5, 1, '48.84889800', '2.35461700', 0),
(7, 4, '48.84359800', '2.35434510', 1);

-- --------------------------------------------------------

--
-- Table structure for table `panier`
--

CREATE TABLE `panier` (
  `IDpanier` int(11) NOT NULL,
  `utilisateur_id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `panier`
--

INSERT INTO `panier` (`IDpanier`, `utilisateur_id`, `produit_id`, `quantite`) VALUES
(1, 3, 3, 1),
(1, 3, 4, 1),
(2, 2, 2, 1),
(2, 2, 5, 2),
(3, 4, 1, 1),
(3, 4, 5, 1),
(4, 5, 6, 1),
(4, 5, 2, 3),
(5, 5, 6, 1),
(5, 5, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

CREATE TABLE `produit` (
  `IDproduit` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `descreptif` varchar(1000) NOT NULL,
  `date` date NOT NULL,
  `prix` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `produit`
--

INSERT INTO `produit` (`IDproduit`, `nom`, `type`, `descreptif`, `date`, `prix`) VALUES
(1, 'blanquette de veau', 'plat', 'La blanquette ou blanquette de veau ou blanquette de veau à l\'ancienne est une recette de cuisine traditionnelle de la cuisine française, à base de ragoût de viande de veau marinée, puis mijotée dans un court-bouillon de vin blanc, de carotte, de poireau, d\'oignon, de champignon de Paris, de bouquet garni, liée en sauce blanche à la crème et au beurre', '2019-10-31', '12.00'),
(2, 'mille-feuille', 'dessert', 'pièce de pâtisserie faite de trois couches de pâte feuilletée et deux couches de crème pâtissière. Le dessus est glacé avec du sucre glace ou du fondant', '2019-10-28', '4.00'),
(3, 'couscous', 'plat', 'une spécialité culinaire issue de la cuisine berbère, à base de couscous, de légumes, d\'épices, d\'huile d\'olive, et de viande (mammifère ou volaille) ou de poisson.', '2019-10-30', '14.00'),
(4, 'riz frit', 'plat', 'Le riz frit est un mets composé de riz sauté au wok ou à la poêle, le plus souvent mélangé à d’autres ingrédients tels qu’œufs, légumes, produits de la mer ou viande', '2019-10-30', '10.00'),
(5, 'salade de fruits', 'dessert', 'La salade de fruits est un dessert composé dun mélange de fruits. La salade de fruits peut se déguster en toutes saisons. Il en existe différentes recettes en fonction des saisons ou des pays', '2019-10-29', '3.00'),
(6, 'quiche lorraine', 'plat', 'tarte salée de la cuisine lorraine et de la cuisine française, à base de pâte brisée ou de pâte feuilletée, de migaine d`œufs, de crème fraîche et de lardons.', '2019-10-30', '8.00');

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `IDuser` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `adresse_id` int(11) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `telephone` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`IDuser`, `nom`, `prenom`, `adresse_id`, `email`, `telephone`) VALUES
(1, 'dubuis', 'jean', 2, 'j-dubuis@gmail.com', '0600000001'),
(2, 'roberts', 'marie', 5, 'marie-d@gmail.com', '0600000002'),
(3, 'fikri', 'ahmed', 3, 'ahmed-fikri@gmail.com', '0600000003'),
(4, 'williams', 'serena', 1, 'w.serena@rolland-garros.com', '0600000004'),
(5, 'lambert', 'sophie', 4, 'sophie-l@yahoo.com', '0600000005');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`IDadresse`);

--
-- Indexes for table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`IDcommande`),
  ADD KEY `fk_adresse_livraison` (`adresse_id`),
  ADD KEY `fk_panier_commande` (`panier_id`) USING BTREE;

--
-- Indexes for table `livreur`
--
ALTER TABLE `livreur`
  ADD PRIMARY KEY (`IDlivreur`),
  ADD KEY `fk_commande_id` (`commande_id`);

--
-- Indexes for table `panier`
--
ALTER TABLE `panier`
  ADD KEY `fk_produit_panier` (`produit_id`),
  ADD KEY `fk_client_panier` (`utilisateur_id`);

--
-- Indexes for table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`IDproduit`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`IDuser`),
  ADD KEY `fk_adresse_client` (`adresse_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adresse`
--
ALTER TABLE `adresse`
  MODIFY `IDadresse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `commande`
--
ALTER TABLE `commande`
  MODIFY `IDcommande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `livreur`
--
ALTER TABLE `livreur`
  MODIFY `IDlivreur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `produit`
--
ALTER TABLE `produit`
  MODIFY `IDproduit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `IDuser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`panier_id`) REFERENCES `panier` (`produit_id`),
  ADD CONSTRAINT `fk_adresse_livraison` FOREIGN KEY (`adresse_id`) REFERENCES `adresse` (`IDadresse`);

--
-- Constraints for table `livreur`
--
ALTER TABLE `livreur`
  ADD CONSTRAINT `fk_commande_id` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`IDcommande`);

--
-- Constraints for table `panier`
--
ALTER TABLE `panier`
  ADD CONSTRAINT `fk_client_panier` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`IDuser`),
  ADD CONSTRAINT `fk_produit_panier` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`IDproduit`);

--
-- Constraints for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `fk_adresse_client` FOREIGN KEY (`adresse_id`) REFERENCES `adresse` (`IDadresse`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
