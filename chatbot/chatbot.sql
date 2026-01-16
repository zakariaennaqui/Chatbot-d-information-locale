-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 16 jan. 2026 à 15:18
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `chatbot`
--

-- --------------------------------------------------------

--
-- Structure de la table `evenements`
--

CREATE TABLE `evenements` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `lieu` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `evenements`
--

INSERT INTO `evenements` (`id`, `nom`, `date`, `lieu`, `description`) VALUES
(1, 'Gnaoua World Music Festival', '2025-06-26', 'Essaouira', 'International festival celebrating Gnaoua music and culture with artists from around the world.'),
(2, 'Fès Festival of World Sacred Music', '2025-06-13', 'Fès', 'Renowned spiritual and cultural event featuring sacred music, forums, and artistic encounters.'),
(3, 'Concert Jazz', '2025-12-18', 'Parc Central', 'Concert gratuit de jazz'),
(4, 'Marché Bio', '2025-12-20', 'Place du Marché', 'Marché biologique hebdomadaire'),
(5, 'Festival Culturel', '2025-12-22', 'Centre Ville', 'Festival des arts et cultures'),
(6, 'Hay Borja Fete', '2025-12-25', 'Hay Borja', 'Fête de quartier traditionnel'),
(7, 'Salon du Livre', '2025-12-28', 'Bibliothèque Centrale', 'Salon annuel du livre'),
(8, 'Festival des Arts de Marrakech', '2025-01-15', 'Jardin Majorelle, Marrakech', 'Festival annuel des arts visuels et scéniques'),
(9, 'Moussem de Tan-Tan', '2025-05-10', 'Tan-Tan, Région de Guelmim-Oued Noun', 'Rassemblement culturel et festif des tribus sahraouies'),
(10, 'Festival International du Film de Marrakech', '2025-11-29', 'Palais des Congrès, Marrakech', 'Compétition internationale de cinéma'),
(11, 'Festival des Cerises de Sefrou', '2025-06-15', 'Sefrou, Fès-Meknès', 'Célébration de la récolte des cerises'),
(12, 'Festival des Nomades à M\'hamid', '2025-03-20', 'M\'hamid El Ghizlane, Drâa-Tafilalet', 'Rencontre culturelle des peuples nomades'),
(13, 'Fête des Roses à Kelaa M\'gouna', '2025-05-01', 'Kelaa M\'gouna, Drâa-Tafilalet', 'Célébration de la récolte des roses'),
(14, 'Festival Gnawa d\'Essaouira', '2025-06-27', 'Essaouira, Marrakech-Safi', 'Festival de musique world et gnawa'),
(15, 'Salon International de l\'Agriculture de Meknès', '2025-04-25', 'Meknès, Fès-Meknès', 'Le plus grand salon agricole d\'Afrique'),
(16, 'Festival des Arts Populaires de Marrakech', '2025-07-05', 'Place Jemaa el-Fna, Marrakech', 'Spectacles de musique et danse traditionnelles'),
(17, 'Festival des Dattes à Erfoud', '2025-10-10', 'Erfoud, Drâa-Tafilalet', 'Célébration de la récolte des dattes'),
(18, 'Festival International de la Culture Amazighe', '2025-07-13', 'Rabat', 'Promotion de la culture et langue amazighes'),
(19, 'Festival du Cheval à Tissa', '2025-09-20', 'Tissa, Fès-Meknès', 'Fantasia et compétitions équestres'),
(20, 'Festival des Lumières de Fès', '2025-12-05', 'Médina de Fès', 'Mise en lumière du patrimoine historique'),
(21, 'Festival des Abeilles à Immouzzer', '2025-08-15', 'Immouzzer, Béni Mellal-Khénifra', 'Célébration de l\'apiculture et du miel'),
(22, 'Festival International du Théâtre Universitaire', '2025-03-10', 'Casablanca', 'Compétition de théâtre universitaire'),
(23, 'Moussem de Moulay Abdellah Amghar', '2025-08-25', 'El Jadida, Casablanca-Settat', 'Pèlerinage et festivités religieuses'),
(24, 'Festival des Arts de la Rue à Tanger', '2025-07-30', 'Tanger, Tanger-Tétouan-Al Hoceima', 'Performances artistiques en extérieur'),
(25, 'Festival International de Volubilis', '2025-06-05', 'Site archéologique de Volubilis', 'Festival de musique classique dans un site antique'),
(26, 'Festival des Roses de Kelaa M\'Gouna', '2026-05-10', 'Kelaa M\'Gouna', 'Célébration annuelle de la récolte des roses de la vallée du Dadès. Marché, processions et élection de Miss Roses.'),
(27, 'Festival International de la Culture Amazighe', '2026-07-13', 'Rabat', 'Promotion de la langue, musique, danse et artisanat amazighs. Concerts, conférences et expositions.'),
(28, 'Moussem de Moulay Idriss Zerhoun', '2026-09-15', 'Moulay Idriss', 'Pèlerinage religieux et festivités traditionnelles.'),
(29, 'Solaire Expo Maroc', '2026-02-10', 'Casablanca', 'Salon professionnel B2B dédié à l\'énergie solaire et à l\'efficacité énergétique. 118 exposants et 8240 visiteurs attendus[citation:7].'),
(30, 'MEGA HORECA MOROCCO', '2026-07-01', 'ICEC Casablanca', 'Le plus grand salon professionnel pour l\'hôtellerie, la restauration et les cafés au Maroc[citation:7].'),
(31, 'HYGIE-CLEAN EXPO', '2026-11-05', 'ICEC Casablanca', 'Salon international pour les industries du nettoyage, de l\'hygiène et de la chimie[citation:7].'),
(32, 'Marathon International de Casablanca', '2026-10-26', 'Casablanca', 'Course à pied avec des distances marathon, semi-marathon et 10km. Parcours dans la ville.'),
(33, 'Grand Prix Hassan II de Tennis', '2026-04-07', 'Casablanca', 'Tournoi international de tennis ATP sur terre battue.'),
(34, 'Nuit de la Poésie à Chefchaouen', '2026-03-21', 'Chefchaouen', 'Soirée de lectures de poésie en plusieurs langues dans la médina bleue.'),
(35, 'Salon de l\'Artisanat d\'Essaouira', '2026-08-15', 'Essaouira', 'Exposition-vente de l\'artisanat local : marqueterie, tissage, argent.'),
(36, 'Fête du Miel d\'Immouzzer', '2026-08-20', 'Immouzzer', 'Dégustation et vente de miels de la région, expositions apicoles.'),
(37, 'Gnaoua World Music Festival', '2025-06-12', 'Essaouira', 'A vibrant celebration of Gnaoua music and world sounds with free concerts on the beach.'),
(38, 'Fès Festival of World Sacred Music', '2025-06-26', 'Bab Makina, Fes', 'International festival promoting peace through spiritual and sacred music from around the globe.'),
(39, 'Marrakech Popular Arts Festival', '2025-07-10', 'Jemaa el-Fnaa, Marrakech', 'A chaotic and free spectacle of acrobats, snake charmers, and Berber musicians in the main square.'),
(40, 'Festival of Roses', '2025-05-01', 'El Kelaa M\'Gouna', 'Celebration of the rose harvest with parades, folk music, and the crowning of a Rose Queen.'),
(41, 'Mawazine Festival - Rhythms of the World', '2025-05-01', 'Various venues, Rabat', 'One of the world\'s largest music festivals featuring international and Moroccan artists across multiple stages.'),
(42, 'Almond Blossom Festival', '2025-02-15', 'Tafraoute', 'Celebration of the almond harvest with traditional Berber music and dance amidst the blooming trees.'),
(43, 'International Film Festival of Marrakech', '2025-05-02', 'Marrakech', 'Prestigious film festival attracting international stars, with red carpet events and free public screenings.'),
(44, 'Imilchyl Marriage Festival', '2025-09-19', 'Imilchyl, haut Atlas', 'Traditional Berber festival where young people from different tribes meet with the prospect of marriage.'),
(45, 'Date Festival', '2025-10-24', 'Erfoud', 'A celebration of the date harvest with exhibitions of numerous date varieties, music, and parades.'),
(46, 'Tan Tan Moussem', '2025-12-01', 'Tan Tan', 'A UNESCO-listed cultural festival celebrating Saharan nomadic heritage with camel races and traditional music.'),
(47, 'New Year\'s Day', '2025-01-01', 'Nationwide', 'Celebration of the new year according to the Gregorian calendar.'),
(48, 'Independence Manifesto Day', '2025-01-11', 'Nationwide', 'Anniversary of the presentation of the Independence Manifesto in 1944.[citation:2][citation:4]'),
(49, 'Amazigh New Year (Yennayer)', '2025-01-14', 'Nationwide', 'Celebration of the Berber New Year, a national holiday.[citation:2][citation:4]'),
(50, 'Labour Day', '2025-05-01', 'Nationwide', 'International Workers\' Day.[citation:2][citation:5]'),
(51, 'Throne Day', '2025-07-30', 'Nationwide', 'Anniversary of King Mohammed VI\'s accession to the throne.[citation:2][citation:4][citation:7]'),
(52, 'Eid al-Adha (Feast of Sacrifice)', '2025-06-07', 'Nationwide', 'Major Islamic festival.[citation:4][citation:7]'),
(53, 'Independence Day', '2025-11-18', 'Nationwide', 'Celebrates Morocco\'s independence.[citation:2][citation:4][citation:5]'),
(54, 'Marathon des Sables', '2025-04-05', 'Sahara Desert', 'One of the world\'s toughest foot races.[citation:3][citation:6]'),
(55, 'Festival of Roses', '2025-05-01', 'El Kelaa M\'Gouna', 'Celebration of the rose harvest with parades and folk music.[citation:3]'),
(56, 'Gnaoua World Music Festival', '2025-06-20', 'Essaouira', 'Celebration of Gnaoua music and culture with international artists.[citation:3][citation:6]'),
(57, 'Mawazine Festival', '2025-06-21', 'Rabat', 'One of the world\'s largest music festivals.[citation:3][citation:6]'),
(58, 'Timitar Festival', '2025-07-03', 'Agadir', 'Premier festival of Amazigh (Berber) and world music.[citation:3][citation:6]'),
(59, 'Tanjazz Festival', '2025-09-19', 'Tangier', 'International jazz festival.[citation:3][citation:6]'),
(60, 'Almond Blossom Festival', '2025-02-15', 'Tafraoute', 'Celebration of the almond harvest with traditional Berber music.[citation:3]'),
(61, 'Weekly Artisan Souk', '2025-03-08', 'Marrakech Medina', 'Weekly market featuring traditional crafts, pottery, and textiles.'),
(62, 'Chefchaouen Cultural Walk', '2025-07-10', 'Chefchaouen', 'Guided tour exploring the history of the blue city.'),
(63, 'Dates Festival', '2025-10-10', 'Erfoud', 'Celebration of the date harvest with music, dance, and camel races.[citation:3]');

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `response` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `message`, `response`, `timestamp`) VALUES
(47, 4, 'hi', 'Salut ! Que souhaitez-vous savoir ?', '2025-12-15 05:45:17'),
(48, 4, 'Concert Jazz', '📅 Concert Jazz: Concert gratuit de jazz à Parc Central le 2025-12-18', '2025-12-15 05:46:39'),
(49, 4, 'Marché Bio', '📅 Marché Bio: Marché biologique hebdomadaire à Place du Marché le 2025-12-20', '2025-12-15 05:46:55'),
(50, 4, 'Marché Bi', '📅 Marché Bio: Marché biologique hebdomadaire à Place du Marché le 2025-12-20', '2025-12-15 05:47:00'),
(51, 4, 'Parc central', 'Salut ! Que souhaitez-vous savoir ?', '2025-12-15 05:48:00'),
(52, 4, 'evenementX', '📅 evenementX: Concert gratuit de jazz à Parc central le 2025-12-18', '2025-12-15 05:48:17'),
(53, 4, 'Hay Borja Fete', '📅 Hay Borja Fete: Fête de quartier traditionnel à Hay Borja le 2025-12-25', '2025-12-15 05:48:36'),
(54, 4, 'Hay Borja Feté', '📅 Hay Borja Fete: Fête de quartier traditionnel à Hay Borja le 2025-12-25', '2025-12-15 05:48:44'),
(55, 4, 'bus', '🚌 Ligne 1 (bus)\n   Horaires: Toutes les 10-15 min\n   Tarif: 4 DH\n   Destination: Hay Borja - Centre Ville\n   État: Normal\n\n🚌 Ligne 2 (bus)\n   Horaires: Toutes les 20 min\n   Tarif: 4 DH\n   Destination: Ain Diab - Maarif\n   État: Retard\n\n🚌 Ligne 3 (bus)\n   Horaires: Toutes les 15 min\n   Tarif: 4 DH\n   Destination: Casa Port - Ain Sebaa\n   État: Retard léger\n\n🚌 Ligne 15 (bus)\n   Horaires: Toutes les 12 min\n   Tarif: 4 DH\n   Destination: Hay Hassani - Derb Sultan\n   État: Normal', '2025-12-15 05:49:58'),
(56, 4, 'M1', '🚌 Ligne 1 (bus)\n   Horaires: Toutes les 10-15 min\n   Tarif: 4 DH\n   Destination: Hay Borja - Centre Ville\n   État: Normal\n\n🚌 Ligne M1 (tramway)\n   Horaires: Toutes les 8 min\n   Tarif: 6 DH\n   Destination: Sidi Moumen - Facultés\n   État: Normal', '2025-12-15 05:53:38'),
(57, 4, 'Hay Borja - Centre Ville', '🚌 Ligne 1 (bus)\n   Horaires: Toutes les 10-15 min\n   Tarif: 4 DH\n   Destination: Hay Borja - Centre Ville\n   État: Normal', '2025-12-15 05:54:51'),
(58, 4, 'Mairie', '🏛️ Mairie\n   Horaires: 08:30-17:30\n   Adresse: 123 Avenue Mohammed V, Casablanca\n   Téléphone: 0522-123456\n   Description: Services administratifs municipaux', '2025-12-15 05:56:33'),
(59, 4, 'Services administratifs municipaux', 'Aucun service trouvé.', '2025-12-15 05:57:00'),
(60, 4, 'service', 'Aucun service trouvé.', '2025-12-15 05:58:03'),
(61, 4, 'services', 'Aucun service trouvé.', '2025-12-15 05:58:14'),
(62, 4, 'services_muncipaux', 'Aucun service trouvé.', '2025-12-15 05:58:27'),
(63, 4, 'services muncipaux', 'Aucun service trouvé.', '2025-12-15 05:58:37'),
(64, 4, 'transports', 'Aucun transport trouvé.', '2025-12-15 05:59:25'),
(65, 4, 'events', 'Aucun événement trouvé.', '2025-12-15 05:59:36'),
(66, 4, 'event', 'Aucun événement trouvé.', '2025-12-15 06:01:54'),
(67, 4, 'test', '🏛️ test\n   Horaires: 555555\n   Adresse: 5555\n   Téléphone: 555555\n   Description: test', '2025-12-15 06:08:17'),
(68, 4, 'evenement', 'Aucun événement trouvé.', '2025-12-15 06:11:13'),
(69, 4, 'test', 'Aucun service trouvé.', '2025-12-15 06:14:03'),
(70, 4, 'Concert Jazz', '📅 Concert Jazz: Concert gratuit de jazz à Parc Central le 2025-12-18', '2025-12-15 11:27:32'),
(71, 4, 'coupe afrique', 'Bonjour ! Posez-moi vos questions sur les événements, services ou transports.', '2025-12-15 11:28:06'),
(72, 1, 'Marrakech - Essaouira', '🚌 Ligne CTM 101 (bus longue distance)\n   Horaires: Départs: 07:00, 10:30, 15:00, 19:30\n   Tarif: 85 DH\n   Destination: Marrakech - Essaouira\n   État: Normal\n\n🚌 Ligne GT MRK-ESS (grand taxi)\n   Horaires: 06:00-20:00, départ à remplissage\n   Tarif: 70 DH/place\n   Destination: Marrakech - Essaouira\n   État: Normal\n\n🚌 Ligne CTM 401 (bus longue distance)\n   Horaires: Départs: 07:00, 10:30, 15:00, 19:30\n   Tarif: 85 DH\n   Destination: Marrakech - Essaouira\n   État: Normal\n\n🚌 Ligne GT: MRK-ESSA (grand taxi)\n   Horaires: 06:00-20:00 (départ à remplissage)\n   Tarif: 70 DH/place\n   Destination: Marrakech - Essaouira\n   État: Normal', '2025-12-23 12:43:58'),
(73, 1, 'Place Mohammed V - Ain Chock', '🚌 Ligne Casa 10 (bus)\n   Horaires: 05:00-22:00, toutes les 15 min\n   Tarif: 4 DH\n   Destination: Place Mohammed V - Ain Chock\n   État: Normal\n\n🚌 Ligne Casa 10 (bus)\n   Horaires: 05:00-22:00, toutes les 15 min\n   Tarif: 4 DH\n   Destination: Place Mohammed V - Ain Chock\n   État: Normal', '2025-12-23 12:44:31'),
(74, 1, 'hi', 'Ligne L110 (bus)\n   Horaires: Toutes les 45 min\n   Tarif: 6 DH\n   Destination: Errachidia - Erfoud\n   État: Normal\n\nLigne L111 (bus)\n   Horaires: Toutes les 60 min\n   Tarif: 8 DH\n   Destination: Errachidia - Midelt\n   État: Normal', '2025-12-23 12:53:02'),
(75, 1, 'Bonjour', 'Bonjour ! Comment puis-je vous aider aujourd\'hui ?', '2025-12-23 12:53:30'),
(76, 1, 'Hi', 'Ligne L110 (bus)\n   Horaires: Toutes les 45 min\n   Tarif: 6 DH\n   Destination: Errachidia - Erfoud\n   État: Normal\n\nLigne L111 (bus)\n   Horaires: Toutes les 60 min\n   Tarif: 8 DH\n   Destination: Errachidia - Midelt\n   État: Normal', '2025-12-23 12:53:35'),
(77, 1, 'Hey', 'Hello ! Je suis là pour vous renseigner.', '2025-12-23 12:53:58'),
(78, 1, 'Bye', 'Au plaisir de vous revoir !', '2025-12-23 12:54:15'),
(79, 1, 'hi', '🚌 Ligne L110 (bus)\n   Horaires: Toutes les 45 min\n   Tarif: 6 DH\n   Destination: Errachidia - Erfoud\n   État: Normal\n\n🚌 Ligne L111 (bus)\n   Horaires: Toutes les 60 min\n   Tarif: 8 DH\n   Destination: Errachidia - Midelt\n   État: Normal', '2025-12-23 13:02:47'),
(80, 1, 'how are you', 'Aucun transport trouvé.', '2025-12-23 13:02:53'),
(81, 1, 'hey', 'Salut ! Que souhaitez-vous savoir ?', '2025-12-23 13:03:00'),
(82, 1, 'hi', '🚌 Ligne L110 (bus)\n   Horaires: Toutes les 45 min\n   Tarif: 6 DH\n   Destination: Errachidia - Erfoud\n   État: Normal\n\n🚌 Ligne L111 (bus)\n   Horaires: Toutes les 60 min\n   Tarif: 8 DH\n   Destination: Errachidia - Midelt\n   État: Normal', '2025-12-23 13:04:23'),
(83, 1, 'Lahraouiyine - Casa-Port', '🚌 Ligne C35 (bus)\n   Horaires: 05:30-21:45, toutes les 20 min\n   Tarif: 5 DH\n   Destination: Lahraouiyine - Casa-Port\n   État: Normal', '2025-12-23 13:33:51'),
(84, 1, 'lahraouiyine', '🚌 Ligne C35 (bus)\n   Horaires: 05:30-21:45, toutes les 20 min\n   Tarif: 5 DH\n   Destination: Lahraouiyine - Casa-Port\n   État: Normal', '2025-12-23 13:35:02'),
(85, 1, 'berrechid', 'Aucun transport trouvé.', '2025-12-23 13:35:22'),
(86, 1, 'youssoufia', '🚌 Ligne L130 (bus)\n   Horaires: Toutes les 35 min\n   Tarif: 5 DH\n   Destination: Safi - Youssoufia\n   État: Normal', '2025-12-23 13:35:44'),
(87, 1, 'safi', '🏛️ Service Social - Safi\n   Horaires: 08:30-16:30\n   Adresse: Rue Moulay Youssef, Safi\n   Téléphone: 0524-626262\n   Description: Aide sociale et assistance\n\n🏛️ Conseil Régional Marrakech-Safi\n   Horaires: 08:30-16:30\n   Adresse: Siège du Conseil, Marrakech\n   Téléphone: 0524-XXXXXX\n   Description: Gouvernement et développement de la région.', '2025-12-23 13:35:56'),
(88, 1, 'tanger', '📅 Festival des Arts de la Rue à Tanger: Performances artistiques en extérieur à Tanger, Tanger-Tétouan-Al Hoceima le 2025-07-30', '2025-12-23 13:37:05'),
(89, 1, 'kenitra', '🏛️ Conseil Régional Rabat-Salé-Kénitra\n   Horaires: 08:30-16:30\n   Adresse: Siège du Conseil, Rabat\n   Téléphone: 0537-XXXXXX\n   Description: Gouvernement et développement de la région.\n\n🏛️ Conseil Régional Rabat-Salé-Kénitra\n   Horaires: 08:30-17:30\n   Adresse: Siège du Conseil, Rabat\n   Téléphone: 0537-XXXXXX\n   Description: Institution en charge du développement régional.\n\n🏛️ Académie Régionale de l\'Éducation et de la Formation (AREF) Rabat-Salé-Kénitra\n   Horaires: 08:30-17:00\n   Adresse: Avenue Al Haj Ahmed Bahnini, Rabat\n   Téléphone: 0537-JJJJJJ\n   Description: Gestion de l\'enseignement scolaire dans la région.[citation:1]', '2025-12-23 13:37:39'),
(90, 1, 'hixijfldsf', 'Aucun transport trouvé.', '2025-12-23 13:44:05'),
(91, 1, 'c:fkdsml4', '🚌 Ligne L4 (bus)\n   Horaires: Toutes les 30 min\n   Tarif: 5 DH\n   Destination: Tanger Ville - Malabata\n   État: Normal', '2025-12-23 13:44:16'),
(92, 1, 'cjfmhjfdgjfkh', 'Aucun transport trouvé.', '2025-12-23 13:44:23'),
(93, 1, 'hi', '📅 Imilchil Marriage Festival: Traditional Berber festival where young people from different tribes meet with the prospect of marriage. à Imilchil, High Atlas le 2025-09-19', '2025-12-25 13:12:42'),
(94, 1, 'Hay Borja - Centre Ville', '🚌 Ligne 1 (bus)\n   Horaires: Toutes les 10-15 min\n   Tarif: 4 DH\n   Destination: Hay Borja - Centre Ville\n   État: Normal', '2025-12-25 13:13:13'),
(95, 1, 'hi', '📅 Imilchil Marriage Festival: Traditional Berber festival where young people from different tribes meet with the prospect of marriage. à Imilchil, High Atlas le 2025-09-19', '2025-12-25 13:13:26'),
(96, 1, 'hi', '📅 Imilchil Marriage Festival: Traditional Berber festival where young people from different tribes meet with the prospect of marriage. à Imilchil, High Atlas le 2025-09-19', '2025-12-25 13:15:53'),
(97, 1, 'hi', '🏛️ Archives Municipales de Rabat\n   Horaires: 09:00-15:00\n   Adresse: Rue Patrice Lumumba, Rabat\n   Téléphone: 0537-20-XXXX\n   Description: Consultation des archives historiques de la ville.\n\n🏛️ Archives du Maroc\n   Horaires: 09:00-16:00\n   Adresse: Rabat\n   Téléphone: 0537-LLLLLL\n   Description: Institution nationale des archives.[citation:1]\n\n🏛️ Centre Cinématographique Marocain\n   Horaires: 09:00-17:00\n   Adresse: Rue Zelaka, Rabat\n   Téléphone: 0537-MMMMMM\n   Description: Promotion et régulation de l\'industrie cinématographique.[citation:1]', '2025-12-25 13:19:28'),
(98, 1, 'hi', '🏛️ Archives Municipales de Rabat\n   Horaires: 09:00-15:00\n   Adresse: Rue Patrice Lumumba, Rabat\n   Téléphone: 0537-20-XXXX\n   Description: Consultation des archives historiques de la ville.\n\n🏛️ Archives du Maroc\n   Horaires: 09:00-16:00\n   Adresse: Rabat\n   Téléphone: 0537-LLLLLL\n   Description: Institution nationale des archives.[citation:1]\n\n🏛️ Centre Cinématographique Marocain\n   Horaires: 09:00-17:00\n   Adresse: Rue Zelaka, Rabat\n   Téléphone: 0537-MMMMMM\n   Description: Promotion et régulation de l\'industrie cinématographique.[citation:1]', '2025-12-25 13:20:13'),
(99, 1, 'hi', '🚌 Ligne L110 (bus)\n   Horaires: Toutes les 45 min\n   Tarif: 6 DH\n   Destination: Errachidia - Erfoud\n   État: Normal\n\n🚌 Ligne L111 (bus)\n   Horaires: Toutes les 60 min\n   Tarif: 8 DH\n   Destination: Errachidia - Midelt\n   État: Normal', '2025-12-25 13:23:27'),
(100, 1, 'hi', 'Salut ! Que souhaitez-vous savoir ?', '2025-12-25 13:29:08'),
(101, 1, 'hello', 'Salut ! Que souhaitez-vous savoir ?', '2025-12-25 13:29:25'),
(102, 1, 'yo', '🏛️ Bibliothèque Sidi Belyout\n   Horaires: 10:00-19:00\n   Adresse: Rue Ahmed Charci, Sidi Belyout, Casablanca\n   Téléphone: 0522-48-XXXX\n   Description: Bibliothèque municipale avec section jeunesse et salle d\'étude.\n\n🏛️ Conseil Régional Laâyoune-Sakia El Hamra\n   Horaires: 08:30-16:30\n   Adresse: Siège du Conseil, Laâyoune\n   Téléphone: 0528-888888\n   Description: Gouvernement et développement de la région.', '2025-12-25 13:29:35'),
(103, 1, 'Salam', 'Salut ! Que souhaitez-vous savoir ?', '2025-12-25 13:29:51'),
(104, 1, 'Salamb', 'Aucun transport trouvé.', '2025-12-25 13:29:55'),
(105, 1, 'Salamm', 'Aucun transport trouvé.', '2025-12-25 13:30:02'),
(106, 1, 'SalaM', 'Bonjour ! Posez-moi vos questions sur les événements, services ou transports.', '2025-12-25 13:30:09');

-- --------------------------------------------------------

--
-- Structure de la table `services_municipaux`
--

CREATE TABLE `services_municipaux` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `horaires` varchar(100) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `telephone` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `services_municipaux`
--

INSERT INTO `services_municipaux` (`id`, `nom`, `description`, `horaires`, `adresse`, `telephone`) VALUES
(1, 'Conseil Régional Tanger-Tétouan-Al Hoceima', 'Gouvernement et développement de la région.', '08:30-16:30', 'Siège du Conseil, Tanger', '0539-XXXXXX'),
(2, 'Conseil Régional de l\'Oriental', 'Gouvernement et développement de la région.', '08:30-16:30', 'Siège du Conseil, Oujda', '0536-XXXXXX'),
(3, 'Conseil Régional Fès-Meknès', 'Gouvernement et développement de la région.', '08:30-16:30', 'Siège du Conseil, Fès', '0535-XXXXXX'),
(4, 'Conseil Régional Rabat-Salé-Kénitra', 'Gouvernement et développement de la région.', '08:30-16:30', 'Siège du Conseil, Rabat', '0537-XXXXXX'),
(5, 'État Civil', 'Service d\'état civil et documents officiels', '09:00-16:00', '123 Avenue Mohammed V, Casablanca', '0522-123458'),
(6, 'Bibliothèque', 'Bibliothèque municipale publique', '10:00-19:00', '45 Rue de la Culture, Casablanca', '0522-123459'),
(7, 'Centre Social', 'Aide sociale et accompagnement', '08:00-17:00', '78 Rue des Fleurs, Casablanca', '0522-999888'),
(8, 'Mairie de Marrakech', 'Services administratifs de la ville ocre', '08:30-17:30', 'Avenue Mohammed V, Marrakech', '0524-338989'),
(9, 'Service Propreté - Rabat', 'Collecte des déchets et nettoyage urbain', '06:00-22:00', 'Avenue Al Massira, Rabat', '0537-202020'),
(10, 'Police Municipale - Casablanca', 'Sécurité urbaine et circulation', '24/24', 'Boulevard Brahim Roudani, Casablanca', '0522-303030'),
(11, 'Centre Culturel - Fès', 'Activités culturelles et artistiques', '09:00-20:00', 'Place Batha, Fès', '0535-636363'),
(12, 'Service Eaux et Assainissement - Tanger', 'Distribution d\'eau et assainissement', '08:00-18:00', 'Avenue Mohammed VI, Tanger', '0539-323232'),
(13, 'Service Urbanisme - Agadir', 'Permis de construire et urbanisme', '08:30-16:30', 'Boulevard Hassan II, Agadir', '0528-848484'),
(14, 'Centre Médical Municipal - Meknès', 'Soins de santé primaires', '08:00-20:00', 'Rue Dar Smen, Meknès', '0535-525252'),
(15, 'Service Jeunesse et Sports - Oujda', 'Activités sportives et jeunesse', '09:00-19:00', 'Avenue Al Qods, Oujda', '0536-707070'),
(16, 'Bibliothèque Municipale - Essaouira', 'Lecture publique et médiathèque', '10:00-18:00', 'Rue du Caire, Essaouira', '0524-474747'),
(17, 'Marché Municipal - Chefchaouen', 'Marché couvert et produits locaux', '07:00-15:00', 'Place El Haouta, Chefchaouen', '0539-989898'),
(18, 'Service Environnement - El Jadida', 'Protection environnementale', '08:30-17:00', 'Avenue Mohammed Erraji, El Jadida', '0523-353535'),
(19, 'Centre d\'Accueil Touristique - Dakhla', 'Information et services touristiques', '09:00-19:00', 'Av. Mohammed V, Dakhla', '0528-898989'),
(20, 'Service Social - Safi', 'Aide sociale et assistance', '08:30-16:30', 'Rue Moulay Youssef, Safi', '0524-626262'),
(21, 'Piscine Municipale - Béni Mellal', 'Piscine publique et activités aquatiques', '07:00-21:00', 'Avenue Hassan II, Béni Mellal', '0523-484848'),
(22, 'Service Transport Urbain - Tétouan', 'Gestion des transports en commun', '08:00-18:00', 'Place Moulay El Mehdi, Tétouan', '0539-969696'),
(23, 'Office du Tourisme - Asilah', 'Promotion touristique et information', '09:00-18:00', 'Place du 9 Avril, Asilah', '0539-417979'),
(24, 'Service des Marchés - Khouribga', 'Gestion des marchés municipaux', '07:00-16:00', 'Avenue des FAR, Khouribga', '0523-494949'),
(25, 'Centre Artisanal - Taroudant', 'Promotion de l\'artisanat local', '09:00-19:00', 'Place Assarag, Taroudant', '0528-555555'),
(26, 'Mairie d\'Arrondissement Maarif', 'Services administratifs de l\'arrondissement (cartes nationales, état civil).', '08:30-16:30', 'Place de la Résistance, Maarif, Casablanca', '0522-27-XXXX'),
(27, 'Bibliothèque Sidi Belyout', 'Bibliothèque municipale avec section jeunesse et salle d\'étude.', '10:00-19:00', 'Rue Ahmed Charci, Sidi Belyout, Casablanca', '0522-48-XXXX'),
(28, 'Complexe Sportif El Hank', 'Stade, piscine olympique et terrains de tennis publics.', '07:00-22:00', 'Boulevard de la Corniche, Casablanca', '0522-36-XXXX'),
(29, 'Centre de Santé Sidi Othmane', 'Dispensaire public pour soins de santé primaires et vaccinations.', '08:00-18:00', 'Avenue des FAR, Sidi Othmane, Casablanca', '0522-62-XXXX'),
(30, 'Mairie de Rabat', 'Services centraux de la municipalité.', '08:30-17:00', 'Avenue Mohammed V, Rabat', '0537-73-XXXX'),
(32, 'Délégation de l\'Eau et de l\'Électricité (RADEEMA)', 'Paiement des factures et dépôt de dossiers pour les branchements.', '08:30-15:30', 'Guéliz, Marrakech', '0524-33-XXXX'),
(33, 'Office Municipal de l\'Habitat (OMH)', 'Information sur les programmes de logement sociaux.', '09:00-16:00', 'Avenue Hassan II, Marrakech', '0524-44-XXXX'),
(34, 'Service de la Voirie et de la Propreté', 'Signalement des problèmes de nettoyage ou d\'éclairage public.', '08:00-17:00', 'Boulevard Mohammed VI, Tangier', '0539-32-XXXX'),
(35, 'Centre d\'Accueil et d\'Orientation Sociale', 'Aide sociale, orientation et soutien aux familles en difficulté.', '08:30-16:00', 'Rue de la Liberté, Tangier', '0539-94-XXXX'),
(36, 'Conseil Régional Casablanca-Settat', 'Institution en charge du développement régional.', '08:30-17:30', 'Siège du Conseil, Casablanca', '0522-XXXXXX'),
(37, 'Conseil Régional Rabat-Salé-Kénitra', 'Institution en charge du développement régional.', '08:30-17:30', 'Siège du Conseil, Rabat', '0537-XXXXXX'),
(38, 'Municipalité de Marrakech', 'Administration des services communaux de la ville.', '08:30-16:30', 'Place de la Liberté, Marrakech', '0524-XXXXXX'),
(39, 'Agence Urbaine de Casablanca', 'Urbanisme, aménagement et planification de la ville.', '08:30-16:30', 'Avenue Hassan II, Casablanca', '0522-XXXXXX'),
(40, 'Agence Urbaine de Marrakech', 'Urbanisme, aménagement et planification de la ville.', '08:30-16:30', 'Guéliz, Marrakech', '0524-XXXXXX'),
(41, 'Agence du Bassin Hydraulique du Tensift', 'Gestion des ressources en eau dans la région.', '08:30-17:00', 'Quartier Industriel, Marrakech', '0524-YYYYYY'),
(42, 'Académie Régionale de l\'Education et de la Formation (AREF) Casablanca-Settat', 'Gestion de l\'enseignement scolaire dans la région.', '08:30-17:00', 'Avenue des FAR, Casablanca', '0522-XXXXXX'),
(43, 'Université Mohammed V de Rabat', 'Enseignement supérieur et recherche.', '08:30-18:00', 'Avenue des Nations Unies, Rabat', '0537-XXXXXX'),
(44, 'Centre National de la Recherche Scientifique (CNRST)', 'Coordination de la recherche scientifique nationale.', '08:30-17:30', 'Angle Ave. Allal El Fassi et My Rachid, Rabat', '0537-YYYYYY'),
(45, 'Centre Hospitalier Universitaire (CHU) Ibn Rochd', 'Hôpital universitaire et centre de soins de référence.', '24h/24', 'Quartier des Hôpitaux, Casablanca', '0522-XXXXXX'),
(46, 'Caisse Nationale de Sécurité Sociale (CNSS) - Agence Centre', 'Gestion des assurances sociales des salariés.', '08:30-16:30', 'Bd. Mohamed V, Casablanca', '0522-YYYYYY'),
(47, 'Agence de Développement Social', 'Mise en œuvre des politiques de développement social.', '08:30-17:00', 'Hay Riad, Rabat', '0537-XXXXXX'),
(48, 'CHU Ibn Rochd', 'Centre Hospitalier Universitaire et centre de soins de référence.', '24h/24', 'Quartier des Hôpitaux, Casablanca', '0522-AAAAAA'),
(49, 'CHU Hassan II', 'Centre Hospitalier Universitaire majeur à Fès.', '24h/24', 'Route Sidi Hrazem, Fès', '0535-BBBBBB'),
(50, 'Conseil Régional Béni Mellal-Khénifra', 'Gouvernement et développement de la région.', '08:30-16:30', 'Siège du Conseil, Béni Mellal', '0523-XXXXXX'),
(51, 'Conseil Régional Casablanca-Settat', 'Gouvernement et développement de la région.', '08:30-16:30', 'Siège du Conseil, Casablanca', '0522-XXXXXX'),
(52, 'Conseil Régional Marrakech-Safi', 'Gouvernement et développement de la région.', '08:30-16:30', 'Siège du Conseil, Marrakech', '0524-XXXXXX'),
(53, 'Conseil Régional Drâa-Tafilalet', 'Gouvernement et développement de la région.', '08:30-16:30', 'Siège du Conseil, Errachidia', '0535-YYYYYY'),
(54, 'Conseil Régional Souss-Massa', 'Gouvernement et développement de la région.', '08:30-16:30', 'Siège du Conseil, Agadir', '0528-XXXXXX'),
(55, 'Conseil Régional Guelmim-Oued Noun', 'Gouvernement et développement de la région.', '08:30-16:30', 'Siège du Conseil, Guelmim', '0528-YYYYYY'),
(56, 'Conseil Régional Laâyoune-Sakia El Hamra', 'Gouvernement et développement de la région.', '08:30-16:30', 'Siège du Conseil, Laâyoune', '0528-888888'),
(57, 'Conseil Régional Dakhla-Oued Ed-Dahab', 'Gouvernement et développement de la région.', '08:30-16:30', 'Siège du Conseil, Dakhla', '0528-999999'),
(58, 'CHU Mohammed VI', 'Centre Hospitalier Universitaire à Marrakech.', '24h/24', 'Quartier Mhamid, Marrakech', '0524-CCCCCC'),
(59, 'Agence Marocaine du Médicament et des Produits de Santé', 'Régulation des médicaments et produits de santé.', '08:30-16:30', 'Rabat', '0537-DDDDDD'),
(60, 'Caisse Nationale de Sécurité Sociale (CNSS) - Siège', 'Gestion des assurances sociales des salariés.[citation:1]', '08:30-16:30', 'Avenue Moulay Hassan, Rabat', '0537-EEEEEE'),
(61, 'Fond National des Organismes de Prévoyance Sociale - Caisse de Retraite', 'Gestion des pensions de retraite.[citation:1]', '08:30-16:30', 'Rabat', '0537-FFFFFF'),
(62, 'Université Mohammed V de Rabat', 'Principale université de recherche et d\'enseignement supérieur.[citation:1]', '08:00-18:00', 'Avenue des Nations Unies, Rabat', '0537-GGGGGG'),
(63, 'Université Cadi Ayyad', 'Université majeure de la région Marrakech-Safi.[citation:1]', '08:00-18:00', 'Boulevard Abdelkrim Khattabi, Marrakech', '0524-HHHHHH'),
(64, 'Académie Régionale de l\'Éducation et de la Formation (AREF) Casablanca-Settat', 'Gestion de l\'enseignement scolaire dans la région.', '08:30-17:00', 'Avenue des FAR, Casablanca', '0522-IIIIII'),
(65, 'Académie Régionale de l\'Éducation et de la Formation (AREF) Rabat-Salé-Kénitra', 'Gestion de l\'enseignement scolaire dans la région.[citation:1]', '08:30-17:00', 'Avenue Al Haj Ahmed Bahnini, Rabat', '0537-JJJJJJ'),
(66, 'Bibliothèque Nationale du Royaume du Maroc', 'Bibliothèque nationale et archive du dépôt légal.[citation:1]', '09:00-17:00', 'Avenue Ibn Khaldoun, Rabat', '0537-KKKKKK'),
(69, 'Agence Urbaine de Casablanca', 'Urbanisme, aménagement et planification de la ville.[citation:1]', '08:30-16:30', 'Avenue Hassan II, Casablanca', '0522-NNNNNN'),
(70, 'Agence Urbaine de Marrakech', 'Urbanisme, aménagement et planification de la ville.[citation:1]', '08:30-16:30', 'Guéliz, Marrakech', '0524-OOOOOO'),
(71, 'Agence Urbaine de Rabat-Salé', 'Urbanisme, aménagement et planification de la région.[citation:1]', '08:30-16:30', 'Rabat', '0537-PPPPPP'),
(72, 'Agence Nationale des Eaux et Forêts', 'Gestion durable des ressources en eau et des forêts.[citation:1]', '08:30-16:30', 'Rabat', '0537-QQQQQQ'),
(73, 'Office National de l\'Électricité et de l\'Eau Potable (ONEE)', 'Production et distribution d\'électricité et d\'eau.[citation:1]', '08:30-16:30', 'Rabat', '0537-RRRRRR'),
(74, 'Office National des Chemins de Fer (ONCF)', 'Gestion du réseau ferroviaire national.[citation:1]', '08:30-16:30', 'Rabat', '0537-SSSSSS'),
(75, 'Agence Marocaine de Développement des Investissements et des Exportations', 'Promotion des investissements et des exportations.[citation:1]', '08:30-17:00', 'Angle rue Al Abtal et rue Oued Fès, Rabat', '0537-TTTTTT'),
(76, 'Office National Marocain du Tourisme (ONMT)', 'Promotion du tourisme au Maroc.[citation:1][citation:6]', '08:30-17:00', 'Rue Oqba Ibn Nafaa, Rabat', '0537-UUUUUU'),
(77, 'Agence Nationale de Promotion de l\'Emploi et des Compétences (ANAPEC)', 'Intermédiation sur le marché du travail et promotion de l\'emploi.[citation:1]', '08:30-16:30', 'Rabat', '0537-VVVVVV'),
(78, 'Agence de Développement Social', 'Mise en œuvre des politiques de développement social.[citation:1]', '08:30-17:00', 'Hay Riad, Rabat', '0537-WWWWWW'),
(79, 'Agence Nationale de la Promotion des Petites et Moyennes Entreprises', 'Soutien au développement des PME.[citation:1]', '08:30-17:00', 'Rabat', '0537-XXXXXX'),
(80, 'Office National de la Sécurité Sanitaire des Produits Alimentaires', 'Contrôle de la sécurité sanitaire des aliments.[citation:1]', '08:30-16:30', 'Rabat', '0537-YYYYYY');

-- --------------------------------------------------------

--
-- Structure de la table `transports`
--

CREATE TABLE `transports` (
  `id` int(11) NOT NULL,
  `ligne` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL COMMENT 'bus, taxi, tramway, etc.',
  `horaires` varchar(100) DEFAULT NULL,
  `tarif` varchar(50) DEFAULT NULL,
  `destination` varchar(100) DEFAULT NULL,
  `etat_trafic` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `transports`
--

INSERT INTO `transports` (`id`, `ligne`, `type`, `horaires`, `tarif`, `destination`, `etat_trafic`) VALUES
(1, '1', 'bus', 'Toutes les 10-15 min', '4 DH', 'Hay Borja - Centre Ville', 'Normal'),
(2, '2', 'bus', 'Toutes les 20 min', '4 DH', 'Ain Diab - Maarif', 'Retard'),
(3, '3', 'bus', 'Toutes les 15 min', '4 DH', 'Casa Port - Ain Sebaa', 'Retard léger'),
(4, '15', 'bus', 'Toutes les 12 min', '4 DH', 'Hay Hassani - Derb Sultan', 'Normal'),
(5, 'M1', 'tramway', 'Toutes les 8 min', '6 DH', 'Sidi Moumen - Facultés', 'Normal'),
(6, 'M2', 'tramway', 'Toutes les 10 min', '6 DH', 'Ain Diab - Sidi Bernoussi', 'Normal'),
(7, 'T1', 'taxi', 'Sur demande', '10 DH/course', 'Toute la ville', 'Normal'),
(8, 'TGV 1001', 'train grande vitesse', '06:00-21:00, toutes les heures', '199 DH (2e classe)', 'Tanger - Casablanca (Via Rabat & Kenitra)', 'Normal'),
(9, 'TGV 1002', 'train grande vitesse', '06:30-21:30, toutes les heures', '199 DH (2e classe)', 'Casablanca - Tanger (Via Rabat & Kenitra)', 'Normal'),
(10, 'AL 1101', 'train classique', 'Départs: 07:00, 09:30, 12:00, 15:30, 18:00, 20:30', '145 DH', 'Casablanca - Marrakech', 'Normal'),
(11, 'AL 1102', 'train classique', 'Départs: 06:45, 10:15, 13:45, 17:15, 19:45', '145 DH', 'Marrakech - Casablanca', 'Normal'),
(12, 'AL 1201', 'train classique', 'Départs: 08:30, 11:00, 14:30, 17:00', '120 DH', 'Rabat - Fès (Via Meknès)', 'Retard léger'),
(13, 'AL 1202', 'train classique', 'Départs: 07:15, 12:45, 16:15', '120 DH', 'Fès - Rabat (Via Meknès)', 'Normal'),
(14, 'AL 1301', 'train classique', 'Départs: 09:00, 13:00, 17:00 (+ train de nuit)', 'Variable', 'Casablanca - Oujda (Via Fès)', 'Normal'),
(15, 'AL 1302', 'train classique', 'Départs: 08:15, 14:15, 19:15 (+ train de nuit)', 'Variable', 'Oujda - Casablanca (Via Fès)', 'Normal'),
(16, 'AL 1401', 'train classique', 'Départs: 06:00, 10:00, 14:00, 18:00', '95 DH', 'Casablanca - El Jadida', 'Normal'),
(17, 'AL 1402', 'train classique', 'Départs: 07:30, 11:30, 15:30, 19:30', '95 DH', 'El Jadida - Casablanca', 'Normal'),
(18, 'AL 1501', 'train classique', 'Départs: 07:00, 13:00', '80 DH', 'Safi - Benguerir', 'Normal'),
(19, 'AL 1502', 'train classique', 'Départs: 09:30, 15:30', '80 DH', 'Benguerir - Safi', 'Normal'),
(20, 'AL 1601', 'train classique', '1 départ/jour (21:00)', 'Variable', 'Marrakech - Tanger (Train de nuit)', 'Normal'),
(21, 'AL 1602', 'train classique', '1 départ/jour (21:05)', 'Variable', 'Tanger - Marrakech (Train de nuit)', 'Normal'),
(22, 'CTM 101', 'bus longue distance', 'Départs: 07:00, 10:30, 15:00, 19:30', '85 DH', 'Marrakech - Essaouira', 'Normal'),
(23, 'CTM 102', 'bus longue distance', 'Départs: 06:30, 11:00, 16:30, 20:00', '85 DH', 'Essaouira - Marrakech', 'Normal'),
(24, 'CTM 201', 'bus longue distance', 'Départs: 08:15, 12:45, 17:15', '95 DH', 'Fès - Chefchaouen', 'Normal'),
(25, 'CTM 202', 'bus longue distance', 'Départs: 07:45, 13:15, 18:45', '95 DH', 'Chefchaouen - Fès', 'Retard léger'),
(26, 'CTM 301', 'bus longue distance', 'Départs: 06:45, 14:00, 21:15', '110 DH', 'Casablanca - Agadir', 'Normal'),
(27, 'CTM 302', 'bus longue distance', 'Départs: 05:30, 12:30, 19:30', '110 DH', 'Agadir - Casablanca', 'Normal'),
(28, 'SUP 401', 'bus longue distance', 'Départs: 09:00, 11:30, 14:00, 16:30', '75 DH', 'Marrakech - Ouarzazate', 'Normal'),
(29, 'SUP 402', 'bus longue distance', 'Départs: 08:00, 10:30, 13:00, 15:30', '75 DH', 'Ouarzazate - Marrakech', 'Normal'),
(30, 'CTM 501', 'bus longue distance', 'Multiple départs quotidiens', '90-130 DH', 'Marrakech - Casablanca', 'Normal'),
(31, 'CTM 502', 'bus longue distance', 'Multiple départs quotidiens', '90-130 DH', 'Casablanca - Marrakech', 'Normal'),
(32, 'GT MRK-ESS', 'grand taxi', '06:00-20:00, départ à remplissage', '70 DH/place', 'Marrakech - Essaouira', 'Normal'),
(33, 'GT ESS-MRK', 'grand taxi', '06:30-19:30, départ à remplissage', '70 DH/place', 'Essaouira - Marrakech', 'Normal'),
(34, 'GT FES-CHX', 'grand taxi', '07:00-18:00, départ à remplissage', '60 DH/place', 'Fès - Chefchaouen', 'Normal'),
(35, 'GT CHX-FES', 'grand taxi', '07:30-17:30, départ à remplissage', '60 DH/place', 'Chefchaouen - Fès', 'Normal'),
(36, 'GT TNG-CHX', 'grand taxi', '06:00-17:00, départ à remplissage', '55 DH/place', 'Tanger - Chefchaouen', 'Normal'),
(37, 'GT CHX-TNG', 'grand taxi', '07:00-16:00, départ à remplissage', '55 DH/place', 'Chefchaouen - Tanger', 'Normal'),
(38, 'GT AGD-TAR', 'grand taxi', '07:00-19:00, départ à remplissage', '30 DH/place', 'Agadir - Taroudannt', 'Normal'),
(39, 'GT TAR-AGD', 'grand taxi', '06:30-18:30, départ à remplissage', '30 DH/place', 'Taroudannt - Agadir', 'Normal'),
(40, 'T1', 'tramway', '05:30-22:30, toutes les 8-10 min', '6 DH', 'Sidi Moumen - Lissasfa', 'Normal'),
(41, 'T2', 'tramway', '05:45-22:45, toutes les 9 min', '6 DH', 'Aïn Diab - Sidi Bernoussi', 'Normal'),
(42, 'T3', 'tramway', '06:00-23:00, toutes les 10 min', '6 DH', 'Casa-Port - Hay El Wahda', 'Normal'),
(43, 'T4', 'tramway', '05:30-22:15, toutes les 12 min', '6 DH', 'Parc Ligue Arabe - Mohammed Erradi', 'Normal'),
(44, 'TR1', 'tramway', '05:45-23:15, toutes les 7 min', '6 DH', 'Hay Karima - Agdal (Rabat)', 'Normal'),
(45, 'TR2', 'tramway', '06:00-23:00, toutes les 9 min', '6 DH', 'Salé Tabriquet - Université (Rabat)', 'Normal'),
(46, 'Casa 10', 'bus', '05:00-22:00, toutes les 15 min', '4 DH', 'Place Mohammed V - Ain Chock', 'Normal'),
(47, 'Casa 15', 'bus', '05:15-21:45, toutes les 20 min', '4 DH', 'Lissasfa - Sidi Maarouf', 'Retard léger'),
(48, 'Casa 20', 'bus', '05:30-22:15, toutes les 25 min', '4 DH', 'Hay Hassani - Derb Sultan', 'Normal'),
(49, 'L1', 'bus', 'Toutes les 15 min', '4 DH', 'Gueliz - Médina', 'Normal'),
(50, 'L2', 'bus', 'Toutes les 20 min', '4 DH', 'Sidi Youssef Ben Ali - Palmeraie', 'Retard léger'),
(51, 'T1', 'tramway', 'Toutes les 10 min', '6 DH', 'Hay Nahda - Université', 'Normal'),
(52, 'T2', 'tramway', 'Toutes les 8 min', '6 DH', 'Aïn Chock - Sidi Bernoussi', 'Normal'),
(53, 'L4', 'bus', 'Toutes les 30 min', '5 DH', 'Tanger Ville - Malabata', 'Normal'),
(54, 'L5', 'bus', 'Toutes les 25 min', '5 DH', 'Tanger Méd - Gare Routière', 'Retard'),
(55, 'L10', 'bus', 'Toutes les 15 min', '4 DH', 'Agadir Talborjt - Nouveau Talborjt', 'Normal'),
(56, 'L11', 'bus', 'Toutes les 20 min', '4 DH', 'Agadir Port - Dakhla', 'Normal'),
(57, 'L20', 'bus', 'Toutes les 45 min', '6 DH', 'Fès Médina - Fès Nouvelle', 'Retard léger'),
(58, 'L21', 'bus', 'Toutes les 40 min', '6 DH', 'Fès - Sais Aéroport', 'Normal'),
(59, 'L30', 'bus', 'Toutes les 30 min', '5 DH', 'Meknès Médina - Ville Nouvelle', 'Normal'),
(60, 'L31', 'bus', 'Toutes les 35 min', '5 DH', 'Meknès - Moulay Idriss Zerhoun', 'Normal'),
(61, 'L40', 'bus', 'Toutes les 20 min', '4 DH', 'Rabat Centre - Salé', 'Normal'),
(62, 'T3', 'tramway', 'Toutes les 12 min', '6 DH', 'Rabat Agdal - Salé Tabriquet', 'Normal'),
(63, 'L50', 'bus', 'Toutes les 25 min', '5 DH', 'Oujda Centre - Aéroport Angads', 'Normal'),
(64, 'L51', 'bus', 'Toutes les 30 min', '5 DH', 'Oujda - Berkane', 'Retard'),
(65, 'L60', 'bus', 'Toutes les 60 min', '8 DH', 'Laayoune - El Marsa', 'Normal'),
(66, 'L61', 'bus', 'Toutes les 90 min', '10 DH', 'Laayoune - Dakhla', 'Retard léger'),
(67, 'L70', 'bus', 'Toutes les 40 min', '6 DH', 'Essaouira - Diabat', 'Normal'),
(68, 'L71', 'bus', 'Toutes les 120 min', '12 DH', 'Essaouira - Marrakech', 'Normal'),
(69, 'L80', 'bus', 'Toutes les 35 min', '5 DH', 'Chefchaouen - Oued Laou', 'Retard'),
(70, 'L81', 'bus', 'Toutes les 50 min', '6 DH', 'Chefchaouen - Tétouan', 'Normal'),
(71, 'L90', 'bus', 'Toutes les 25 min', '4 DH', 'El Jadida - Azemmour', 'Normal'),
(72, 'L91', 'bus', 'Toutes les 30 min', '5 DH', 'El Jadida - Casablanca', 'Normal'),
(73, 'Taxi Urbain', 'taxi', '24/24', 'Mètre + supplément', 'Toute la ville', 'Normal'),
(74, 'Grand Taxi', 'taxi', '06:00-22:00', 'Forfait selon destination', 'Intercités', 'Normal'),
(75, 'Navette Aéroport', 'navette', 'Toutes les 30 min', '20 DH', 'Centre Ville - Aéroport', 'Normal'),
(76, 'Train Regional', 'train', '5 fois/jour', '15-50 DH', 'Ligne côtière', 'Normal'),
(77, 'Alsa', 'bus longue distance', 'Plusieurs départs/jour', '50-200 DH', 'Villes principales', 'Normal'),
(78, 'CTM', 'bus longue distance', 'Plusieurs départs/jour', '60-250 DH', 'Villes principales', 'Normal'),
(79, 'Ferry', 'bateau', '2-3 fois/jour', '200-500 DH', 'Tanger - Espagne', 'Normal'),
(80, 'L100', 'bus', 'Toutes les 20 min', '4 DH', 'Béni Mellal - Kasba Tadla', 'Normal'),
(81, 'L101', 'bus', 'Toutes les 25 min', '4 DH', 'Béni Mellal - Fkih Ben Salah', 'Retard léger'),
(82, 'L110', 'bus', 'Toutes les 45 min', '6 DH', 'Errachdia - Erfoud', 'Normal'),
(83, 'L111', 'bus', 'Toutes les 60 min', '8 DH', 'Errachdia - Midelt', 'Normal'),
(84, 'L120', 'bus', 'Toutes les 30 min', '5 DH', 'Nador - Berkane', 'Normal'),
(85, 'L121', 'bus', 'Toutes les 40 min', '5 DH', 'Nador - Al Hoceima', 'Retard'),
(86, 'L130', 'bus', 'Toutes les 35 min', '5 DH', 'Safi - Youssoufia', 'Normal'),
(87, 'L131', 'bus', 'Toutes les 50 min', '6 DH', 'Safi - Marrakech', 'Normal'),
(88, 'L140', 'bus', 'Toutes les 25 min', '4 DH', 'Khouribga - Oued Zem', 'Normal'),
(89, 'L141', 'bus', 'Toutes les 30 min', '4 DH', 'Khouribga - Béni Mellal', 'Normal'),
(90, 'L150', 'bus', 'Toutes les 60 min', '8 DH', 'Taroudant - Taliouine', 'Normal'),
(91, 'L151', 'bus', 'Toutes les 90 min', '10 DH', 'Taroudant - Ouarzazate', 'Retard léger'),
(92, 'T3', 'tramway', '05:30-23:30, toutes les 8 min', '6 DH', 'Sidi Moumen - Lissasfa', 'Normal'),
(93, 'T4', 'tramway', '06:00-23:00, toutes les 10 min', '6 DH', 'Aïn Diab - Sidi Maârouf', 'Normal'),
(94, 'T1-Rabat', 'tramway', '05:45-23:15, toutes les 7 min', '6 DH', 'Hay Karima - Agdal', 'Normal'),
(95, 'T2-Rabat', 'tramway', '06:00-23:00, toutes les 9 min', '6 DH', 'Salé Tabriquet - Université', 'Normal'),
(96, 'C30', 'bus', '05:00-22:30, toutes les 12 min', '4 DH', 'Aïn Chock - Place Mohammed V', 'Normal'),
(97, 'C32', 'bus', '05:15-22:00, toutes les 15 min', '4 DH', 'Sidi Bernoussi - Gare Oasis', 'Retard léger'),
(98, 'C35', 'bus', '05:30-21:45, toutes les 20 min', '5 DH', 'Lahraouiyine - Casa-Port', 'Normal'),
(99, 'GT: CASA-RABAT', 'grand taxi', '05:00-22:00, départ à remplissage', '35 DH/place', 'Gare Routière Ouled Ziane - Rabat Agdal', 'Normal'),
(100, 'GT: MARRAKECH-AGADIR', 'grand taxi', '06:00-20:00, départ à remplissage', '70 DH/place', 'Bab Doukkala - Agadir Centre', 'Normal'),
(101, 'ALSA 1000', 'bus longue distance', 'Départs: 08:00, 12:00, 16:00, 22:00', '80-120 DH', 'Casablanca - Marrakech', 'Normal'),
(102, 'CTM 2015', 'bus longue distance', 'Départs: 07:30, 14:30, 18:30', '90 DH', 'Fès - Tanger', 'Normal'),
(103, 'ONCF Al Boraq', 'train grande vitesse', '6 départs/jour', 'À partir de 200 DH', 'Casablanca - Tanger', 'Normal'),
(104, 'ONCF Regional', 'train régional', '10 départs/jour', 'À partir de 40 DH', 'Rabat - Kénitra', 'Normal'),
(105, 'Al Boraq 1001', 'train grande vitesse', 'Départs: 06:00, 08:00, 12:00, 16:00, 19:00', '199 DH (2nd Classe)', 'Tanger - Casablanca (Via Rabat)', 'Normal'),
(106, 'Al Atlas 1200', 'train classique', 'Départs: 07:15, 10:45, 14:30, 18:00', '145 DH (2nd Classe)', 'Casablanca - Marrakech', 'Normal'),
(107, 'Al Atlas 1400', 'train classique', 'Départs: 08:30, 13:15, 17:45', '120 DH (2nd Classe)', 'Rabat - Fès (Via Meknès)', 'Retard léger'),
(108, 'CTM 401', 'bus longue distance', 'Départs: 07:00, 10:30, 15:00, 19:30', '85 DH', 'Marrakech - Essaouira', 'Normal'),
(109, 'Supratours 701', 'bus longue distance', 'Départs: 08:15, 12:45, 17:15', '95 DH', 'Fès - Chefchaouen', 'Normal'),
(110, 'CTM 205', 'bus longue distance', 'Départs: 06:45, 14:00, 21:15', '110 DH', 'Casablanca - Agadir', 'Normal'),
(111, 'GT: MRK-ESSA', 'grand taxi', '06:00-20:00 (départ à remplissage)', '70 DH/place', 'Marrakech - Essaouira', 'Normal'),
(112, 'GT: FES-CHX', 'grand taxi', '07:00-18:00 (départ à remplissage)', '60 DH/place', 'Fès - Chefchaouen', 'Normal'),
(113, 'GT: AGD-Aéroport', 'grand taxi', '05:00-23:00 (départ à remplissage)', '25 DH/place', 'Agadir Centre - Aéroport Agadir', 'Normal'),
(114, 'T1', 'tramway', '05:30-22:30, toutes les 8-10 min', '6 DH', 'Sidi Moumen - Lissasfa', 'Normal'),
(115, 'T2', 'tramway', '05:45-22:45, toutes les 9 min', '6 DH', 'Aïn Diab - Sidi Bernoussi', 'Retard léger'),
(116, 'T3', 'tramway', '06:00-23:00, toutes les 10 min', '6 DH', 'Casa-Port - Hay El Wahda', 'Normal'),
(117, 'T4', 'tramway', '05:30-22:15, toutes les 12 min', '6 DH', 'Parc Ligue Arabe - Mohammed Erradi', 'Normal'),
(118, 'Casa 10', 'bus', '05:00-22:00, toutes les 15 min', '4 DH', 'Place Mohammed V - Ain Chock', 'Normal'),
(119, 'Casa 15', 'bus', '05:15-21:45, toutes les 20 min', '4 DH', 'Lissasfa - Sidi Maarouf', 'Normal'),
(120, 'Rabat 5', 'bus', '05:30-22:15, toutes les 18 min', '4 DH', 'Agdal - Salé Medina', 'Retard'),
(121, 'Marrakech 8', 'bus', '06:00-21:30, toutes les 25 min', '4 DH', 'Gueliz - Palmeraie', 'Normal');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`) VALUES
(1, 'zakariaennaqui', 'zakariaennaqui@gmail.com', '0000000000', '2025-12-11 22:53:05'),
(4, 'test', 'test@gmail.com', '0000', '2025-12-12 01:13:49');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `evenements`
--
ALTER TABLE `evenements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nom` (`nom`),
  ADD KEY `idx_date` (`date`);

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idx_timestamp` (`timestamp`);

--
-- Index pour la table `services_municipaux`
--
ALTER TABLE `services_municipaux`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nom` (`nom`);

--
-- Index pour la table `transports`
--
ALTER TABLE `transports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ligne` (`ligne`),
  ADD KEY `idx_type` (`type`),
  ADD KEY `idx_destination` (`destination`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `evenements`
--
ALTER TABLE `evenements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT pour la table `services_municipaux`
--
ALTER TABLE `services_municipaux`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT pour la table `transports`
--
ALTER TABLE `transports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
