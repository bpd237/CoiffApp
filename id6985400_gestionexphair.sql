-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le :  mar. 01 oct. 2019 à 15:33
-- Version du serveur :  10.3.16-MariaDB
-- Version de PHP :  7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `id6985400_gestionexphair`
--

-- --------------------------------------------------------

--
-- Structure de la table `boisson`
--

CREATE TABLE `boisson` (
  `id` int(11) NOT NULL,
  `nom` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `prix_achat` int(11) NOT NULL,
  `prix_vente` int(11) NOT NULL,
  `qte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `boisson`
--

INSERT INTO `boisson` (`id`, `nom`, `prix_achat`, `prix_vente`, `qte`) VALUES
(1, 'Jus', -2500, -250, 10),
(2, 'Mangue de Guinee', 250, 350, -250);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `nom_complet` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `nbr_coiffure` int(11) NOT NULL,
  `depense` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom_complet`, `nbr_coiffure`, `depense`) VALUES
(1, 'test', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `coiffure`
--

CREATE TABLE `coiffure` (
  `id` int(11) NOT NULL,
  `nbr_produit` int(11) NOT NULL,
  `nbr_coiffeur` int(11) NOT NULL,
  `nom` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `prix` int(11) NOT NULL,
  `description` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `type` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT 'Homme'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `coiffure`
--

INSERT INTO `coiffure` (`id`, `nbr_produit`, `nbr_coiffeur`, `nom`, `prix`, `description`, `type`) VALUES
(2, 2, 12, '', 15, '', 'homme');

-- --------------------------------------------------------

--
-- Structure de la table `dette`
--

CREATE TABLE `dette` (
  `id` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `montant` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `esthetique`
--

CREATE TABLE `esthetique` (
  `id` int(11) NOT NULL,
  `nbr_produit` int(11) NOT NULL,
  `nbr_coiffeur` int(11) NOT NULL,
  `nom` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `description` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `prix` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `esthetique`
--

INSERT INTO `esthetique` (`id`, `nbr_produit`, `nbr_coiffeur`, `nom`, `description`, `prix`) VALUES
(1, 55, 555, 'ioio', '555', 55);

-- --------------------------------------------------------

--
-- Structure de la table `fonction`
--

CREATE TABLE `fonction` (
  `id` int(11) NOT NULL,
  `designation` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT 'coiffeur',
  `description` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `salaire_de_base` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `id_auteur` int(11) NOT NULL,
  `elt` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `nom` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `action` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `prix` int(11) NOT NULL,
  `qte` int(11) NOT NULL,
  `date` date NOT NULL,
  `heure` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `log`
--

INSERT INTO `log` (`id`, `id_auteur`, `elt`, `nom`, `action`, `prix`, `qte`, `date`, `heure`) VALUES
(1, 7, 'coiffure_homme', '', 'vente', 0, 1, '2018-09-07', '14:44:09');

-- --------------------------------------------------------

--
-- Structure de la table `personnel`
--

CREATE TABLE `personnel` (
  `id` int(11) NOT NULL,
  `id_fonction_personnel` int(11) NOT NULL,
  `nom_complet` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `localisation` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `contact` varchar(15) COLLATE latin1_general_ci NOT NULL,
  `salaire` int(11) NOT NULL,
  `date_entree` date NOT NULL,
  `statut` tinyint(3) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `description` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `prix` int(11) NOT NULL,
  `date_achat` date NOT NULL,
  `statut` tinyint(2) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `restauration`
--

CREATE TABLE `restauration` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `description` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `prix` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `nom_complet` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `contact` varchar(15) COLLATE latin1_general_ci NOT NULL,
  `localisation` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `niveau` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT 'personnel',
  `statut` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `nom_complet`, `contact`, `localisation`, `niveau`, `statut`) VALUES
(1, 'gestionnaire', 'b1a52e5cebe5a89db71f7225d41ca9a8fe63b3c9', 'Testeur Principal', '123456789', 'Ekounou', 'patron', 1),
(6, 'utest1', '1292654244e19401e0e8d276f2b7c08cb1879307', 'Utilisateur Test 1', '111', 'Ekounou', 'personnel', 1),
(7, 'user1', '91c202258addba1980c83a6da0a2507a68a2d815', '', '', '', 'personnel', 1),
(8, 'patron1', 'b8917229d2fba0aa457de1133f20b562310f6662', '', '', '', 'patron', 1),
(9, 'user2', 'd1ae42bbabbea5d9c795b11e38ca8801af2d6dd6', '', '', '', 'personnel', 1),
(10, 'patron2', '22d16eb185a662104af9e2e393476612d2ace87c', '', '', '', 'patron', 1),
(11, 'user3', '7c563aa92a17ecbbb18f48b4d9cc3b2de08fd407', '', '', '', 'personnel', 1),
(12, 'patron3', 'd6b8af338f7786434086a9e7fec806c554da07dd', '', '', '', 'patron', 1),
(13, 'user4', 'f1dd2fc3110fb82f3063ef68d7728cd29a5ae28a', '', '', '', 'personnel', 1),
(14, 'patron4', 'f28afa3e9bcb00a7e9278174ad4f994a3fa296d5', '', '', '', 'patron', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `boisson`
--
ALTER TABLE `boisson`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `coiffure`
--
ALTER TABLE `coiffure`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `dette`
--
ALTER TABLE `dette`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `esthetique`
--
ALTER TABLE `esthetique`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fonction`
--
ALTER TABLE `fonction`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `personnel`
--
ALTER TABLE `personnel`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `restauration`
--
ALTER TABLE `restauration`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `boisson`
--
ALTER TABLE `boisson`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `coiffure`
--
ALTER TABLE `coiffure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `dette`
--
ALTER TABLE `dette`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `esthetique`
--
ALTER TABLE `esthetique`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `fonction`
--
ALTER TABLE `fonction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `personnel`
--
ALTER TABLE `personnel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `restauration`
--
ALTER TABLE `restauration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
