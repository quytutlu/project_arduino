//check session
if(sessionStorage.getItem("success")!="true")
{
	window.location.href = "login.php";
}

//load dư liệu từ database
var user=sessionStorage.getItem("tendangnhap");
document.getElementById("ThongBao").innerHTML="Xin chào "+user;
var temp="index.php?cmd=laytrangthai";
$.ajax({type: 'GET',url: temp,
	success:function(data){
		PageLayout(data,"init",document.getElementById("bangdieukhien"));
	}
});
//tự động cập nhật sau 1s
setInterval(function () { autoloadpage(); }, 1000);
function autoloadpage() {
    $.ajax({type: 'GET',url: temp,
    	success:function(data){
			PageLayout(data,"update",document.getElementById("bangdieukhien"));
		}
	});
}

var temp2="index.php?cmd=laytrangthaianalog";
$.ajax({type: 'GET',url: temp2,
	success:function(data){
		PageLayout2(data,"init",document.getElementById("bangdieukhien2"));
	}
});
//tự động cập nhật sau 1s
setInterval(function () { autoloadpage2(); }, 1000);
function autoloadpage2() {
    $.ajax({type: 'GET',url: temp2,
    	success:function(data){
			PageLayout2(data,"update",document.getElementById("bangdieukhien2"));
		}
	});
}
function PageLayout(data,type,table){
	obj = JSON.parse(data);
	for (var i = 0; i < obj.list.length;i++) {
		if(type=="init"){
			var row=table.insertRow(i+1);
			var cell1=row.insertCell(0);
			var cell2=row.insertCell(1);
			var cell3=row.insertCell(2);
		}else{
			var x = table.rows[i+1].cells;
			cell1=x[0];
			cell2=x[1];
			cell3=x[2];
		}
		ThietBi=obj.list[i].TenThietBi;
		ReadOnly=obj.list[i].ReadOnly;
		id_ThietBi=obj.list[i].id;
		TrangThai=obj.list[i].TrangThai==1?"Bật":"Tắt";
		cell1.innerHTML=ThietBi;
		cell2.innerHTML=TrangThai;
		TrangThai=TrangThai=="Bật"?"Tắt":"Bật";
		clbtn=TrangThai=="Bật"?"btn btn-primary":TrangThai=="x"?"btn btn-warning":"btn btn-danger";
		cell3.innerHTML="<input class=\""+clbtn+"\" type=\"button\" id=\""+id_ThietBi+"\" onclick=\"UpdateStt(this.id,"+(i+1)+")\" value=\""+TrangThai+"\"/></div>";
	}
}
function PageLayout2(data,type,table){
	obj = JSON.parse(data);
	for (var i = 0; i < obj.list.length;i++) {
		if(type=="init"){
			var row=table.insertRow(i+1);
			var cell1=row.insertCell(0);
			var cell2=row.insertCell(1);
		}else{
			var x = table.rows[i+1].cells;
			cell1=x[0];
			cell2=x[1];
		}
		ThietBi=obj.list[i].TenThietBi;
		TrangThai=obj.list[i].TrangThai;
		cell1.innerHTML=ThietBi;
		cell2.innerHTML=TrangThai;
	}
}
function UpdateStt (id_ThietBi,index) {
	var TrangThai=document.getElementById("bangdieukhien").rows[index].cells[1].innerHTML;
	if(TrangThai=="Tắt"){
		var temp="index.php?cmd=batthietbi&idthietbi="+id_ThietBi;
		$.ajax({type: 'GET',url: temp,success:function(data){
			obj=JSON.parse(data);
			if(obj.success==true){
				document.getElementById(id_ThietBi).value="Tắt";
				document.getElementById("bangdieukhien").rows[index].cells[1].innerHTML="Bật";
				document.getElementById(id_ThietBi).setAttribute("class", "btn btn-danger");
			}
		}});
	}else if(TrangThai=="Bật"){
		var temp="index.php?cmd=tatthietbi&idthietbi="+id_ThietBi;
		$.ajax({type: 'GET',url: temp,success:function(data){
			obj=JSON.parse(data);
			if(obj.success==true){
				document.getElementById(id_ThietBi).value="Bật";
				document.getElementById("bangdieukhien").rows[index].cells[1].innerHTML="Tắt";
				document.getElementById(id_ThietBi).setAttribute("class", "btn btn-primary");
			}
		}});
	}
	else{
		alert("Hành động không được chấp nhận");
	}
}
function DangXuat(){
	sessionStorage.setItem("success", "false");
	window.location.href = "login.php";
}