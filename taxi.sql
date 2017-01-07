-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 10 Novembre 2016 à 11:33
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `taxi`
--

-- --------------------------------------------------------

--
-- Structure de la table `association_conducteurs_vehicules`
--

CREATE TABLE `association_conducteurs_vehicules` (
  `id_association` int(10) UNSIGNED NOT NULL,
  `id_vehicule` int(10) UNSIGNED NOT NULL,
  `id_conducteur` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `conducteurs`
--

CREATE TABLE `conducteurs` (
  `id_conducteur` int(10) UNSIGNED NOT NULL,
  `prenom` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'prenom du conducteur',
  `nom` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'nom du conducteur'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `conducteurs`
--

INSERT INTO `conducteurs` (`id_conducteur`, `prenom`, `nom`) VALUES
(1, 'Jean-Mi', 'Shell'),
(2, 'Bernard', 'Lermite');

-- --------------------------------------------------------

--
-- Structure de la table `vehicules`
--

CREATE TABLE `vehicules` (
  `id_vehicule` int(10) UNSIGNED NOT NULL,
  `marque` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `modele` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `couleur` enum('noir','bleu','gris','vert') NOT NULL,
  `immatriculation` varchar(13) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `association_conducteurs_vehicules`
--
ALTER TABLE `association_conducteurs_vehicules`
  ADD PRIMARY KEY (`id_association`),
  ADD KEY `FK_id_vehicule` (`id_vehicule`),
  ADD KEY `FK_id_conducteur` (`id_conducteur`);

--
-- Index pour la table `conducteurs`
--
ALTER TABLE `conducteurs`
  ADD PRIMARY KEY (`id_conducteur`);

--
-- Index pour la table `vehicules`
--
ALTER TABLE `vehicules`
  ADD UNIQUE KEY `IMMAT` (`immatriculation`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `association_conducteurs_vehicules`
--
ALTER TABLE `association_conducteurs_vehicules`
  MODIFY `id_association` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `conducteurs`
--
ALTER TABLE `conducteurs`
  MODIFY `id_conducteur` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
