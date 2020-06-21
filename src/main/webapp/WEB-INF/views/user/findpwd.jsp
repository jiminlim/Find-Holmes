<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../sidebar.jsp"%>

<c:if test="${cookie.ssafy_id.value}">
<c:set var="svid" value="${cookie.ssafy_id.value}"/>
<c:set var="ckid" value=" checked"/>
</c:if>
<!DOCTYPE html>
<html lang="utf-8">
<head>
<title>login</title>
<meta charset="utf-8">
<script type="text/javascript">
$(document).ready(function(){
	$("#findBtn").click(function(){
			$("#findform").attr("action","/happyhouse/user/findPwd").submit();
	});
});	

function cancel() {
	document.location.href = "/happyhouse/index";
}	

function newPwd(){
	if($('#userpwd').val() != $('#pwdcheck').val()){
		alert("비밀번호가 다릅니다.");
	}else{
		var userpwd = $('#userpwd').val();
		document.location.href="/happyhouse/user/newPwd?id=${id}&&pwd="+userpwd;		
	}	
}
</script>
</head>
<body>
<div class="container" align="center">
	<div class="col-lg-6" align="center">
	<c:if test="${pwd == '0' || pwd == null}"> 
		<c:if test="${userinfo == null }">
			<h3>${msg}</h3>
		</c:if>
		<form id="findform" method="post" action="">
		<input type="hidden" name="act" id="act" value="findpwd">
			<div class="form-group" align="left">
				<label for="">아이디</label>
				<input type="text" class="form-control" id="userid" name="id">
			</div>
			<div class="form-group" align="left">
				<label for="tel">전화번호</label>
				<div id="tel" class="custom-control-inline">
				<select class="form-control" id="tel1" name="tel1">
					<option value="010">010</option>
					<option value="02">02</option>
					<option value="031">031</option>
					<option value="032">032</option>
				</select> _
				<input type="text" class="form-control" id="tel2" name="tel2" placeholder=""> _
				<input type="text" class="form-control" id="tel3" name="tel3" placeholder="">
				</div>
			</div>
			<div class="form-group" align="center">
				<button type="button" class="btn btn-warning" id="findBtn">찾기</button>
				<button type="button" class="btn btn-primary" onclick="javascript:cancel();">취소</button>

			</div>
		</form>
		</c:if>
		<c:if test="${pwd != '0' && pwd != null}">
			<h3>새로운 비밀번호를 입력해주세용</h3>
			<div class="form-group" align="left">
				<label for="">비밀번호</label>
				<input type="password" class="form-control" id="userpwd" name="password" placeholder="">
			</div>
			<div class="form-group" align="left">
				<label for="">비밀번호 재입력</label>
				<input type="password" class="form-control" id="pwdcheck" name="pwdcheck" placeholder="">
			</div>
			<div class="form-group" align="center">
				<button type="button" class="btn btn-primary" id="newPwdBtn" onclick="javascript:newPwd();">저장</button>
				<button type="reset" class="btn btn-warning">초기화</button>
								<button type="button" class="btn btn-primary" onclick="javascript:cancel();">취소</button>
			</div>
		</c:if>
	</div>
</div>
