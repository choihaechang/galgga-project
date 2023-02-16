<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.couponPageBox{
  /*border: 1px solid #000000;*/
  width: 720px;
  height: 700px;
  margin: auto;	
  padding-bottom: 10px;
  }
   
  .pageName{
	  width: 120px;
    height: 45px;
    font-family: 'Inter';
    font-style: normal;
    font-weight: 400;
    font-size: 28px;
    line-height: 36px;
    color: #000000;
    margin-left: 0px;
    text-align: center;
    margin-top: 0px;
		    
  }
    .line{
  		margin-top: 0px;
  		margin-bottom: 40px;
      width: 120px;
      height: 0px;
      left: 0px;
      border: 1px solid;
  }
  
  /*-------------admin,쿠폰-----------------*/
  .userInfo{
    height: auto;
  
  }
  .userName{
    font-size: 20px;
    width: 130px;
    float: left;
    height: auto;
    text-align: center;
   
   
  }


  
  /*------------------쿠폰 확인---------------------*/
  .couponChk{
    font-size: 20px;
    height: 300px;
    width: 550px;
    margin-left: 170px;
    margin-top: 150px;
    border: solid 0.1px black;
  }

  .cptext{
    font-size: 18px;
    margin-top: 5px;
    margin-left: 5px;
  }

  .cptextbox{
    width: 500px;
    height: 32px;
    margin-top: 10px;
    margin-left: 23px;
  }
  .cpinfo{
    height: 190px;
    margin-top: 10px;
    margin-left: 23px;
    width: 500px;
  }
  



  .eventtitle{
    font-size: 23px;
    width: 120px;
    height: auto;
    margin-bottom: 5px;
  }
  
   .couponbutton{
    width: 90px;
    height: 40px;
    background: #4B5578;
    border-radius: 5px;
    color: white;
    margin-top: 5px;
    margin-left: 632px;
  
  }
  
    
 
  </style>
</head>

<body>

	<div class="couponPageBox">
	  <div class="pageName">관리자
	  <p class="line"></p>
	  </div>
	  
	 	<div class="userName">admin</div>
	    <div class="userInfo"></div>
  

  
	<div class="couponChk">
    <div class="cptext">쿠폰 등록</div>
    <input type="text" class="cptextbox" placeholder="쿠폰 제목"></input>
    <input type="text" class="cpinfo" placeholder="쿠폰 정보"></input>

	</div>
		 
   <button type="button" class="couponbutton">등록하기</button>
</div>
   
</body>
</html>