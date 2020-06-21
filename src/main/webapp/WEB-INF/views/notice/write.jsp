<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Write</title>
</head>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#registerBtn").click(function() {
		if($("#subject").val() == "") {
			alert("input Title!");
			$("#subject").focus();
			return;
		} else if($("#content").val() == "") {
			alert("input Content!");
			$("#content").focus();
			return;
		} else {
			$("#notice-register").attr("action", "/happyhouse/notice/write").submit();
		}
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

.button-check{
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


.button-check:hover, .button-check:active, .button-check:focus{
  background: #43A047;
}

.button-back{
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


.button-back:hover, .button-back:active, .button-back:focus{
  background: skyblue;
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

textarea {
    resize: none;
}
</style>
<body>
<%@ include file="../sidebar.jsp"%>
    <div class="main-imgbox">
        <div class="main-text">
            <h1>Happy House</h1>
            <h2 class="page-text">Notice Page</h2>
        </div>
    </div>
    <div class="user-page">
        <div class="form">
            <form id="notice-register" class="user-form" action="">
                <table>
                    <tr>
                        <td style=" padding: 0 0 7px 0; font-size: 20px; font: bold; width: 100px;">
                            <label for="writer">Writer</label>
                        </td>
                        <td colspan="8">
                            <input type="text" id="userid" name="id" value="${user.id}" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <td style=" padding: 0 0 7px 0; font-size: 20px; font: bold; width: 100px;">
                            <label for="title">Title</label>
                        </td>
                        <td colspan="8">
                            <input type="text" id="subject" name="subject" value="" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="9" style=" padding: 0 0 7px 0; font-size: 20px; font: bold;">
                            <label for="content">Content</label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="9">
                            <textarea name="content" id="content" cols="90%" rows="15"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><button class="button-check" id="registerBtn">등록</button></td>
                    </tr>
                    <tr>
                        <td colspan="2"><button type="button" class="button-back" onclick="location.href='/happyhouse/notice/moveNoticeList';">목록으로</button></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</body>
</html>