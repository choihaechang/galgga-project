<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

table {
  width: 100%;
  border-top: 2px solid #000000;
  border-bottom: 1px solid #000000;

  margin-bottom: 50px;
  
  border-collapse: collapse;
  border-left: none;
  border-right: none;
}

tbody{
	font-size:14px;
}

th {
	height: 52px;
    border-bottom: 1px solid #000000;
}

td {
    padding: 10px;
    border-bottom: 1px solid #cecece;
    text-align: center;
}

.myPageMainBox {
	width: 720px;
	height: auto;
	margin: auto;
	padding-bottom: 10px;
	display: flex;
}

.pageName {
	width: 120px;
	height: 45px;
	font-family: 'Inter';
	font-style: normal;
	font-size: 24px;
	line-height: 36px;
	color: #000000;
	text-align: center;
	
}

.pageName_2{
font-size:23px;
margin-bottom: 10px;
}

.myPageSubBox {
	width: 120px;
	height: auto;
	padding-bottom: 10px;
}

.line{
	margin-top: 0px;
    border: 1px solid;
}

.leftMenu {
	border: 1px solid;
	width: 118px;
	text-align: center;
	margin-top: 50px;
	margin-right: 13px;
}

.textBox {
	border-bottom: 1px dashed #000000;
	width: auto;
	text-align: center;
	padding: 10px;
	font-size: 15px;
}

.textBox2{
	width: auto;
	text-align: center;
	padding: 10px;
	font-size: 15px;
}

.myPageRightBox {
	  width: 100%;
	  padding-bottom: 10px;
	  margin-top:55px;
	  margin-left:20px;
 }
 
 article{
display: flex;
}
 

</style>
</head>
<body>
	<div class="myPageSubBox">
		<div class="pageName">마이페이지<p class="line"/></div>
		<div class="leftMenu">
			<div class="textBox"><a class="text" href="${contextPath}/member/UpdateView.do">회원정보수정</a><br></div>
			<div class="textBox"><a class="text" href="${contextPath}/order/reserveChkList.do">숙소예약확인</a><br></div>
			<div class="textBox"><a class="text" href="${contextPath}/order/myOrderList.do?member_id=${memberInfo.member_id}">주문목록</a><br></div>
			<div class="textBox"><a class="text" href="${contextPath}/cart/myCartList.do?m_id=${memberInfo.m_id}">장바구니</a><br></div>
			<div class="textBox"><a class="text" href="${contextPath}/lodCart/lodCartList.do?m_id=${memberInfo.m_id}">숙소 찜</a><br></div>
			<div class="textBox2"><a class="text" href="${contextPath}/board/boardlist.do">1:1 문의</a><br></div>
		
		</div>
	</div>
</body>
</html>