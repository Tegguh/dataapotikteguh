<?php
include "koneksi.php";
$notrans = $_GET["x"];
$sql = "DELETE FROM trekammedis WHERE no_transaksi='$notrans'";
$conn->query($sql);
header("location:datarekammedis.php");
?>