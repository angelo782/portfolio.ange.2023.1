-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Jeu 08 Décembre 2022 à 15:13
-- Version du serveur: 5.5.10
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `location_voiture`
--

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `code_client` varchar(5) NOT NULL,
  `nom_prenom` varchar(20) NOT NULL,
  `date_naissance` date NOT NULL,
  `adresse` text NOT NULL,
  `ville` varchar(10) NOT NULL,
  `telephone` varchar(10) NOT NULL,
  `date_permis` date NOT NULL,
  `code_postal` varchar(5) NOT NULL,
  `email` varchar(20) NOT NULL,
  PRIMARY KEY (`code_client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `clients`
--

INSERT INTO `clients` (`code_client`, `nom_prenom`, `date_naissance`, `adresse`, `ville`, `telephone`, `date_permis`, `code_postal`, `email`) VALUES
('0001A', 'HASSANI A', '2004-08-07', '3 ALLER DES ALO', 'PARIS ', '0734567891', '2018-12-13', '75012', 'lobol@yahoo.com'),
('0001C', 'DOLOMBIA F', '1994-12-21', '3 R DE LA COLONI', 'PARIS', '0753752485', '2010-12-09', '75012', 'DIALO@GMAIL.COM'),
('0002B', 'BOLIA P', '1999-06-23', '5 RUE DES LOUERANGE', 'PARIS', '0734564390', '2017-12-19', '75004', 'BOLIACON@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
  `id_location` int(11) NOT NULL AUTO_INCREMENT,
  `date_location` date NOT NULL,
  `duree` int(11) NOT NULL,
  `prix_jour` int(11) NOT NULL,
  `code_client` varchar(5) NOT NULL,
  `immatriculation` varchar(20) NOT NULL,
  PRIMARY KEY (`id_location`),
  KEY `code_client` (`code_client`,`immatriculation`),
  KEY `immatriculation` (`immatriculation`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `locations`
--

INSERT INTO `locations` (`id_location`, `date_location`, `duree`, `prix_jour`, `code_client`, `immatriculation`) VALUES
(12, '2022-12-01', 14, 23, '0001A', '12 TU 2000'),
(13, '2022-12-09', 123, 12, '0002B', '16 EMD 543');

-- --------------------------------------------------------

--
-- Structure de la table `reparations`
--

CREATE TABLE IF NOT EXISTS `reparations` (
  `num_reparation` int(11) NOT NULL AUTO_INCREMENT,
  `date_reparation` date NOT NULL,
  `cout_reparation` int(11) NOT NULL,
  `duree_reparation` int(11) NOT NULL,
  `responsable_rep` varchar(255) NOT NULL,
  `immatriculation` varchar(20) NOT NULL,
  PRIMARY KEY (`num_reparation`),
  KEY `immatriculation` (`immatriculation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `reparations`
--


-- --------------------------------------------------------

--
-- Structure de la table `voitures`
--

CREATE TABLE IF NOT EXISTS `voitures` (
  `immatriculation` varchar(20) NOT NULL,
  `marque` varchar(10) NOT NULL,
  `couleur` varchar(10) NOT NULL,
  `kilometrage` int(11) NOT NULL,
  `annee_circulation` date NOT NULL,
  `modele` varchar(10) NOT NULL,
  PRIMARY KEY (`immatriculation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `voitures`
--

INSERT INTO `voitures` (`immatriculation`, `marque`, `couleur`, `kilometrage`, `annee_circulation`, `modele`) VALUES
('12 TU 2000', 'Mercedes', 'noire', 20000, '2012-12-26', 'AMG'),
('16 EMD 543', 'Renault', 'rouge', 30000, '2016-12-09', 'Clio');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`code_client`) REFERENCES `clients` (`code_client`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `locations_ibfk_2` FOREIGN KEY (`immatriculation`) REFERENCES `voitures` (`immatriculation`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reparations`
--
ALTER TABLE `reparations`
  ADD CONSTRAINT `reparations_ibfk_1` FOREIGN KEY (`immatriculation`) REFERENCES `voitures` (`immatriculation`) ON DELETE CASCADE ON UPDATE CASCADE;
