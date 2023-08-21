 <html>
<head>
<body>
<tr><td><h2 align="center">Aplikasi pengelola Klinik Teguh</h2></td></tr>
        <table border="1" width="30%" cellpadding="5" align="center">
    <form>
            <tr bgcolor="#1E90FF">
            <td><h2 align="center">Menu</h2></td>
            <tr><td><a href="data_peserta.php">Data Peserta<tr></td>
            <tr><td><a href="data_bidan.php">Data Bidan<tr></td>
            <tr><td><a href="data_poli.php">Data Poli<tr></td>
            <tr><td><a href="datarekammedis.php">Data Rekam Medis<tr></td>
    </form>
        </table>
<table border="1" width="30%" cellpadding="5" align="center">
    <form>
        <tr><td align="center">
        <input type="button" value="Laporan" onclick="location=''"></td></tr>
        <tr><td align="center">
        <input type="button" value="Lap Bidan" onclick="location='data_dokter.php'"></td></tr>
        <tr><td align="center">
        <input type="button" value="Lap Peserta" onclick="location='data_pasien.php'"></td></tr>
        <tr><td align="center">
        <input type="button" value="Lap rekammedis" onclick="location='list_berobat.php'"></td></tr>
    </form>
</table>
</head>
</body>
</html>