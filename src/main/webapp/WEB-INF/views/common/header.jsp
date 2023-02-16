<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="//code.jquery.com/jquery.min.js"></script>
<title>Insert title here</title>
<script>
function btn(p) {
	if(p=='member_id') {
		if(confirm('정말 로그아웃 하시겠습니까?')){
		location.href='${contextPath}/member/logout.do';
		} return;
	} else if(p=='business') {
		if(confirm('정말 로그아웃 하시겠습니까?')){
		location.href='${contextPath}/business/logout.do';
		} return;
	} else  {
		if(confirm('정말 로그아웃 하시겠습니까?')) {
		location.href='${contextPath}/admin/logout.do';
		} return;
	}			
}
</script>
<style>
article{
width: 1000px;
margin: 0px auto;
}

a {
	text-decoration:none;
	color:#000000;
}
.head_btn, #logout_btn {
	text-decoration:none;
	margin-right:10px;
	color:black;
	font-size:14px;
	background:#FFFFFF;
	border:none;
	cursor:pointer;
}
.nav {
	margin-right:10px;
	float:right;
	color:black;
}
ul {list-style:none;}

#head_btn {
	display:list-item;
    float:left;  
}

li.head_btn {
	display:list-item;
    float:left; 
	padding-top:1.5px;
	cursor:default;
}

#headbox1 {
	position:relative;
	width:1000px;
	height:108px;
	margin: 0px auto 30px;
    padding: 0px;
}
.headbox2 {
	position:relative;
	height:70px;
	top:40px;
	background: rgba(119, 192, 161, 0.49);
}
.logo {
	margin-left:10px;
	float:left;
}
.title1 {
	margin-left:10px;
	float:left;
}
.search {
    width: 300px;
    position: relative;
    display: flex;
    margin-left: 620px;
    top: 18px;
    }

.searchTerm {
	width: 300px;
    border: 3px solid #C4C4C4;
    border-right: none;
    padding: 5px;
    height: 20px;
    border-radius: 5px 0 0 5px;
    outline: none;
    color: #C4C4C4;
}

.searchTerm:focus{
    color: #000000;
}

.searchButton {
    width: 40px;
    height: 36px;
    border: 1px solid #C4C4C4;
    background: #C4C4C4;
    text-align: center;
    color: #fff;
    border-radius: 0 5px 5px 0;
    cursor: pointer;
    font-size: 20px;
}

</style>
</head>
<body>
<header>
<div id="headbox1">
	<div class="nav">
		<c:choose>
		<c:when test="${isLogOn==true and not empty memberInfo }">
		<div class="headtext">
			<ul>
				<li class="head_btn">${memberInfo.member_name}님 반갑습니다!</li>
				<li id="head_btn"><a class="head_btn" href="${contextPath }/order/reserveChkList.do">마이페이지</a></li>
				<li id="head_btn"><a class="head_btn" href="${contextPath }/board/boardlist.do">1:1문의</a></li>
				<li id="head_btn"><button id="logout_btn" onclick="javascript:btn('member_id');">로그아웃</button></li>
				<li id="head_btn"><a class="head_btn" href="#">사이트맵</a></li>
			</ul>
			</div>
		</c:when>
		
		<c:when test="${isLogOn==true and not empty businessInfo }">
		<div class="headtext">
			<ul>
				<li class="head_btn">${businessInfo.business_id}님 반갑습니다!</li>
	   			<li id="head_btn"><a class="head_btn" href="${contextPath }/businessLods/business_main.do">사업자</a></li>
				<li id="head_btn"><button id="logout_btn" onclick="javascript:btn('business');">로그아웃</button></li>
				<li id="head_btn"><a class="head_btn" href="#">사이트맵</a></li>
			</ul>
		</div>
	</c:when>
	<c:when test="${isLogOn==true and not empty adminInfo }">
		<div class="headtext">
			<ul>
				<li class="head_btn">${adminInfo.admin_name}님 반갑습니다!</li>
	   			<li id="head_btn"><a class="head_btn" href="${contextPath }/admin/admin_BusinessList.do">관리자</a></li>
	   			<li id="head_btn"><a class="head_btn" href="${contextPath }/admin/admin_boardList.do">1:1문의</a></li>
				<li id="head_btn"><button id="logout_btn" onclick="javascript:btn('admin');">로그아웃</button></li>
				<li id="head_btn"><a class="head_btn" href="#">사이트맵</a></li>
			</ul>
		</div>
	</c:when>
	<c:otherwise>
		<div class="headtext">
			<ul>
				<li id="head_btn"><a class="head_btn" href="${contextPath }/member/loginForm.do">로그인</a></li>
				<li id="head_btn"><a class="head_btn" href="${contextPath }/member/selectAdd.do">회원가입</a></li>
				<li id="head_btn"><a class="head_btn" href="${contextPath }/board/boardlist.do">1:1문의</a></li>
				<li id="head_btn"><a class="head_btn" href="#">사이트맵</a></li>
			</ul>
			</div>
		</c:otherwise>
		</c:choose>
   	</div>
	<div class="headbox2">
		<div class="logo"><a href="${contextPath }/main/main.do"><img width="96" height="69" alt="logo" src="${contextPath}/resources/image/camping.JPG" /></a></div>
		<div class="title1"><h2>캠핑갈까</h2></div>
    		<div class="search">
    			<form id ="searchForm" action="${contextPath }/lods/lodsSearch.do" method="get" style="display:flex; margin-top:-35px;">
      			<input type="text" name="keyword" id="lodSearch" class="searchTerm" placeholder="숙소,상품 검색">
      			<button type="submit" class="searchButton"><img src="${contextPath}/resources/image/searchlook.png" width="30" height="30" /></button>     	
      			</form>	
    	    </div>
	</div>	
</div>
</header>
</body>
</html>