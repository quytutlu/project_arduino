<?php 
	include_once "BLL.php";
	include_once "Object/TrangThai.php";
	$XuLyNV=new XuLyNghiepVu();
	function Display($key,$value){
		$KetQua=json_encode(array($key=>$value));
		echo $KetQua;
	}
	$cmd;
	if(isset($_GET["cmd"])){
		$cmd=$_GET["cmd"];
		$cmd=strtolower($cmd);
		switch ($cmd) {
		case "batthietbi":
			if(isset($_GET["idthietbi"])){
				Display("success",$XuLyNV->BatThietBi($_GET["idthietbi"]));
			}
			break;
		case "tatthietbi":
			if(isset($_GET["idthietbi"])){
				Display("success",$XuLyNV->TatThietBi($_GET["idthietbi"]));
			}
			break;
		case "laytrangthaianalog":
			Display("list",$XuLyNV->LayTrangThaiAnalog());
			break;
		case "laytrangthaiarduino":
			if(isset($_GET["a1"])&&isset($_GET["a2"])&&isset($_GET["a3"])){
				Display("list",$XuLyNV->LayTrangThaiArduino($_GET["a1"],$_GET["a2"],$_GET["a3"]));
			}
			break;
		case "laytrangthai":
			Display("list",$XuLyNV->LayTrangThai());
			break;
		case "dangnhap":
			$TenDangNhap;
			$MatKhau;
			if(isset($_GET["tendangnhap"])&&isset($_GET["matkhau"])){
				Display("success",$XuLyNV->DangNhap($_GET["tendangnhap"],$_GET["matkhau"]));
			}
			break;
		}
	}else{
		echo "khong nhan duoc lenh";
	}
	
 ?>