
<div class="row">
	<!-- <div class="col-lg-3">
		<div class="card">
			<h5 class="card-header">Filter Pencarian</h5>
			<div class="card-body">
				<input type="text" name="txt" class="form-control" placeholder="Pencarian"> <br>
				<a href="#" class="btn btn-primary">Cari</a>
			</div>
		</div>
	</div> -->
	<div class="col-lg-12">
		<div class="row">
			<?php 
			error_reporting(0);
			session_start();
			include '../config/koneksi.php';
			$product = mysqli_query($conn,"SELECT * FROM master_produk");
			while ($dapod = mysqli_fetch_array($product)) {
				$result = mysqli_query($conn,"SELECT SUM(CAST(jawaban AS DOUBLE) /5) as jawaban FROM `master_isian_review` WHERE id_produk = '".$dapod['id']."'");
				$review_bintan = mysqli_fetch_array($result);
			?>
				<div class="col-md-6 col-xl-3">
					<div class="card product-box">
						<div class="product-img">
							<div class="p-3">
								<img src="<?php echo $base_url."upload/".$dapod['gambar']; ?>" alt="product-pic" class="img-fluid" />
							</div>
							<div class="product-action">
								<div class="d-flex">
									<a href="javascript: void(0);" onclick="keranjang_belanja('<?php echo $dapod['id']; ?>', '<?php echo $dapod['harga']; ?>')" class="btn btn-danger d-block w-100 action-btn m-2">
										<i class="ti-shopping-cart"></i> Keranjang</a>
									</div>
								</div>
							</div>

							<div class="product-info border-top p-3">

								<div>
									<h5 class="font-16 mt-0 mb-1"><a href="ecommerce-product-detail.html" class="text-dark"><?php echo $dapod['nama']; ?></a> </h5>
									<p class="text-muted">
											<?php for ($i=1; $i <=number_format($review_bintan['jawaban'],2) ; $i++) { 
												echo '<i class="mdi mdi-star text-warning"></i>';
											}?> (<?php echo number_format($review_bintan['jawaban'],2); ?>)
									</p>
									<h4 class="m-0"> <span class="text-muted"> Harga : Rp.<?php echo number_format($dapod['harga']); ?> /Hari</span></h4>
								</div>

							</div> <!-- end product info-->

						</div>
					</div>

				<?php } ?>
			</div>
		</div>
	</div> <!-- end container -->


	<script type="text/javascript">

		function keranjang_belanja(id, harga) {
			<?php  if(!empty($_SESSION['id_pelanggan'])) :?>
				var id = id;
				var harga = harga;
				$.ajax({
					url: '<?php echo $base_url; ?>pages/act_keranjang_belanja.php',
					type: 'POST',
					dataType: 'json',
					data: {id:id, harga:harga, tgl_pinjam : '<?php echo $_REQUEST['tanggal_pinjam']; ?>', tgl_selesai: '<?php echo $_REQUEST['tanggal_selesai']; ?>' },
					success : function(data){
						if(data.status=='success'){
							swal({
								title: "Berhasil",
								text: "Data berhasil dimasukan ke keranjang belanja",
								type: "success"
							}).then(function() {
								updateQty();
							});
						}else{
							Swal.fire({
								title: "Maaf !",
								text: "Harus login terlebih dahulu",
								type: "error",
								confirmButtonClass: "btn btn-confirm mt-2"
							})
						}
					}
				});
				<?php else : ?>
					Swal.fire({
						title: "Maaf !",
						text: "Harus login terlebih dahulu",
						type: "error",
						confirmButtonClass: "btn btn-confirm mt-2"
					})

				<?php endif; ?>
			}
		</script>