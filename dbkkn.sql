-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Apr 2022 pada 03.15
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbkkn`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `balita`
--

CREATE TABLE `balita` (
  `id_balita` int(9) NOT NULL,
  `nomor_kk` int(20) DEFAULT NULL,
  `id_posyandu` int(5) DEFAULT NULL,
  `nama_balita` varchar(100) DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jenis_data` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `balita`
--

INSERT INTO `balita` (`id_balita`, `nomor_kk`, `id_posyandu`, `nama_balita`, `jenis_kelamin`, `tgl_lahir`, `jenis_data`) VALUES
(274, 2, 1, 'nabiila fatimatuz zahra', 'P', '2021-09-29', '1'),
(275, 3, 2, 'adinda robiyatul adawiyah', 'P', '2021-12-22', '1'),
(276, 1234, 1, 'erawati', 'P', '2021-09-22', '1'),
(277, 4, 3, 'hanifah abdillah rasyid', 'P', '2021-11-23', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_balita`
--

CREATE TABLE `detail_balita` (
  `id_detail` int(9) NOT NULL,
  `id_balita` int(9) NOT NULL,
  `usia` int(2) DEFAULT NULL,
  `berat_badan` float DEFAULT NULL,
  `status_gizi` enum('1','2','3','4') DEFAULT NULL,
  `tgl_update` date NOT NULL,
  `nomor_urut` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_balita`
--

INSERT INTO `detail_balita` (`id_detail`, `id_balita`, `usia`, `berat_badan`, `status_gizi`, `tgl_update`, `nomor_urut`) VALUES
(2, 274, 18, 9.2, '1', '2022-03-29', 1),
(3, 274, 19, 9.8, '2', '2022-03-29', 2),
(4, 275, 18, 5.3, '3', '2022-03-29', 1),
(5, 275, 19, 5.8, '2', '2022-03-29', 2),
(6, 275, 20, 5.1, '4', '2022-03-29', 3),
(7, 276, 6, 4.5, '2', '2022-03-29', 1),
(8, 276, 7, 5, '2', '2022-03-29', 2),
(9, 277, 4, 5.3, '3', '2022-03-29', 1),
(10, 277, 5, 5.5, '2', '2022-03-29', 2),
(11, 277, 6, 4.2, '4', '2022-03-29', 3),
(12, 274, 20, 8.7, '3', '2022-03-29', 3),
(13, 275, 21, 6.5, '2', '2022-03-31', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orang_tua`
--

CREATE TABLE `orang_tua` (
  `nomor_kk` int(20) NOT NULL,
  `nama_ibu` varchar(100) NOT NULL,
  `nama_ayah` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `orang_tua`
--

INSERT INTO `orang_tua` (`nomor_kk`, `nama_ibu`, `nama_ayah`) VALUES
(1, 'LASTRI', 'BUDI PURNOMO'),
(2, 'suprapti', 'bambang subroto'),
(3, 'karmanaheen', 'muhammad rohmat'),
(4, 'nurul laily', 'abdul rasyid'),
(5, 'siti', 'budi'),
(1234, 'siti jubaedah', 'hadi setiawan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `posyandu`
--

CREATE TABLE `posyandu` (
  `id_posyandu` int(5) NOT NULL,
  `nama_posyandu` varchar(50) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `posyandu`
--

INSERT INTO `posyandu` (`id_posyandu`, `nama_posyandu`, `alamat`) VALUES
(1, 'SEJAHTERA', '-'),
(2, 'BAHAGIA', '-'),
(3, 'LESTARI', '-'),
(5, 'NONGKOREJO', '-');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(5) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `level` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES
(1, 'admin', 'admin', '1'),
(2, 'lastri', '123', '2');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `balita`
--
ALTER TABLE `balita`
  ADD PRIMARY KEY (`id_balita`),
  ADD KEY `id_ortu` (`nomor_kk`),
  ADD KEY `id_posyandu` (`id_posyandu`);

--
-- Indeks untuk tabel `detail_balita`
--
ALTER TABLE `detail_balita`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_balita` (`id_balita`);

--
-- Indeks untuk tabel `orang_tua`
--
ALTER TABLE `orang_tua`
  ADD PRIMARY KEY (`nomor_kk`);

--
-- Indeks untuk tabel `posyandu`
--
ALTER TABLE `posyandu`
  ADD PRIMARY KEY (`id_posyandu`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `balita`
--
ALTER TABLE `balita`
  MODIFY `id_balita` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=278;

--
-- AUTO_INCREMENT untuk tabel `detail_balita`
--
ALTER TABLE `detail_balita`
  MODIFY `id_detail` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `orang_tua`
--
ALTER TABLE `orang_tua`
  MODIFY `nomor_kk` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1235;

--
-- AUTO_INCREMENT untuk tabel `posyandu`
--
ALTER TABLE `posyandu`
  MODIFY `id_posyandu` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `balita`
--
ALTER TABLE `balita`
  ADD CONSTRAINT `balita_ibfk_1` FOREIGN KEY (`nomor_kk`) REFERENCES `orang_tua` (`nomor_kk`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `balita_ibfk_2` FOREIGN KEY (`id_posyandu`) REFERENCES `posyandu` (`id_posyandu`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_balita`
--
ALTER TABLE `detail_balita`
  ADD CONSTRAINT `detail_balita_ibfk_1` FOREIGN KEY (`id_balita`) REFERENCES `balita` (`id_balita`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
