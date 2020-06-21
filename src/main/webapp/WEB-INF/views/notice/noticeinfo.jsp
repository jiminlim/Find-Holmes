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
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
function notice_Delete() {
	window.location.href = "/happyhouse/notice/noticedelete/${noinfo.no}";
}	
function cancel() {
	window.location.href = "/happyhouse/notice/moveNoticeList";
}	

$(document).ready(function() {
	$("#update-button").click(function() {
		if($("#subject").val() == "") {
			alert("input Title!");
			$("#subject").focus();
			return;
		} else if($("#content").val() == "") {
			alert("input Content!");
			$("#content").focus();
			return;
		} else {
			$("#notice-register").attr("action", "/happyhouse/notice/noticemodify/${noinfo.no}").submit();
		}
	});
});

</script>
<style>

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

.button-delete{
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
.button-list{
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

.button-list:hover, .button-list:active, .button-list:focus{
  background: skyblue;
}
.button-back:hover, .button-back:active, .button-back:focus{
  background: #43A047;
}

.button-update:hover, .button-update:active, .button-update:focus{
  background: rgba(61, 61, 255);
}

.button-delete:hover, .button-delete:active, .button-delete:focus{
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
            <form class="user-form" action="" id="notice-register">
                <table>
                    <tr>
                        <td style=" padding: 0 0 7px 0; font-size: 20px; font: bold; width: 100px;">
                            <label for="writer">Writer</label>
                        </td>
                        <td colspan="8">
                            <input type="text" name="id" value="${noinfo.id}" readonly />
                        </td>
                    </tr>
                    <tr>
                        <td style=" padding: 0 0 7px 0; font-size: 20px; font: bold;">
                            <label for="title">Title</label>
                        </td>
                        <td colspan="8">
                            <input type="text" id="subject" name="subject" value="${noinfo.subject}" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="9">
                            <label for="content" style=" padding: 0 0 7px 0; font-size: 20px; font: bold;" >Content</label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="9">
                            <textarea name="content" id="content" cols="90%" rows="15">${noinfo.content}</textarea>
                        </td>
                    </tr>
                        <c:if test="${user.admin == 1}">
                    <tr>
                        <td></td>
                        <td><button type="button" class="button-back" onclick="location.href='/happyhouse/notice/moveNoticeList';">Back</button></td>
                        <td colspan="4"><button type="button" class="button-update" id="update-button">Update</button></td>
                        <td colspan="3"><button type="button" class="button-delete" onclick="javascript:notice_Delete()">Delete</button></td>
                    </tr>
                        </c:if>
                        <c:if test="${user.admin == 0}">
                    <tr>
                        <td colspan="2"><button type="button" class="button-back" onclick="javascript:history.back();">Back</button></td>
                    </tr>
                    <tr>
                        <td colspan="2"><button type="button" class="button-list" onclick="location.href='/happyhouse/notice/moveNoticeList';">List</button></td>
                    </tr>
                        </c:if>
                        <c:if test="${user == null}">
                    <tr>
                        <td colspan="2"><button type="button" class="button-back" onclick="javascript:history.back();">Back</button></td>
                    </tr>
                    <tr>
                        <td colspan="2"><button type="button" class="button-list" onclick="location.href='/happyhouse/notice/moveNoticeList';">List</button></td>
                    </tr>
                        </c:if>
                </table>
            </form>
        </div>
    </div>
</body>
</html>