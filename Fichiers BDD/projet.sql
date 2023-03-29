-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 29 mars 2023 à 09:53
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet`
--

-- --------------------------------------------------------

--
-- Structure de la table `action`
--

CREATE TABLE `action` (
  `actionID` int(11) NOT NULL,
  `designation` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `action`
--

INSERT INTO `action` (`actionID`, `designation`) VALUES
(1, 'allumé'),
(2, 'éteint');

-- --------------------------------------------------------

--
-- Structure de la table `historiqueautomatique`
--

CREATE TABLE `historiqueautomatique` (
  `lampID` int(11) NOT NULL,
  `actionID` int(11) NOT NULL,
  `dateTime` datetime NOT NULL DEFAULT current_timestamp(),
  `temperature` double NOT NULL,
  `luminosite` double NOT NULL,
  `nbPassages` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `historiquemanuel`
--

CREATE TABLE `historiquemanuel` (
  `userID` int(11) NOT NULL,
  `lampID` int(11) NOT NULL,
  `dateTime` datetime NOT NULL DEFAULT current_timestamp(),
  `actionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `lampadaire`
--

CREATE TABLE `lampadaire` (
  `lampID` int(11) NOT NULL,
  `ville` varchar(30) NOT NULL,
  `codepostal` int(30) NOT NULL,
  `voie` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `mode` varchar(15) NOT NULL,
  `etat` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `userNom` varchar(30) NOT NULL,
  `userPrenom` varchar(30) NOT NULL,
  `userMail` varchar(30) NOT NULL,
  `userPassword` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`userID`, `userNom`, `userPrenom`, `userMail`, `userPassword`) VALUES
(1, 'Monsieur Test', 'Test', 'root@root.com', 'root');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `action`
--
ALTER TABLE `action`
  ADD PRIMARY KEY (`actionID`);

--
-- Index pour la table `historiqueautomatique`
--
ALTER TABLE `historiqueautomatique`
  ADD KEY `lampID` (`lampID`),
  ADD KEY `actionID` (`actionID`);

--
-- Index pour la table `historiquemanuel`
--
ALTER TABLE `historiquemanuel`
  ADD KEY `lampID` (`lampID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `actionID` (`actionID`);

--
-- Index pour la table `lampadaire`
--
ALTER TABLE `lampadaire`
  ADD PRIMARY KEY (`lampID`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `action`
--
ALTER TABLE `action`
  MODIFY `actionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `lampadaire`
--
ALTER TABLE `lampadaire`
  MODIFY `lampID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `historiqueautomatique`
--
ALTER TABLE `historiqueautomatique`
  ADD CONSTRAINT `historiqueautomatique_ibfk_1` FOREIGN KEY (`lampID`) REFERENCES `lampadaire` (`lampID`),
  ADD CONSTRAINT `historiqueautomatique_ibfk_2` FOREIGN KEY (`actionID`) REFERENCES `action` (`actionID`);

--
-- Contraintes pour la table `historiquemanuel`
--
ALTER TABLE `historiquemanuel`
  ADD CONSTRAINT `historiquemanuel_ibfk_1` FOREIGN KEY (`lampID`) REFERENCES `lampadaire` (`lampID`),
  ADD CONSTRAINT `historiquemanuel_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`),
  ADD CONSTRAINT `historiquemanuel_ibfk_3` FOREIGN KEY (`actionID`) REFERENCES `action` (`actionID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
