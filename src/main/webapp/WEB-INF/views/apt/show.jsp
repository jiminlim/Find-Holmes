<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ include file="../sidebar.jsp"%>
<!DOCTYPE html>

<html lang="ko">
	<head>
		<title>SSAFY아파트정보</title>
		<meta charset="utf-8">
		<script>
var type = [];
var jungbo = "";

$(document).ready(function(){
	init();
	 $("#ch1").change(function(){
			init();
		});
	 $("#ch2").change(function(){
			init();
		});	 
	 $("#ch3").change(function(){
			init();
		});	 
	 $("#ch4").change(function(){
			init();
		});	 	
});
function find(){
	var dong = $("#dong").val();
	var apt = $("#aptname").val();
	$.ajaxSettings.traditional = true;
	$.get("${root}/apt.do"
		,{act:"show", dong:dong, aptname:apt, types: type }
		,function(data,status){
			$("#searchResult").empty();
			$("tbody").empty();
			$.each(data, function(index, vo) {
				typefind(vo.gettype);
				let str = "<tr>"
				+ "<td>" + vo.dong + "</td>"
				+ "<td>"+ vo.AptName + "</td>"
				+ "<td>" + vo.dealAmount + "</td>"
				+ "<td>" + jungbo
				+ "</td></tr>";
				$("tbody").append(str);
				$("#searchResult").append(vo.dong+" "+vo.AptName+" "+vo.jibun+"<br>");
			});
		}
		,"json"
	);
}
function typefind(data){
	if(data==1){
		jungbo = "아파트 매매";
	}
	if(data==2){
		jungbo = "아파트 전월세";
	}
	if(data==3){
		jungbo = "주택 매매";
	}
	if(data==4){
		jungbo = "주택 전월세";
	}
}
function init(){
	type=[];
	$("input[name='type']:checked").each(function(i) {
		type.push($(this).val());
	 });
	find();
	jungbo = "";
}
		
		</script>
	</head>
	<body>	
	 <div class="main-imgbox">
        <div class="main-text">
            <h1>Happy House</h1>
            <h2 class="page-text">HouseDeal Page</h2>
        </div>
    </div>
	<div class="container" align="center">
	  <div class="col-lg-8" align="center">
	  <input type="hidden" name = "dong" id ="dong" value="${param.dong }"/>
	  <input type="hidden" name = "aptname" id ="aptname" value="${param.aptname }"/>
	  <h2> ${param.dong } ${param.aptname } 거래 정보</h2>
	<!-- 아파트매매 아파트전월세 주택매매 주택전월세 체크박스 -->
		  <div class="form-group form-check">
		    <div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="checkbox" id="ch1" name="type" class="form-check-input" value="1" checked>아파트매매
			  </label>
			</div>
			<div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="checkbox" id="ch2" name="type" class="form-check-input" value="2" checked>아파트전월세
			  </label>
			</div>
			<div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="checkbox" id="ch3" name="type" class="form-check-input" value="3" checked>주택매매
			  </label>
			</div>
			<div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="checkbox" id="ch4" name="type" class="form-check-input" value="4" checked>주택전월세
			  </label>
			</div>
		  </div>
	  <table class="table table-active">
	    <thead>
	      <tr class="table-info">
		 		 <td>동</td>
		 		 <td>아파트이름</td>
		 		 <td>거래금액</td>
		 		 <td>거래정보</td>
	      </tr>
	    </thead>
	    <tbody>
	 		</tbody>
	  </table>
	  <button type="button" class="btn btn-primary" onclick="location.href='/happyhouse/apt/moveAptList';">목록으로</button>
	  </div>
	</div>
	</body>
</html>
