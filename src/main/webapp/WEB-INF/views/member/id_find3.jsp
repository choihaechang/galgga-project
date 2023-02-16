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
 
</head>
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
  width: 470px;
  height: 300px;
  margin: 90px auto;
  text-align: center;
}

.main-title1 {
  margin-top: 110px;
  font-size: 17px;
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

.text-box{
margin-top: 10px;
height: 120px;
border: solid 2px black;
text-align:left;
}

.text-email1{
 width: 200px;
 height: 28px;

}
.findidtext{
margin:45px auto;
text-align:center;
}



</style>

<body>
  
  
  <div class="box">
  <div class="header">
  <div class="title"><b>아이디 찾기</b></div>
  </div>

<div class="info-find">
  
  <div class="main-title1"><b>회원님의 정보와 일치하는 아이디 목록입니다</b></div>
  <div class="text-box"><h3 class="findidtext">아이디는:
  	 <c:forEach items="${memberInfo}" var="memberInfo">
  	 ${memberInfo.member_id}&nbsp;입니다
  	 </c:forEach>  
  	</h3>
 
  </div>
   <button type="button" class="email-button" onclick="location.href='/galgga/member/loginForm.do';">로그인하기</button>
    &nbsp; &nbsp; &nbsp;<button type="button" class="email-button" onclick="location.href='/galgga/member/pw_find.do';">비밀번호 찾기</button>

</div>
  </div>
  
</body>

</html>