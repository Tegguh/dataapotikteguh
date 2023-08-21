-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Jul 2023 pada 15.49
-- Versi server: 10.4.20-MariaDB
-- Versi PHP: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dataapotikteguh`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbidan`
--

CREATE TABLE `tbidan` (
  `kode_bidan` char(10) NOT NULL,
  `nama_bidan` varchar(25) NOT NULL,
  `kode_poli` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbidan`
--

INSERT INTO `tbidan` (`kode_bidan`, `nama_bidan`, `kode_poli`) VALUES
('B11', 'Badriyah', 'PL01'),
('B12', 'Lutfi', 'PL02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tpeserta`
--

CREATE TABLE `tpeserta` (
  `kode_peserta` varchar(25) NOT NULL,
  `nama_peserta` varchar(25) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` varchar(25) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `telepone` int(11) NOT NULL,
  `email` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tpeserta`
--

INSERT INTO `tpeserta` (`kode_peserta`, `nama_peserta`, `tanggal_lahir`, `jenis_kelamin`, `alamat`, `telepone`, `email`) VALUES
('P001', 'Ade', '2023-07-13', 'Laki-laki', 'Jl. Pendurenan', 54987546, 'ade@gmail.com'),
('P002', 'Mona', '2023-07-12', 'Perempuan', 'Jl. Kalimalang', 245678651, 'mona@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tpoli`
--

CREATE TABLE `tpoli` (
  `kode_poli` char(10) NOT NULL,
  `nama_poli` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tpoli`
--

INSERT INTO `tpoli` (`kode_poli`, `nama_poli`) VALUES
('PL01', 'Gigi'),
('PL02', 'Umum');

-- --------------------------------------------------------

--
-- Struktur dari tabel `trekammedis`
--

CREATE TABLE `trekammedis` (
  `no_transaksi` char(10) NOT NULL,
  `kode_peserta` char(10) NOT NULL,
  `tgl_berobat` date NOT NULL,
  `kode_bidan` char(10) NOT NULL,
  `keluhan` varchar(50) NOT NULL,
  `biaya_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `trekammedis`
--

INSERT INTO `trekammedis` (`no_transaksi`, `kode_peserta`, `tgl_berobat`, `kode_bidan`, `keluhan`, `biaya_admin`) VALUES
('TR101', 'P001', '2023-07-06', 'B11', 'Gigi Ngilu', 50000),
('TR102', 'P002', '2023-07-12', 'B12', 'Pusing', 50000),
('TRX004', 'P001', '2021-04-08', 'B11', 'masuk angin', 50000);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `vrekammedis`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `vrekammedis` (
`no_transaksi` char(10)
,`tgl_berobat` date
,`kode_peserta` varchar(25)
,`nama_peserta` varchar(25)
,`jenis_kelamin` varchar(25)
,`keluhan` varchar(50)
,`nama_poli` varchar(25)
,`nama_bidan` varchar(25)
,`biaya_admin` int(11)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `vrekammedis`
--
DROP TABLE IF EXISTS `vrekammedis`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vrekammedis`  AS SELECT `trekammedis`.`no_transaksi` AS `no_transaksi`, `trekammedis`.`tgl_berobat` AS `tgl_berobat`, `tpeserta`.`kode_peserta` AS `kode_peserta`, `tpeserta`.`nama_peserta` AS `nama_peserta`, `tpeserta`.`jenis_kelamin` AS `jenis_kelamin`, `trekammedis`.`keluhan` AS `keluhan`, `tpoli`.`nama_poli` AS `nama_poli`, `tbidan`.`nama_bidan` AS `nama_bidan`, `trekammedis`.`biaya_admin` AS `biaya_admin` FROM (((`tpeserta` join `trekammedis` on(`trekammedis`.`kode_peserta` = `tpeserta`.`kode_peserta`)) join `tbidan` on(`tbidan`.`kode_bidan` = `trekammedis`.`kode_bidan`)) join `tpoli` on(`tpoli`.`kode_poli` = `tbidan`.`kode_poli`)) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
