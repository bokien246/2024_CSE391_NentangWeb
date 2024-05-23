-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 23, 2024 lúc 12:50 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `kiemtra`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `employees`
--

INSERT INTO `employees` (`id`, `name`, `email`, `address`, `phone`) VALUES
(1, 'Karrie Quantick', 'kquantick0@theguardian.com', '4 Debs Way', '190-933-6908'),
(2, 'Bibi O\'Hallagan', 'bohallagan1@wunderground.com', '581 Tennyson Road', '461-321-8297'),
(3, 'Jonathon O\'Hartnedy', 'johartnedy2@bloomberg.com', '13787 Moose Lane', '731-319-1767'),
(4, 'Charil Crotty', 'ccrotty3@un.org', '2089 Fordem Junction', '456-293-7197'),
(5, 'Shandeigh Grocott', 'sgrocott4@mashable.com', '92 Vermont Pass', '701-741-9840'),
(6, 'Sutton Lohering', 'slohering5@bluehost.com', '2 Brown Court', '792-836-0787'),
(7, 'Darby Deverick', 'ddeverick6@miibeian.gov.cn', '4 Menomonie Crossing', '264-430-2984'),
(8, 'Hamlin Torregiani', 'htorregiani7@nhs.uk', '386 Browning Road', '864-340-4041'),
(9, 'Chere Dumpleton', 'cdumpleton8@weebly.com', '430 Coleman Center', '563-847-1017'),
(10, 'Paloma Broszkiewicz', 'pbroszkiewicz9@i2i.jp', '17764 Mandrake Parkway', '283-130-3472'),
(11, 'Benoite Cotsford', 'bcotsforda@utexas.edu', '0322 Barby Hill', '575-412-9018'),
(12, 'Foss Smitham', 'fsmithamb@timesonline.co.uk', '5 Straubel Point', '871-582-8687'),
(13, 'Basilio Farnhill', 'bfarnhillc@chronoengine.com', '3 Forest Pass', '861-871-4186'),
(14, 'Bob Say', 'bsayd@marketwatch.com', '62587 Talisman Park', '551-960-8742'),
(15, 'Saundra Scala', 'sscalae@discovery.com', '23161 Mallory Court', '384-186-9544'),
(16, 'Thorsten Chrichton', 'tchrichtonf@wordpress.org', '44 Welch Center', '744-880-8846'),
(17, 'Valaree Cowlishaw', 'vcowlishawg@ca.gov', '73740 Fairfield Court', '939-331-6711'),
(18, 'Jedediah Levington', 'jlevingtonh@printfriendly.com', '087 Karstens Plaza', '908-701-9545'),
(19, 'Kanya Horrigan', 'khorrigani@lycos.com', '1732 Spohn Hill', '126-118-2748'),
(20, 'Onida Delacourt', 'odelacourtj@wiley.com', '23 Trailsway Pass', '485-589-5591'),
(21, 'Boris Schaumaker', 'bschaumakerk@quantcast.com', '646 Melvin Junction', '178-336-8100'),
(22, 'Mirella Ferriby', 'mferribyl@icio.us', '9933 Marcy Avenue', '761-209-6302'),
(23, 'Penelopa Spellman', 'pspellmanm@t.co', '1 Fisk Terrace', '432-499-4197'),
(24, 'Dore Archdeacon', 'darchdeaconn@myspace.com', '64392 Old Shore Avenue', '521-723-6356'),
(25, 'Montgomery Shoebotham', 'mshoebothamo@uiuc.edu', '8 Charing Cross Pass', '832-872-4042'),
(26, 'Orbadiah Braben', 'obrabenp@ucoz.com', '25060 Lighthouse Bay Trail', '479-723-5100'),
(27, 'Udale Lipp', 'ulippq@techcrunch.com', '68 Loomis Lane', '686-113-6661'),
(28, 'Moise Picheford', 'mpichefordr@soup.io', '57 Golf Park', '504-191-7150'),
(29, 'Caye Reina', 'creinas@abc.net.au', '2 Ronald Regan Hill', '111-683-9162'),
(30, 'Alaric Sails', 'asailst@usda.gov', '7642 Jana Hill', '233-679-7699'),
(31, 'Helen-elizabeth Awton', 'hawtonu@yolasite.com', '2853 Mifflin Hill', '856-872-4023'),
(32, 'Derward Macauley', 'dmacauleyv@biglobe.ne.jp', '465 Almo Court', '741-767-0697'),
(33, 'Cody Litherland', 'clitherlandw@slashdot.org', '3351 Fisk Parkway', '781-597-5295'),
(34, 'Cecily Illem', 'cillemx@facebook.com', '32429 Northview Street', '814-986-6595'),
(35, 'Nanni Digges', 'ndiggesy@networksolutions.com', '0 Forest Terrace', '570-202-9265'),
(36, 'Markus Kemmett', 'mkemmettz@go.com', '28 8th Hill', '450-959-9262'),
(37, 'Cal Wathan', 'cwathan10@home.pl', '1 Carpenter Center', '413-385-8155'),
(38, 'Holmes Vise', 'hvise11@ehow.com', '264 Annamark Court', '207-177-1852'),
(39, 'Dael Olcot', 'dolcot12@smh.com.au', '8 Waxwing Junction', '432-398-4591'),
(40, 'Laurence McConnal', 'lmcconnal13@topsy.com', '77 Fulton Alley', '494-569-7045'),
(41, 'Jinny Pottiphar', 'jpottiphar14@patch.com', '171 Sundown Circle', '191-126-0974'),
(42, 'Ferdinande Moland', 'fmoland15@ca.gov', '36502 Golf Course Plaza', '605-515-0698'),
(43, 'Chaddie Laxen', 'claxen16@yahoo.co.jp', '2239 Mayer Road', '581-600-8904'),
(44, 'Cele Denslow', 'cdenslow17@tinypic.com', '2885 Mitchell Center', '670-188-8839'),
(45, 'Dani McKearnen', 'dmckearnen18@who.int', '073 Troy Drive', '992-484-1639'),
(46, 'Arel Rivett', 'arivett19@simplemachines.org', '1 1st Pass', '620-310-7798'),
(47, 'Fabio Brameld', 'fbrameld1a@si.edu', '54 Montana Trail', '322-537-5613'),
(48, 'Devon Forde', 'dforde1b@ucoz.com', '2115 Michigan Lane', '974-293-9725'),
(49, 'Skylar Vinnick', 'svinnick1c@wix.com', '915 Meadow Valley Parkway', '542-294-8758'),
(50, 'Jakob Wiggam', 'jwiggam1d@springer.com', '32582 Bunker Hill Parkway', '342-531-8068');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
