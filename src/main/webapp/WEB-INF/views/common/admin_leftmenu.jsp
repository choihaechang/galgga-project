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
.AdminMainBox {
	  width: 1000px;
	  height: auto;
	  margin: auto;	
	  padding-bottom: 10px;
	  display:flex;
	}
	
.pageName{
		width: 120px;
		height: 45px;
		font-family: 'Inter';
		font-style: normal;
		font-weight: 400;
		font-size: 30px;
		line-height: 36px;		
		color: #000000;
		text-align:center;    
}

.line{
	margin-top: 0px;
    border: 1px solid;
}
.AdminSubBox{
	  width: 120px;
	  height: auto;
	  padding-bottom: 10px;
}

.leftMenu{
     border: 1px solid;
     width: 118px;
  	 text-align: center;
  	 margin-top: 50px;
  	 margin-right:13px;
}

.textBox{
    border-bottom: 1px dashed #000000;
    width: auto;
  	text-align: center;
  	padding:5px;
  	font-size: 15px;
}

.textBox2{
    width: auto;
  	text-align: center;
  	padding:5px;
  	font-size: 15px;
}

.AdminRightBox {
	  width: 100%;
	  padding-bottom: 10px;
	  margin-top:75px;
	  margin-left:20px;
  }
  
  
 table {
  width: 100%;
  border-top: 2px solid #000000;
  border-bottom: 1px solid #000000;

  margin: auto;
  
  border-collapse: collapse;
  border-left: non;
  border-right: non;
  margin-bottom: 50px;
  }
  th{
  font-size:15px;
  padding-top:10px;
  padding-bottom:10px;
  background-color: aliceblue;
  }
  td{
  font-size:15px;
  padding:10px;
  }
  th, td {
  border-bottom: 1px solid #000000;
 
  text-align: center;
  }
    th:first-child, td:first-child {
    border-left: none;
    }
  
  
article{

display: flex;
}


</style>
</head>
<body>

	<div class="AdminSubBox">
		<div class="pageName">관리자<p class="line"/></div>
	
		<div class="leftMenu">
			<div class="textBox"><a class="text" href="${contextPath }/admin/admin_BusinessList.do">사업자 관리</a><br></div>
			<div class="textBox"><a class="text" href="${contextPath }/admin/goods/admin_GoodsList.do">상품 관리</a><br></div>
			<div class="textBox2"><a class="text" href="${contextPath }/admin/admin_boardList.do">1:1문의 관리</a><br></div>
		</div>
		
	</div>

</body>
</html>