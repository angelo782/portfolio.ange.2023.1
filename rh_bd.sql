-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Jeu 05 Janvier 2023 à 16:16
-- Version du serveur: 5.5.10
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `rh_bd`
--

-- --------------------------------------------------------

--
-- Structure de la table `rh.employe`
--

CREATE TABLE IF NOT EXISTS `rh.employe` (
  `NoEmp` int(11) NOT NULL,
  `Nom` varchar(20) NOT NULL,
  `Prenom` varchar(20) NOT NULL,
  `Sexe` varchar(1) NOT NULL,
  `Salaire` int(11) NOT NULL,
  `TypeContrat` varchar(20) NOT NULL,
  `Fonction` varchar(20) NOT NULL,
  `Site` varchar(20) NOT NULL,
  `DateEmbauche` date NOT NULL,
  `DateNaissance` date NOT NULL,
  `NoSrv` int(11) NOT NULL,
  PRIMARY KEY (`NoEmp`),
  KEY `NoSrv` (`NoSrv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `rh.employe`
--

INSERT INTO `rh.employe` (`NoEmp`, `Nom`, `Prenom`, `Sexe`, `Salaire`, `TypeContrat`, `Fonction`, `Site`, `DateEmbauche`, `DateNaissance`, `NoSrv`) VALUES
(78, 'HASSANI', 'Barol', 'M', 2350, 'CDI', 'directeurs', 'Acheres', '2016-12-13', '1999-08-07', 1),
(92, 'LOS', 'Ko', 'M', 1980, 'CDI', 'comptables', 'paris', '2009-08-16', '2003-01-21', 2),
(940, 'SOUL', 'NI', 'F', 1300, 'CDD', 'TAFF', 'paris', '2016-12-24', '2000-08-07', 3);

-- --------------------------------------------------------

--
-- Structure de la table `rh.intervenir`
--

CREATE TABLE IF NOT EXISTS `rh.intervenir` (
  `NoEmp` int(11) NOT NULL,
  `Num_Interv` varchar(20) NOT NULL,
  `NoProj` int(11) NOT NULL,
  `NbHeures` int(11) NOT NULL,
  PRIMARY KEY (`Num_Interv`),
  KEY `NoEmp` (`NoEmp`,`NoProj`),
  KEY `NoProj` (`NoProj`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `rh.intervenir`
--

INSERT INTO `rh.intervenir` (`NoEmp`, `Num_Interv`, `NoProj`, `NbHeures`) VALUES
(940, 'coulie', 354, 37),
(92, 'livre', 78, 25),
(78, 'parler', 354, 15);

-- --------------------------------------------------------

--
-- Structure de la table `rh.projet`
--

CREATE TABLE IF NOT EXISTS `rh.projet` (
  `NoProj` int(11) NOT NULL,
  `LibelleProjet` varchar(20) NOT NULL,
  `NoSrv` int(11) NOT NULL,
  PRIMARY KEY (`NoProj`),
  KEY `NoSrv` (`NoSrv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `rh.projet`
--

INSERT INTO `rh.projet` (`NoProj`, `LibelleProjet`, `NoSrv`) VALUES
(78, 'QLF', 3),
(354, 'zinou', 1),
(678, 'zloulo', 2);

-- --------------------------------------------------------

--
-- Structure de la table `rh.service`
--

CREATE TABLE IF NOT EXISTS `rh.service` (
  `NoSrv` int(11) NOT NULL,
  `NomSrv` varchar(20) NOT NULL,
  PRIMARY KEY (`NoSrv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `rh.service`
--

INSERT INTO `rh.service` (`NoSrv`, `NomSrv`) VALUES
(1, 'CMD'),
(2, 'CMDA'),
(3, 'CMDQ');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `rh.employe`
--
ALTER TABLE `rh.employe`
  ADD CONSTRAINT `rh@002eemploye_ibfk_1` FOREIGN KEY (`NoSrv`) REFERENCES `rh.service` (`NoSrv`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `rh.intervenir`
--
ALTER TABLE `rh.intervenir`
  ADD CONSTRAINT `rh@002eintervenir_ibfk_2` FOREIGN KEY (`NoProj`) REFERENCES `rh.projet` (`NoProj`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rh@002eintervenir_ibfk_1` FOREIGN KEY (`NoEmp`) REFERENCES `rh.employe` (`NoEmp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `rh.projet`
--
ALTER TABLE `rh.projet`
  ADD CONSTRAINT `rh@002eprojet_ibfk_1` FOREIGN KEY (`NoSrv`) REFERENCES `rh.service` (`NoSrv`) ON DELETE CASCADE ON UPDATE CASCADE;
