<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../sidebar.jsp"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
    function login() {
	if(document.getElementById("userid").value == "") {
		alert("아이디 입력!!!");
		return;
	} else if(document.getElementById("userpwd").value == "") {
		alert("비밀번호 입력!!!");
		return;
	} else {
		document.getElementById("loginform").action = "/happyhouse/user/login";
		document.getElementById("loginform").submit();
	}
}
	 
function moveJoin() {
	document.location.href = "/happyhouse/user/moveJoinPage";
}	
function findPwd() {
	document.location.href = "/happyhouse/user/moveFindPwdPage";
}	
</script>
<style>
    body {
        margin: 0;
        background-color: rgb(230, 230, 230);
        font-family: 'Noto Sans KR', sans-serif;
    }
/* login-box */

.login-page {
  width: 450px;
  padding: 4% 0 0;
  margin: auto;
}
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
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
.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #4CAF50;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
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
.form .register-form {
  display: none;
}
.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
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
    <div class="main-imgbox">
        <div class="main-text">
            <h1>Happy House</h1>
            <h2 class="page-text">Login Page</h2>
        </div>
    </div>
    <div class="login-page">
        <div class="form">
            <form class="login-form" id="loginform" action="">
                <input type="text" id="userid" name="id" placeholder="id" />
                <input type="password" id="userpwd" name="password" placeholder="password" />
                <button onclick="javascript:login();">login</button>
                <p class="message">Not registered? <a href="#">Create an account</a></p>
            </form>
        </div>
    </div>
</body>
</html>