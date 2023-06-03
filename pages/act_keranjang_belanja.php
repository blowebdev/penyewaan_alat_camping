<?php 
error_reporting(0);
session_start();
include '../config/koneksi.php';

$id_pelanggan = $_SESSION['id_pelanggan'];
$id_produk = $_POST['id'];
$harga = $_POST['harga'];
$tgl_pinjam = $_POST['tgl_pinjam'].":00";
$tgl_selesai = $_POST['tgl_selesai'].":00";

$cek = mysqli_query($conn,"SELECT * FROM master_keranjang_belanja WHERE id_produk='".$id_produk."' AND id_pelanggan='".$id_pelanggan."'");
$cek_tot = mysqli_num_rows($cek);
$cekhasil = mysqli_fetch_array($cek);
if ($cek_tot>=1) {
	$qty = $cekhasil['qty']+1;
	$harga = ($cekhasil['qty']+1)*$cekhasil['harga'];
	$sql = "UPDATE master_keranjang_belanja SET qty='".$qty."', total='".$harga."' WHERE id_produk='".$id_produk."' AND id_pelanggan='".$id_pelanggan."' ";
}else{
	$sql = "INSERT INTO master_keranjang_belanja (
	id_produk,
	id_pelanggan,
	harga,
	qty,
	total, 
	tgl_pinjam, 
	tgl_selesai, 
	date_created) 
	VALUES (
	'".$id_produk."',
	'".$id_pelanggan."',
	'".$harga."',
	'1',
	'".$harga."',
	'".$tgl_pinjam."',
	'".$tgl_selesai."',
	'".date('Y-m-d H:i:s')."'
)";
}
$save = mysqli_query($conn,$sql);
if ($save) {
	$data['status'] = 'success';
}else{
	$data['status'] = 'gagal';
}

echo json_encode($data); 
?>