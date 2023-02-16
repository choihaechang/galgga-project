<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

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
	margin-top: 20px;
	border: 0.4px solid #000000;
	width: 669px;
	height: AUTO;
	clear: both;
	margin: 20px;
}

.lod_img {
	width: 215px;
	height: 105px;
	margin: 6px 5px 5px 0px;
}

.siteName {
	font-size: 18px;
	font-weight: bold;
	width: 400px;
	display: block;
	padding-top: 5px;
}

.price {
	width: 100px;
	margin-left: 310px;
	font-size: 18px;
}

.button {
	background-color: white;
	border: 0px;
	width: 669px;
	height: 120px;
	cursor: pointer;
	text-align: left;
	display: flex;
	font-size: 15px;
}
</style>

</head>
<body>
	<div class="mainBody">
		<div class="lodlist">검색 결과</div>
		<c:choose>
			<c:when test="${not empty lodsList}">
				<c:forEach var="searchlist" items="${lodsList}">
					<div class="lod">
						<button class="button" type="button" onclick="location.href='${contextPath}/lods/lodsDetail.do?lod_id=${searchlist.lod_id}'">
							<img src="${contextPath}/lodThumbnails.do?lod_id=${searchlist.lod_id}&lod_imgName=${searchlist.lod_imgName}" alt="${searchlist.lod_name }" class="lod_img">
							<div>
								<div class="siteName">${searchlist.lod_name }</div>
								<br>
								<div class="lodInfo">${searchlist.lod_address }<br>
								</div>
								<br>
								<div class="price">${searchlist.lod_price}원~</div>
							</div>
						</button>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach var="searchlist" items="${goodsList}">
					<div class="lod">
						<button class="button" type="button" onclick="location.href='${contextPath}/goods/goodsDetail.do?goods_no=${searchlist.goods_no}'">
							<img src="${contextPath}/thumbnails.do?goods_no=${searchlist.goods_no}&fileType=${searchlist.fileType}&file_name=${searchlist.file_name}" class="lod_img" alt="이미지">
							<div>
								<div class="siteName">${searchlist.goods_name }</div>
								<br>
								<div class="price">${searchlist.goods_price}원~</div>
							</div>
						</button>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>

</body>
</html>