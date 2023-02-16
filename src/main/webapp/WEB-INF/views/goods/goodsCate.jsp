<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
a {
	text-decoration: none;
}

.mainBody {
	/* border: 1px solid #000000; */
	width: 720px;
	margin: auto;
}
/*-----------이미지, 인포--------*/
.camping {
	padding: 7px;
	padding-left: 8px;
	border: 1px solid #000000;
	height: 190px;
	width: 700px;
	margin: auto;
	margin-bottom: 8px;
}

.campingMain {
	height: 175px;
	width: 335px;
	float: left;
}

.campingName {
	font-size: 18px;
	font-weight: bold;
	margin: 5px;
}

.address {
	font-size: 15px;
	padding-left: 5px;
}

.address1 {
	font-size: 15px;
	padding-left: 40px;
}
/*-----------예약 날짜---------*/
.reservationDate {
	padding-top: 7px;
	padding-left: 15px;
	height: 35px;
	width: 650px;
	border: 1px solid #000000;
	border-radius: 10px;
	font-size: 18px;
	margin: auto;
	margin-bottom: 8px;
}

.reserveDate {
	font-size: 18px;
	border-radius: 10px;
	padding-left: 45px;
}

.number {
	padding-left: 15px;
	height: 38px;
	width: 650px;
	border: 1px solid #000000;
	border-radius: 10px;
	margin: auto;
	margin-bottom: 8px;
}

.minus, .plus {
	cursor: pointer;
	width: 20px;
	height: 30px;
	background: #f2f2f2;
	border-radius: 4px;
	border: 1px solid #ddd;
	display: inline-block;
	text-align: center;
	font-size: 20px;
	margin: 0 auto;
	padding: 3px;
}


/*------------------main------------------*/
.lodlist {
	font-size: 18px;
	font-weight: bold;
	margin: 15px;
}

.lod {
	border: 0.4px solid #000000;
	width: 669px;
	height: 120px;
	margin: auto;
	margin: 20px auto;
}

.lod_img {
	width: 212px;
	height: 92px;
	margin: 5px 5px;
	float: left;
}

.siteName {
	font-size: 20px;
	font-weight: bold;
}

.price {
	float: right;
	margin-right: 10px;
	font-size: 20px;
}

.button{
    background-color: white;
    border: 0px;
    width : 669px;
    height: 120px;
    cursor: pointer;
    text-align:left;
    display:flex;
    font-size: 15px;
}
</style>

</head>
<body>
	<div class="mainBody">
		<div class="lodlist">캠핑 용품</div>
		<c:forEach var="item" items="${cateList}">
			<div class="lod">
				<button class="button" type="button" onclick="location.href='${contextPath}/goods/goodsDetail.do?goods_no=${item.goods_no}'">
					<img src="${contextPath}/thumbnails.do?goods_no=${item.goods_no}&fileType=${item.fileType }&file_name=${item.file_name}" class="lod_img">
					<div style="margin-top:10px;">
						<div class="siteName">${item.goods_name }</div>
						<br>
						<div class="price"><fmt:formatNumber value="${item.goods_price}" type="number" />원</div>
					</div>
				</button>
			</div>
		</c:forEach>
	</div>
	<div style="text-align:center; margin-top:50px;">
		<c:if test="${pageMaker.prev}">
			<a href="${contextPath }/goods/goodsCate.do?page=${pageMaker.startPage-1}">prev &nbsp;</a>
		</c:if>
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
			<a href="${contextPath }/goods/goodsCate.do?page=${pageNum}">${pageNum}</a>
		</c:forEach>
		<c:if test="${pageMaker.next}">
			<a href="${contextPath }/goods/goodsCate.do?page=${pageMaker.endPage+1}">&nbsp; next</a>
		</c:if>
	</div>
</body>
</html>