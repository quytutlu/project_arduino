-- phpMyAdmin SQL Dump
-- version 4.4.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 05, 2015 at 06:56 PM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `arduino`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `BatThietBi`(IN `id_ThietBi` INT(50))
begin
	update ThietBi set TrangThai="1" where thietbi.id=id_ThietBi;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DangNhap`(in TenDangNhap varchar(30),MatKhau varchar(30))
begin
	select *
    from thongtinnguoidung
    where thongtinnguoidung.TenDangNhap=TenDangNhap and thongtinnguoidung.MatKhau=MatKhau;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LayTrangThai`()
begin
	select *
    from thietbi
    WHERE thietbi.ReadOnly=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LayTrangThaiAnalog`()
BEGIN
	SELECT *
    from thietbi
    WHERE thietbi.ReadOnly=1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LayTrangThaiArduino`(IN `a1` VARCHAR(50), IN `a2` VARCHAR(50), IN `a3` VARCHAR(50))
begin
	UPDATE thietbi SET thietbi.TrangThai=a1 WHERE thietbi.id=11;
    UPDATE thietbi SET thietbi.TrangThai=a2 WHERE thietbi.id=12;
    UPDATE thietbi SET thietbi.TrangThai=a3 WHERE thietbi.id=13;
	select *
    from thietbi
    where thietbi.ReadOnly=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `TatThietBi`(IN `id_ThietBi` INT(50))
begin
	update ThietBi set TrangThai="0" where thietbi.id=id_ThietBi;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `thietbi`
--

CREATE TABLE IF NOT EXISTS `thietbi` (
  `id` int(11) NOT NULL,
  `TenThietBi` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TrangThai` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `TenVietTat` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `ReadOnly` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `thietbi`
--

INSERT INTO `thietbi` (`id`, `TenThietBi`, `TrangThai`, `TenVietTat`, `ReadOnly`) VALUES
(5, 'Thiết bị 1', '0', 'dr1', 0),
(6, 'Thiết bị 2', '0', 'dr2', 0),
(7, 'Thiết bị 3', '0', 'dr3', 0),
(8, 'Thiết bị 4', '0', 'dr4', 0),
(9, 'Thiết bị 5', '0', 'dr5', 0),
(11, 'Analog 1', '15', 'an1', 1),
(12, 'Analog 2', '22', 'an2', 1),
(13, 'Analog 3', '44', 'an3', 1);

-- --------------------------------------------------------

--
-- Table structure for table `thongtinnguoidung`
--

CREATE TABLE IF NOT EXISTS `thongtinnguoidung` (
  `id` int(11) NOT NULL,
  `TenDangNhap` varchar(30) NOT NULL,
  `MatKhau` varchar(30) NOT NULL,
  `SDT` varchar(12) NOT NULL,
  `Email` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thongtinnguoidung`
--

INSERT INTO `thongtinnguoidung` (`id`, `TenDangNhap`, `MatKhau`, `SDT`, `Email`) VALUES
(1, 'adminstrator', '123456a@', '01688558810', 'quytutlu@gmail.com'),
(2, 'quytutlu', '60648994t', '01688558810', 'quytutlu@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `thietbi`
--
ALTER TABLE `thietbi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thongtinnguoidung`
--
ALTER TABLE `thongtinnguoidung`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `thietbi`
--
ALTER TABLE `thietbi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `thongtinnguoidung`
--
ALTER TABLE `thongtinnguoidung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
