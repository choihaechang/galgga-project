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
 width: 130px;
 height: 30px;
 border-bottom: 2px solid black;

 
}

.ghosttext{
margin-top: 20px;
border-bottom: 2px solid black;
}
.subtext1{
  
  margin-top: 20px;
  font-size: 14px;

  
}

.info-find {
  width: 460px;
  height: 500px;
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
.email-button{ /* 인증번호 발송버튼 */
width: 100px;
height: 37px;
margin-top: 20px;
color: white;
background: #4B5578;
border-radius: 5px;

}

.text-id { /* 이름칸 */
margin-top: 30px;
width: 350px;
height: 20px;

}

.text-email1{
 width: 400px;
 height: 28px;

}


.email{
 width: 90px;
 height: 50px;
}



</style>

<body>
  <script src="script.js"></script>

  <div class="box">
  <div class="header">
  <div class="title"><b>비밀번호 찾기</b></div>
  </div>

<div class="info-find">
    
  <div class="main-title1"><b>000님, 새로운 비밀번호를 재설정해주세요</b></div>
  <br><br>
 <form class="email-form" method="post"> 
      <input type="text" class="text-email1" placeholder="새 비밀번호를 입력해주세요"/><br>
       <input type="text" class="text-email1" placeholder="비밀번호를 확인해주세요"/>
  <button type="button" class="email-button" onclick="location.href='/galgga/member/loginForm.do';">완료</button>
   <div class="ghosttext"> </div>
   <div class="subtext1">8~32자의 영문, 숫자, 특수문자를 하나 이상씩 사용(필수)</div>

  
</div>
  </div>
  
</body>

</html>