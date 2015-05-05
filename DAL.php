<?php
	class TruyXuatDuLieu
	{
		private $conn;
		public function TruyXuatDuLieu(){
			$connect=mysql_connect("localhost","root","60648994t");
			mysql_query("SET character_set_results=utf8", $connect);
			mb_language('uni');
			mb_internal_encoding('UTF-8');
			mysql_select_db("Arduino",$connect);
			mysql_query("set names 'utf8'",$connect);
		}
		public function CloseDB(){
			mysql_close();
		}
		public function BatThietBi($id_ThietBi){
			$sql="Call BatThietBi(".$id_ThietBi.")";
			return mysql_query($sql);
		}
		public function TatThietBi($id_ThietBi){
			$sql="Call TatThietBi(".$id_ThietBi.")";
			return mysql_query($sql);
		}
		public function RaNgoai(){
			$sql="Call RaNgoai()";
			return mysql_query($sql);
		}
		public function LayTrangThai(){
			$sql="Call LayTrangThai()";
			return mysql_query($sql);
		}
		public function LayTrangThaiArduino($a1,$a2,$a3){
			$sql="Call LayTrangThaiArduino(\"".$a1."\",\"".$a2."\",\"".$a3."\")";
			return mysql_query($sql);
		}
		public function DangNhap($TenDangNhap,$MatKhau){
			$sql="Call DangNhap(\"".$TenDangNhap."\",\"".$MatKhau."\")";
			return mysql_query($sql);
		}
	}
?>