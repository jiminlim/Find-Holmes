<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./sidebar.jsp"%>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>카테고리별 장소 검색하기</title>
    <style>
.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap {position:relative;width:100%;height:500px;}
#category {position:absolute;top:10px;right:100px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
#category li.on {background: #eee;}
#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
#category li:last-child{margin-right:0;border-right:0;}
#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
#category li .category_bg {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
#category li .bank {background-position: -10px 0;}
#category li .mart {background-position: -10px -36px;}
#category li .pharmacy {background-position: -10px -72px;}
#category li .oil {background-position: -10px -108px;}
#category li .cafe {background-position: -10px -144px;}
#category li .store {background-position: -10px -180px;}
#category li.on .category_bg {background-position-x:-46px;}
.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.placeinfo .tel {color:#0f7833;}
.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
#map{
	width:95%;
	height:100%;
	position:relative;
	overflow:hidden;
	margin: 2% auto;
	
}
select{
   width: 150px ;
   height: 30px;
   border: 1px solid black;
   border-radius: 3px;
   font-size: 15px;
   text-align-last: center;
}

</style>
</head>
<script type="text/javascript">
$(document).ready(function(){
	   $.get("/happyhouse/map/sido"
	      ,function(data, status){
	         $.each(data, function(index, vo) {
	            $("#sido").append("<option value='"+vo.sido_code+"'>"+vo.sido_name+"</option>");
	         });//each
	      }//function
	      , "json"
	   );//get
	   $("#slider-area").hide();
	});//ready


	$(document).ready(function(){
	   $("#sido").change(function() {
	      $.get("/happyhouse/map/gugun"
	            ,{sido:$("#sido").val()}
	            ,function(data, status){
	               $("#gugun").empty();
	               $("#gugun").append('<option value="0">선택</option>');
	               $.each(data, function(index, vo) {
	                  $("#gugun").append("<option value='"+vo.gugun_code+"'>"+vo.gugun_name+"</option>");
	               });//each
	            }//function
	            , "json"
	      );//get
	      
	   });//change
	   $("#gugun").change(function() {
	      $.get("/happyhouse/map/dong"
	            ,{gugun:$("#gugun").val()}
	            ,function(data, status){
	               $("#dong").empty();
	               $("#dong").append('<option value="0">선택</option>');
	               $.each(data, function(index, vo) {
	                  $("#dong").append("<option value='"+vo.dong+"'>"+vo.dong+"</option>");
	               });//each
	            }//function
	            , "json"
	      );//get
	   });//change
var bizname ="";	  
	   $("#dong").change(function() {
	      $.get("/happyhouse/envi/bizcount"
	            ,{dong:$("#dong").val()}
	            ,function(data, status){
	               $("#category").empty();
	               $.each(data, function(index, vo) {
	                  let str = "<li id='CS2' data-order='5' onClick='javascript:categorylist("+vo.bizcode+");'> <span class='category_bg store'></span>"+vo.bizName+"</li> ";
	                  $("#category").append(str);
	               });//each
	               
	            }//function
	            , "json"
	      );//get
	   });//change
	});//ready
	
</script>
<body>
<div class="main-imgbox">
        <div class="main-text">
            <h1>Happy House</h1>
            <h2 class="page-text">Environment Page</h2>
        </div>
</div>

<!-- 지도를 표시할 div 입니다 -->
<div class="form-group form-check"  align="center">
시도 : <select id="sido">
   <option value="0">선택</option>
</select>
구군 : <select id="gugun">
   <option value="0">선택</option>
</select>
읍면동 : <select id="dong">
   <option value="0">선택</option>
</select>
</div>

<div class="map_wrap">
    <div id="map"></div>
    <ul id="category">
    </ul>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=73704d579b0ce83553c77baa0d946b4e&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(37.498004414546934, 127.02770621963765), // 지도의 중심좌표 
    level: 3 // 지도의 확대 레벨 
}; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var clickArr=[];
function categorylist(data){
	setMarkers(null);
	cateClick(data);
	execute();
}
function cateClick(data){
	setMarkers(null);
	 $.get("/happyhouse/envi/getAddress"
	            ,{dong:$("#dong").val(), biz:data }
	            ,function(data, status){
	            	var count =0;
	            	$.each(data, function(index, vo) {
	            		clickArr.push(vo.address);
	            		count++;
	            		if(count==data[0].len*1){
	            			execute();
	            		}
	              });//each
	              
	            }//function
	            , "json"
	      );//get
	//map 초기화;
	//

}
function execute(){
	console.log("execute"+clickArr.length);
	for (var i = 0; i < clickArr.length; i++) {
    	addressMark(clickArr[i]);
    }   
}
function setMarkers(map) {
    for (var i = 0; i < clickArr.length; i++) {
    	clickArr[i].setMap(map);
    }            
    clickArr=[];
}

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
function addressMark(data){
// 주소로 좌표를 검색합니다
data = "'"+data+"'";
geocoder.addressSearch(data, function(result, status) {
    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });
        marker.setMap(map);
        clickArr.push(marker);
        
//         // 인포윈도우로 장소에 대한 설명을 표시합니다
//         var infowindow = new kakao.maps.InfoWindow({
//             content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
//         });
//         infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
}
</script>
</body>
</html>