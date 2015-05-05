<?php
	include_once "DAL.php";
	include_once "Object/TrangThai.php";
	include_once "Object/TrangThaiArduino.php";
	require 'PHPMailer/PHPMailerAutoload.php';
	class XuLyNghiepVu
	{
		private $ThaoTacCSDL;
		public function XuLyNghiepVu(){
			$this->ThaoTacCSDL=new TruyXuatDuLieu();
		}
		public function BatThietBi($id_ThietBi){
			return $this->ThaoTacCSDL->BatThietBi($id_ThietBi);
		}
		public function TatThietBi($id_ThietBi){
			return $this->ThaoTacCSDL->TatThietBi($id_ThietBi);
		}
		public function LayTrangThai(){
			$kq=$this->ThaoTacCSDL->LayTrangThai();
			$ListTrangThai;
			while($row=mysql_fetch_array($kq))
			{
				$temp=new TrangThaiThietBi();
				$temp->id=$row[0];
				$temp->TenThietBi=$row[1];
				$temp->TrangThai=$row[2];
				$temp->ReadOnly=$row[4];
				$ListTrangThai[]=$temp;
			}
			return $ListTrangThai;
		}
		public function LayTrangThaiArduino($a1,$a2,$a3){
			$kq=$this->ThaoTacCSDL->LayTrangThaiArduino($a1,$a2,$a3);
			$ListTrangThai;
			while($row=mysql_fetch_array($kq))
			{
				$temp=new TrangThaiArduino();
				$temp->TenThietBi=$row[1];
				$temp->TrangThai=$row[3].$row[2];
				$ListTrangThai[]=$temp;
			}
			return $ListTrangThai;
		}
		public function DangNhap($TenDangNhap,$MatKhau){
			$kq=$this->ThaoTacCSDL->DangNhap($TenDangNhap,$MatKhau);
			return mysql_num_rows($kq)==1;
		}
	}
?>