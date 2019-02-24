-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 22, 2018 at 08:31 AM
-- Server version: 5.7.23
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `pweb18`
--

-- --------------------------------------------------------

--
-- Table structure for table `batiment`
--

CREATE TABLE `batiment` (
  `idBat` int(11) NOT NULL,
  `nom` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `batiment`
--

INSERT INTO `batiment` (`idBat`, `nom`) VALUES
(1, 'Blériot'),
(2, 'Versailles'),
(3, 'Amphis');

-- --------------------------------------------------------

--
-- Table structure for table `completude`
--

CREATE TABLE `completude` (
  `id_complet` int(11) NOT NULL,
  `id_period` int(11) NOT NULL,
  `id_mat` int(11) DEFAULT NULL,
  `id_prof` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `completude`
--

INSERT INTO `completude` (`id_complet`, `id_period`, `id_mat`, `id_prof`) VALUES
(1, 1, 1, 1),
(2, 1, 1, 3),
(3, 1, 9, 11);

-- --------------------------------------------------------

--
-- Table structure for table `contrainte`
--

CREATE TABLE `contrainte` (
  `id_cont` int(11) NOT NULL,
  `bPositive` tinyint(4) NOT NULL DEFAULT '0',
  `id_mat` int(11) DEFAULT NULL,
  `id_prof` int(11) DEFAULT NULL,
  `id_salle` int(11) DEFAULT NULL,
  `type_cont` text COLLATE utf8_bin NOT NULL,
  `valeur` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `contrainte`
--

INSERT INTO `contrainte` (`id_cont`, `bPositive`, `id_mat`, `id_prof`, `id_salle`, `type_cont`, `valeur`) VALUES
(1, 0, 1, 3, NULL, 'jour', '{\"mardi\":[14,18.30], \n\"mercredi\":[8,18.30]}'),
(2, 1, 1, 3, NULL, 'creneau', '{\"M\":[2]}'),
(3, 0, NULL, NULL, NULL, 'vacances', '{\"Toussaint\":[1540767600,1541178000]}\n'),
(4, 0, NULL, NULL, 6, 'reservation', '{\"Akhaton\":[1574982000,1575048600]}');

-- --------------------------------------------------------

--
-- Table structure for table `contraintes_matiere`
--

CREATE TABLE `contraintes_matiere` (
  `idContrainte` int(11) NOT NULL,
  `contrainte` text COLLATE utf8_bin NOT NULL,
  `idMat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `contraintes_matiere`
--

INSERT INTO `contraintes_matiere` (`idContrainte`, `contrainte`, `idMat`) VALUES
(1, '{\"mardi\":[14,18.30], \r\n\"mercredi\":[16,18.30]}', 4),
(2, '[\"CM\":[2]]', 6);

-- --------------------------------------------------------

--
-- Table structure for table `cours`
--

CREATE TABLE `cours` (
  `idCours` int(11) NOT NULL,
  `HDeb` datetime NOT NULL,
  `HFin` datetime NOT NULL,
  `idUserEns` int(11) NOT NULL,
  `idSalle` int(11) NOT NULL,
  `idGr` int(11) NOT NULL,
  `idTypeEns` int(11) NOT NULL,
  `idEdt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `cours`
--

INSERT INTO `cours` (`idCours`, `HDeb`, `HFin`, `idUserEns`, `idSalle`, `idGr`, `idTypeEns`, `idEdt`) VALUES
(1, '2018-09-10 08:00:00', '2018-09-10 10:00:00', 1, 1, 1, 1, 1),
(2, '2018-09-11 08:00:00', '2018-09-11 10:00:00', 3, 4, 1, 3, 2),
(3, '2018-09-03 08:00:00', '2018-09-03 10:00:00', 6, 5, 1, 1, 1),
(4, '2018-09-04 08:00:00', '2018-09-04 10:00:00', 4, 3, 1, 2, 1),
(5, '2018-09-05 14:00:00', '2018-09-05 17:00:00', 7, 2, 1, 3, 1),
(6, '2018-09-06 16:00:00', '2018-09-06 18:00:00', 1, 5, 1, 1, 1),
(7, '2018-09-07 09:00:00', '2018-09-07 11:00:00', 4, 2, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `creneau`
--

CREATE TABLE `creneau` (
  `id_creneau` int(11) NOT NULL,
  `tDeb` int(11) NOT NULL,
  `tFin` int(11) NOT NULL,
  `id_edth` int(11) NOT NULL,
  `id_mat` int(11) NOT NULL,
  `id_prof` int(11) NOT NULL,
  `id_grpe` int(11) NOT NULL,
  `id_salle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `creneau`
--

INSERT INTO `creneau` (`id_creneau`, `tDeb`, `tFin`, `id_edth`, `id_mat`, `id_prof`, `id_grpe`, `id_salle`) VALUES
(1, 1539604800, 1539615600, 6, 17, 5, 11, 7),
(3, 1539678600, 1539685800, 5, 16, 6, 11, 9),
(4, 1539777600, 1539788400, 4, 9, 4, 11, 10),
(5, 1539604800, 1539615600, 6, 1, 2, 10, 11),
(6, 1539676800, 1539680400, 6, 1, 2, 9, 11),
(7, 1539763200, 1539766800, 6, 1, 2, 12, 1),
(8, 1539790200, 1539801000, 3, 1, 2, 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `edt`
--

CREATE TABLE `edt` (
  `idEdt` int(11) NOT NULL,
  `dateDeb` date NOT NULL,
  `dateFin` date NOT NULL,
  `valide` tinyint(1) NOT NULL,
  `idPromo` int(11) NOT NULL,
  `idPeriode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `edt`
--

INSERT INTO `edt` (`idEdt`, `dateDeb`, `dateFin`, `valide`, `idPromo`, `idPeriode`) VALUES
(1, '2018-09-03', '2018-09-07', 1, 2, 1),
(2, '2018-09-10', '2018-09-14', 1, 2, 1),
(3, '2018-09-17', '2018-09-21', 1, 2, 1),
(4, '2018-09-24', '2018-09-28', 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `edth`
--

CREATE TABLE `edth` (
  `id_edth` int(11) NOT NULL,
  `tDeb` int(11) NOT NULL,
  `label` text COLLATE utf8_bin NOT NULL,
  `bCourant` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `edth`
--

INSERT INTO `edth` (`id_edth`, `tDeb`, `label`, `bCourant`) VALUES
(1, 1536537600, '1', 1),
(2, 1537142400, '2', 1),
(3, 1537747200, '3', 1),
(4, 1538352000, '4', 1),
(5, 1538956800, '5', 0),
(6, 1539561600, '6', 1),
(7, 1540166400, '7', 1),
(8, 1541379600, 'DST C', 1),
(9, 1541984400, '1', 1),
(10, 1542589200, '2', 1),
(11, 1543194000, '3', 1),
(12, 1543798800, '4', 1),
(13, 1544403600, '5', 1),
(14, 1545008400, '6', 1),
(15, 1546822800, '7', 1),
(16, 1547427600, 'DST D', 1);

-- --------------------------------------------------------

--
-- Table structure for table `edtperiod`
--

CREATE TABLE `edtperiod` (
  `id_period` int(11) NOT NULL,
  `id_promo` int(11) NOT NULL,
  `label` text COLLATE utf8_bin NOT NULL,
  `tDeb` int(11) NOT NULL,
  `tFin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `edtperiod`
--

INSERT INTO `edtperiod` (`id_period`, `id_promo`, `label`, `tDeb`, `tFin`) VALUES
(1, 1, 'D', 1541977200, 1548025200),
(2, 1, 'C', 1513292400, 1540656000);

-- --------------------------------------------------------

--
-- Table structure for table `enseignant`
--

CREATE TABLE `enseignant` (
  `idUserEns` int(11) NOT NULL,
  `dateEns` date NOT NULL,
  `acronyme` text COLLATE utf8_bin NOT NULL,
  `couleur` text COLLATE utf8_bin NOT NULL,
  `idUser` int(11) NOT NULL,
  `idMat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `enseignant`
--

INSERT INTO `enseignant` (`idUserEns`, `dateEns`, `acronyme`, `couleur`, `idUser`, `idMat`) VALUES
(1, '2011-04-11', 'JMI', 'blue', 14, 4),
(2, '2011-04-11', 'FK', 'green', 15, 4),
(3, '2011-04-11', 'KC', 'pink', 16, 6),
(4, '2011-04-11', 'SM', 'purple', 17, 1),
(5, '2011-04-11', 'OM', 'brown', 18, 9),
(6, '2011-04-11', 'DH', 'yellow', 19, 2),
(7, '2011-04-11', 'PD', 'gray', 20, 5),
(8, '2011-04-11', 'ML', 'red', 21, 7),
(9, '2011-04-11', 'OP', 'midnightblue', 22, 8);

-- --------------------------------------------------------

--
-- Table structure for table `etudiant`
--

CREATE TABLE `etudiant` (
  `id_etu` int(11) NOT NULL,
  `id_promo` int(11) NOT NULL,
  `id_grpe` int(11) NOT NULL,
  `genre` text COLLATE utf8_bin NOT NULL,
  `nom` text COLLATE utf8_bin NOT NULL,
  `prenom` text COLLATE utf8_bin NOT NULL,
  `email` text COLLATE utf8_bin NOT NULL,
  `login_etu` text COLLATE utf8_bin NOT NULL,
  `pass_etu` text COLLATE utf8_bin NOT NULL,
  `matricule` text COLLATE utf8_bin NOT NULL,
  `date_etu` date NOT NULL,
  `urlPhoto` text COLLATE utf8_bin NOT NULL,
  `bConnect` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `etudiant`
--

INSERT INTO `etudiant` (`id_etu`, `id_promo`, `id_grpe`, `genre`, `nom`, `prenom`, `email`, `login_etu`, `pass_etu`, `matricule`, `date_etu`, `urlPhoto`, `bConnect`) VALUES
(1, 1, 1, 'Melle', 'Dahmani', 'Djaouida', 'ddahmani@parisdescartes.fr', 'ddahmani', '098f6bcd4621d373cade4e832627b4f6', '12345678', '2018-09-10', '', 0),
(2, 1, 1, 'M', 'Karl', 'Bernard', 'bernard.karl@parisdescartes.fr', 'bkarl', '098f6bcd4621d373cade4e832627b4f6', '40004000', '2018-09-10', '', 0),
(3, 1, 2, 'Melle', 'Mozart', 'Lea', 'lea.mozart@parisdescartes.fr', 'lmozart', '098f6bcd4621d373cade4e832627b4f6', '10001000', '2018-09-10', '', 1),
(4, 1, 4, 'M', 'Vincens', 'Bernard', 'bernard.vincens@parisdescartes.fr', 'bvincens', '098f6bcd4621d373cade4e832627b4f6', '12345678', '2018-09-10', '', 0),
(5, 1, 5, 'M', 'Lauzanne', 'Alain', 'alauzanne@parisdescartes.fr', 'alauzanne', '098f6bcd4621d373cade4e832627b4f6', '22345678', '2018-09-10', './userdata/profile_pictures/alauzanne_2018_11_05_17_24_36.jpg', 0),
(6, 1, 6, 'Melle', 'Rey', 'Annie', 'arey@parisdecartes.fr', 'arey', '098f6bcd4621d373cade4e832627b4f6', '32345678', '2018-09-10', '', 0),
(7, 1, 6, 'M', 'Tao', 'Minh', 'mtao@parisdescartes.fr', 'mtao', '098f6bcd4621d373cade4e832627b4f6', '10001000', '2018-09-10', '', 0),
(8, 1, 7, 'M', 'Berger', 'Paul', 'pberger@parisdescartes.fr', 'pberger', '098f6bcd4621d373cade4e832627b4f6', '70000000', '2018-09-10', '', 0),
(9, 1, 8, 'Melle', 'Franceschinis', 'Octavia', 'ofranceschinis@gmail.com', 'ofrance', '9c65baccdc237513635a1372d4e379cf', '46546545', '2018-09-10', './vue/images/pdp/etu/9-pere-noel-veut-pleurer-aussi.jpg', 0),
(10, 1, 11, 'Melle', 'test', 'test', 'test@test', 'test', 'test', '20000000', '2018-09-10', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `etu_grps`
--

CREATE TABLE `etu_grps` (
  `id_etu` int(11) NOT NULL,
  `id_grpe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `etu_grps`
--

INSERT INTO `etu_grps` (`id_etu`, `id_grpe`) VALUES
(1, 1),
(1, 9),
(2, 1),
(2, 9),
(3, 2),
(3, 9),
(4, 4),
(4, 10),
(5, 5),
(5, 11),
(6, 6),
(6, 11),
(7, 6),
(7, 11),
(8, 7),
(8, 12),
(9, 8),
(9, 12),
(10, 4),
(10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `formation`
--

CREATE TABLE `formation` (
  `id_form` int(4) NOT NULL,
  `nom` text COLLATE utf8_bin NOT NULL,
  `label` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `formation`
--

INSERT INTO `formation` (`id_form`, `nom`, `label`) VALUES
(1, 'DUT INFO - formation initiale', 'DUT INFO'),
(3, 'Licence PRO Métier de l\'informatique \r\nparcours IOT - apprentissage', 'LPIOT'),
(4, 'Licence PRO Métier de l\'informatique \r\nparcours ERP - formation apprentissage', 'LPERP_A'),
(5, 'Licence PRO Métier de l\'informatique \r\nparcours ERP - formation initiale', 'LPERP_I');

-- --------------------------------------------------------

--
-- Table structure for table `groupe`
--

CREATE TABLE `groupe` (
  `id_grpe` int(11) NOT NULL,
  `id_promo` int(11) NOT NULL,
  `type_grpe` text COLLATE utf8_bin NOT NULL,
  `num_grpe` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `groupe`
--

INSERT INTO `groupe` (`id_grpe`, `id_promo`, `type_grpe`, `num_grpe`) VALUES
(1, 1, 'mono', '201'),
(2, 1, 'mono', '202'),
(3, 1, 'mono', '203'),
(4, 1, 'mono', '204'),
(5, 1, 'mono', '205'),
(6, 1, 'mono', '206'),
(7, 1, 'mono', '207'),
(8, 1, 'mono', '208'),
(9, 1, 'bi', '201-202'),
(10, 1, 'bi', '203-204'),
(11, 1, 'bi', '205-206'),
(12, 1, 'bi', '207-208'),
(13, 1, 'promo', 'promo'),
(14, 1, '1/2promo', '1/2'),
(15, 1, '1/2promo', '2/2');

-- --------------------------------------------------------

--
-- Table structure for table `matiere`
--

CREATE TABLE `matiere` (
  `id_mat` int(4) NOT NULL,
  `id_ue` int(11) NOT NULL,
  `id_mod` int(4) NOT NULL,
  `id_period` int(11) NOT NULL,
  `nom` text COLLATE utf8_bin NOT NULL,
  `label` text COLLATE utf8_bin NOT NULL,
  `couleur` text COLLATE utf8_bin NOT NULL,
  `themes` text COLLATE utf8_bin NOT NULL,
  `typeEns` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `matiere`
--

INSERT INTO `matiere` (`id_mat`, `id_ue`, `id_mod`, `id_period`, `nom`, `label`, `couleur`, `themes`, `typeEns`) VALUES
(1, 1, 1, 1, 'Programmation WEB côté Serveur (M3104)', 'PWEB MVC', '#ff8a80\r\n\r\n', '{\n\"web\":\"Client Serveur HTTP\", \n\"pattern\":\"MVC\",\n\"Langage\":\"PHP\"\n}\n', '{\n\"A\":[\"promo\", 1.5],\n\'M\':[\"bi\",3]\n}'),
(2, 1, 1, 2, 'Programmation WEB côté Serveur - JAVA (M3104-2)', 'PWEB JAVA', '#ea80fc\r\n\r\n', '{\n\"Systeme WEB\":\"Client Serveur HTTP\", \n\"Langage\":\"JAVA\"\n}\n', '{\n\"A\":[\"promo\",1.5],\n\"M\":[\"bi\",3]\n}'),
(9, 1, 1, 1, 'Algorithmique avancée', 'AAV', '#b388ff\r\n\r\n', '{\"complexite\": \"tri\"}', '{\n\"A\":[\"promo\",1.5],\n\"T\":[\"bi\",1.5],\n\"M\":[\"mono\",1.5]\n}'),
(14, 2, 1, 1, 'Anglais', 'ANG', '#8c9eff\r\n\r\n', '{\"theme\" : \"vocabulaire\"}', '{\"M\":[\"mono\",1.5]}'),
(15, 2, 1, 1, 'Expression Communication', 'EC', '#82b1ff\r\n\r\n', '{\n\"expression\":\"écriture de rapport de stage\",\n\"communication\":\"soutenance orale\"\n}', '{\n\"T\":[\"bi\",1.5]\n}'),
(16, 1, 1, 1, 'Modélisation Objet', 'MO', '#b9f6ca', '{\"modele\" : \"UML\"}', '{\"A\":[\"promo\",1.5],\n\'M\':[\"bi\",3]\n}'),
(17, 2, 1, 1, 'PROBA STAT', 'PS', '#ffe57f\r\n\r\n', '{\"proba\": [\"espace\"], \n\"stat\": [\"régression\"]}', '{ \"A\":[\"promo\",1.5], \"M\":[\"bi\",3] }');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id_msg` int(11) NOT NULL,
  `typeMsg` int(11) NOT NULL,
  `id_src` int(11) NOT NULL,
  `id_dest` int(11) NOT NULL,
  `contenu` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id_msg`, `typeMsg`, `id_src`, `id_dest`, `contenu`) VALUES
(17, 1, 3, 2, 'Bonjour, comment allez-vous ?'),
(20, 1, 2, 3, 'salut mon gars'),
(21, 1, 3, 2, 'bien ou quoi rezouanne ?'),
(22, 1, 2, 3, 'trkl'),
(23, 1, 2, 3, 'sava\r\n'),
(24, 1, 3, 2, 'c toi rezouanne ?'),
(25, 1, 2, 3, 'oui\r\n'),
(26, 1, 3, 2, 'mdr'),
(27, 1, 2, 3, 'comment ta fait le truc avec l\'animation'),
(28, 1, 2, 3, '?'),
(29, 1, 3, 2, 'c\'est une ligne de javascript'),
(30, 1, 2, 3, 'Ah non c\'est juste un refresh et le truc qui descent'),
(31, 1, 3, 2, 'c\'est : window.onload=function (){\r\n      var div = document.getElementById(\'chat\');\r\n      $(\'#\' + \'chat\').animate({\r\n      scrollTop: div.scrollHeight - div.clientHeight\r\n   }, 500);\r\n    }'),
(32, 1, 2, 3, 'bon vazy je joue a fortnite'),
(33, 1, 3, 2, 'mdr vasy'),
(34, 1, 3, 2, 'mais en vrai c bien cheum de devoir refresh à chaque fois'),
(35, 1, 5, 2, 'salut !'),
(36, 1, 5, 2, 'comment ça va ?'),
(37, 1, 5, 2, 'coucou \r\n'),
(38, 1, 2, 5, 'slt'),
(39, 1, 5, 2, 'ca marche\r\n'),
(40, 1, 3, 2, 'Hey! Salut!\r\n'),
(41, 1, 5, 3, 'facho'),
(42, 1, 3, 5, 'Test'),
(43, 1, 2, 5, 'nickel'),
(44, 1, 2, 3, 'grave bave bave baveba veabveab eravrb\r\n'),
(45, 1, 2, 3, 'fgh njffhg gv\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nfgh njffhg gv\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nfgh njffhg gv\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nfgh njffhg gv\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nfgh njffhg gv\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nfgh njffhg gv\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n'),
(46, 1, 2, 3, 'a\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\naa\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\naa\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\naa\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\naa\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\naa\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na'),
(47, 1, 3, 2, 'hello'),
(48, 1, 2, 3, 'salut mon gars'),
(49, 1, 3, 2, '1'),
(50, 1, 2, 3, 'elle s\'appelle comment ta soeur ?'),
(51, 1, 3, 2, '12');

-- --------------------------------------------------------

--
-- Table structure for table `prof`
--

CREATE TABLE `prof` (
  `id_prof` int(11) NOT NULL,
  `genre` text COLLATE utf8_bin NOT NULL,
  `nom` text COLLATE utf8_bin NOT NULL,
  `prenom` text COLLATE utf8_bin NOT NULL,
  `email` text COLLATE utf8_bin NOT NULL,
  `label` text COLLATE utf8_bin NOT NULL,
  `login_prof` text COLLATE utf8_bin NOT NULL,
  `pass_prof` text COLLATE utf8_bin NOT NULL,
  `date_prof` date NOT NULL,
  `urlPhoto` text COLLATE utf8_bin NOT NULL,
  `couleur` text COLLATE utf8_bin NOT NULL,
  `bConnect` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `prof`
--

INSERT INTO `prof` (`id_prof`, `genre`, `nom`, `prenom`, `email`, `label`, `login_prof`, `pass_prof`, `date_prof`, `urlPhoto`, `couleur`, `bConnect`) VALUES
(1, 'M', 'Ilié', 'Jean-Michel', 'jmilie@parisdescartes.fr', 'JMI', 'jmilie', 'jmii', '2018-09-12', './userdata/profile_pictures/jmilie_2018_11_05_16_51_31.png', '#80d8ff', 1),
(3, 'M', 'Foughali', 'Karim', 'kfoughali@gmail.com', 'KF', 'kfoughali', '098f6bcd4621d373cade4e832627b4f6', '2018-01-12', '', '#2962ff', 1),
(4, 'M', 'Kurtz', 'Camille', 'ckurtz@parisdescartes.fr', 'CK', 'ckurtz', '098f6bcd4621d373cade4e832627b4f6', '2018-09-09', '', '#1de9b6', 0),
(5, 'M', 'Sortais', 'Michel', 'msortais@parisdescartes.fr', 'MS', 'msortais', '098f6bcd4621d373cade4e832627b4f6', '2018-09-10', '', '#00e676', 0),
(6, 'M', 'Ouziri', 'Mourad', 'mouziri@parisdescartes.fr', 'MO', 'mouziri', '098f6bcd4621d373cade4e832627b4f6', '2018-09-10', '', '', 0),
(7, 'Mme', 'Dirani', 'Hélène', 'hdirani@parisdescartes.fr', 'HD', 'hdirani', '098f6bcd4621d373cade4e832627b4f6', '2018-09-10', '', '', 0),
(8, 'M', 'Poitrenaud', 'Denis', 'dpoitrenaud', 'DP', 'dpoitrenaud', '098f6bcd4621d373cade4e832627b4f6', '2018-09-10', '', '#ffab40', 0),
(9, 'Mme', 'Marechal', 'Laurence', 'lmarechal@parisdescartes.fr', 'LM', 'lmarechal', '098f6bcd4621d373cade4e832627b4f6', '2018-09-10', '', '', 0),
(10, 'M', 'Oliviero', 'Philippe', 'poliviero@parisdescartes.fr', 'PhO', 'poliviero', '098f6bcd4621d373cade4e832627b4f6', '2018-09-10', '', '', 0),
(11, 'M', 'test', 'test', 'test@', 'test', 'testp', 'testp', '2018-10-02', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `prof_roles`
--

CREATE TABLE `prof_roles` (
  `id_role` int(11) NOT NULL,
  `objet` text COLLATE utf8_bin NOT NULL,
  `id_objet` int(11) NOT NULL,
  `bResp` tinyint(4) NOT NULL DEFAULT '0',
  `id_prof` int(11) NOT NULL,
  `label` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `prof_roles`
--

INSERT INTO `prof_roles` (`id_role`, `objet`, `id_objet`, `bResp`, `id_prof`, `label`) VALUES
(1, 'edt', 0, 1, 8, 'Responsable EDT - DUT 1 DUT 2'),
(6, 'matiere', 1, 1, 2, 'Responsable PWEB'),
(7, 'matiere', 11, 1, 11, 'Responsable AAV'),
(9, 'matiere', 10, 1, 7, 'Responsable EC'),
(10, 'matiere', 16, 1, 6, 'Responsable MO'),
(12, 'matiere', 17, 1, 1, 'Responsable PROBA STAT'),
(13, 'matiere', 1, 0, 1, 'Intervenant PWEB'),
(14, 'matiere', 1, 0, 3, 'Intervenant PWEB'),
(15, 'matiere', 9, 0, 4, 'Intervenant AAV'),
(16, 'matiere', 17, 0, 5, 'Intervenant PROBA STAT'),
(17, 'matiere', 14, 0, 9, 'Intervenant ANG'),
(18, 'matiere', 16, 0, 6, 'Intervenant MO'),
(19, 'matiere', 15, 0, 10, 'Intervenant EC'),
(255, 'matiere', 14, 1, 11, 'Responsable ANG');

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `id_promo` tinyint(4) NOT NULL,
  `id_form` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `label` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `promotion`
--

INSERT INTO `promotion` (`id_promo`, `id_form`, `num`, `label`) VALUES
(1, 1, 2018, 'INFOA1 2018'),
(2, 1, 2018, 'INFOA2 2018'),
(3, 2, 2018, 'LPIOT 2018'),
(4, 3, 2018, 'LPERP-A 2018'),
(5, 4, 2018, 'LPERP-I 2018');

-- --------------------------------------------------------

--
-- Table structure for table `salle`
--

CREATE TABLE `salle` (
  `id_salle` int(11) NOT NULL,
  `nom` text COLLATE utf8_bin NOT NULL,
  `label` text COLLATE utf8_bin NOT NULL,
  `batiment` text COLLATE utf8_bin NOT NULL,
  `type_salle` text COLLATE utf8_bin NOT NULL,
  `nb_postes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `salle`
--

INSERT INTO `salle` (`id_salle`, `nom`, `label`, `batiment`, `type_salle`, `nb_postes`) VALUES
(1, 'B1-12', 'B1-12', 'Blériot\niut-Paris', 'M', 25),
(2, 'IOT WIFI 1', 'B2-15', 'Blériot\nIUT-Paris', 'M', 25),
(3, 'V1-11', 'V1-11', 'Versailles-\nIUT Paris', 'M', 30),
(4, 'Daumart', 'A-1', 'iut-paris', 'A', 200),
(5, 'IOT WIFI 2', 'V1-11', 'iut-Paris', 'M', 30),
(6, 'Olympe de Gouge', 'A-2', 'iut-paris', 'A', 200),
(7, 'B2-12', 'B2-12', 'Blériot\r\niut-Paris', 'T', 22),
(8, 'B2-17', 'B2-17', 'Blériot\r\niut-Paris', 'T', 22),
(9, 'B0-13', 'B0-13', 'Blériot\r\niut-Paris', 'M', 22),
(10, 'B1-17', 'B1-17', 'Blériot\r\niut-Paris', 'M', 22),
(11, 'B0-3', 'B0-3', 'Blériot\r\niut-Paris', 'M', 22);

-- --------------------------------------------------------

--
-- Table structure for table `uemodule`
--

CREATE TABLE `uemodule` (
  `id_uemod` int(11) NOT NULL,
  `id_form` int(11) NOT NULL,
  `classif` text COLLATE utf8_bin NOT NULL,
  `nom` text COLLATE utf8_bin NOT NULL,
  `label` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `uemodule`
--

INSERT INTO `uemodule` (`id_uemod`, `id_form`, `classif`, `nom`, `label`) VALUES
(1, 1, 'ue', 'Informatique avancée', '31'),
(2, 1, 'ue', 'Culture scientifique, sociale et humaine avancées', '32'),
(3, 1, 'module', 'Programmation Web côté serveur', '3104'),
(4, 1, 'module', 'Algorithmique avancée', '3103'),
(5, 1, 'module', 'Conception et programmation objet avancées', '3105'),
(6, 1, 'module', 'Probabilités et statistiques', '3201'),
(7, 1, 'module', 'Expression-Communication – Communication\r\nprofessionnelle', '3205'),
(8, 1, 'module', 'Collaborer en anglais', '3206');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `batiment`
--
ALTER TABLE `batiment`
  ADD PRIMARY KEY (`idBat`);

--
-- Indexes for table `completude`
--
ALTER TABLE `completude`
  ADD PRIMARY KEY (`id_complet`);

--
-- Indexes for table `contrainte`
--
ALTER TABLE `contrainte`
  ADD PRIMARY KEY (`id_cont`);

--
-- Indexes for table `contraintes_matiere`
--
ALTER TABLE `contraintes_matiere`
  ADD PRIMARY KEY (`idContrainte`),
  ADD KEY `idMat` (`idMat`);

--
-- Indexes for table `cours`
--
ALTER TABLE `cours`
  ADD PRIMARY KEY (`idCours`),
  ADD KEY `idSalle` (`idSalle`),
  ADD KEY `idGr` (`idGr`),
  ADD KEY `idTypeEns` (`idTypeEns`),
  ADD KEY `idEdt` (`idEdt`);

--
-- Indexes for table `creneau`
--
ALTER TABLE `creneau`
  ADD PRIMARY KEY (`id_creneau`);

--
-- Indexes for table `edt`
--
ALTER TABLE `edt`
  ADD PRIMARY KEY (`idEdt`),
  ADD KEY `idPromo` (`idPromo`),
  ADD KEY `idPeriode` (`idPeriode`);

--
-- Indexes for table `edth`
--
ALTER TABLE `edth`
  ADD PRIMARY KEY (`id_edth`);

--
-- Indexes for table `edtperiod`
--
ALTER TABLE `edtperiod`
  ADD PRIMARY KEY (`id_period`);

--
-- Indexes for table `enseignant`
--
ALTER TABLE `enseignant`
  ADD PRIMARY KEY (`idUserEns`),
  ADD KEY `idUser` (`idUser`),
  ADD KEY `idMat` (`idMat`);

--
-- Indexes for table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id_etu`);

--
-- Indexes for table `etu_grps`
--
ALTER TABLE `etu_grps`
  ADD UNIQUE KEY `index_etuGrp` (`id_etu`,`id_grpe`) USING BTREE;

--
-- Indexes for table `formation`
--
ALTER TABLE `formation`
  ADD PRIMARY KEY (`id_form`);

--
-- Indexes for table `groupe`
--
ALTER TABLE `groupe`
  ADD PRIMARY KEY (`id_grpe`);

--
-- Indexes for table `matiere`
--
ALTER TABLE `matiere`
  ADD PRIMARY KEY (`id_mat`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id_msg`);

--
-- Indexes for table `prof`
--
ALTER TABLE `prof`
  ADD PRIMARY KEY (`id_prof`);

--
-- Indexes for table `prof_roles`
--
ALTER TABLE `prof_roles`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`id_promo`);

--
-- Indexes for table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`id_salle`);

--
-- Indexes for table `uemodule`
--
ALTER TABLE `uemodule`
  ADD PRIMARY KEY (`id_uemod`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `batiment`
--
ALTER TABLE `batiment`
  MODIFY `idBat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `completude`
--
ALTER TABLE `completude`
  MODIFY `id_complet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contrainte`
--
ALTER TABLE `contrainte`
  MODIFY `id_cont` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contraintes_matiere`
--
ALTER TABLE `contraintes_matiere`
  MODIFY `idContrainte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cours`
--
ALTER TABLE `cours`
  MODIFY `idCours` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `creneau`
--
ALTER TABLE `creneau`
  MODIFY `id_creneau` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `edt`
--
ALTER TABLE `edt`
  MODIFY `idEdt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `edth`
--
ALTER TABLE `edth`
  MODIFY `id_edth` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `edtperiod`
--
ALTER TABLE `edtperiod`
  MODIFY `id_period` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `enseignant`
--
ALTER TABLE `enseignant`
  MODIFY `idUserEns` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id_etu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `formation`
--
ALTER TABLE `formation`
  MODIFY `id_form` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `groupe`
--
ALTER TABLE `groupe`
  MODIFY `id_grpe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `matiere`
--
ALTER TABLE `matiere`
  MODIFY `id_mat` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id_msg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `prof`
--
ALTER TABLE `prof`
  MODIFY `id_prof` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT for table `prof_roles`
--
ALTER TABLE `prof_roles`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `salle`
--
ALTER TABLE `salle`
  MODIFY `id_salle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `uemodule`
--
ALTER TABLE `uemodule`
  MODIFY `id_uemod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
