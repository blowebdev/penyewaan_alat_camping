 <div class="row">
    <div class="col-12">
        <div class="page-title-box">
            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Pencarian</a></li>
                    <li class="breadcrumb-item active">Dashboard</li>
                </ol>
            </div>
        </div>
    </div>
</div>   
<div>
    <div class="row">
        <div class="col-lg-12">
            <!-- Portlet card -->
            <div class="card">
                <div class="card-body">
                    <div class="card-widgets">
                    </div>
                    <h5 class="card-title mb-0">Untuk mulai peminjaman silahkan anda klik tombol cari dibawah.</h5>
                    <div id="cardCollpase1" class="collapse pt-3 show">
                        <div class="row">
                            <div class="col-lg-5">
                                <label>Tanggal Pinjam</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i class="fa fa-clock"></i></div>
                                    </div>
                                    <input type="text" class="form-control form-control-lg tanggal_pinjam" value="<?php echo $_REQUEST['tanggal_pinjam']; ?>" name="tanggal_pinjam" placeholder="Tanggal Pinjam">
                                </div>
                            </div>
                            <div class="col-lg-5">
                                <label>Tanggal Selesai</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i class="fa fa-clock"></i></div>
                                    </div>
                                    <input type="text" class="form-control form-control-lg tanggal_selesai" name="tanggal_selesai" placeholder="Tanggal Selesai">
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <label>-</label><br>
                                <button class="btn  btn-lg btn-primary" onclick="showProduk();"><i class="fa fa-search"></i> Cari</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div> <!-- end card-->
        </div>
        <div id="detail_produk">
            <div class="row">
                <div class="col-12">
                    <div class="card-box">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="p-lg-2">
                                    <!-- Question/Answer -->
                                    <div>
                                        <div class="faq-question-q-box">Q.</div>
                                        <h4 class="faq-question">Bagaimana Cara sewa lewat aplikasi ?</h4>
                                        <p class="faq-answer mb-4">
                                            1. Pencarian barang camping yang tersedia. <br>
                                            2. Penyewaan barang dengan menentukan tanggal dan durasi penyewaan.<br>
                                            3. Informasi detail tentang setiap barang camping, termasuk deskripsi, gambar, harga sewa, dan persyaratan penyewaan.<br>
                                            4. Keranjang belanja untuk menambahkan barang yang akan disewa.<br>
                                            5. Proses pembayaran yang aman.<br>
                                            6. Pelacakan status pesanan dan riwayat penyewaan.<br>
                                            7. Fitur ulasan dan penilaian dari pelanggan sebelumnya.<br>
                                            8. Integrasi dengan peta atau petunjuk arah ke lokasi penyewaan.
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <img style="height: 200px; width: 100" src="<?php echo $base_url; ?>assets/images/banner_depan.png">
                                <img style="height: 200px; width: 100" src="<?php echo $base_url; ?>assets/images/banner_depan2.png">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div><!-- end col -->
    <script src="<?php echo $base_url; ?>assets/js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">
        // showProduk();
        function showProduk() {
           $("#detail_produk").html('<div class="spinner-border m-2" role="status"><span class="sr-only">Loading...</span></div>');
           const tglPinjam = $(".tanggal_pinjam").val();
           const tglSelesai = $(".tanggal_selesai").val();
           console.log(tglSelesai);
           $.ajax({
            url: '<?php echo $base_url; ?>pages/act_produk.php',
            type: 'post',
            dataType: 'html',
            data: {tanggal_pinjam: tglPinjam, tanggal_selesai : tglSelesai},
            success:function(data){
                $("#detail_produk").html(data);
            }
        });
       }
   </script>