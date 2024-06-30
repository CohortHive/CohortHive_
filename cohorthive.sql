-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 30, 2024 at 01:43 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cohorthive`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `ID` int(11) NOT NULL,
  `Room_ID` varchar(20) NOT NULL,
  `User_ID` varchar(20) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Description` varchar(400) NOT NULL,
  `Created_On` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`ID`, `Room_ID`, `User_ID`, `Title`, `Description`, `Created_On`) VALUES
(10, 'r0yhk1ytx0vikypw2bs9', '7cu8mgwdifahhch39pab', 'vhewvfb hrgfbr btbtujg bitugh nt4gh vtugbu hgtj gh', 'vhewvfb hrgfbr btbtujg bitugh nt4gh vtugbu hgtj ghu tjbvhewvfb hrgfbr btbtujg bitugh nt4gh vtugbu hgtj ghu tjbvhewvfb hrgfbr btbtujg bitugh nt4gh vtugbu hgtj ghu tjbvhewvfb hrgfbr btbtujg bitugh nt4gh vtugbu hgtj ghu tjbvhewvfb hrgfbr btbtujg bitugh nt4gh vtugbu hgtj ghu tjbvhewvfb hrgfbr btbtujg bitugh nt4gh vtugbu hgtj ghu tjbvhewvfb hrgfbr btbtujg bitugh nt4gh vtugbu hgtj ghu tjbvhewvfb hrgfbr ', '2024-06-29 17:46:39');

-- --------------------------------------------------------

--
-- Table structure for table `chat_users`
--

CREATE TABLE `chat_users` (
  `ID` int(11) NOT NULL,
  `User_ID` varchar(20) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Room_ID` varchar(20) NOT NULL,
  `Status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_users`
--

INSERT INTO `chat_users` (`ID`, `User_ID`, `Name`, `Room_ID`, `Status`) VALUES
(14, 'iooab0fut365u9wi5uwd', 'testid1', 'ilunhpfcpvzi2ot10iuy', 'Offline'),
(19, '7cu8mgwdifahhch39pab', 'testid5', 'r0yhk1ytx0vikypw2bs9', 'Active Now'),
(20, 'rbr3vhocokcgkt2e5hiv', 'Rajeev Manhas', 'm79n6287011rlqk4b60t', 'Active Now');

-- --------------------------------------------------------

--
-- Table structure for table `codetoroomid`
--

CREATE TABLE `codetoroomid` (
  `ID` int(11) NOT NULL,
  `Room_code` varchar(10) NOT NULL,
  `Room_ID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `codetoroomid`
--

INSERT INTO `codetoroomid` (`ID`, `Room_code`, `Room_ID`) VALUES
(14, 'o6iuqh5wov', 'ilunhpfcpvzi2ot10iuy'),
(16, 't7c1mj24sn', 'r0yhk1ytx0vikypw2bs9'),
(17, 'wo982pfzwh', 'm79n6287011rlqk4b60t');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `ID` varchar(20) NOT NULL,
  `Room_ID` varchar(20) NOT NULL,
  `Link` varchar(500) NOT NULL,
  `Type` varchar(30) NOT NULL,
  `File_Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`ID`, `Room_ID`, `Link`, `Type`, `File_Name`) VALUES
('4kg0k4yxxbrl3uk51pep', 'm79n6287011rlqk4b60t', 'https://docs.google.com/document/d/12AGHRS1O_I_9Ouwe9OSnF71QcBcheE3kJOPftuqLDvQ/edit', 'document', 'letcode'),
('ja1kcn3zb9jk3ia00ko9', 'm79n6287011rlqk4b60t', 'https://docs.google.com/document/d/12AGHRS1O_I_9Ouwe9OSnF71QcBcheE3kJOPftuqLDvQ', 'document', 'letcode'),
('v6gxi8rbs91bgybaivu7', 'm79n6287011rlqk4b60t', 'https://docs.google.com/document/d/12AGHRS1O_I_9Ouwe9OSnF71QcBcheE3kJOPftuqLDvQ/edit', 'document', 'letcode'),
('w0fjar1fhkj6yvt8vwkg', 'm79n6287011rlqk4b60t', 'https://docs.google.com/document/d/12AGHRS1O_I_9Ouwe9OSnF71QcBcheE3kJOPftuqLDvQ/edit?usp=sharing', 'document', 'letcode');

-- --------------------------------------------------------

--
-- Table structure for table `githubrepos`
--

CREATE TABLE `githubrepos` (
  `ID` varchar(20) NOT NULL,
  `Room_ID` varchar(20) NOT NULL,
  `Owner_ID` varchar(20) NOT NULL,
  `UserName` varchar(200) NOT NULL,
  `RepoName` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `githubrepos`
--

INSERT INTO `githubrepos` (`ID`, `Room_ID`, `Owner_ID`, `UserName`, `RepoName`) VALUES
('kjxgeyfe5tnvddd7t0rk', 'm79n6287011rlqk4b60t', 'rbr3vhocokcgkt2e5hiv', 'RajeevSingh2412', 'Metacrafter_JS_MovieNFT'),
('rpqgnlu22paast3o6ja7', 'm79n6287011rlqk4b60t', 'rbr3vhocokcgkt2e5hiv', 'RajeevSingh2412', 'Metacrafter_JS_MovieNFT');

-- --------------------------------------------------------

--
-- Table structure for table `gitusers`
--

CREATE TABLE `gitusers` (
  `ID` int(11) NOT NULL,
  `Room_ID` varchar(20) NOT NULL,
  `Owner_ID` varchar(20) NOT NULL,
  `Token` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gitusers`
--

INSERT INTO `gitusers` (`ID`, `Room_ID`, `Owner_ID`, `Token`) VALUES
(1, 'm79n6287011rlqk4b60t', 'rbr3vhocokcgkt2e5hiv', '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');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `ID` int(11) NOT NULL,
  `Room_ID` varchar(20) NOT NULL,
  `Incomming_ID` varchar(20) NOT NULL,
  `Outgoing_ID` varchar(20) NOT NULL,
  `Message` varchar(201) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`ID`, `Room_ID`, `Incomming_ID`, `Outgoing_ID`, `Message`) VALUES
(24, '', 'x93i0w7kskeo1aes5tva', 'iooab0fut365u9wi5uwd', 'hlo');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `ID` varchar(20) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Owner_ID` varchar(20) NOT NULL,
  `Created_On` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`ID`, `Name`, `Password`, `Owner_ID`, `Created_On`) VALUES
('ilunhpfcpvzi2ot10iuy', 'Test Room 3', 'testid3', 'iooab0fut365u9wi5uwd', '2024-06-18 21:28:27'),
('m79n6287011rlqk4b60t', 'NewRoom', '12345678', 'rbr3vhocokcgkt2e5hiv', '2024-06-29 22:01:08'),
('r0yhk1ytx0vikypw2bs9', 'Test Room 1', '12345678', '7cu8mgwdifahhch39pab', '2024-06-29 17:45:52');

-- --------------------------------------------------------

--
-- Table structure for table `timeline`
--

CREATE TABLE `timeline` (
  `ID` int(11) NOT NULL,
  `Owner_ID` varchar(20) NOT NULL,
  `Room_ID` varchar(20) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Deadline` varchar(20) NOT NULL,
  `Details` varchar(1200) NOT NULL,
  `Created_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `timeline`
--

INSERT INTO `timeline` (`ID`, `Owner_ID`, `Room_ID`, `Title`, `Deadline`, `Details`, `Created_on`) VALUES
(13, 'iooab0fut365u9wi5uwd', 'ilunhpfcpvzi2ot10iuy', 'ysys', '2024-08-05', 'her kj brkef wge be gbfeg birvbrjh t', '2024-06-29 16:28:13'),
(14, '7cu8mgwdifahhch39pab', 'r0yhk1ytx0vikypw2bs9', 'vhewvfb hrgfbr btbtujg bitugh nt4gh vtugbu hgtj ghu tjb', '2024-08-05', 'vhewvfb hrgfbr btbtujg bitugh nt4gh vtugbu hgtj ghu tjbvhewvfb hrgfbr btbtujg bitugh nt4gh vtugbu hgtj ghu tjbvhewvfb hrgfbr btbtujg bitugh nt4gh vtugbu hgtj ghu tjbvhewvfb hrgfbr btbtujg bitugh nt4gh vtugbu hgtj ghu tjbvhewvfb hrgfbr btbtujg bitugh nt4gh vtugbu hgtj ghu tjbvhewvfb hrgfbr btbtujg bitugh nt4gh vtugbu hgtj ghu tjbvhewvfb hrgfbr btbtujg bitugh nt4gh vtugbu hgtj ghu tjbvhewvfb hrgfbr btbtujg bitugh nt4gh vtugbu hgtj ghu tjbvhewvfb hrgfbr btbtujg bitugh nt4gh vtugbu hgtj ghu tjbvhewvfb hrgfbr btbtujg bitugh nt4gh vtugbu hgtj ghu tjbvhewvfb hrgfbr btbtujg bitugh nt4gh vtugbu hgtj ghu tjbvhewvfb hrgfbr btbtujg bitugh nt4gh vtugbu hgtj ghu tjbvhewvfb hrgfbr btbtujg bitugh nt4gh vtugbu hgtj ghu tjb', '2024-06-29 17:47:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` varchar(20) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Created_On` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `Name`, `Username`, `Email`, `Password`, `Created_On`) VALUES
('7cu8mgwdifahhch39pab', 'testid5', 'testid5', 'testid5@gmail.com', '$2y$10$tTYKNrAsXEMxbjT3pvSjeuzsRSJ1yyh6bLahrSMEmRdAKGL1bgX/m', '2024-06-29 17:44:42'),
('iooab0fut365u9wi5uwd', 'testid1', 'testid1', 'testid1@gmail.com', '$2y$10$j4c6KuMO99kpKMXZp4lXn.t68ig8eenSTeu7cQ0VKddWLxxxGNuq.', '2024-06-18 21:25:37'),
('o9x4xg6djpef0w9xqn3v', 'testid3', 'testid3', 'testid3@gmail.com', '$2y$10$Upx.VGvN0D35eMsBPRwMN.C4772jD03NL0x6p88IAc.9XBF2kxTpS', '2024-06-19 10:38:50'),
('qbobb2ndfglg8ok8jruw', 'TestUser 4', 'testid4', 'testid4@gmail.com', '$2y$10$oPjiJMmXDKr39q4Bl/88cuL3bF7lMEBDJQeKH3AKngPE97oL.PLUW', '2024-06-29 15:02:09'),
('rbr3vhocokcgkt2e5hiv', 'Rajeev Manhas', 'rajeevsingh_', '22BCS14717@cuchd.in', '$2y$10$DF8OWIAcOiNcOLYp7ba7VO8QZ2ONoCuxozDgTJUbcUZQhD/XcD9kO', '2024-06-29 22:00:45'),
('x93i0w7kskeo1aes5tva', 'Test User 2', 'testid2', 'testid2@gmail.com', '$2y$10$XiDBw4rTIqDgqe.9kwUh7uaoE3CndJKlqiH3lnUDZG5YYLMof9NIS', '2024-06-18 23:44:53');

-- --------------------------------------------------------

--
-- Table structure for table `usertoroom`
--

CREATE TABLE `usertoroom` (
  `ID` int(11) NOT NULL,
  `User_ID` varchar(20) NOT NULL,
  `Room_ID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usertoroom`
--

INSERT INTO `usertoroom` (`ID`, `User_ID`, `Room_ID`) VALUES
(21, 'iooab0fut365u9wi5uwd', 'ilunhpfcpvzi2ot10iuy'),
(26, '7cu8mgwdifahhch39pab', 'r0yhk1ytx0vikypw2bs9'),
(27, 'rbr3vhocokcgkt2e5hiv', 'm79n6287011rlqk4b60t');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `chat_users`
--
ALTER TABLE `chat_users`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `codetoroomid`
--
ALTER TABLE `codetoroomid`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `githubrepos`
--
ALTER TABLE `githubrepos`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `gitusers`
--
ALTER TABLE `gitusers`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `timeline`
--
ALTER TABLE `timeline`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `usertoroom`
--
ALTER TABLE `usertoroom`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `chat_users`
--
ALTER TABLE `chat_users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `codetoroomid`
--
ALTER TABLE `codetoroomid`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `gitusers`
--
ALTER TABLE `gitusers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `timeline`
--
ALTER TABLE `timeline`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `usertoroom`
--
ALTER TABLE `usertoroom`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
