<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="myPageRightBox">
	<div class="pageName_2">주문 목록</div>
	<table>
		<thead>
			<tr style="background:aliceblue;">
				<th colspan="2">상품정보</th>
				<th>주문일자</th>
				<th>주문번호</th>
				<th>주문금액(수량)</th>
				<th>주문상태</th>
			</tr>
		</thead>
		<c:choose>
		<c:when test="${empty orderList}">
		<tbody>
			<tr>
				<td colspan="6">주문 상품이 없습니다.</td>
			</tr>
		</tbody>
		</c:when>
		<c:otherwise>
		<c:forEach var="item" items="${orderList}" varStatus="cnt">
			<tbody style="font-size:14px;">
				<tr>
					<td colspan="2">
						<div>
							<img src="${contextPath}/thumbnails.do?goods_no=${item.goods_no}&fileType=${item.fileType}&file_name=${item.file_name}" alt="이미지" >
						</div>
						<ul>
							<li>${item.goods_name}</li>
							<li>옵션</li>
						</ul>
					</td>
					<td><fmt:parseDate value="${item.orderDate }" var="date" pattern="yyyy-MM-dd" /><fmt:formatDate value="${date}" pattern="yyyy-MM-dd" />
					<td>${item.order_no}</td>
					<td><fmt:formatNumber value="${item.goods_price-(item.goods_price*item.goods_discount*0.01)}" type="number"/>원(${item.order_qty}개)</td>
					<td>주문 상태</td>
				</tr>
			</tbody>
		</c:forEach>
		</c:otherwise>
		</c:choose>
	</table>
	<div style="text-align:center;">
		<c:if test="${pageMaker.prev}">
			<a href="${contextPath }/admin/goods/admin_GoodsList.do?page=${pageMaker.startPage-1}">prev &nbsp;</a>
		</c:if>
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
			<a href="${contextPath }/admin/goods/admin_GoodsList.do?page=${pageNum}">${pageNum}</a>
		</c:forEach>
		<c:if test="${pageMaker.next}">
			<a href="${contextPath }/admin/goods/admin_GoodsList.do?page=${pageMaker.endPage+1}">&nbsp; next</a>
		</c:if>
	</div>
</div>
</body>
</html>