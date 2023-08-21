<?php
include "koneksi.php";
$sql1 = "SELECT*FROM tpeserta";
$result1 = $conn->query($sql1);
$sql2 = "SELECT*FROM tbidan";
$result2 = $conn->query($sql2);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Tambah Data Rekam Medis</title>
</head>

<body>
<form method="post" action="save.php">
 <table width="80%" border="0" cellpadding="5">
 <tr>
 <th width="31%" scope="row"><div align="left">Nomor Transaksi</div></th>
 <td width="69%"><label for="no_transaksi"></label>
 <input type="text" name="no_transaksi" id="no_transaksi" required="required" /></td>
 </tr>
 <tr>
    
 <th scope="row">
 <div align="left">
 <label for="nama_peserta">Nama Peserta</label>
 </div>
 </th>
 <td>
 <select name="nama_peserta">
 <?php
while($row1=$result1->fetch_assoc())
{
echo "<option
value=".$row1["kode_peserta"].">".$row1["nama_peserta"]."</option>";
}
 ?>
 </select>
 </td>
 </tr>
 <tr>
 <th scope="row">
 <div align="left">
 <label for="tanggal_berobat">Tanggal Berobat</label>
 </div>
 </th>
 <td>
 <select name="tanggal_berobat">
 <?php for ($t=1;$t<=31;$t++)
{
echo "<option value=$t>$t</option>";
}
?>
 </select>
 <label for="bln">Bulan</label>
 <select name="bln" id="bln">
 <?php
$nmbulan = array ("--Pilih Bulan--
","Januari","Februari","Maret","April","Mei","Juni","Juli","Agustus","September","Oktober","Novem
ber","Desember");
for($b=0;$b<=12;$b++)
{
echo"<option value=$b>$nmbulan[$b]</option>";
}
?>
 </select>
<label for="thn">Tahun</label>
 <input type="number" maxlength="4" min="2000" max="2023" id="thn" size="10" name="thn"
required/>
 </td>
 </tr>
 <tr>
 <th scope="row">
 <div align="left">
 <label for="nama_bidan">Nama Bidan</label>
 </div>
 </th>
 <td>
 <select name="nama_bidan">
 <?php
while($row2=$result2->fetch_assoc())
{
echo "<option
value=".$row2["kode_bidan"].">".$row2["nama_bidan"]."</option>";
}
 ?>
 </select>
 </td>
 </tr>
 <tr>
 <th scope="row"><div align="left">Keluhan</div></th>
 <td>
 <label for="keluhan"></label>
 <input type="text" name="keluhan" id="keluhan" required /></td>
 </tr>
 <tr>
 <th scope="row"><div align="left">Biaya Administrasi</div></th>
 <td><label for="biaya_admin"></label>
 <input type="number" name="biaya_admin" id="biaya_admin" required /></td>
 </tr>
 <tr>
 <td>&nbsp;</td>
 <td><input type="submit" value="Simpan" /><input type="reset" value="Clear" />
 </td>
 </tr>
 </table>
</form>
</body>
</html>
