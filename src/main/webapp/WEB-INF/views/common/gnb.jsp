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

.gnb_btn_box {
	width:1000px;
	background:rgba(119, 192, 161, 0.49);
	margin:25px auto;
	text-align:center;
}
.category_btn {
	border-radius:15px;
	display:inline-block;
	color:#222b27;
	font-size:13px;
	text-decoration:none;
    margin: 10px 35px;
	width:90px;
}
.category_btn:hover {
	background:linear-gradient(to bottom, #28c98b 5%, #c4fae6 100%);
	background-color:#28c98b;
}
.category_btn:active {
	position:relative;
	top:1px;
}

</style>
</head>
<body>
	<div class="gnb_btn_box">
		<a href="${contextPath }/lods/lodsCate.do?lod_category=camping" class="category_btn"><img src="${contextPath}/resources/image/camping2.png" width="60" height="40" style="margin:5px 5px 0px;"><b style="display:block; text-align:center;">캠핑</b></a>
		<a href="${contextPath }/lods/lodsCate.do?lod_category=glamping" class="category_btn"><img src="${contextPath}/resources/image/glamping.png" width="60" height="40" style="margin:5px 5px 0px;"><b style="display:block; text-align:center;">글램핑</b></a>
		<a href="${contextPath }/lods/lodsCate.do?lod_category=caravan" class="category_btn"><img src="${contextPath}/resources/image/caravan.png" width="60" height="40" style="margin:5px 5px 0px;"><b style="display:block; text-align:center;">카라반</b></a>
		<a href="${contextPath }/lods/lodsCate.do?lod_category=car" class="category_btn"><img src="${contextPath}/resources/image/car.png" width="60" height="40" style="margin:5px 5px 0px;"><b style="display:block; text-align:center;">차박</b></a>
		<a href="${contextPath }/goods/goodsCate.do" class="category_btn"><img src="${contextPath}/resources/image/item.png" width="60" height="50" style="margin:5px 5px 0px;"><b style="display:block; text-align:center;">캠핑용품</b></a>	</div>
</body>
</html>