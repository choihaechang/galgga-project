<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title>info</title>
  <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<style>
  
.box {

margin: 0px auto;
}

  
.header {
 width:142px;
 height:30px;
 margin-top: 10px;

}

  
.title-text {
 font-size: 22px;
 widht: 142px;
 height: 30px;
 border-bottom: 2px solid black;

 
}

.info-find {
  width: 460px;
  height: 300px;
  margin: 165px auto;
  margin-bottom:0px;
  text-align: center;
}


  
.id-find {
position: relative;
font-size: 16px;
width: 450px;
height: 64px;
background: #FFFFFF;
box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

}

.pw-find {
position: relative;
font-size: 16px;
width: 450px;
height: 64px;
top: 20px;
background: #FFFFFF;
box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
  
}

.back {
position: relative;
width: 157px;
height: 42px;
margin: 50px auto;

background: #FFFFFF;
border-radius: 8px;

}

.buttonbox {
height: 100px;
}



</style>

<body>
  <script src="script.js"></script>
  
  <div class="box">
  <div class="header">
  <div class="title-text"><b>회원정보 찾기</b></div>
  </div>

<div class="info-find">
  <button type="submit" class="id-find" onClick="location.href='${contextPath}/member/id_find.do';"><b>아이디 찾기</b></button>
  <button type="submit" class="pw-find" onclick="location.href='${contextPath}/member/pw_find.do';"><b>비밀번호 찾기</b></button>
  <div class="buttonbox">
  <button type="button" class="back" onclick="location.href='/galgga/member/loginForm.do';">되돌아가기</button>
  </div>
</div>
  </div>
  
 
 
  
</body>

</html>