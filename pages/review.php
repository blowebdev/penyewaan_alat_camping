<?php 
if (!in_array($_SESSION['level'], array('1','2'))) {
echo  "<br>Maaf halaman tidak bisa di akses";
exit;
}
?>
<div class="row">
	<div class="col-12">
		<div class="page-title-box">
			<div class="page-title-right">
				<ol class="breadcrumb m-0">
					<li class="breadcrumb-item"><a href="javascript: void(0);">Dashboard</a></li>
					<li class="breadcrumb-item active">Review</li>
				</ol>
			</div>
			<h4 class="page-title">Pertanyaan Review Untuk Pelanggan</h4>
		</div>
	</div>
</div>  
<style type="text/css">
	.card-header {
		padding: 1rem 1.5rem;
		margin-bottom: 0;
		background-color: #81ecec !important;
		border-bottom: 0 solid #dee2e6 !important;
	}
</style>
<?php 
if (in_array($_SESSION['level'], array('1'))) {
	$_SESSION['id_pelanggan']= str_replace('/', '', $_REQUEST['id2']);
}
if (isset($_REQUEST['simpan'])) {
	$id_pelanggan = $_SESSION['id_pelanggan'];
	$kode_transaksi = $_REQUEST['id'];
	foreach ($_REQUEST['isi_pertanyaan'] as $id_produk => $data) {
		$id_produk = $id_produk;
		foreach ($data as $key => $d) {
			$id_pertanyaan = $key;
			foreach ($d as $key => $isi) {
				$cek_total = mysqli_num_rows(mysqli_query($conn,"SELECT * FROM master_isian_review 
					WHERE id_pelanggan='".$id_pelanggan."'
					AND id_produk='".$id_produk."'
					AND id_pertanyaan='".$id_pertanyaan."'"));
				if ($cek_total>=1) {
					$sql = "UPDATE `master_isian_review` SET 
					jawaban='".$isi."',
					kode_transaksi='".$kode_transaksi."'
					WHERE id_produk='".$id_produk."'
					AND id_pelanggan='".$id_pelanggan."'
					AND id_pertanyaan='".$id_pertanyaan."'
					";
				}else{
					$sql = "
					INSERT INTO `master_isian_review`(
					`id_produk`,
					`id_pelanggan`,
					`id_pertanyaan`,
					`jawaban`,
					`kode_transaksi`
					) VALUES (
					'".$id_produk."',
					'".$id_pelanggan."',
					'".$id_pertanyaan."',
					'".$isi."',
					'".$kode_transaksi."'
				)";
				}
				// echo  $sql."<br>";
				mysqli_query($conn,$sql);
			}
		}
	}
}
?>
<div class="row">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<div class="row">
					<div class="col-lg-12">
						<form action="" method="POST">
							<div class="accordion mb-3" id="accordionExample">
								<?php 
								$no = 1;
								if(!empty($_REQUEST['id'])){
									$q = "WHERE a.kode_transaksi='".$_REQUEST['id']."' ";
								}else{
									if(in_array($_SESSION['level'],array('1'))) {
										$q = "";
									}else{
										$q = "WHERE a.id_pelanggan='".$_SESSION['id_pelanggan']."' ";
									}
								}
								$trxsql = mysqli_query($conn,"
									SELECT DISTINCT b.id, b.nama FROM `master_detail_transaksi` as a 
									LEFT JOIN master_produk as b ON a.id_produk = b.id
									".$q."
									");
								$no=1;
								while ($data = mysqli_fetch_array($trxsql)) {?>	

									<div class="card mb-1">
										<div class="card-header" id="headingOne">
											<h5 class="my-0">
												<a class="text-default" style="color: black" data-toggle="collapse" href="#collapseOne<?php echo $data['id']; ?>" aria-expanded="true" aria-controls="collapseOne<?php echo $data['id']; ?>">
													# <?php echo $data['nama']; ?>
												</a>
											</h2>
										</div>

										<div id="collapseOne<?php echo $data['id']; ?>" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
											<div class="card-body">
												<table class="table">
													<?php 
													$no =1;
													$pertanyaan = mysqli_query($conn,"SELECT * FROM master_pertanyaan_review ORDER BY id ASC");
													foreach ($pertanyaan as $key => $value) {
														$isi =mysqli_fetch_array(mysqli_query($conn,"SELECT * FROM master_isian_review 
															WHERE id_produk='".$data['id']."'
															AND id_pelanggan='".$_SESSION['id_pelanggan']."'
															AND id_pertanyaan='".$value['id']."'"));
															?>
															<tr>
																<td rowspan="2" width="1%"><?php echo $no++; ?></td>
																<td><?php echo $value['pertanyaan']; ?></td>
															</tr>
															<tr>
																<td>
																	<select name="isi_pertanyaan[<?php echo $data['id']; ?>][<?php echo $value['id']; ?>][]" required="">
																		<option value="">Pilih jawaban</option>
																		<option value="1"
																		<?php echo ($isi['jawaban']==1) ? "selected": ""; ?>
																		>Sangat Tidak Setuju</option>
																		<option value="2"
																		<?php echo ($isi['jawaban']==2) ? "selected": ""; ?>
																		>Tidak Setuju</option>
																		<option value="3"
																		<?php echo ($isi['jawaban']==3) ? "selected": ""; ?>
																		>Setuju</option>
																		<option value="4"
																		<?php echo ($isi['jawaban']==4) ? "selected": ""; ?>
																		>Sangat Setuju</option>
																	</select>
																</td>
															</tr>
														<?php } ?>
													</table>
													<label>Review</label>
													<textarea class="form-control" placeholder="Review" ></textarea>
												</div>
											</div>
										</div>

									<?php } ?>
									<center><button class="btn btn-primary btn-lg" type="submit" name="simpan" onclick="return confirm('Apakah anda ingin menyimpan data ini ?')">Simpan</button></center>
								</div>
							</form>
						</div>
					</div> <!-- end row -->
				</div>
			</div>
		</div>
	</div>