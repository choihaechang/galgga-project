<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title>pw_find</title>
 
</head>
<style>

.box {
width:1000px;
margin: 0px auto;
}

  
.header {
 width:140px;
 height:30px;
 margin-top: 10px;

}

  
.title {
 font-size: 22px;
 width: 140px;
 height: 30px;
 border-bottom: 2px solid black;

 
}

.info-find {
  width: 460px;
  height: 300px;
  margin: 90px auto;
  text-align: center;
}

.main-title1 {
  margin-top: 20px;
  font-size: 20px;
}

.main-subtitle1 {
  margin-top: 10px;
}


.text-email1{
 width: 200px;
 height: 28px;

}


.email{
 width: 90px;
 height: 50px;
}

.login_button{ 
width: 130px;
height: 37px;
margin-top: 20px;
color: white;
background: #545f83;
border-radius: 7px;
}



</style>

<body>
  <div class="box">
  <div class="header">
  <div class="title"><b>비밀번호 찾기</b></div>
  </div>

<div class="info-find">
    <img class="email" src="${contextPath}/resources/image/email.jpg" alt="email">
  <div class="main-title1"><b>본인확인 이메일로 인증하기</b></div>
  <div class="main-subtitle1"><b>인증번호가 발송되었습니다</b></div><br>
  <div class="title2"><b>이메일 임시비밀번호 확인 후 로그인 해주세요</b></div>
  <button type="button" class="login_button" onclick="location.href='/galgga/member/loginForm.do';">로그인 화면 가기</button>
</div>
 
  </div>
</body>

</html>