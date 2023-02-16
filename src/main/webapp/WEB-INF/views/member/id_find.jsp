<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title>id_find</title>
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
  
  <script type="text/javascript">
	$(document).ready(function(){
  	var msg ="${msg}";
  		if (msg != "") {
  			alert(msg);
  		}
	})
  </script>
  

<style>


  
.box {
width:1000px;
margin: 0px auto;
}

  
.header {
 width:120px;
 height:30px;
 margin-top: 10px;

}

  
.title {
 font-size: 22px;
 widht: 50px;
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
.email-button{ /* 인증번호 발송버튼 */
width: 100px;
height: 37px;
margin-top: 20px;
color: white;
background: #4B5578;
border-radius: 7px;
}

.email{
 width: 90px;
 height: 50px;
}


.text-id { /* 이름칸 */
margin-top: 30px;
width: 350px;
height: 20px;

}

.text-email1{
 margin-top: 15px;
 width: 99px;
 height: 20px;

}
.text-totalemail{
 margin-top: 15px;
 width: 300px;
 height: 25px;
  
}

.text-email3{
 width: 110px;
 height: 25px;
}

</style>
</head>

<body>


  <div class="box">
  <div class="header">
  <div class="title"><b>아이디 찾기</b></div>
  </div>

<div class="info-find">
  <img class="email" src="${contextPath}/resources/image/email.jpg" alt="email">
  <div class="main-title1"><b>본인확인 이메일로 인증하기</b></div>
  <div class="main-subtitle1"><b>이메일로 회원 아이디 찾기</b></div>
 <form class="email-form" method="POST" action="findId"> 
      <input type="email" class="text-totalemail" id="totalemail" name="totalemail" placeholder="이메일을 입력 해주세요"/>
  
  <br>
  <button type="submit" class="email-button">확인</button>
  </form>
</div>
  </div>
  


  
</body>

</html>