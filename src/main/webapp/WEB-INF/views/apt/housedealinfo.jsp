<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인 페이지</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
    var giMenuDuration = 700;

    // 전체 메뉴를 오른쪽으로 슬라이드하여서 보여준다.
    function ShowMenu(){
        $('.menu_bg' ).css( { 'display' : 'block' } );
        $('.menu' ).css( { 'left' : '-100%' } );
        $('.menu' ).animate( { left: '-75%' }, { duration: giMenuDuration } );
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
    z-index: 1;
    color: white;
}
.menu { 
    position:absolute; 
    top:0px; 
    left:0px; 
    width:100%; 
    height: 100%; 
    background-color:rgba(0, 0, 0, 0.95); 
}
.menu > div { 
    padding: 2% 2% 0 2%; 
}

.menu-text{
    width: 85%;
    text-align: right;
    font-size: x-large;
}
.menu-row > div{
    margin: 10px 0 0 0;
}

/* Main Image Box */

.main-imgbox{
    position: relative;
    margin: 10px;
    overflow: hidden;
    border-radius: 10px;
    opacity: 1;
    background-image: url('${root}/resources/img/main.png');
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

/* user page */
.user-page {
  width: 550px;
  padding: 4% 0 0;
  margin: auto;
}
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 550px;
  margin: 0 auto 100px;
  padding: 45px;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 350px;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}


.form select {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}

.table-style{
    text-align: center;
}

.button-back{
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: green;
  width: 100% !important;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}


.button-back:hover, .button-back:active, .button-back:focus{
  background: #43A047;
}

.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #4CAF50;
  text-decoration: none;
}

.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}

.container .info {
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.container .info span {
  color: #4d4d4d;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}

</style>
<body>
    <div class="navbar">
        <a class="logo" href="#">
            <img src="${root}/resources/img/m_gnb_btn.png" width="25" height="17" onclick="ShowMenu()">
        </a>
        <ul class="menu-right navbar-menu">
            <li class="menu-item"><a href="#">회원가입</a></li>
            <li class="menu-item"><a href="#">로그인</a></li>
        </ul>
    </div>
    <div class="menu_bg">
		<div class="menu">
			<div style="width: 96%; text-align: right" onclick="HideMenu()">닫기</div>
			<div class="menu-text">
                <div class="menu-row">
                    메뉴 1 <button onclick="ShowSubMenu('#sub1')">+</button>&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
				<div class="menu_2 menu-row" id="sub1">
					<div>메뉴 1-1</div>
					<div>메뉴 1-2</div>
				</div>
			</div>
			<div class="menu-text">
                <div class="menu-row">
                    메뉴 2 <button onclick="ShowSubMenu('#sub2')">+</button>&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
				<div class="menu_2 menu-row" id="sub2">
					<div>메뉴 2-1</div>
					<div>메뉴 2-2</div>
				</div>
			</div>
		</div>
    </div>
    <div class="main-imgbox">
        <div class="main-text">
            <h1>Happy House</h1>
            <h2 class="page-text">HouseDeal Page</h2>
        </div>
    </div>
    <div class="user-page">
        <div class="form">
            <form class="user-form" action="">
                <table class="table-style">
                    <tr>
                        <td style="width: 200px;">
                            <label for="subject">아파트 이름</label>
                        </td>
                        <td colspan="8">
                            <input type="text" id="subject" name="subject" value="${noinfo.aptName }" readonly>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="content">거래금액</label>
                        </td>
                        <td colspan="8">
                            <input type="text" class="form-control" id="content" name="content" value="${noinfo.dealAmount }" readonly>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="content">월세금액</label>
                        </td>
                        <td colspan="8">
                            <input type="text" class="form-control" id="content" name="content" value="${noinfo.rentMoney}" readonly>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="content">건축년도</label>
                        </td>
                        <td colspan="8">
                            <input type="text" class="form-control" id="content" name="content" value="${noinfo.buildYear }" readonly>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="content">전용면적</label>
                        </td>
                        <td colspan="8">
                            <input type="text" class="form-control" id="content" name="content" value="${noinfo.area }" readonly>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="content">거래일</label>
                        </td>
                        <td colspan="8">
                            <input type="text" class="form-control" id="content" name="content" value="${noinfo.dealYear }.${noinfo.dealMonth }" readonly>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="content">법정동</label>
                        </td>
                        <td colspan="8">
                            <input type="text" class="form-control" id="content" name="content" value="${noinfo.dong }" readonly>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="content">지번</label>
                        </td>
                        <td colspan="8">
                            <input type="text" class="form-control" id="content" name="content" value="${noinfo.jibun }" readonly>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="9">
                            <button type="button" class="button-back" onclick="location.href='/happyhouse/apt/moveAptList';">목록으로</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</body>
</html>