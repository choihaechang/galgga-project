<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	// 취소
	$(".cancle").on("click", function(){
		
		location.href = "/galgga/mypage/MypageReserveChk.do";
				    
	})

	$("#delete_btn").on("click", function(){
		if($("#member_pw").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#member_pw").focus();
			return false;
		} else {
			if(confirm("정말로 탈퇴하시겠습니까?")) {
				$("#delForm").submit();
			} return false;
		}
	})
})
</script> 
<c:if test="${not empty msg }">
<script>
window.onload=function()
{
  result();
}
function result(){
	alert('${msg}');
}
</script>
</c:if>
<style>
.outmember{
 width: 170px;
 height: auto;
}
 .section{
  margin: 70px auto;	
  width: 200px;
  height: auto;
 }
 
 .out_delete_btn{
   margin-top: 20px;
   background: #4B5578;
   border-radius: 5px;
   color: white;
   width: 80px;
 }
 
 .cancel_btn{
   margin-top: 20px;
   background: #4B5578;
   border-radius: 5px;
   color: white;
   width: 60px;
 }
 
 .form-control{
 height: 20px;
 width: 200px;
 }
 
 
</style>
</head>
<body>
<section class="section" id="container">
		<div class="outmember">
			<h1 style="text-align:center; margin-left:30px;">회원탈퇴</h1>
			<form action="memberDelete" method="post" class="delForm" id="delForm">
				<div class="form-group has-feedback">
					<label class="control-label" for="member_id">아이디</label>
					<input class="form-control" type="text" name="member_id" id="member_id" value="${memberInfo.member_id}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="member_pw">패스워드</label>
					<input class="form-control" type="password" name="member_pw" id="member_pw"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userName">성명</label>
					<input class="form-control" type="text" name="member_name" value="${memberInfo.member_name}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<button class="out_delete_btn" id="delete_btn" type="submit">회원탈퇴</button>
					<button class="cancel_btn" type="button" onclick="location.href='${contextPath}/mypage/MypageReserveChk.do'">취소</button>
				</div>
			</form>
			<div style="width:300px;">

			</div>
		</div>
		</section>
</body>
</html>