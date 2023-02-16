<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
 <script src="//code.jquery.com/jquery.min.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <title>pw_find</title>
  
  
 <script type="text/javascript">

	var msg = "${msg}";
		 
		if (msg != "") {
			alert(msg);
		}
</script>

<style>

  
.box {
width:1000px;
margin: 0px auto;
}

  
.header {
 width:135px;
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
  width: 450px;
  height: 300px;
  margin: 100px auto;
  text-align: center;
}

.main-title1 {
  margin-top: 10px;
  font-size: 20px;
}

.main-subtitle1 {
  margin-top: 10px;
}

.id-box{ /* 아이디 입력 */
 margin-top: 10px;
 font-size: 16px;
 width: 450px;
 height: 32px;
 border: solid 1.5px black;
  
}
.id-button{ /* 인증번호 발송버튼 */
width: 455px;
height: 37px;
color: white;
background: #4B5578;
border-radius: 7px;
}

.text-id { /* 아이디를 입력해주세요 칸 */

width: 445px;
height: 32px;
  

}

.email{
 width: 90px;
 height: 50px;
}

.text-email2{
 width: 445px;
 height: 32px;
  
}

</style>
</head>

<body>

  
  <div class="box">
  <div class="header">
  <div class="title"><b>비밀번호 찾기</b></div>
  </div>

<div class="info-find">
  <img class="email" src="${contextPath}/resources/image/email.jpg" alt="email">
  <div class="main-title1"><b>본인확인 이메일로 인증하기</b></div>
  <div class="id-box"><b>아이디 입력</b></div> 
  <form class ="user" action="findPw" method="post">
  <input type="text" class="text-id" id="member_id" name="member_id" placeholder="아이디를 입력해주세요"/> 
   <input type="email" class="text-email2" id="totalemail" name="totalemail"  placeholder="이메일을 입력 해주세요"/> 
  <button type="submit" class="id-button" onclick="location.href='/galgga/member/pw_find4.do';">확인</button>
  </form>
</div>
  </div>
</body>

</html>