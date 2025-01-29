-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 29 jan. 2025 à 10:37
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `restobd`
--

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `com` varchar(255) DEFAULT NULL,
  `idUser` int DEFAULT NULL,
  `dateHeureCom` datetime DEFAULT NULL,
  `idResto` int DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_commentaire_utilisateur` (`idUser`),
  KEY `fk_commentaire_resto` (`idResto`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `commentaire`
--

INSERT INTO `commentaire` (`com`, `idUser`, `dateHeureCom`, `idResto`, `id`) VALUES
('tt', 1, '2025-01-29 09:21:34', 1, 1),
('Test', 3, '2025-01-29 10:31:28', 1, 5),
('M', 3, '2025-01-29 10:33:55', 1, 6);

-- --------------------------------------------------------

--
-- Structure de la table `photo`
--

DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `idP` bigint NOT NULL,
  `cheminP` varchar(255) DEFAULT NULL,
  `idR` bigint DEFAULT NULL,
  PRIMARY KEY (`idP`),
  KEY `idR` (`idR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `photo`
--

INSERT INTO `photo` (`idP`, `cheminP`, `idR`) VALUES
(1, 'florian.jpg', 1),
(2, 'tacosAvenue.jpg', 3),
(3, 'buffaloGrill.jpg', 5),
(4, 'monocle.jpg', 2),
(6, 'pizzaPasta.jpg', 4),
(7, 'buffaloGrill_2.jpg', 5),
(8, 'kantine.jpg', 6),
(9, 'tajMahal.jpg', 7),
(10, 'biocoop.jpg', 8),
(11, 'galopins.jpg', 9),
(12, 'charlye.jpg', 10),
(13, 'goldBurger.jpg', 11),
(14, 'pizzaPasta_2.jpg', 4),
(15, 'pizzaPasta_3.jpg', 4);

-- --------------------------------------------------------

--
-- Structure de la table `resto`
--

DROP TABLE IF EXISTS `resto`;
CREATE TABLE IF NOT EXISTS `resto` (
  `idR` bigint NOT NULL,
  `nomR` varchar(255) DEFAULT NULL,
  `numAdrR` varchar(20) DEFAULT NULL,
  `voieAdrR` varchar(255) DEFAULT NULL,
  `cpR` char(5) DEFAULT NULL,
  `villeR` varchar(255) DEFAULT NULL,
  `descR` text,
  `telR` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`idR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `resto`
--

INSERT INTO `resto` (`idR`, `nomR`, `numAdrR`, `voieAdrR`, `cpR`, `villeR`, `descR`, `telR`) VALUES
(1, 'Florian', '9', 'rue Victor Hugo', '65000', 'Tarbes', 'Cuisine locale et gourmande', '+33660898981'),
(2, 'Le Monocle', '1', 'avenue Bertrand Barère', '65000', 'Tarbes', 'Ambiance feutrée et cosy', '+33660896781'),
(3, 'Tacos Avenue', '15', 'rue Brauhauban', '65000', 'Tarbes', 'Recettes de tacos inédites', '+33660429835'),
(4, 'Pizza Pasta', '8', 'avenue du Marché Brauhauban', '65000', 'Tarbes', 'Une des plus anciennes pizzerias de la ville, sans fioritures ni superflu.', '+33660420035'),
(5, 'Buffalo Grill', '', 'boulevard Kennedy', '65000', 'Tarbes', 'Bien plus qu\'un Steakhouse, c\'est la chaleureuse et authentique maison du BBQ', '+33660428734'),
(6, 'La Kantine', '9', 'rue Desaix', '65000', 'Tarbes', 'Petits plats bistrot et desserts maison', '+33609765081'),
(7, 'Taj Mahal', '13', 'rue du Maquis de Payolle', '65000', 'Tarbes', 'Cuisine indienne et ses mille saveurs', '+33627456581'),
(8, 'Biocoop Le Grand Pic', '17', 'route de Pau', '65000', 'Tarbes', 'L\'un des premiers restaurants Biocoop de France', '+33660346521'),
(9, 'Les Galopins', '8 bis', 'avenue des Forges', '65000', 'Tarbes', 'Ce bar-restaurant orné de fresques graphiques propose des plats classiques', '+33660422983'),
(10, 'Charlye et ses drôles de crêpes', '1', 'rue Ferrere', '65000', 'Tarbes', 'Drôles de crêpes !', '+33660425023'),
(11, 'Le Gold Burger', '8', 'place de Verdun', '65000', 'Tarbes', 'Restauration rapide', '+33660465081');

-- --------------------------------------------------------

--
-- Structure de la table `typecuisine`
--

DROP TABLE IF EXISTS `typecuisine`;
CREATE TABLE IF NOT EXISTS `typecuisine` (
  `idTC` bigint NOT NULL,
  `libelleTC` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idTC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `typecuisine`
--

INSERT INTO `typecuisine` (`idTC`, `libelleTC`) VALUES
(1, 'sud ouest'),
(2, 'japonaise'),
(3, 'orientale'),
(4, 'fastfood'),
(5, 'vegetarienne'),
(6, 'vegan'),
(7, 'crepe'),
(8, 'sandwich'),
(9, 'tartes'),
(10, 'viande'),
(11, 'grillade');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `mailU` varchar(150) NOT NULL,
  `mdpU` varchar(50) DEFAULT NULL,
  `pseudoU` varchar(50) DEFAULT NULL,
  `idUser` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `mailU` (`mailU`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`mailU`, `mdpU`, `pseudoU`, `idUser`) VALUES
('admin5@local.fr', 'rl836vO2Wg7T2', 'admin', 1),
('lmct65@local.fr', 'lmct65', 'lmct65', 2),
('noah.sagot@nameless.uk', 'rlxSCeoRN2rX.', 'BlackOut', 3);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`idR`) REFERENCES `resto` (`idR`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
