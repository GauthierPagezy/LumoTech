-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 08 mars 2023 à 12:02
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestionlampadaire`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

CREATE TABLE `adresse` (
  `adID` int(11) NOT NULL,
  `adVille` varchar(50) NOT NULL,
  `adCP` int(11) NOT NULL,
  `adVoie` varchar(50) NOT NULL,
  `adNumVoie` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `historique`
--

CREATE TABLE `historique` (
  `userID` int(11) NOT NULL,
  `lampID` int(11) NOT NULL,
  `dateTime` datetime NOT NULL,
  `actionType` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lampadaire`
--

CREATE TABLE `lampadaire` (
  `lampID` int(11) NOT NULL,
  `adID` int(11) NOT NULL,
  `lampMode` tinyint(1) NOT NULL,
  `etat` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `userID` int(11) NOT NULL,
  `userNom` varchar(30) NOT NULL,
  `userMail` varchar(30) NOT NULL,
  `userPassword` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`adID`);

--
-- Index pour la table `historique`
--
ALTER TABLE `historique`
  ADD KEY `lampID` (`lampID`),
  ADD KEY `userID` (`userID`);

--
-- Index pour la table `lampadaire`
--
ALTER TABLE `lampadaire`
  ADD PRIMARY KEY (`lampID`),
  ADD KEY `adID` (`adID`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adresse`
--
ALTER TABLE `adresse`
  MODIFY `adID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lampadaire`
--
ALTER TABLE `lampadaire`
  MODIFY `lampID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `historique`
--
ALTER TABLE `historique`
  ADD CONSTRAINT `historique_ibfk_1` FOREIGN KEY (`lampID`) REFERENCES `lampadaire` (`lampID`),
  ADD CONSTRAINT `historique_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `utilisateur` (`userID`);

--
-- Contraintes pour la table `lampadaire`
--
ALTER TABLE `lampadaire`
  ADD CONSTRAINT `lampadaire_ibfk_1` FOREIGN KEY (`adID`) REFERENCES `adresse` (`adID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
