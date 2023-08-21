<?php
	include "koneksi.php";
	
	$notrans 	= $_POST["notrans"];
	$nmpeserta   = $_POST["nmpeserta"];
	$tg 		 = $_POST["tgl"];
	$bl		 = $_POST["bln"];
	$th		 = $_POST["thn"];
	$tgl		= $th.'-'.$bl.'-'.$tg;
	$nmbidan   = $_POST["nmbidan"];
	$kel		= $_POST["keluhan"];
	$biaya	  = $_POST["biayaadm"];
	
	$query = "UPDATE trekammedis 
				SET 
				kode_peserta='$nmpeserta',
				tgl_berobat='$tgl',
				kode_bidan='$nmbidan',
				keluhan='$kel',
				biaya_admin='$biaya'
				WHERE no_transaksi='$notrans'";
				
	$conn->query($query);
	
	header("location:datarekammedis.php")
?>