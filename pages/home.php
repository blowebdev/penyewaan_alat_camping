<?php
if (@$_SESSION['level']=='1') {
	include 'dashboard.php';
}else{
	if(in_array($_SESSION['level'], array('2'))){
		include 'produk.php';
	}else{
		include 'start_home.php';
	}
}
?>