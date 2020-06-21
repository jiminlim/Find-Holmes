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

/* list */
table{
    width: 60%;
    margin: 2% auto;
    border-collapse: collapse;
    text-align: center;
}

tr{
    line-height: 40px;
    border-top: 1px solid black;
}

thead{
    border-top: 1px solid black;
    background-color: rgba(0, 0, 0, 0.75);
    color: white;
}


.button-write{
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background:#43A047;
  width: 100% !important;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
  border-radius: 10px;
  margin: 3px 0;
}

.button-write:hover, .button-write:active, .button-write:focus{
  background: rgba(180, 231, 112, 0.897);
}

a:link {text-decoration:none; color:#646464;}
a:visited {text-decoration:none; color:#646464;}
a:active {text-decoration:none; color:#646464;}
a:hover {text-decoration:none; color:#646464;}
</style>
<body>
<%@ include file="../sidebar.jsp"%>
    <div class="main-imgbox">
        <div class="main-text">
            <h1>Happy House</h1>
            <h2 class="page-text">Notice Page</h2>
        </div>
    </div>
    <table>
            <col width="10%">
            <col width="40%">
            <col width="15%">
            <col width="15%">
        <thead>
            <tr>
                <th>No</th>
                <th>Title</th>
                <th>Writer</th>
                <th>Date</th>
            </tr>
        </thead>
        <c:forEach var="article" items="${articles }">
            <tr>
                <td>${article.no}</td>
                <td><a href="/happyhouse/notice/moveNoticeInfo/${article.no}">${article.subject }</a></td>
                <td>${article.id}</td>
                <td>${article.regtime}</td>
            </tr>
        </c:forEach>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <c:if test="${user.admin == 1}">
                <td><button class="button-write" onclick="location.href='/happyhouse/notice/mvwrite';">글쓰기</button></td>
                </c:if>
                <c:if test="${user.admin == 0}">
                <td></td>
                </c:if>
                <c:if test="${user == null}">
                <td></td>
                </c:if>
            </tr>
    </table>
    
</body>
</html>