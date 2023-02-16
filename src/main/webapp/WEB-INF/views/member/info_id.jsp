<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title>replit</title>
  <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<style>

.box {
width:1000px;
margin: 0px auto;
}

  
.header {
 width:110px;
 height:30px;
 margin-top: 10px;
 margin-left: 200px;
}

  
.title {
 font-size: 20px;
 widht: 50px;
 height: 30px; 
 border-bottom: 2px solid black;

 
}

.info-find {
  width: 460px;
  height: 500px;
  margin: 90px auto;
  text-align: center;
}

.main-title1 {
  font-size: 20px;
  margin-top: 10px;
}

.main-subtitle1 {
  margin-top: 10px;
}
.email-button{
width: 80px;
height: 37px;
margin-top: 20px;
color: white;
background: #4B5578;
border-radius: 5px;
}

.main-line{
width: 310px;
margin: 70px; auto;
border-bottom: 2px solid black;
}

.email{
 width: 90px;
 height: 50px;
}

.phone{
 width: 90px;
 height: 50px;
}





</style>

<body>
  <script src="script.js"></script>

  <div class="box">
  <div class="header">
  <div class="title"><b>아이디 찾기</b></div>
  </div>

<div class="info-find">
  <img class="email" src="${contextPath}/resources/image/email.jpg" alt="email">
  <div class="main-title1"><b>본인확인 이메일로 인증</b></div>
  <div class="main-subtitle1"><b>본인확인 이메일로 인증번호를 발송합니다</b></div>
  <button type="submit" class="email-button" onclick="location.href='${contextPath}/member/id_find.do';">확인</button>
  <div class="main-line"></div>

   <img class="phone" src="${contextPath}/resources/image/phone.jpg" alt="phone">
  <div class="main-title1"><b>본인명의 핸드폰으로 인증하기</b></div>
  <div class="main-subtitle1"><b>회원님의 명의로 등록된 휴대폰으로 가입여부 및 본인여부를<br> 
    확인합니다.</b></div>
  <button class="email-button" onclick="">확인</button>
  
</div>
  </div>
  
</body>

</html>