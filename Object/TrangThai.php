<?php
class TrangThaiThietBi
{
	public $id;
	public $TenThietBi;
	public $TrangThai;
	public $ReadOnly;
	public function TrangThaiThietBi()
	{
		
	}
	public function ToJson()
	{
		return json_encode(array('TenThietBi'=>$this->TenThietBi,'TrangThai'=>$this->TrangThai));
	}
}
?>	