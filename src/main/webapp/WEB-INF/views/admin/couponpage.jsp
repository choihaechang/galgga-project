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
    height: 51px;
    text-align: center;
   
   
  }


  
  /*------------------쿠폰 확인---------------------*/
  .couponChk{
    font-size: 20px;
    height: 400px;
    width: 550px;
    margin-left: 170px;
    margin-top: 50px;
  }
  

  table {
    width: 100%;
    border-top: 2px solid #000000;
    border-bottom: 1px solid #000000;
    margin: auto;
    border-collapse: collapse;
    border-left: none;
    border-right: none;
    text-decoration: none;
    color: black;
    margin-bottom: 20px;
  }
  th{
    font-size:15px;
    padding-top:10px;
    padding-bottom:10px;
    text-decoration: none;
    color: black;
  }
  td{
    text-decoration: none;
    color: black;
    font-size:15px;

  }
  th, td {
    border-bottom: 1px solid #000000;
    text-decoration: none;
    color: black;
    text-align: center;
    }
  th:first-child, td:first-child {
    border-left: none;
    text-decoration: none;
    color: black;
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
  
  
  .adminleftbox { 
  margin-top: 130px;
  float: left;
  width: 140px;
  height: 240px;
  border: 1px solid black;
  top: 255px;
  }

  .leftbox1 {  
  margin: 7px auto;
  width: 140px;
  height: 32px;
  text-align:center;
  border-bottom: 0.2px dashed #000000;
  }

  .leftbox2 { 
  margin: 7px auto;
  width: 140px;
  height: 32px;
  text-align:center;
  border-bottom: 0.2px dashed #000000;
  }

  .leftbox3 {  
  margin: 7px auto;
  width: 140px;
  height: 32px;
  text-align:center;
  border-bottom: 0.2px dashed #000000;
  }
 
  .leftbox4 {  
  margin: 7px auto;
  width: 140px;
  height: 32px;
  text-align:center;
  border-bottom: 0.2px dashed #000000;
  }

  .leftbox5 { 
  margin: 7px auto;
  width: 140px;
  height: 32px;
  text-align:center;
  border-bottom: 0.2px dashed #000000;
  }

  .leftbox6 {  
  margin: 7px auto;
  width: 140px;
  height: 32px;
  text-align:center;
  }

  .lefttext1 { 
  font-size: 16px;
  color: black;
  text-decoration: none;
    
  }
  

  </style>
</head>

<body>

	<div class="couponPageBox">
	  <div class="pageName">관리자
	  <p class="line"></p>
	  </div>
      

      

	 	<div class="userName">admin</div>
	    <div class="userInfo">
	  </div>
  

  
	<div class="couponChk">
    <div class="eventtitle">쿠폰 관리</div>
   
		<table>
		<thead>
			<tr>
				<th>쿠폰 번호</th>
				<th>쿠폰 이름</th>
				<th>쿠폰 정보</th>		
			</tr>
		</thead>
		<tbody>	
			<tr> 
				<td><a href="${contextPath }/admin/couponupload.do">coupon.1</a></td>
				<td><a href="${contextPath }/admin/couponupload.do">5000원 할인쿠폰</a></td>
				<td><a href="${contextPath }/admin/couponupload.do">coupon info</a></td>
			</tr>

      <tr> 
				<td><a href="${contextPath }/admin/couponupload.do">coupon.2</a></td>
				<td><a href="${contextPath }/admin/couponupload.do">6000원 할인쿠폰</a></td>
				<td><a href="${contextPath }/admin/couponupload.do">coupon info</a></td>
			</tr>

      <tr> 
			<td><a href="${contextPath }/admin/couponupload.do">coupon.3</a></td>
				<td><a href="${contextPath }/admin/couponupload.do">8000원 할인쿠폰</a></td>
				<td><a href="${contextPath }/admin/couponupload.do">coupon info</a></td>
			</tr>

		</tbody>
	</table>
	</div>
		 
	 <button type="button" class="couponbutton">쿠폰등록</button>
</div>
  
</body>
</html>