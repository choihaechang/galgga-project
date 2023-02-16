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
	width: 720px;
	margin: auto;
	}

    .addMemberText{

    width: 140px;
    height: 45px;
	margin-left:30px;
	margin-bottom:20px;
    font-family: 'Inter';
    font-style: normal;
    font-weight: 400;
    font-size: 30px;
    line-height: 36px;
    
    color: #000000;
    }
    
    .selectbox{
    width: 720px;
	margin-bottom: 20px;
	text-align:center;
    background: #FFFFFF;
    border: 0.2px solid #000000;
    box-sizing: border-box;
    }

    .selectTxt{
	  margin: 5px auto;
      height: 45px;
      font-family: 'Inter';
      font-style: normal;
      font-weight: 1000;
      font-size: 24px;
      line-height: 36px;
      text-align: center;
      color: #000000;
    }
    
    .selectTxt2{
	  margin: auto;
      height: 18px;
      font-family: 'Inter';
      font-style: normal;
      font-weight: 400;
      font-size: 15px;
      line-height: 18px;
      text-align: center;
      color: #000000;
    }
    
    .myButton {
      	
    	background: #4B5578;
    	border-radius:7px;
    	border:1px solid black;
    	display:inline-block;
    	cursor:pointer;
    	color: white;
    	font-family:Arial;
    	font-size:20px;
    	font-weight:bold;
    	padding:15px 30px;
    	text-decoration:none;
   
    	
    }
    .myButton:hover {
    	background:linear-gradient(to bottom, #4b5578 5%, #6f88b3 100%);
    	background-color:#4b5578;
    }
    .myButton:active {
    	position:relative;
    	top:1px;
    }
    .selectButton{
		width: 150px;
		margin: 20px auto;
    }
    
  </style>
</head>
<body>


<div class="main">
 <div class="addMemberText">회원 가입</div>
  <div class="selectwrap">
  <div class="selectbox">
    <div><img style="width:140px; height:80px margin-top:5px;" src="${contextPath}/resources/image/normal.JPG" alt="일반회원"/></div>
      <div class="selectTxt">개인회원</div>
      <div class="selectTxt2">만 14세 이상</div>
      <div class="selectButton">
      		<a href="${contextPath }/member/addMemberWrite.do" class="myButton">회원 가입</a>
      </div>
  </div>

    <div class="selectbox">
    <div><img style="width:140px; height:80px; margin-top:5px;" src="${contextPath}/resources/image/businessPerson.JPG" alt="사업자"/></div>
      <div class="selectTxt">사업자 회원</div>
      <div class="selectTxt2">사업자 등록증을 보유한 회원</div>
      <div class="selectButton">
      <a href="${contextPath }/member/addbusinessperson.do" class="myButton">회원 가입</a>
      </div>
  </div>
  
  <div class="selectbox">
    <div><img style="width:140px; height:80px; margin-top:5px;" src="${contextPath}/resources/image/admin.PNG" alt="관리자"/></div>
      <div class="selectTxt">관리자</div>
      <div class="selectTxt2">관리권한을 보유한 관리자</div>
      <div class="selectButton">
      <a href="${contextPath }/admin/addAdmin.do" class="myButton">회원 가입</a>
      </div>
  </div>
  
  </div>
</div>

</body>
</html>