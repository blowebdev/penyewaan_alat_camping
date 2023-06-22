<div class="row">
    <div class="col-12">
        <div class="page-title-box">
            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Admin</a></li>
                    <li class="breadcrumb-item active">Dashboard</li>
                </ol>
            </div>
            <h4 class="page-title">Selamat datang ! Admin</h4>
        </div>
    </div>
</div>    
<div class="row">
    <div class="col-xl-3 col-md-6">
        <div class="widget-bg-color-icon card-box">
            <div class="avatar-lg rounded-circle bg-icon-success float-left">
                <i class="fe-shopping-bag font-24 avatar-title text-white"></i>
            </div>
            <?php $jml_produk = mysqli_num_rows(mysqli_query($conn,"SELECT * FROM master_produk")); ?>
            <div class="text-right">
                <h3 class="text-dark mt-1"><span class="counter"><?php echo number_format($jml_produk); ?></span></h3>
                <p class="text-muted mb-0">Produk</p>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6">
        <?php $jml_pengguna = mysqli_num_rows(mysqli_query($conn,"SELECT * FROM master_pelanggan")); ?>
        <div class="widget-bg-color-icon card-box">
            <div class="avatar-lg rounded-circle bg-icon-primary float-left">
                <i class="fe-users font-24 avatar-title text-white"></i>
            </div>
            <div class="text-right">
                <h3 class="text-dark mt-1"><span class="counter"><?php echo number_format($jml_pengguna); ?></span></h3>
                <p class="text-muted mb-0">Pengguna</p>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>

    <div class="col-xl-3 col-md-6">
        <?php $keuntungan = mysqli_fetch_array(mysqli_query($conn,"SELECT SUM(grand_total) as total FROM master_transaksi")); ?>
        <div class="widget-bg-color-icon card-box">
            <div class="avatar-lg rounded-circle bg-icon-danger float-left">
                <i class="fe-gift font-24 avatar-title text-white"></i>
            </div>
            <div class="text-right">
                <h3 class="text-dark mt-1"><span class="counter">Rp. <?php echo number_format($keuntungan['total']); ?></span></h3>
                <p class="text-muted mb-0">Keuntungan</p>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>

    <div class="col-xl-3 col-md-6">
        <?php $ongkir = mysqli_fetch_array(mysqli_query($conn,"SELECT SUM(biaya_kirim) as total FROM master_transaksi")); ?>
        <div class="widget-bg-color-icon card-box">
            <div class="avatar-lg rounded-circle bg-icon-purple float-left">
                <i class="fe-truck font-24 avatar-title text-white"></i>
            </div>
            <div class="text-right">
                <h3 class="text-dark mt-1">Rp. <?php echo number_format($ongkir['total']); ?></h3>
                <p class="text-muted mb-0">Ongkir Terkumpul</p>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>

     <div class="col-xl-3 col-md-6">
        <?php $dipinjam = mysqli_fetch_array(mysqli_query($conn,"SELECT SUM(qty) as total FROM master_detail_transaksi WHERE status='PROSES'")); ?>
        <div class="widget-bg-color-icon card-box">
            <div class="avatar-lg rounded-circle bg-icon-purple float-left">
                <i class="fe-truck font-24 avatar-title text-white"></i>
            </div>
            <div class="text-right">
                <h3 class="text-dark mt-1"><?php echo number_format($dipinjam['total']); ?> Item</h3>
                <p class="text-muted mb-0">Total barang dipinjam</p>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6">
        <?php $harus_kembali = mysqli_fetch_array(mysqli_query($conn,"
             SELECT SUM(v.qty) as total FROM (
             SELECT  a.id as id_detail, a.qty,  DATEDIFF(a.tgl_selesai, a.tgl_pinjam) AS total_hari,
                                    IF(NOW() > a.tgl_selesai, 'Perlu dikembalikan', 'Proses') AS status, a.status as status_up,
                                    DATEDIFF(NOW(),a.tgl_selesai) AS sisa_hari
                                    FROM `master_detail_transaksi` as a 
                                    LEFT JOIN master_produk as b ON a.id_produk = b.id
            ) as v WHERE v.status='Perlu dikembalikan' 
        ")); ?>
        <div class="widget-bg-color-icon card-box">
            <div class="avatar-lg rounded-circle bg-icon-purple float-left">
                <i class="fe-truck font-24 avatar-title text-white"></i>
            </div>
            <div class="text-right">
                <h3 class="text-dark mt-1"><?php echo number_format($harus_kembali['total']); ?> Item</h3>
                <p class="text-muted mb-0">Total barang harus kembali</p>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- end row -->
<div class="card-box ribbon-box">
    <div class="ribbon ribbon-success float-left">Laporan Bulanan</div>
    <h5 class="text-success float-right mt-0">Report Statistik</h5>
    <div class="ribbon-content" style="height: 30% !important">
        <div id="chart"></div>
    </div>
</div>



<script type="text/javascript">
<?php 
   $pemesanan = mysqli_query($conn,"SELECT DATE_FORMAT(created_at, '%Y-%m') AS bulan, COUNT(*) AS jumlah_pemesanan FROM master_transaksi GROUP BY bulan;");
   $dataPoints = array();
           while ($row = mysqli_fetch_array($pemesanan)) {
            $dataPoints[] = array("label" => $row["bulan"], "y" => $row["jumlah_pemesanan"]);
        }
?>
var dataPoints = <?php echo json_encode($dataPoints, JSON_NUMERIC_CHECK); ?>;
var chart = new CanvasJS.Chart("chart", {
    theme: "light2",
    animationEnabled: true,
    title: {
        text: "Penyewaan Per Bulan"
    },
    axisY: {
        title: "Total sewa barang"
    },
    data: [{
        type: "line",
        dataPoints: dataPoints
    }]
});

chart.render();
</script>