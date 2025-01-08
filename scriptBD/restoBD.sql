-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mer. 02 déc. 2020 à 17:47
-- Version du serveur :  10.4.6-MariaDB
-- Version de PHP :  7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `restoBD`
--

-- --------------------------------------------------------

--
-- Structure de la table `photo`
--

CREATE TABLE `photo` (
  `idP` bigint(20) NOT NULL,
  `cheminP` varchar(255) DEFAULT NULL,
  `idR` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE `resto` (
  `idR` bigint(20) NOT NULL,
  `nomR` varchar(255) DEFAULT NULL,
  `numAdrR` varchar(20) DEFAULT NULL,
  `voieAdrR` varchar(255) DEFAULT NULL,
  `cpR` char(5) DEFAULT NULL,
  `villeR` varchar(255) DEFAULT NULL,
  `descR` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `resto`
--

INSERT INTO `resto` (`idR`, `nomR`, `numAdrR`, `voieAdrR`, `cpR`, `villeR`, `descR`) VALUES
(1, 'Florian', '9', 'rue Victor Hugo', '65000', 'Tarbes', 'Cuisine locale et gourmande'),
(2, 'Le Monocle', '1', 'avenue Bertrand Barère', '65000', 'Tarbes', 'Ambiance feutrée et cosy'),
(3, 'Tacos Avenue', '15', 'rue Brauhauban', '65000', 'Tarbes', 'Recettes de tacos inédites'),
(4, 'Pizza Pasta', '8', 'avenue du Marché Brauhauban', '65000', 'Tarbes', 'Une des plus anciennes pizzerias de la ville, sans fioritures ni superflu.'),
(5, 'Buffalo Grill', '', 'boulevard Kennedy', '65000', 'Tarbes', 'Bien plus qu\'un Steakhouse, c\'est la chaleureuse et authentique maison du BBQ'),
(6, 'La Kantine', '9', 'rue Desaix', '65000', 'Tarbes', 'Petits plats bistrot et desserts maison'),
(7, 'Taj Mahal', '13', 'rue du Maquis de Payolle', '65000', 'Tarbes', 'Cuisine indienne et ses mille saveurs'),
(8, 'Biocoop Le Grand Pic', '17', 'route de Pau', '65000', 'Tarbes', 'L\'un des premiers restaurants Biocoop de France'),
(9, 'Les Galopins', '8 bis', 'avenue des Forges', '65000', 'Tarbes', 'Ce bar-restaurant orné de fresques graphiques propose des plats classiques'),
(10, 'Charlye et ses drôles de crêpes', '1', 'rue Ferrere', '65000', 'Tarbes', 'Drôles de crêpes !'),
(11, 'Le Gold Burger', '8', 'place de Verdun', '65000', 'Tarbes', 'Restauration rapide');

-- --------------------------------------------------------

--
-- Structure de la table `typecuisine`
--

CREATE TABLE `typecuisine` (
  `idTC` bigint(20) NOT NULL,
  `libelleTC` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE `utilisateur` (
  `mailU` varchar(150) NOT NULL,
  `mdpU` varchar(50) DEFAULT NULL,
  `pseudoU` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`mailU`, `mdpU`, `pseudoU`) VALUES
('lmct65@local.fr', 'lmct65', 'lmct65');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`idP`),
  ADD KEY `idR` (`idR`);

--
-- Index pour la table `resto`
--
ALTER TABLE `resto`
  ADD PRIMARY KEY (`idR`);

--
-- Index pour la table `typecuisine`
--
ALTER TABLE `typecuisine`
  ADD PRIMARY KEY (`idTC`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`mailU`);

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
