<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입 선택 창</title>
<style>
	.main{
	width: 712px;
	margin: auto;

	}

    .addMemberText{

    width: 140px;
    height: 45px;
    margin-left: 80px;
    margin-top: 100px;
    font-family: 'Inter';
    font-style: normal;
    font-weight: 400;
    font-size: 30px;
    line-height: 36px;
    color: #000000;
    }
    
    .normalUser{

    width: 650px;
    height: 260px;
	  margin:  auto;
     
    background: #FFFFFF;
    border: 0.2px solid #000000;
    box-sizing: border-box;
    }
    .normalUserAdd{
    	margin: auto;
		width: 140px;
		height: 80px;
    }
    .normal{
  	  margin: 30px auto;
      width: 350px;
      height: 45px;
      font-family: 'Inter';
      font-style: normal;
      font-weight: 300px;
      font-size: 16px;
      line-height: 36px;
      text-align: center;
      color: #000000;
    }
    .normal1{
  
    margin: 20px auto;
    width: 350px;
    height: 45px;
    font-family: 'Inter';
    font-style: normal;
    font-weight: 300px;
    font-size: 16px;
    line-height: 36px;
    text-align: center;
    color: #000000;

    }
    .myButton {
    
    box-shadow: 0px 0px 0px 2px #4f5f8c;
    background: linear-gradient(to bottom, #6f88b3 5%, #4b5578 100%);
    background-color: #6f88b3;
    border-radius: 10px;
    cursor: pointer;
    color: #ffffff;
    font-family: Arial;
    font-size: 14px;
    font-weight: bold;
    padding: 8px 15px;
    width: 100px;
    text-decoration: none;
    text-shadow: 0px 0px 0px #283966;
    text-align: center;
  

    	
    }

    .myButton2 {
    box-shadow: 0px 0px 0px 2px #4f5f8c;
    background: linear-gradient(to bottom, #6f88b3 5%, #4b5578 100%);
    background-color: #6f88b3;
    border-radius: 10px;
    margin-left: 90px;
    cursor: pointer;
    color: #ffffff;
    font-family: Arial;
    font-size: 14px;
    font-weight: bold;
    padding: 8px 15px;
    width: 100px;
    text-decoration: none;
    text-shadow: 0px 0px 0px #283966;

    	
    }
    .myButton:hover {
    	background:linear-gradient(to bottom, #4b5578 5%, #6f88b3 100%);
    	background-color:#4b5578;
    }
    .myButton:active {
    	position:relative;
    	top:1px;
    }
    .normalButton{
    display: flex;
	  width: 350px;
    margin: auto;
    
    }
    

  </style>
</head>
<body>


<div class="main">
 <div class="addMemberText">회원 가입</div>
  <div class="normalUser">
    <div class="normalUserAdd"><img class="normalUserAdd" src="${contextPath}/resources/image/businessPerson.JPG" alt="사업자회원"/></div>
      <div class="normal">OOO님 회원가입이 성공적으로 완료 되었습니다</div>
      <div class="normalButton">
      		<a href="/galgga/main/main.do" class="myButton">메인으로가기</a>
        	<a href="/galgga/member/loginForm.do" class="myButton2">로그인하러가기</a>
      </div>
  </div>


  </div>
    

</body>
</html>