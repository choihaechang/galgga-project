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
.businessMainBox {
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
.businessSubBox{
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
  	padding:8px;
  	font-size: 15px;
}

.textBox2{

    width: auto;
  	text-align: center;
  	padding:8px;
  	font-size: 15px;
}


  .pageName_2{
  margin-left:5px;
  font-weight:bold;
  font-size: 23px;
  margin-bottom: 10px;
  }

   .businessRightBox {
      margin-left:20px;
	  width: 100%;
	  padding-bottom: 10px;
	  margin-top:50px;
	 
  }
  
    
table {
  width: 98%;
  border-top: 2px solid #000000;
  border-bottom: 1px solid #000000;

  margin: 12px auto;
  margin-bottom: 40px;
  border-collapse: collapse;
  border-left: non;
  border-right: non;
  }
  th{
  font-size:15px;
  padding-top:10px;
  padding-bottom:10px;
  }
  td{
  font-size:12px;
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

	<div class="businessSubBox">
		<div class="pageName">사업자<p class="line"/></div>
	
		<div class="leftMenu">
			<div class="textBox"><a class="text" href="${contextPath }/businessLods/business_main.do">숙소 등록</a></div>
			<div class="textBox2"><a class="text" href="${contextPath }/businessLods/business_reserveList.do">예약 확인</a></div>
			
		</div>
	</div>

</body>
</html>