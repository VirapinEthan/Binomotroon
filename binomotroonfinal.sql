-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 07, 2023 at 06:57 PM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `binomotroonfinal`
--

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `creation_date` date NOT NULL,
  `id_project` int(11) UNSIGNED NOT NULL,
  `id_promo` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `creation_date`, `id_project`, `id_promo`) VALUES
(1, 'Groupe1', '2023-03-01', 1, 1),
(2, 'Groupe2', '2023-03-01', 1, 1),
(3, 'Groupe3', '2023-03-01', 1, 1),
(5, 'Groupe1', '2023-03-01', 1, 2),
(6, 'Groupe2', '2023-03-01', 1, 2),
(7, 'Groupe3', '2023-03-01', 1, 2),
(8, 'Groupe4', '2023-03-01', 1, 2),
(9, 'Groupe5', '2023-03-01', 1, 2),
(10, 'Groupe1', '2023-03-01', 1, 3),
(11, 'Groupe2', '2023-03-01', 1, 3),
(12, 'Groupe3', '2023-03-01', 1, 3),
(13, 'Groupe4', '2023-03-01', 1, 3),
(14, 'Groupe5', '2023-03-01', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `name`, `id_user`) VALUES
(1, 'Projet de site vitrine', 1),
(2, 'Application web de gestion de tâches', 2),
(3, 'Application de réservation de restaurants en ligne', 3),
(4, 'Site de vente en ligne de produits bio', 1),
(6, 'Application mobile de suivi de la santé', 3),
(7, 'Application web de gestion de stock', 1),
(8, 'Site de location de vélos électriques', 1),
(9, 'Application de rencontre en ligne', 3),
(10, 'Application de création de CV en ligne', 2);

-- --------------------------------------------------------

--
-- Table structure for table `projects_promos`
--

CREATE TABLE `projects_promos` (
  `id_project` int(10) UNSIGNED NOT NULL,
  `id_promo` int(10) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projects_promos`
--

INSERT INTO `projects_promos` (`id_project`, `id_promo`, `start_date`, `end_date`) VALUES
(1, 1, '2023-04-01', '2023-06-30'),
(1, 2, '2023-05-01', '2023-07-31'),
(1, 3, '2023-06-01', '2023-08-31'),
(2, 2, '2023-05-01', '2023-07-31'),
(2, 3, '2023-06-01', '2023-08-31'),
(2, 5, '2023-08-01', '2023-10-31'),
(3, 1, '2023-04-01', '2023-06-30'),
(3, 3, '2023-06-01', '2023-08-31'),
(3, 4, '2023-07-01', '2023-09-30'),
(4, 1, '2023-04-01', '2023-06-30'),
(4, 3, '2023-06-01', '2023-08-31'),
(4, 4, '2023-07-01', '2023-09-30'),
(6, 2, '2023-05-01', '2023-07-31'),
(6, 5, '2023-08-01', '2023-10-31'),
(7, 1, '2023-04-01', '2023-06-30'),
(7, 3, '2023-06-01', '2023-08-31'),
(7, 4, '2023-07-01', '2023-09-30'),
(8, 1, '2023-04-01', '2023-06-30'),
(8, 3, '2023-06-01', '2023-08-31'),
(8, 4, '2023-07-01', '2023-09-30'),
(9, 2, '2023-05-01', '2023-07-31'),
(9, 3, '2023-06-01', '2023-08-31'),
(9, 5, '2023-08-01', '2023-10-31'),
(10, 2, '2023-05-01', '2023-07-31'),
(10, 4, '2023-07-01', '2023-09-30');

-- --------------------------------------------------------

--
-- Table structure for table `promos`
--

CREATE TABLE `promos` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `promos`
--

INSERT INTO `promos` (`id`, `name`, `start_date`, `end_date`) VALUES
(1, 'Développement Web 101', '2023-04-01', '2023-06-30'),
(2, 'Développement Web Avancé', '2023-05-01', '2023-07-31'),
(3, 'Full Stack Web Développement ', '2023-06-01', '2023-08-31'),
(4, 'Développement Front-end', '2023-07-01', '2023-09-30'),
(5, 'Développement Back-end', '2023-08-01', '2023-10-31');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'Administrateur'),
(2, 'Formateur'),
(3, 'Apprenant');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `adress` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number_phone` text NOT NULL,
  `id_role` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `adress`, `email`, `number_phone`, `id_role`) VALUES
(1, 'Marie', 'Dupont', '3 Rue de la Paix, 75001 Paris', 'marie.dupont@gmail.com', '0123456789', 2),
(2, 'Pierre', 'Martin', '42 Rue de la République, 69002 Lyon', 'pierre.martin@yahoo.fr', '0678901234', 2),
(3, 'Sophie', 'Dubois', '15 Rue des Fleurs, 31000 Toulouse', 'sophie.dubois@hotmail.com', '0456789123', 2),
(4, 'Julien', 'Moreau', '8 Rue du Commerce, 44000 Nantes', 'julien.moreau@orange.fr', '0789123456', 1),
(5, 'Isabelle', 'Lefebvre', '27 Rue des Champs, 59000 Lille', 'isabelle.lefebvre@laposte.net', '0234567891', 3),
(6, 'Lucie', 'Rousseau', '10 Rue du Château, 67000 Strasbourg', 'lucie.rousseau@gmail.com', '0567891234', 3),
(7, 'Antoine', 'Girard', '22 Rue des Écoles, 69005 Lyon', 'antoine.girard@hotmail.com', '0678912345', 3),
(8, 'Elodie', 'Mercier', '5 Rue de la Liberté, 13001 Marseille', 'elodie.mercier@yahoo.fr', '0612345678', 3),
(9, 'Alexandre', 'Dupuis', '12 Rue de la Gare, 35000 Rennes', 'alexandre.dupuis@outlook.fr', '0234567891', 3),
(10, 'Nathalie', 'Leroy', '7 Avenue de la République, 75011 Paris', 'nathalie.leroy@laposte.net', '0789123456', 3),
(11, 'Étienne', 'Simon', '3 Rue de la Fontaine, 21000 Dijon', 'etienne.simon@orange.fr', '0678901234', 3),
(12, 'Marie-Louise', 'Morel', '9 Rue des Roses, 44000 Nantes', 'marielouise.morel@gmail.com', '0234567891', 3),
(13, 'Julien', 'Gauthier', '16 Rue des Lilas, 59000 Lille', 'julien.gauthier@hotmail.com', '0456789123', 3),
(14, 'Laura', 'Dubois', '22 Rue de la Paix, 69002 Lyon', 'laura.dubois@yahoo.fr', '0789123456', 3),
(15, 'Nicolas', 'Lefebvre', '10 Rue du Faubourg, 31000 Toulouse', 'nicolas.lefebvre@outlook.fr', '0678912345', 3),
(16, 'Nicolas', 'Dubois', '2 Rue de la Paix, 75002 Paris', 'nicolas.dubois@gmail.com', '0123456789', 3),
(17, 'Camille', 'Leroy', '12 Rue du Maréchal Foch, 44000 Nantes', 'camille.leroy@hotmail.com', '0234567891', 3),
(18, 'Maxime', 'Martin', '7 Rue de la Liberté, 31000 Toulouse', 'maxime.martin@yahoo.fr', '0456789123', 3),
(19, 'Elisa', 'Mercier', '5 Rue de la Gare, 67000 Strasbourg', 'elisa.mercier@outlook.fr', '0678912345', 3),
(20, 'Lucas', 'Rousseau', '18 Rue des Lilas, 69002 Lyon', 'lucas.rousseau@gmail.com', '0789123456', 3),
(21, 'Marie', 'Morel', '25 Rue des Roses, 69005 Lyon', 'marie.morel@orange.fr', '0123456789', 3),
(22, 'Mathieu', 'Gauthier', '3 Rue des Écoles, 75005 Paris', 'mathieu.gauthier@hotmail.com', '0234567891', 3),
(23, 'Sophie', 'Simon', '14 Rue de la Fontaine, 13001 Marseille', 'sophie.simon@yahoo.fr', '0345678912', 3),
(24, 'Pierre', 'Lefebvre', '10 Rue de la Paix, 59000 Lille', 'pierre.lefebvre@laposte.net', '0678912345', 3),
(25, 'Julie', 'Dupuis', '9 Avenue de la République, 75011 Paris', 'julie.dupuis@gmail.com', '0456789123', 3),
(26, 'Alexis', 'Girard', '5 Rue du Château, 69002 Lyon', 'alexis.girard@hotmail.com', '0234567891', 3),
(27, 'Emilie', 'Lemaire', '22 Rue des Lilas, 44000 Nantes', 'emilie.lemaire@yahoo.fr', '0567891234', 3),
(28, 'Rémi', 'Roux', '3 Rue de la Liberté, 35000 Rennes', 'remi.roux@outlook.fr', '0789123456', 3),
(29, 'Manon', 'Fournier', '8 Rue de la Gare, 75008 Paris', 'manon.fournier@gmail.com', '0456789123', 3),
(30, 'David', 'Brun', '14 Rue des Roses, 69005 Lyon', 'david.brun@hotmail.com', '0345678912', 3),
(31, 'Caroline', 'Vincent', '16 Rue des Écoles, 44000 Nantes', 'caroline.vincent@yahoo.fr', '0789123456', 3),
(32, 'Jérémy', 'Moreau', '20 Rue de la Paix, 75002 Paris', 'jeremy.moreau@gmail.com', '0678912345', 3),
(33, 'Hugo', 'Gagnon', '30 rue de la Paix', 'hugogagnon@mail.com', '0601020304', 3),
(34, 'Léa', 'Lavoie', '25 avenue du Maine', 'lealavoie@mail.com', '0602030405', 3),
(35, 'Noah', 'Lapointe', '15 rue de la Liberté', 'noahlapointe@mail.com', '0603040506', 3),
(36, 'Emma', 'Lafontaine', '50 boulevard Haussmann', 'emmalafontaine@mail.com', '0604050607', 3),
(37, 'Liam', 'Rousseau', '10 rue de la République', 'liamrousseau@mail.com', '0605060708', 3),
(38, 'Jade', 'Girard', '18 avenue des Champs-Elysées', 'jadegirard@mail.com', '0606070809', 3),
(39, 'William', 'Gagné', '2 rue de la Convention', 'williamgagne@mail.com', '0607080910', 3),
(40, 'Alice', 'Bélanger', '7 rue Sainte-Catherine', 'alicebelanger@mail.com', '0608091011', 3),
(41, 'Samuel', 'Lemieux', '12 avenue Foch', 'samuellemieux@mail.com', '0609101112', 3),
(42, 'Olivia', 'Beaulieu', '22 boulevard des Batignolles', 'oliviabeaulieu@mail.com', '0610111213', 3),
(43, 'Logan', 'Gauthier', '5 rue de la Pompe', 'logangauthier@mail.com', '0611121314', 3),
(44, 'Charlotte', 'Deschamps', '1 avenue Montaigne', 'charlottedeschamps@mail.com', '0612131415', 3),
(45, 'Nathan', 'Gosselin', '8 rue Saint-Honoré', 'nathangosselin@mail.com', '0613141516', 3),
(46, 'Eva', 'Dupont', '3 avenue Marceau', 'evadupont@mail.com', '0614151617', 3),
(47, 'William', 'Tremblay', '40 rue de la Roquette', 'williamtremblay@mail.com', '0615161718', 3),
(48, 'Léa', 'Lafleur', '20 avenue de l\'Opéra', 'lealafleur@mail.com', '0616171819', 3),
(49, 'Jacob', 'Dupuis', '14 rue Saint-Antoine', 'jacobdupuis@mail.com', '0617181920', 3),
(50, 'Chloé', 'Côté', '29 boulevard de Courcelles', 'chloecote@mail.com', '0618192021', 3),
(51, 'Mason', 'Lefebvre', '11 rue des Petits Champs', 'masonlefebvre@mail.com', '0619202122', 3),
(52, 'Livia', 'Perron', '9 avenue Victor Hugo', 'liviaperron@mail.com', '0620212223', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id_user` int(10) UNSIGNED NOT NULL,
  `id_group` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id_user`, `id_group`) VALUES
(5, 1),
(10, 1),
(6, 2),
(8, 2),
(7, 3),
(9, 3),
(11, 6),
(17, 6),
(14, 7),
(12, 7),
(20, 8),
(13, 8),
(19, 9),
(16, 9);

-- --------------------------------------------------------

--
-- Table structure for table `users_promos`
--

CREATE TABLE `users_promos` (
  `id_user` int(10) UNSIGNED NOT NULL,
  `id_promo` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_promos`
--

INSERT INTO `users_promos` (`id_user`, `id_promo`) VALUES
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 3),
(22, 3),
(23, 3),
(24, 3),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(29, 3),
(30, 3),
(31, 4),
(32, 4),
(33, 4),
(34, 4),
(35, 4),
(36, 4),
(39, 4),
(40, 4),
(37, 4),
(38, 4),
(41, 5),
(42, 5),
(43, 5),
(44, 5),
(45, 5),
(46, 5),
(47, 5),
(48, 5),
(49, 5),
(50, 5),
(51, 5),
(52, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_project` (`id_project`),
  ADD KEY `id_promo` (`id_promo`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `projects_promos`
--
ALTER TABLE `projects_promos`
  ADD KEY `id_project` (`id_project`),
  ADD KEY `id_promo` (`id_promo`);

--
-- Indexes for table `promos`
--
ALTER TABLE `promos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_role` (`id_role`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD KEY `id_group` (`id_group`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `users_promos`
--
ALTER TABLE `users_promos`
  ADD KEY `id_promo` (`id_promo`),
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `promos`
--
ALTER TABLE `promos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`id_project`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `groups_ibfk_2` FOREIGN KEY (`id_promo`) REFERENCES `promos` (`id`);

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `projects_promos`
--
ALTER TABLE `projects_promos`
  ADD CONSTRAINT `projects_promos_ibfk_1` FOREIGN KEY (`id_project`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_promos_ibfk_2` FOREIGN KEY (`id_promo`) REFERENCES `promos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id`);

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `users_groups_ibfk_1` FOREIGN KEY (`id_group`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_groups_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users_promos`
--
ALTER TABLE `users_promos`
  ADD CONSTRAINT `users_promos_ibfk_1` FOREIGN KEY (`id_promo`) REFERENCES `promos` (`id`),
  ADD CONSTRAINT `users_promos_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
