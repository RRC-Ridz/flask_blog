-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 03, 2023 at 07:37 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coding thunder`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`sno`, `name`, `email`, `phone_num`, `msg`, `date`) VALUES
(1, 'Ridham', 'rid@gmail.com', '9876543210', 'HELLOW WORLD', '2023-06-29 17:33:06'),
(2, 'Ridham', 'ridham@gmail.com', '9876543210', 'Ridham', '2023-06-30 09:32:55'),
(4, 'Honey G', 'gnadhi@gmail.com', '9876543210', 'dfgsdfgsdfgsdfg', '2023-06-30 09:47:59'),
(5, 'Ridham Chitre', 'ridhamchitre@gmail.com', '9876543210', 'Ridham@2001', '2023-06-30 10:08:48'),
(6, 'Deep Sins', 'Johnny@abc.com', '9876543210', 'How are you?', '2023-06-30 11:08:15'),
(7, 'Ridham', 'Johnny@abc.com', 's5+6324234', 'sdfsdfdf', '2023-06-30 11:10:13'),
(8, 'Ridham', 'Johnny@abc.com', 's5+6324234', 'sdfsdfdf', '2023-06-30 11:17:14'),
(9, 'Ridham', 'gnadhi@gmail.com', 'dfgdfgdfg', 'wewedrwedfwef', '2023-06-30 11:18:27'),
(10, 'Honey Gandhi', 'honeypatel2101@gmail.com', '9876543210', 'Kem chho Majama???', '2023-06-30 11:19:56'),
(11, 'Deep Adhia', 'Adhia750@gmail.com', '9876543210', 'Kem Chho Majama???', '2023-06-30 11:25:38'),
(12, 'Deep Adhia', 'Adhia750@gmail.com', '9876543210', 'Kem Chho Majama???', '2023-06-30 11:25:59');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `tagline` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `img_file` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tagline`, `slug`, `content`, `date`, `img_file`) VALUES
(1, 'Learning PYTHOONNN', 'Lets Learn Python', 'python', 'dsfjkgnksdjfngjksdfngjksdfgjkmsdfgsdfgsdfgdfgdsf', '2023-06-30 16:30:53', 'Capture.jpg'),
(2, 'Learn about Javascriptttt', 'tagline', 'second_post', 'JavaScript (/ˈdʒɑːvəskrɪpt/), often abbreviated as JS, is a programming language that is one of the core technologies of the World Wide Web, alongside HTML and CSS. As of 2022, 98% of websites use JavaScript on the client side for webpage behavior, often incorporating third-party libraries. All major web browsers have a dedicated JavaScript engine to execute the code on users\' devices.\r\n\r\nJavaScript is a high-level, often just-in-time compiled language that conforms to the ECMAScript standard.[10] It has dynamic typing, prototype-based object-orientation, and first-class functions. It is multi-paradigm, supporting event-driven, functional, and imperative programming styles. It has application programming interfaces (APIs) for working with text, dates, regular expressions, standard data structures, and the Document Object Model (DOM).', '2023-06-30 16:35:27', 'js.jpg'),
(3, 'Learn react', 'Frontend Framework of Javascript', 'React', 'React (also known as React.js or ReactJS) is a free and open-source front-end JavaScript library[3][4] for building user interfaces based on components. It is maintained by Meta (formerly Facebook) and a community of individual developers and companies.[5][6][7]\r\n\r\nReact can be used to develop single-page, mobile, or server-rendered applications with frameworks like Next.js. Because React is only concerned with the user interface and rendering components to the DOM, React applications often rely on libraries for routing and other client-side functionality.[8][9]', '2023-06-30 14:25:35', 'download.png'),
(4, 'Learning Node', 'A Backend framework of JS for Web Development', 'node', 'Node.js is a cross-platform, open-source server environment that can run on Windows, Linux, Unix, macOS, and more. Node.js is a back-end JavaScript runtime environment, runs on the V8 JavaScript Engine, and executes JavaScript code outside a web browser.\r\n\r\nNode.js lets developers use JavaScript to write command line tools and for server-side scripting. The ability to run JavaScript code on the server is often used to generate dynamic web page content before the page is sent to the user\'s web browser. Consequently, Node.js represents a \"JavaScript everywhere\" paradigm,[6] unifying web-application development around a single programming language, as opposed to using different languages for the server- versus client-side programming.\r\n\r\nNode.js has an event-driven architecture capable of asynchronous I/O. These design choices aim to optimize throughput and scalability in web applications with many input/output operations, as well as for real-time Web applications (e.g., real-time communication programs and browser games).[7]', '2023-06-30 14:27:24', ''),
(6, 'Learn .NET', 'a free and open-source, managed computer software framework for Windows, Linux, and macOS operating systems.', 'dotnet', 'On November 12, 2014, Microsoft announced .NET Core, in an effort to include cross-platform support for .NET, including Linux and macOS, source for the .NET Core CoreCLR implementation, source for the \"entire [...] library stack\" for .NET Core,[7] and the adoption of a conventional (\"bazaar\"-like) open-source development model under the stewardship of the .NET Foundation. Miguel de Icaza describes .NET Core as a \"redesigned version of .NET that is based on the simplified version of the class libraries\",[8] and Microsoft\'s Immo Landwerth explained that .NET Core would be \"the foundation of all future .NET platforms\". At the time of the announcement, the initial release of the .NET Core project had been seeded with a subset of the libraries\' source code and coincided with the relicensing of Microsoft\'s existing .NET reference source away from the restrictions of the Ms-RSL. Landwerth acknowledged the disadvantages of the formerly selected shared license, explaining that it made codename Rotor \"a non-starter\" as a community-developed open source project because it did not meet the criteria of an Open Source Initiative (OSI) approved license.[9][10][11]', '2023-06-30 14:29:59', ''),
(8, 'Learning ABC', '15', 'abc', 'Lorem Ipsumdfgsdflkgdf \r\nsdfgdf \r\nsd\r\n sd\r\ng sdfg sdfgsdfgsdfg dsfgdfgsdfgsdfgsfg', '2023-07-03 10:17:35', 'Capture.JPG'),
(9, 'Learn Numbers\r\n', '19', 'numbers', '12345678910', '2023-07-03 10:18:38', 'Capture.JPG');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
