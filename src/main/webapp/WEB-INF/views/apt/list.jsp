<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../sidebar.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인 페이지</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
var arr = [];
$(document).ready(function(){

	arr = [1,2,3,4];
 $.get("/happyhouse/apt/alllistPaging"
	 ,{pg: '1' , key : 'all', word:'all', checkArr : arr}
     ,function(data){
     	$("#showlist").empty();
     	var count =0;
     	let str ="";
     	$.each(data, function(i, v){
     		typeChange(v.type);
     		str +="<tr onclick='javascript:moveAptInfo("+v.no+")'><td >"+v.no+"</td><td>"
     		+v.dong+"</td><td>"
     		+v.aptName+"</td><td>"
     		+v.dealAmount+"</td><td>"
     		+jungbo+"</td><td>"
     		+v.click+"</td></tr>";
    		if(count ==0){
     			var nav = "<li >"+v.navigation.navigator+"</li>";
     			$("#navitr").append(nav);
     			count=1;
     		}
     	});
	   	$("#showlist").append(str);
     },"json"
 );
     	$('#pg').val(1);
     	$('#h_key').val('all');
    	$('#h_word').val('all');
    	arr = [1,2,3,4];
 
});
function pageMove(pg) { 
	var key = document.getElementById("h_key").value;
	var word = document.getElementById("h_word").value;
	console.log(pg+" "+key+" "+word+" "+arr);
	
	$.get("/happyhouse/apt/alllistPaging"
			 ,{pg: pg , key : key, word: word, checkArr : arr}
		     ,function(data){
		     	$("#showlist").empty();
		     	$("#navitr").empty();
		     	var count =0;
		     	$.each(data, function(i, v){
		     		typeChange(v.type);
		     		let str ="<tr onclick='javascript:moveAptInfo("+v.no+")'><td >"+v.no+"</td><td>"
		     		+v.dong+"</td><td>"
		     		+v.aptName+"</td><td>"
		     		+v.dealAmount+"</td><td>"
		     		+jungbo+"</td><td>"
		     		+v.click+"</td></tr>";
			   		$("#showlist").append(str);
		     		if(count ==0){
		     			var nav = "<li >"+v.navigation.navigator+"</li>";
		     			$("#navitr").append(nav);
		     			count=1;
		     		}
		     	});
		     },"json"
		 );
	
     	$('#pg').val(pg);
     	$('#h_key').val(key);
    	$('#h_word').val(word);
}

function moveAptInfo(no){
	console.log(no);
	location.href='/happyhouse/apt/moveAptInfo/'+no;
}
var jungbo="";
function typeChange(data){
	if(data==1){
		jungbo = "아파트 매매";
	}
	if(data==2){
		jungbo = "아파트 전/월세";
	}
	if(data==3){
		jungbo = "주택 매매";
	}
	if(data==4){
		jungbo = "주택 전/월세";
	}
}
function searchApt() {
	if(document.getElementById("word").value == "") {
		alert("값을 입력해주세요!");
	}else{
		var checkArr = [];     // 배열 초기화
	    $("input[name='type']:checked").each(function(i) {
	        checkArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
	    });
		if(checkArr.length==0)
			alert("찾으시는 매매 정보를 체크해주세요!");
		else{
			var key = document.getElementById("key").value;
			var word = document.getElementById("word").value;
			
		    $.get("/happyhouse/apt/alllistPaging"
		        ,{
		        	pg: '1' ,
		        	key : key,
		        	word : word,
		        	checkArr: checkArr
		        },
		        function(data){
		        	$("#showlist").empty();
		        	$("#navitr").empty();
			     	var count =0;
			     	$.each(data, function(i, v){
			     		typeChange(v.type);
			     		let str ="<tr onclick='javascript:moveAptInfo("+v.no+")'><td >"+v.no+"</td><td>"
			     		+v.dong+"</td><td>"
			     		+v.aptName+"</td><td>"
			     		+v.dealAmount+"</td><td>"
			     		+jungbo+"</td><td>"
			     		+v.click+"</td></tr>";
				   		$("#showlist").append(str);
			     		if(count ==0){
			     			var nav = "<li >"+v.navigation.navigator+"</li>";
			     			$("#navitr").append(nav);
			     			count=1;
			     		}
			     	});
			     },"json"
			 );
		    $('#pg').val(1);
	     	$('#h_key').val(key);
	    	$('#h_word').val(word);
	    	arr = checkArr;
		}
	}
}

</script>
<style>
body {
  margin: 0;
  background-color: rgb(230, 230, 230);
  font-family: 'Noto Sans KR', sans-serif;
}

table{
    width: 80%;
    margin: 2% auto;
    border-collapse: collapse;
    text-align: center;
}

tr{
    line-height: 40px;
    border-bottom: 1px solid black;
    cursor: pointer;
}

thead{
    border-bottom: 2px groove black;
    border-top: 1px solid black;
    background-color: rgba(18, 155, 18, 0.945);
    color: white;
}
.checkboxs{
	margin: 20px auto 0 0;
	text-align: center;
}

.checkboxs > div{
	margin: 10px auto;
	display: inline;
}
#key{
	height: 25px;
	border-radius: 2px;
	font-size: 13px;
	text-align-last: center;
	padding: 1px 2px;
	vertical-align: center;
}

#word{
	height: 21px;
	border-radius: 2px;
	border: 1px solid black;
	font-size: 13px;
	text-align-last: center;
	vertical-align: center;
	margin-bottom : 2px;
}

#search-btn{
	background: rgb(87, 191, 143);
	color:white;
	margin-top: 11px;
	height: 27px;
	width: 45px;
	vertical-align: center;
	border-radius: 5px;
	border-width: 0;
}

.input-table{
	margin: 0 auto;
}

#navitr {
	text-align:center;
}
#navitr li {
	display:inline;
	vertical-align:middle;
}
#navitr li a {
	display:-moz-inline-stack;	/*FF2*/
	display:inline-block;
	vertical-align:top;
	padding:4px;
	margin-right:3px;
	width:40px !important;
	color: rgb(0,0,0);
	font:bold 12px tahoma;
	border:1px solid rgb(0,0,0);
	text-align:center;
	text-decoration:none;
	width /**/:26px;	/*IE 5.5*/
	background: white;

}
#navitr li a.now {
	color:#fff;
	background-color:#f40;
	border:1px solid #f40;
}
#navitr li a:hover, ul li a:focus {
	color:#fff;
	border:1px solid #f40;
	background-color:#f40;
}
</style>
<body>
    <div class="main-imgbox">
        <div class="main-text">
            <h1>Happy House</h1>
            <h2 class="page-text">HouseDeal Page</h2>
        </div>
    </div>
    
    <!-- 아파트매매 아파트전월세 주택매매 주택전월세 체크박스 -->
	<form id="searchform" >
	<input type="hidden" name="pg" id="pg" value="">
	<input type="hidden" name="h_key" id="h_key" value="">
	<input type="hidden" name="h_word" id="h_word" value="">
	<input type="hidden" name="h_typed" id="h_typed" value="">
  <div class="checkboxs">
  
    <div class="custom-control custom-checkbox">
	    <input type="checkbox" name="type" id="jb-checkbox"  class="custom-control-input" value="1" checked>
	  	<label class="custom-control-label" for="jb-checkbox">아파트매매</label>
	</div>
	 <div class="custom-control custom-checkbox">
	    <input type="checkbox" name="type" id="jb-checkbox2" class="custom-control-input" value="2" checked>
	  <label class="custom-control-label" for="jb-checkbox2">아파트전월세</label>
	</div>
	 <div class="custom-control custom-checkbox">
	    <input type="checkbox" name="type" id="jb-checkbox3" class="custom-control-input" value="3" checked>
	  <label class="custom-control-label" for="jb-checkbox3">주택매매</label>
	</div>
	 <div class="custom-control custom-checkbox">
	    <input type="checkbox" name="type" id="jb-checkbox4" class="custom-control-input" value="4" checked>
	  <label class="custom-control-label" for="jb-checkbox4">주택전월세</label>
	</div>
  </div>
		
	<!-- 검색 -->
	  <table>
	  	<tr>
	  		<td align="right">
	  		 <div>
		  	  <select name="key" id="key">
			    <option value="all" selected="selected">--All--</option>
			    <option value="dong">동</option>
			    <option value="Aptname">아파트 이름</option>
			  </select>
			 
			  <input type="text"  placeholder="검색어 입력." name="word" id="word" value="">
			  <input type="button" onclick="javascript:searchApt();" value="검색"/>
				</div>
			</td>
	  	</tr>
	  </table>
	  </form>
    
    
    <table>
            <col width="10%">
            <col width="15%">
            <col width="25%">
            <col width="15%">
            <col width="10%">
            <col width="5%">
        <thead>
            <tr>
                <th>No</th>
                <th>Dong Name</th>
                <th>Apartment Name</th>
                <th>Deal-Amount</th>
                <th>Deal-Infomation</th>
                <th>Views</th>
            </tr>
        </thead>
        <tbody id="showlist">
        </tbody>
    </table>

    <ul id = "navitr">
    </ul>

</body>
</html>