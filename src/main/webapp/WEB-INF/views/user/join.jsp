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

    $( document ).ready( function(){
        $('.menu_2' ).hide();
        $("#registerBtn").click(function () {
        if ($("#userid").val() == "") {
            alert("아이디 입력!!!");
            $("#userid").focus();
            return;
        } else if ($("#userpwd").val() == "") {
            alert("비밀번호 입력!!!");
            $("#userpwd").focus();
            return;
        } else if ($("#userpwd").val() != $("#pwdcheck").val()) {
            alert("비밀번호 확인!!!");
            $("#userpwd").focus();
            return;
        } else if ($("#username").val() == "") {
            alert("이름 입력!!!");
            $("#username").focus();
            return;
        } else if ($("#emailid").val() == "" || $("#emaildomain").val() == "") {
            alert("이메일 입력!!!");
            $("#emailid").focus();
            return;
        } else if ($("#tel1").val() == "" || $("#tel2").val() == "" || $("#tel3").val() == "") {
            alert("전화번호 입력!!!");
            $("#tel1").focus();
            return;
        } else if ($("#address").val() == "" || $("#address_detail").val() == "") {
            alert("주소입력 입력!!!");
            $("#address").focus();
            return;
        } else {
            $("#memberform").attr("action", "/happyhouse/user/join").submit();
        }
    });
        
        $("#userid").blur(function() {
    		// id = "id_reg" / name = "userId"
    		var user_id = $('#userid').val();
    		$.ajax({
    			url : "${root}/user/idcheck",
    			type : 'get',
    			data :{ id : user_id },
    			success : function(data) {
    				console.log("no = 중복o / ok = 중복x : "+ data);							
    				
    				if (data == "no") {
    						// 1 : 아이디가 중복되는 문구
    						$("#id_check").text("사용중인 아이디입니다");
    						$("#id_check").css("color", "red");
        						$("#id_check").css("text-align", "center");
    						$("#registerBtn").attr("disabled", true);
    					} else {
    						if( user_id == ""){
    							$("#id_check").text("아이디를 입력해주세요.");
        						$("#id_check").css("color", "red");
        						$("#id_check").css("text-align", "center");
        						$("#registerBtn").attr("disabled", true);
    						}else{
    							$('#id_check').text("사용가능한 아이디입니다");
    							$('#id_check').css('color', 'blue');
        						$("#id_check").css("text-align", "center");
    							$("#registerBtn").attr("disabled", false);
    						}
    					}
    				}, error : function() {
    						console.log("실패");
    				}
    			});
    		});
});
    
    
</script>
<style>


/* Main Image Box */

.main-imgbox{
    position: relative;
    margin: 10px;
    overflow: hidden;
    border-radius: 10px;
    opacity: 1;
    background-image: url('./img/Main.png');
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

.button-signup{
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

.button-signup:hover, .button-signup:active, .button-signup:focus{
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
<%@ include file="../sidebar.jsp"%>
    <div class="main-imgbox">
        <div class="main-text">
            <h1>Happy House</h1>
            <h2 class="page-text">Sign Up Page</h2>
        </div>
    </div>
    <div class="user-page">
        <div class="form">
            <form class="user-form" id="memberform" action="">
                <table>
                    <tr>
                        <td>
                            <label for="id">Id</label>
                        </td>
                        <td colspan="5">
                            <input type="text" name="id" id="userid" placeholder="Id" />
                        </td>
                        <td colspan="3" style="padding: 0 0 15px 0">
                            <span id="id_check" ></span>
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
                            <input type="password" name="pwdcheck" id="pwdcheck" placeholder="Confirm Password" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="Username">Username</label>
                        </td>
                        <td colspan="8">
                            <input type="text" name="name" id="username" placeholder="Username" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="Email">Email</label>
                        </td>
                        <td colspan="5">
                            <input type="text" class="input-email" name="emailid" id="emailid" placeholder="Email" />
                        </td>
                        <td style="text-align: center;">
                            @
                        </td>
                        <td colspan="2">
                            <select name="emaildomain" id="emaildomain">
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
                            <input type="text" class="input-tel" name="tel1" id="tel1" placeholder="Tel">
                        </td>
                        <td>
                            -
                        </td>
                        <td colspan="2">
                            <input type="text" class="input-tel" name="tel2" id="tel2" placeholder="">
                        </td>
                        <td>
                            -
                        </td>
                        <td colspan="2">
                            <input type="text" class="input-tel" name="tel3" id="tel3" placeholder="">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="Address">Address</label>
                        </td>
                        <td colspan="8">
                            <input type="text" name="address" id="address" placeholder="Address" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="8">
                            <input type="text" name="address_detail" id="address_detail" placeholder="Address-Detail" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="9"><button id="registerBtn" class="button-signup">Sign Up</button></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</body>
</html>