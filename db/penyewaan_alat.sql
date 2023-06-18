-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Jun 2023 pada 13.22
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
-- Struktur dari tabel `master_detail_transaksi`
--

CREATE TABLE `master_detail_transaksi` (
  `id` int(11) NOT NULL,
  `kode_transaksi` text NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `tgl_pinjam` datetime NOT NULL,
  `tgl_selesai` datetime NOT NULL,
  `durasi` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `create_at` datetime NOT NULL,
  `status` varchar(255) NOT NULL,
  `review` text NOT NULL,
  `denda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `master_detail_transaksi`
--

INSERT INTO `master_detail_transaksi` (`id`, `kode_transaksi`, `id_produk`, `id_pelanggan`, `harga`, `qty`, `tgl_pinjam`, `tgl_selesai`, `durasi`, `total_harga`, `total`, `create_at`, `status`, `review`, `denda`) VALUES
(5, 'TRX16987228', 5, 2, 40000, 1, '2023-05-24 12:00:00', '2023-05-27 11:00:00', 3, 40000, 120000, '2023-05-24 06:20:55', 'SUDAH', '', 110000),
(6, 'TRX16987228', 3, 2, 100000, 1, '2023-05-24 12:00:00', '2023-05-27 11:00:00', 3, 100000, 300000, '2023-05-24 06:20:55', 'SUDAH', '', 0),
(7, 'TRX16987228', 2, 2, 75000, 1, '2023-05-24 12:00:00', '2023-05-27 11:00:00', 3, 75000, 225000, '2023-05-24 06:20:55', '', '', 0),
(8, 'TRX15F40C06', 5, 4, 40000, 1, '2023-05-24 14:00:00', '2023-05-25 13:00:00', 1, 40000, 40000, '2023-05-24 08:40:46', '', '', 0),
(9, 'TRX15F40C06', 2, 4, 75000, 1, '2023-05-24 14:00:00', '2023-05-25 13:00:00', 1, 75000, 75000, '2023-05-24 08:40:46', '', '', 0),
(10, 'TRX15F40C06', 1, 4, 50000, 1, '2023-05-24 14:00:00', '2023-05-25 13:00:00', 1, 50000, 50000, '2023-05-24 08:40:46', '', '', 0),
(11, 'TRX8D1B99B8', 5, 4, 40000, 1, '2023-05-24 15:00:00', '2023-05-27 14:00:00', 3, 40000, 120000, '2023-05-24 09:58:35', '', 'Ini Review', 0),
(17, 'TRX47F83E30', 3, 2, 100000, 1, '2023-05-26 14:00:00', '2023-05-27 13:00:00', 1, 100000, 100000, '2023-05-26 08:01:42', '', '', 0),
(18, 'TRX47F83E30', 2, 2, 75000, 1, '2023-05-26 14:00:00', '2023-05-27 13:00:00', 1, 75000, 75000, '2023-05-26 08:01:43', '', '', 0),
(19, 'TRX47F83E30', 1, 2, 50000, 1, '2023-05-26 14:00:00', '2023-05-27 13:00:00', 1, 50000, 50000, '2023-05-26 08:01:43', '', '', 0),
(20, 'TRXDFD08452', 1, 5, 50000, 3, '2023-05-28 17:00:00', '2023-05-29 16:00:00', 1, 150000, 150000, '2023-05-28 11:26:37', '', '', 0),
(21, 'TRXDFD08452', 2, 5, 75000, 1, '2023-05-28 17:00:00', '2023-05-29 16:00:00', 1, 75000, 75000, '2023-05-28 11:26:37', '', '', 0);

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

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_keranjang_belanja`
--

CREATE TABLE `master_keranjang_belanja` (
  `id` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `harga` int(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `tgl_pinjam` datetime NOT NULL,
  `tgl_selesai` datetime NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `master_keranjang_belanja`
--

INSERT INTO `master_keranjang_belanja` (`id`, `id_produk`, `id_pelanggan`, `harga`, `qty`, `total`, `tgl_pinjam`, `tgl_selesai`, `date_created`) VALUES
(57, 5, 4, 40000, 1, 40000, '2023-05-28 17:00:00', '2023-05-29 16:00:00', '2023-05-28 11:53:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_nilai_rekomendasi_review`
--

CREATE TABLE `master_nilai_rekomendasi_review` (
  `id` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `nama` text NOT NULL,
  `nilai` int(11) NOT NULL,
  `rangking` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `master_nilai_rekomendasi_review`
--

INSERT INTO `master_nilai_rekomendasi_review` (`id`, `id_produk`, `nama`, `nilai`, `rangking`) VALUES
(40, 5, 'Paket camping ke bromo', 93, 1),
(41, 1, 'Tenda Camping Murah ', 89, 2),
(42, 2, 'Kompor Camping', 78, 3),
(43, 2, 'Kompor Camping', 76, 4),
(44, 5, 'Paket camping ke bromo', 63, 5),
(45, 3, 'Sleeping bag camping', 57, 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_pelanggan`
--

CREATE TABLE `master_pelanggan` (
  `id` int(11) NOT NULL,
  `nama` varchar(225) NOT NULL,
  `hp` text NOT NULL,
  `email` text NOT NULL,
  `alamat` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `master_pelanggan`
--

INSERT INTO `master_pelanggan` (`id`, `nama`, `hp`, `email`, `alamat`, `username`, `password`, `status`) VALUES
(4, 'Zeaid', '62847758857676', 'email1@gmail.com', 'Alamat Jombang', 'user1', '202cb962ac59075b964b07152d234b70', ''),
(5, 'Yaqin', '6287866163545', 'email@gmail.com', 'Jombang', 'user2', '202cb962ac59075b964b07152d234b70', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_pertanyaan_review`
--

CREATE TABLE `master_pertanyaan_review` (
  `id` int(11) NOT NULL,
  `pertanyaan` text NOT NULL,
  `bobot` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `master_pertanyaan_review`
--

INSERT INTO `master_pertanyaan_review` (`id`, `pertanyaan`, `bobot`) VALUES
(1, 'Bagaimana kualitas produk ini ?', 10),
(2, 'Bagaimana kualitas produk ini ?', 10),
(3, 'Bagaimana kecepatan pelayanan toko ?', 70),
(4, 'Kondisi barang dan harga sewa apakah sesuai ?', 10),
(5, 'Apakah lokasi toko sangat nyaman dan aman ?', 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_produk`
--

CREATE TABLE `master_produk` (
  `id` int(5) NOT NULL,
  `nama` varchar(225) NOT NULL,
  `harga` int(10) NOT NULL,
  `gambar` text NOT NULL,
  `deskripsi` text NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `master_produk`
--

INSERT INTO `master_produk` (`id`, `nama`, `harga`, `gambar`, `deskripsi`, `stock`) VALUES
(1, 'Tenda Camping Murah ', 50000, '2023-05-22-tenda.jpg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 10),
(2, 'Kompor Camping', 75000, '2023-05-22-kompur.jpg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	', 10),
(3, 'Sleeping bag camping', 100000, '2023-05-22-e7ffe2326151ed5a522934d4618c9640.jpg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	  ', 50),
(5, 'Paket camping ke bromo', 40000, '2023-05-23-tenda.jpg', 'I have everything working quite well but I cant seem to get the picker to use the default values that I set in the . There are two inputs, a start date and end date. I have a value=\"\" with a date in both which should be the default date for the datepicker. Then the user has the ability to change those dates.', 10),
(6, 'Paket camping ke jombang', 30000, '2023-05-28-banner_depan2.png', 'Deskripsi', 100);

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_transaksi`
--

CREATE TABLE `master_transaksi` (
  `id` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `kode_transaksi` text NOT NULL,
  `total_barang` int(11) NOT NULL,
  `total_transaksi` int(11) NOT NULL,
  `nama` text NOT NULL,
  `hp` text NOT NULL,
  `alamat` text NOT NULL,
  `pengiriman` text NOT NULL,
  `catatan` text NOT NULL,
  `biaya_kirim` int(11) NOT NULL,
  `grand_total` int(11) NOT NULL,
  `pembayaran` text NOT NULL,
  `created_at` datetime NOT NULL,
  `status` text NOT NULL,
  `bank` text NOT NULL,
  `struk` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `master_transaksi`
--

INSERT INTO `master_transaksi` (`id`, `id_pelanggan`, `kode_transaksi`, `total_barang`, `total_transaksi`, `nama`, `hp`, `alamat`, `pengiriman`, `catatan`, `biaya_kirim`, `grand_total`, `pembayaran`, `created_at`, `status`, `bank`, `struk`) VALUES
(3, 2, 'TRX16987228', 3, 645000, 'Ahamad', '6285748496135', 'Jombang jawa timur', 'dikirim', 'Mohon dikirim', 50000, 695000, 'cash', '2023-05-24 06:20:55', 'LUNAS', '', ''),
(4, 4, 'TRX15F40C06', 3, 165000, 'Aha', '62847758857676', 'Alamat Jombang', 'dikirim', 'Ok', 50000, 215000, 'transfer', '2023-05-24 08:40:45', 'PROSES', 'BRI', '-kos-kosan-wisma-rosa-544356595.jpg'),
(8, 4, 'TRX8D1B99B8', 1, 120000, 'Zein saedi', '62847758857676', 'Alamat Jombang', 'ambil_sendiri', 'OK', 0, 120000, 'transfer', '2023-05-24 09:58:35', 'LUNAS', '', ''),
(9, 2, 'TRX47F83E30', 3, 225000, 'Miftahul Huda', '6285748496135', 'Jombang jawa timur', 'dikirim', 'Ok', 50000, 275000, 'transfer', '2023-05-26 08:01:42', 'PROSES', '', ''),
(10, 5, 'TRXDFD08452', 2, 125000, 'Yaqin', '6287866163545', 'Jombang', 'dikirim', 'Mohon verifikasi', 50000, 175000, 'cash', '2023-05-28 11:26:37', 'LUNAS', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_user`
--

CREATE TABLE `master_user` (
  `user_id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` enum('1','2') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `master_user`
--

INSERT INTO `master_user` (`user_id`, `nama`, `username`, `password`, `level`) VALUES
(4, 'Toko Penyewaan', 'admin', '21232f297a57a5a743894a0e4a801fc3', '1');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `master_detail_transaksi`
--
ALTER TABLE `master_detail_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `master_isian_review`
--
ALTER TABLE `master_isian_review`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `master_keranjang_belanja`
--
ALTER TABLE `master_keranjang_belanja`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `master_nilai_rekomendasi_review`
--
ALTER TABLE `master_nilai_rekomendasi_review`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `master_pelanggan`
--
ALTER TABLE `master_pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `master_pertanyaan_review`
--
ALTER TABLE `master_pertanyaan_review`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `master_produk`
--
ALTER TABLE `master_produk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `master_transaksi`
--
ALTER TABLE `master_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `master_user`
--
ALTER TABLE `master_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `master_detail_transaksi`
--
ALTER TABLE `master_detail_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `master_isian_review`
--
ALTER TABLE `master_isian_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT untuk tabel `master_keranjang_belanja`
--
ALTER TABLE `master_keranjang_belanja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT untuk tabel `master_nilai_rekomendasi_review`
--
ALTER TABLE `master_nilai_rekomendasi_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT untuk tabel `master_pelanggan`
--
ALTER TABLE `master_pelanggan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `master_pertanyaan_review`
--
ALTER TABLE `master_pertanyaan_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `master_produk`
--
ALTER TABLE `master_produk`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `master_transaksi`
--
ALTER TABLE `master_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
