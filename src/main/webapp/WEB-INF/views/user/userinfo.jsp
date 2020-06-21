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
$(document).ready(function() {
	$("#updateBtn").click(function() {
		if($('#userpwd').val()==""){
			alert("비밀번호를 입력해주세요.");
			$('#userpwd').focus();
		}else if($('#userpwd').val() != $('#userpwd_check').val()){
			alert("비밀번호가 일치하지않습니다.");
			
			$('#userpwd').focus();
		}else if($('#username').val() == ""){
			alert("이름을 입력해주세요.");
			console.log($('#username').val());
			$('#username').focus();
		}else if($('#emailid').val() == "" || $('#emaildomain').val() == ""){
			alert("이메일을 입력해주세요.");
			$('#emailid').focus();
		}else if($('#tel1').val() == "" || $('#tel2').val() == "" || $('#tel3').val() == ""){
			alert("전화번호를 입력해주세요.");
			$('#tel1').focus();
		}else if($('#address').val() == "" || $('#address_detail').val() == ""){
			alert("주소를 입력해주세요.");
			$('#address').focus();
		}else{
			$("#manageform").attr("action", "/happyhouse/user/updateUserInfo/${userinfo.id}").submit();
		}
	});
});

function cancel() {
	document.location.href = "/happyhouse/index";
}	
function manDelete() {
	$("#manageform").attr("action", "/happyhouse/user/deleteUserInfo").submit();
}	
</script>
<style>
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
  width: 750px;
  padding: 4% 0 0;
  margin: auto;
}
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 750px;
  margin: 0 auto 100px;
  padding: 45px;
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

.button-update{
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: blue;
  width: 100% !important;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}

.button-secession{
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: red;
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

.button-update:hover, .button-update:active, .button-update:focus{
  background: rgba(61, 61, 255);
}

.button-secession:hover, .button-secession:active, .button-secession:focus{
  background: rgb(255, 61, 61);
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
<%@ include file="../sidebar.jsp"%>
    <div class="main-imgbox">
        <div class="main-text">
            <h1>Happy House</h1>
            <h2 class="page-text">User Page</h2>
        </div>
    </div>
    <div class="user-page">
        <div class="form">
            <form class="user-form" action="" id="manageform">
                <table>
                    <tr>
                        <td>
                            <label for="id">Id</label>
                        </td>
                        <td colspan="5">
                            <input type="text" name="id" id="userid" value="${userinfo.id }" readonly />
                        </td>
                        <td colspan="3">
                            <span id="idcheck"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="password">Password</label>
                        </td>
                        <td colspan="8">
                            <input type="password" name="password" id="userpwd" placeholder="Password" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="Confirm-Password">Confirm Password</label>
                        </td>
                        <td colspan="8">
                            <input type="password" name="userpwd_check" id="userpwd_check" placeholder="Confirm Password" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="Username">Username</label>
                        </td>
                        <td colspan="8">
                            <input type="text" id="username" name="name" placeholder="Username" value="${userinfo.name}"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="Email">Email</label>
                        </td>
                        <td colspan="5">
                            <input type="text" class="input-email" name="emailid" placeholder="Email" value="${userinfo.emailid}"/>
                        </td>
                        <td style="text-align: center;">
                            @
                        </td>
                        <td colspan="2">
                            <select name="emaildomain" id="emaildomain">
                                <option value="${userinfo.emaildomain}">${userinfo.emaildomain}</option>
                                <option value="naver.com">naver.com</option>
                                <option value="daum.net">daum.net</option>
                                <option value="google.com">google.com</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="Tel">Tel</label>
                        </td>
                        <td colspan="2">
                            <input type="text" class="input-tel" id="tel1" name="tel1" placeholder="Tel" value="${userinfo.tel1}">
                        </td>
                        <td>
                            -
                        </td>
                        <td colspan="2">
                            <input type="text" class="input-tel" id="tel2" name="tel2" placeholder="" value="${userinfo.tel2}">
                        </td>
                        <td>
                            -
                        </td>
                        <td colspan="2">
                            <input type="text" class="input-tel" id="tel3" name="tel3" placeholder="" value="${userinfo.tel3}">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="Address">Address</label>
                        </td>
                        <td colspan="8">
                            <input type="text" id="address" name="address" placeholder="Address" value="${userinfo.address}" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="8">
                            <input type="text" id="address_detail" name="address_detail" placeholder="Address-Detail" value="${userinfo.address_detail}"/>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><button type="button" class="button-back" onclick="javascript:history.back();">Back</button></td>
                        <td colspan="4"><button type="button" class="button-update" id="updateBtn">Update</button></td>
                        <td colspan="3"><button type="button" class="button-secession" onclick="javascript:manDelete();">Secession</button></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</body>
</html>