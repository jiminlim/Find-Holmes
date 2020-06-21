<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../sidebar.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인 페이지</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<style>
body {
  margin: 0;
  background-color: rgb(230, 230, 230);
  font-family: 'Noto Sans KR', sans-serif;
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
                            <button type="button" class="button-back" onclick="javascript:history.back();">Back</button>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="9">
                            <button type="button" class="button-list" onclick="location.href='/happyhouse/apt/moveAptList';">List</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</body>
</html>