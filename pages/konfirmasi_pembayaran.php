 <?php 
 if (!in_array($_SESSION['level'], array('2'))) {
    echo  "<br>Maaf halaman tidak bisa di akses";
    exit;
}

if (isset($_REQUEST['simpan'])) {
    $kode_transaksi = $_REQUEST['kode_transaksi'];
    $harga = $_REQUEST['harga'];
    $bank = $_REQUEST['bank'];

    $temp_name       = $_FILES['gambar']['tmp_name'];
    $name_file       = $_FILES['gambar']['name'];
    $type_file       = $_FILES['gambar']['type'];
    $size            = $_FILES['gambar']['size'];
    $nama_gambar        = $_REQUEST['nama_gambar'];
    // var_dump($nama_gambar);

    if (empty($temp_name)) {
        $set_gambar = ",struk='".$nama_gambar."'";
    }else{  
        $file_ext=strtolower(end(explode('.',$_FILES['gambar']['name'])));
        $expensions= array("jpeg","jpg","png");

        if (in_array($file_ext,$expensions)=== false) {
            echo "salah";
        }elseif($size >= 3097152){
            echo "upload maksimal 3 mb";
        }else{
            $Move = move_uploaded_file($temp_name, 'struk/'.$date."-".$name_file.'');
            if ($Move) {
                unlink('"struk/'.$file.'"');
                $nm_foto  = $date."-".$name_file;
            }
        }

        $set_gambar = ",struk='".$nm_foto."'";
    }
    $sql = "UPDATE master_transaksi SET bank='".$bank."' ".$set_gambar." WHERE kode_transaksi='".$_REQUEST['kode_transaksi']."'";
    $exc = mysqli_query($conn,$sql);
    if ($exc) {
        echo '
        <div class="alert alert-success alert-dismissible" role="alert">
        <div class="alert-message">
        <strong>Perhatian !! Data berhasil disimpan</strong>
        </div>
        </div>

        <meta http-equiv="refresh" content="1" url="'.$base_url.'transaksi">

        ';
    }else{
        echo '
        <div class="alert alert-danger alert-dismissible" role="alert">
        <div class="alert-message">
        <strong>Perhatian !! Data gagal disimpan</strong>
        </div>
        </div>


        ';
    }
}


$detail = mysqli_fetch_array(mysqli_query($conn,"SELECT * FROM master_transaksi WHERE kode_transaksi='".$_REQUEST['id']."'"));
?>
<div class="row">
    <div class="col-12">
        <div class="page-title-box">
            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Home</a></li>
                    <li class="breadcrumb-item active">Konfirmasi Pembayaran</li>
                </ol>
            </div>
        </div>
    </div>
</div>


<div class="row">
    <div class="col-12">
        <div class="card-box">
            <div class="row">
                <div class="col-12">
                    <form class="form-horizontal" enctype="multipart/form-data" role="form" action="" method="POST">
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label" for="simpleinput">Konfirmasi Pembayaran</label>
                            <div class="col-sm-10">
                                <input type="text" name="kode_transaksi" value="<?php echo $detail['kode_transaksi']; ?>" class="form-control" readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label" for="example-email">Harga</label>
                            <div class="col-sm-10">
                                <input type="number" name="harga" value="<?php echo $detail['grand_total']; ?>" class="form-control" placeholder="Harga" required="" readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label" for="example-email">Rekening</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="bank" readonly>
                                    <option value="">Pilih rekening</option>
                                    <option value="BNI">BNI / 8839948575</option>
                                    <option value="BRI">BRI / 9294847575</option>
                                    <option value="BCA">BCA / 0199288384</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label" for="example-email">Upload Struk</label>
                            <div class="col-sm-10">
                                <?php if (!empty($detail['struk'])) :?>
                                    <img src="<?php echo $base_url.'/struk/'.$detail['struk']; ?>"  style="width: 300px; height: 300px"/>
                                    <input type="file" class="form-control" name="gambar">
                                    <input type="hidden" class="form-control" name="nama_gambar" value="<?php echo $detail['gambar']; ?>">
                                    <?php else : ?>
                                        <input type="file" class="form-control" name="gambar" required="">
                                    <?php endif; ?>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label" for="example-email">Aksi</label>
                                <div class="col-sm-10">
                                    <?php if(in_array($_SESSION['level'], array('1','2'))) : ?>
                                        <button class="btn btn-danger" type="submit" name="simpan">Simpan</button>
                                    <?php endif; ?>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>