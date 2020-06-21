<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../sidebar.jsp"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>지도 생성하기</title>
    <link rel="stylesheet" href="/happyhouse/resources/css/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
<style>
    .overlay_info {border-radius: 6px; margin-bottom: 12px; float:left;position: relative; border: 1px solid #ccc; border-bottom: 2px solid #ddd;background-color:#fff;}
    .overlay_info:nth-of-type(n) {border:0; box-shadow: 0px 1px 2px #888;}
    .overlay_info strong {display: block; background: #d95050; background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center; text-decoration: none; color: #fff; padding:12px 36px 12px 14px; font-size: 14px; border-radius: 6px 6px 0 0}
    .overlay_info .desc {padding:14px;position: relative; min-width: 190px; height: 56px}
    .overlay_info .address {font-size: 12px; color: #333; position: relative; left: 14px; right: 14px; top: 10px; white-space: normal}
    .overlay_info:after {content:'';position: absolute; margin-left: -11px; left: 50%; bottom: -12px; width: 22px; height: 12px; }
   .map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
   .map_wrap {position:relative;width:100%;height:350px;}
   #category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
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
}

thead{
    border-bottom: 2px groove black;
    border-top: 1px solid black;
    background-color: rgba(18, 155, 18, 0.945);
    color: white;
}

select{
   width: 150px ;
   height: 30px;
   border: 1px solid black;
   border-radius: 3px;
   font-size: 15px;
   text-align-last: center;
}

#slider-area{
	width: 80%;
	margin: 0 auto 3%;
	text-align: center;
	
}

#amount{
	border:0; 
	color: rgb(22,80,27); 
	font-weight:bold; 
	width: 30%; 
	height: 20px; 
	font-size: 15px;
	text-align: center;
	letter-spacing: 5px;
	float: left;
}

#slider-range{
	width: 60%;
	float: right;
}
a:link { color: black; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
</style>
</head>
<script>
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
               zoomLocation($("#gugun").val());
            }//function
            , "json"
      );//get
      //green 
      $("#greenarea").append("  <ul id='category' onclick='greenclick()'>"
        +"<li id='BK9' data-order='4'><span class='category_bg bank'></span>녹색지역 </li></ul>");
      $("#slider-area").show();
      setMarkers1();
      map = new kakao.maps.Map(mapContainer, mapOption); 
      gumarker($("#gugun").val());
      
   });//change
   
   $("#dong").change(function() {
      $.get("/happyhouse/map/apt"
            ,{dong:$("#dong").val()}
            ,function(data, status){
               $("#searchResult").empty();
               $("tbody").empty();
               $.each(data, function(index, vo) {
                  let str = "<tr>"
                  + "<td ><strong><a href=/happyhouse/apt/moveAptInfo/"+vo.no+">"+vo.no+"</a></strong></td>"
                  + "<td>" + vo.dong + "</td>"
                  + "<td>" + vo.AptName + "</a></td>"
                  + "<td>" + vo.jibun + "</td>"
                  + "<td>" + vo.code  + "</td></tr>";
                  $("tbody").append(str);
                  $("#searchResult").append(vo.dong+" "+vo.AptName+" "+vo.jibun+"<br>");
               });//each
               findA(data);
               
            }//function
            , "json"
      );//get
      $("#slider-area").hide();
   });//change
});//ready

//drawM
function zoomLocation(data){
   let idx = 0;
   $.get("/happyhouse/map/center"
         ,{code: data}
         ,function(data,status){
            panTo(data);
            map.setLevel(6);
         },"json"
      );
   
   }

function panTo(data) {
       // 지도를 1레벨 내립니다 (지도가 확대됩니다)
       // 지도 레벨을 표시합니다
   var moveLatLon = new kakao.maps.LatLng(data.lat*1, data.lng*1);
    map.panTo(moveLatLon);  
}    
var greens = [];
var greenClick =0;
function greenclick(){
   if(greenClick==0){
      greenClick++;
   var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
   $.get("/happyhouse/map/greenbelt"
      ,{code: $("#gugun").val()}
      ,function(data,status){
          var imageSize = new kakao.maps.Size(24, 35); 
          var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
         $.each(data, function(index, vo) {
            var lat = vo.green_lat*1;
            var lng = vo.green_lng*1;
            var greenName = vo.green_name;
   
             var marker = new kakao.maps.Marker({
                 map: map, // 마커를 표시할 지도
                 position: new kakao.maps.LatLng(lat, lng), // 마커를 표시할 위치
                 title : greenName, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                 image : markerImage // 마커 이미지 
             });
             marker.setMap(map);
             greens.push(marker);
      });//each
      }//function
      ,"json"
   );//get
    //setMarkers(map);
   }else{
      greenClick=0;
      setMarkers(null);
   }
}
function setMarkers(map) {
   console.log("setmarkers");
    for (var i = 0; i < greens.length; i++) {
       greens[i].setMap(map);
    }            
    greens=[];
}



</script>
<body>
    <div class="main-imgbox">
        <div class="main-text">
            <h1>Happy House</h1>
            <h2 class="page-text">지도 검색</h2>
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
<div id = "slider-area">
   <p>
        <input type="text" id="amount" readonly/>
    </p>
    <div id="slider-range"></div>
</div>
<div class="map_wrap">
   <div id="map" style="width:80%;height:350px;  position:relative;overflow:hidden;margin: 20px auto;" ></div>
   <div id="greenarea" style="position:absolute; right: 12%; top: 4%; width: 45px; height: 45px; z-index: 1;"></div>
</div>
<table class="table mt-2">
         <col width="15%">
            <col width="15%">
            <col width="20%">
            <col width="15%">
            <col width="15%">
   <thead>
      <tr>
         <th>번호</th>
         <th>법정동</th>
         <th>아파트이름</th>
         <th>지번</th>
         <th>지역코드</th>
      </tr>
   </thead>
   <tbody>
   </tbody>
</table>
</body>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=73704d579b0ce83553c77baa0d946b4e&libraries=services">
</script>
<script>


var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.5665734, 126.978179), // 지도의 중심좌표
        level: 6 // 지도의 확대 레벨
    };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption); 
var infowindows = [];

function findA(data){
   $.each(data, function(index, vo) {
      $.get("/happyhouse/map/findaddress"
            ,{dong : vo.dong,
               jibun :vo.jibun,
               AptName : vo.AptName
            }
            ,function(redata, status){
               map = new kakao.maps.Map(mapContainer, mapOption); 
               var geocoder = new kakao.maps.services.Geocoder();
               var address = redata.city+" "+redata.gu+" "+redata.dong+" "+vo.jibun;
               console.log(address);
               geocoder.addressSearch(address, function(result, status) {
                   // 정상적으로 검색이 완료됐으면 
                    if (status === kakao.maps.services.Status.OK) {
                       var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                      var infowindow = {
                            map: map,
                             position: coords,
                             content : '<div class="overlay_info">'
                              +'    <strong>'+vo.AptName +'</strong>'
                              +'    <div class="desc">'
                              +'    <span class="address">'+address+'</span>'
                              +'    </div>'
                              +'    </div>'
                            ,no :vo.no 
                      };
                      infowindows.push(infowindow);
                   } 
                   drawMarker();
                   map.setLevel(3);
               }); 
            }//function
            , "json"
      );//get
   });//each
}
function drawMarker(){
   for (var i = 0; i < infowindows.length; i ++) {
       var a = infowindows.pop();
        var marker = new kakao.maps.Marker({
           map: map, // 마커를 표시할 지도
           position: a.position // 마커의 위치
       });
       // 마커에 표시할 인포윈도우를 생성합니다 
       var infowindow = new kakao.maps.InfoWindow({
           content: a.content // 인포윈도우에 표시할 내용
       }); 
   
       (function(marker, infowindow) {
           kakao.maps.event.addListener(marker, 'mouseover', function() {
               infowindow.open(map, marker);
               
           });

           kakao.maps.event.addListener(marker, 'mouseout', function() {
               infowindow.close();
           });
       })(marker, infowindow);
       
       kakao.maps.event.addListener(marker, 'click', function() {
           location.href='/happyhouse/apt/moveAptInfo/'+a.no;
        });
       //map.
       map.setCenter(a.position);
   } 
}
var gu_aptlist=[];
function gumarker(data){
   $.get("/happyhouse/map/aptinfolist"
        ,{code: $("#gugun").val()}
        ,function(data,status){
           $.each(data, function(index, vo) {
              var lat = vo.lat*1;
              var lng = vo.lng*1;
               var guAptList = {
                    aptName : vo.aptname,
                    lat:lat,
                    lng :lng,
                    position: new kakao.maps.LatLng(lat, lng),
                    dong : vo.dong,
                    content: "hi"
               };
            gu_aptlist.push(guAptList);
           setListMarker(guAptList);
             console.log(gu_aptlist.length);
        });//each
        
        }//function
        ,"json"
     );//get   
}
function setListMarker(a){
       var marker = new kakao.maps.Marker({
           map: map, // 마커를 표시할 지도
           position: a.position // 마커의 위치
       });
   
       marker.setMap(map);
     
       //map.setCenter(a.position);
       //map.setLevel(6);
//    }
}

$(function() {
    $("#slider-range").slider({
        range: true,
        min: 5000,
        max: 90000,
        step : 1000,
        values: [10000, 60000],
        change: function(event, ui) {
            setMarkers1();
         map = new kakao.maps.Map(mapContainer, mapOption); 
           $("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
            sliderRangeList(ui.values[0], ui.values[1]);
           
        }
    });
    $("#amount").val("$" + $("#slider-range").slider("values", 0) + " - $" + $("#slider-range").slider("values", 1));

});

function sliderRangeList(d1, d2){
   $.get("/happyhouse/map/sliderRangeList"
           ,{data1: d1, data2: d2}
           ,function(data,status){
              $.each(data, function(index, vo) {
                 var lat = vo.lat*1;
                 var lng = vo.lng*1;
                 var guAptList = {
                       aptName : vo.aptname,
                       dong : vo.dong,
                       lat:lat,
                       lng :lng,
                    position: new kakao.maps.LatLng(lat, lng),
                       content: "hi"
                  }; 
               gu_aptlist.push(guAptList);
              setListMarker(guAptList);
              console.log("zzzz "+gu_aptlist.length);
           });//each
          }//function
           ,"json"
   );//get      
}
function initMap(data){
   //map설정들 넣어주기.
   map = new kakao.maps.Map(mapContainer, mapOption); 
   map.setLevel(data);
   
}

function setMarkers1() {
   console.log(gu_aptlist.length);
   console.log("chang시 초기화 gu_aptlist"+map);
       for (var i = 0; i < gu_aptlist.length; i++) {
          var a = gu_aptlist[i]; 
          console.log(a);
          console.log( gu_aptlist[i]);
           var marker = new kakao.maps.Marker({
               map: map, // 마커를 표시할 지도
               position: new kakao.maps.LatLng(a.lat, a.lng) // 마커의 위치
           });
           console.log("+ " +typeof a+" "+a.lat);
           console.log(marker);
          marker.setMap(null);
       }            
       gu_aptlist=[];
   }
</script>
</html>
<!-- 73704d579b0ce83553c77baa0d946b4e -->