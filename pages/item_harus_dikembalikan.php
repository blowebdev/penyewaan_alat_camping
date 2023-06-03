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
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Home</a></li>
                    <li class="breadcrumb-item active">Barang Dikembalikan</li>
                </ol>
            </div>
        </div>
    </div>
</div>


<div class="card">
    <div class="card-body">
        <div class="text-center">
            <div class="row">
                <div class="col-md-6 col-xl-3">
                    <div class="py-1">
                        <i class="fe-tag font-24"></i>
                        <h3>-</h3>
                        <p class="text-uppercase mb-1 font-13 fw-medium">Barang Disewa</p>
                    </div>
                </div>
                <div class="col-md-6 col-xl-3">
                    <div class="py-1">
                        <i class="fe-archive font-24"></i>
                        <h3 class="text-warning">-</h3>
                        <p class="text-uppercase mb-1 font-13 fw-medium">Proses</p>
                    </div>
                </div>
                <div class="col-md-6 col-xl-3">
                    <div class="py-1">
                        <i class="fe-shield font-24"></i>
                        <h3 class="text-success">-</h3>
                        <p class="text-uppercase mb-1 font-13 fw-medium">Perlu kembali</p>
                    </div>
                </div>
                <div class="col-md-6 col-xl-3">
                    <div class="py-1">
                        <i class="fe-dollar-sign font-24"></i>
                        <h3 class="text-danger">-</h3>
                        <p class="text-uppercase mb-1 font-13 fw-medium">Total Transaksi</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-12">
        <div class="card-box">
            <div class="row">
                <div class="col-12">
                    <div class="table-responsive">
                        <table id="basic-datatable" class="table table-stripped">
                            <thead class="table-light" style="background-color: #dfe6e9">
                                <tr>
                                    <th width="10%">#</th>
                                    <th width="10%">Tanggal</th>
                                    <th width="10%">Kode Transaksi</th>
                                    <th width="10%">Barang</th>
                                    <th width="10%">Tanggal Sewa</th>
                                    <th width="10%">Tanggal Selesai</th>
                                    <th width="10%">Durasi</th>
                                    <th width="10%">+- Hari</th>
                                    <th width="10%">Status</th>
                                    <th width="10%">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
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
                                    SELECT a.*, b.*,  DATEDIFF(a.tgl_selesai, a.tgl_pinjam) AS total_hari,
                                    IF(NOW() > a.tgl_selesai, 'Perlu dikembalikan', 'Proses') AS status,
                                    DATEDIFF(a.tgl_selesai,NOW()) AS sisa_hari
                                    FROM `master_detail_transaksi` as a 
                                    LEFT JOIN master_produk as b ON a.id_produk = b.id
                                    ".$q."
                                    ");
                                $no=1;
                                while ($data = mysqli_fetch_array($trxsql)) {
                                    ?>
                                    <tr>
                                        <td width="1%"><?php echo $no++; ?></td>
                                        <td><?php echo $data['create_at']; ?></td>
                                        <td>#<?php echo $data['kode_transaksi']; ?></td>
                                        <td><?php echo $data['nama']; ?></td>
                                        <td><?php echo hari_tanggal($data['tgl_pinjam']); ?></td>
                                        <td><?php echo hari_tanggal($data['tgl_selesai']); ?></td>
                                        <td><?php echo $data['total_hari']; ?> Hari</td>
                                        <td><?php echo $data['sisa_hari']; ?> Hari</td>
                                        <td><?php echo ($data['sisa_hari']>=1) ? '<span class="badge badge-warning p-1">Proses</span>' : '<span class="badge badge-danger p-1">Perlu Dikembali</span>'; ?></td>

                                        <td nowrap="">
                                            <?php if(in_array($_SESSION['level'], array('1'))) : ?>
                                                <?php if($data['sisa_hari']<=0): ?>
                                                    <div class="btn-group dropdown">
                                                        <a href="javascript: void(0);" class="dropdown-toggle arrow-none btn btn-light btn-sm" data-toggle="dropdown" aria-expanded="false"><i class="mdi mdi-dots-horizontal"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <form action="" method="POST">
                                                                <input type="hidden" name="id" value="<?php echo $data['id']; ?>">
                                                                <input type="hidden" name="status" value="SUDAH">
                                                                <button class="dropdown-item" type="submit" name="update_lunas"><i class="mdi mdi-check-all mr-2 text-muted font-18 vertical-middle"></i> Sudah Kembali</button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                <?php endif; ?>
                                            <?php endif; ?>
                                        </td>
                                    </tr>

                                <?php } ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>