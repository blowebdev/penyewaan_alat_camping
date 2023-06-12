-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Jun 2023 pada 18.33
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penyewaan_alat`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_isian_review`
--

CREATE TABLE `master_isian_review` (
  `id` int(11) NOT NULL,
  `kode_transaksi` text NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_pertanyaan` int(11) NOT NULL,
  `jawaban` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `master_isian_review`
--

INSERT INTO `master_isian_review` (`id`, `kode_transaksi`, `id_produk`, `id_pelanggan`, `id_pertanyaan`, `jawaban`) VALUES
(20, 'TRX16987228', 5, 2, 4, 3),
(21, 'TRX16987228', 3, 2, 1, 4),
(22, 'TRX16987228', 3, 2, 2, 2),
(23, 'TRX16987228', 3, 2, 3, 4),
(24, 'TRX16987228', 3, 2, 4, 4),
(25, 'TRX16987228', 2, 2, 1, 4),
(26, 'TRX16987228', 2, 2, 2, 3),
(27, 'TRX16987228', 2, 2, 3, 3),
(28, 'TRX16987228', 2, 2, 4, 4),
(29, 'TRX8D1B99B8', 5, 4, 1, 5),
(30, 'TRX8D1B99B8', 5, 4, 2, 5),
(31, 'TRX8D1B99B8', 5, 4, 3, 5),
(32, 'TRX8D1B99B8', 5, 4, 4, 5),
(33, 'TRXDFD08452', 1, 5, 1, 3),
(34, 'TRXDFD08452', 1, 5, 2, 3),
(35, 'TRXDFD08452', 1, 5, 3, 4),
(36, 'TRXDFD08452', 1, 5, 4, 1),
(37, 'TRXDFD08452', 2, 5, 1, 3),
(38, 'TRXDFD08452', 2, 5, 2, 2),
(39, 'TRXDFD08452', 2, 5, 3, 3),
(40, 'TRXDFD08452', 2, 5, 4, 3),
(41, 'TRX8D1B99B8', 5, 4, 5, 5);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `master_isian_review`
--
ALTER TABLE `master_isian_review`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `master_isian_review`
--
ALTER TABLE `master_isian_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
