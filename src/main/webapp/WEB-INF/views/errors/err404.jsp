<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fn_reload() {
			location.reload();
		}

</script>

<style>


.mainBox{
width: 720px;
margin:auto;
border: 1px solid #000000;

height: 500px;
}
.err{
width: 360px;
padding-top: 40px;
margin:auto;
margin-top: 80px;
font-size:30px;
border: 1px solid #ffffff;
}



.button{
	  margin-left: 50px;
		margin-top: 100px;
      width: 500px;

    }
    .myButton {
	box-shadow: 0px 0px 0px 2px #4f5f8c;
	background:linear-gradient(to bottom, #6f88b3 5%, #4b5578 100%);
	background-color:#6f88b3;
	border-radius:10px;
	border:1px solid #6880c7;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:18px;
	font-weight:bold;
	padding:14px 45px;
	text-decoration:none;
	text-shadow:0px 0px 0px #283966;
}
.myButton:hover {
	background:linear-gradient(to bottom, #4b5578 5%, #6f88b3 100%);
	background-color:#4b5578;
}
.myButton:active {
	position:relative;
	top:1px;
}

</style>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<div class="mainBox">
<div class="err">
Error 404가 발생했습니다.
</div>
	
	
	<div style="display:flex;">
	<div class="button">
    	<a href="${contextPath }/main/main.do" class="myButton">main으로 돌아가기</a>
    </div>
    
   <div class="button">
    	<button class="myButton" onclick="fn_reload">다시한번 시도하기</a>
   </div>
   </div>

</div>
<%@include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>