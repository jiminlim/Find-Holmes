<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
</head>
<title>happyhouse</title>
<script>
    var giMenuDuration = 700;

    // 전체 메뉴를 오른쪽으로 슬라이드하여서 보여준다.
    function ShowMenu(){
        $('.menu_bg' ).css( { 'display' : 'block' } );
        $('.menu' ).css( { 'left' : '-100%' } );
        $('.menu' ).animate( { left: '0' }, { duration: giMenuDuration } );
    }

    // 전체 메뉴를 왼쪽으로 슬라이드하여서 닫는다.
    function HideMenu(){
        $('.menu' ).animate( { left: '-100%' }, { duration: giMenuDuration, complete:function(){ $('.menu_bg' ).css( { 'display' : 'none' } ); } } );
    }

    // 확장 메뉴를 보여주거나 닫는다.
    function ShowSubMenu( strId ){
        var lySubMenu = $( strId );

        if( lySubMenu.first().is( ":hidden" ) ){
            $( strId ).slideDown( 300 );
        }
        else{
            $( strId ).slideUp( 300 );
        }
    }

    $( document ).ready( function()
    {
        $('.menu_2' ).hide();
        
        $(".main-imgbox").click(function(){
           location.href="/happyhouse/index";
        });
    } );
</script>
<style>
body {
  margin: 0;
  background-color: rgb(230, 230, 230);
  font-family: 'Noto Sans KR', sans-serif;
}

/* navbar */
.navbar {
  background-color: white;
  height: 59px;
  line-height: 59px;
  padding: 0 82px 0 50px;
  margin: 10px;
  position: relative;
  border-radius: 10px;
}

.navbar .logo {
  float: left;
}

.navbar .logo img {
  vertical-align: middle;
}

.navbar .navbar-menu {
  padding: 0;
  margin: 0 10px;
  list-style: none;
}

.navbar .menu-right {
  float: right;
}

.navbar .navbar-menu li {
  display: inline-block;
  font-size: 16px;
  margin: 0 10px;
}

.navbar .navbar-menu li a {
  color: #4a4a4a;
  text-decoration: none;
}

/* menu */
.menu_bg { 
    width: 100%; 
    height: 2000px; 
    position: fixed; 
    top:0px; 
    left:0px; 
    overflow: hidden; 
    display: none;
    z-index: 5;
    color: white;
}
.menu { 
    position:absolute; 
    top:0px; 
    left:0px; 
    width:25%; 
    height: 100%; 
    background-color:rgba(0, 0, 0, 0.95); 
}
.menu > div { 
    padding: 2% 2% 0 2%; 
}

.menu-text{
    width: 300px;
    text-align: left;
    font-size: x-large;
    float: right;
    margin: 30px 70px 0;
}
.menu-row > div{
    margin: 20px 0 0 30px;
    cursor: pointer;
}

.movetext{
   cursor: pointer;
}
/* Main Image Box */

.main-imgbox{
    position: relative;
    margin: 10px;
    overflow: hidden;
    border-radius: 10px;
    opacity: 1;
    background-image: url('/happyhouse/resources/img/main.png');
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
    height: 200px;
}

.main-text{
    margin: 55px auto;
    width: 20%;
    height: 10%;
    color: #DDD;
    text-align: center;
}

.page-text{
    margin: 40px;
}


</style>
</head>
<body>
      <div class="navbar">
        <a class="logo" href="#" style="text-decoration: none;">
            <img src="/happyhouse/resources/img/m_gnb_btn.png" width="25" height="17" onclick="ShowMenu()">
            <img src="/happyhouse/resources/img/home_btn.png" width="25" height="17" style="margin: auto 30px;" onclick="location.href='/happyhouse';">            
        </a>
         <ul class="menu-right navbar-menu">
           <c:if test="${user != null}">
                 <li class="menu-item"> ${user.name } 님 </li>
               <li class="menu-item"><a href="/happyhouse/user/logout">로그아웃</a></li>
               <li class="menu-item"><a href="/happyhouse/user/ModifyInfo">정보수정</a></li>
            </c:if>
            <c:if test="${user == null}">
               <li class="menu-item"><a href="/happyhouse/user/moveJoinPage">회원가입</a></li>
               <li class="menu-item"><a href="/happyhouse/user/moveLoginPage">로그인</a></li>
            </c:if>
        </ul>
    </div>
    <div class="menu_bg">
      <div class="menu">
      <div style="float: right;">
         <div style=" text-align: right; cursor: pointer; display:inline;" onclick="HideMenu()" >닫기</div>
      </div>
         <div class="menu-text">
                <div class="menu-row">
                         지도 검색 <button onclick="ShowSubMenu('#sub1')">+</button>&nbsp;&nbsp;
                </div>
            <div class="menu_2 menu-row" id="sub1">
               <div onclick="location.href='/happyhouse/map/moveAptMap2';">아파트 검색</div>
               <div onclick="location.href='/happyhouse/map/moveEnvi';">주변 환경 검색</div>
            </div>
         </div>
         <div class="menu-text movetext">
                <div class="menu-row" onclick="location.href='/happyhouse/apt/moveAptList';">
                       아파트 거래 정보 &nbsp;&nbsp;
                </div>
         </div>
         <div class="menu-text movetext">
                <div class="menu-row" onclick="location.href='/happyhouse/notice/moveNoticeList';">
                      공지사항&nbsp;&nbsp;&nbsp;
                </div>
         </div>
      </div>
    </div>
</body>

</html>