-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Des 2019 pada 18.49
-- Versi server: 10.1.30-MariaDB
-- Versi PHP: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pweb`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `destinasi`
--

CREATE TABLE `destinasi` (
  `id` varchar(32) NOT NULL,
  `username` varchar(32) NOT NULL,
  `judul` varchar(32) NOT NULL,
  `deskripsi` varchar(1000) NOT NULL,
  `gambar` varchar(1000) NOT NULL,
  `bukti` varchar(1000) NOT NULL,
  `status` varchar(10) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `destinasi`
--

INSERT INTO `destinasi` (`id`, `username`, `judul`, `deskripsi`, `gambar`, `bukti`, `status`, `created_at`) VALUES
('0rodrigohehe', 'rodrigohehe', 'Sanur', 'Sanur', 'files/img/0rodrigohehe0.jpeg%%', 'files/pdf/0rodrigohehe0.pdf%%', 'terima', NULL),
('1ramirez123', 'ramirez123', 'borobudur', 'borobudur', 'files/img/0ramirez1230.jpeg%%', 'files/pdf/0ramirez1230.pdf%%', 'terima', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `paket`
--

CREATE TABLE `paket` (
  `id` int(11) NOT NULL,
  `id_wisata` varchar(32) NOT NULL,
  `nama` varchar(32) NOT NULL,
  `deskripsi` varchar(1000) NOT NULL,
  `harga` double NOT NULL,
  `gambar` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `paket`
--

INSERT INTO `paket` (`id`, `id_wisata`, `nama`, `deskripsi`, `harga`, `gambar`) VALUES
(1, '0rodrigohehe', 'lala', 'lala', 12345, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengunjung`
--

CREATE TABLE `pengunjung` (
  `id` int(11) NOT NULL,
  `id_pesan` int(11) NOT NULL,
  `nama` varchar(64) NOT NULL,
  `no_ktp` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pengunjung`
--

INSERT INTO `pengunjung` (`id`, `id_pesan`, `nama`, `no_ktp`) VALUES
(1, 1, 'kakk', '0887');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesan`
--

CREATE TABLE `pesan` (
  `id` int(32) NOT NULL,
  `username` varchar(32) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `mulai` date NOT NULL,
  `sampai` date NOT NULL,
  `bukti_transfer` varchar(255) DEFAULT NULL,
  `bukti_wisata` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pesan`
--

INSERT INTO `pesan` (`id`, `username`, `id_paket`, `mulai`, `sampai`, `bukti_transfer`, `bukti_wisata`, `created_at`) VALUES
(1, 'rodrigohehe', 1, '2018-09-09', '2018-10-09', NULL, 'diterima/1', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `id_wisata` int(11) NOT NULL,
  `review` varchar(1000) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `review`
--

INSERT INTO `review` (`id`, `username`, `id_wisata`, `review`, `created_at`) VALUES
(1, 'rizaldihz', 1, 'Sanur sangat bagus', '0000-00-00 00:00:00'),
(2, 'rizaldihz', 1, 'Sanur sangat bagus', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `username` varchar(32) NOT NULL,
  `email` varchar(64) NOT NULL,
  `nama` varchar(32) NOT NULL,
  `password` varchar(200) NOT NULL,
  `telepon` varchar(13) NOT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`username`, `email`, `nama`, `password`, `telepon`, `admin`) VALUES
('admin', 'admin1@mail.com', 'ADMIN', '$2y$08$cWZ1NWVnU2Y0N2tNeVR5QePn3uqXiLAJdBh1ADrpYi8H/A2tFor0m', '0123', 1),
('ramirez123', 'ramirez@mail.com', 'Ramirez', '$2y$08$YVdWd0JnSncrdjFYWVAvMO1kar4VIIJ9CLlVxMs..MdDrKTzWgeDG', '089', 0),
('ramirezoke', 'ramirez@mail.com', 'Ramirez', '$2y$08$MUVERzY2SDRrYkd1WXpvNuOXAxElCO8.Du0KJy/J/mv9FPD88ypXS', '089123456789', 0),
('rizaldihz', 'rizaldi@mail.com', 'Rizaldi', '$2y$12$TnNRSzZ6cWRReW0zUEZ6bugClgP2.2hsedXWNQyBl8vMmHu7KYYAC', '1231231223122', 0),
('rodrigohehe', 'rodrigo@mail.com', 'Hehe', '$2y$08$dWVzalE0YmdzRjdhdDhQWORySR4ShB6osvZtmz3VP39iHKJWnRMDC', '08956789', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `wisata`
--

CREATE TABLE `wisata` (
  `id` int(11) NOT NULL,
  `id_wisata` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `wisata`
--

INSERT INTO `wisata` (`id`, `id_wisata`) VALUES
(1, '0rodrigohehe'),
(2, '1ramirez123');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `destinasi`
--
ALTER TABLE `destinasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_destinasi` (`username`);

--
-- Indeks untuk tabel `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paket_wisata` (`id_wisata`);

--
-- Indeks untuk tabel `pengunjung`
--
ALTER TABLE `pengunjung`
  ADD PRIMARY KEY (`id`),
  ADD KEY `irlnama` (`id_pesan`);

--
-- Indeks untuk tabel `pesan`
--
ALTER TABLE `pesan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paket1` (`id_paket`),
  ADD KEY `pesan_user` (`username`);

--
-- Indeks untuk tabel `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `review_user` (`username`),
  ADD KEY `review_id` (`id_wisata`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `wisata`
--
ALTER TABLE `wisata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_wisata` (`id_wisata`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `paket`
--
ALTER TABLE `paket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pengunjung`
--
ALTER TABLE `pengunjung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pesan`
--
ALTER TABLE `pesan`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `wisata`
--
ALTER TABLE `wisata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `destinasi`
--
ALTER TABLE `destinasi`
  ADD CONSTRAINT `user_destinasi` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `paket`
--
ALTER TABLE `paket`
  ADD CONSTRAINT `paket_wisata` FOREIGN KEY (`id_wisata`) REFERENCES `destinasi` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pengunjung`
--
ALTER TABLE `pengunjung`
  ADD CONSTRAINT `irlnama` FOREIGN KEY (`id_pesan`) REFERENCES `pesan` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pesan`
--
ALTER TABLE `pesan`
  ADD CONSTRAINT `paket1` FOREIGN KEY (`id_paket`) REFERENCES `paket` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pesan_user` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_id` FOREIGN KEY (`id_wisata`) REFERENCES `wisata` (`id`),
  ADD CONSTRAINT `review_user` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

--
-- Ketidakleluasaan untuk tabel `wisata`
--
ALTER TABLE `wisata`
  ADD CONSTRAINT `id_wisata` FOREIGN KEY (`id_wisata`) REFERENCES `destinasi` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
