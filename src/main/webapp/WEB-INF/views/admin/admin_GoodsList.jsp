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
<script src="//code.jquery.com/jquery.min.js"></script>


<style>

  /*--------------AdminRightBox------------*/

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
  }
  td{
  font-size:15px;

  }
  th, td {
  border-bottom: 1px solid #000000;
 
  text-align: center;
  }
    th:first-child, td:first-child {
    border-left: none;
    }
    
    .myButton {
	box-shadow: 0px 0px 0px 2px #4f5f8c;
	background:linear-gradient(to bottom, #6f88b3 5%, #4b5578 100%);
	border-radius:7px;
	border:1px solid #6880c7;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-size:16px;
	font-weight:bold;
	padding:7px;
	text-decoration:none;
	margin: auto;	
}
	.myButton{
	
	
	}
.myButton:hover {
	background:linear-gradient(to bottom, #4b5578 5%, #6f88b3 100%);
	background-color:#4b5578;
}
.myButton:active{
	position:relative;
	top:1px;
}
  </style>

</head>
<body>
<div class="AdminRightBox">
	<div class="pageName_2">상품 관리</div>
	<table>
		<thead>
			<tr>
				<th>상품 번호</th>
				<th>상품 이름</th>
				<!-- <th>남은 수량</th> -->
				<th>등록 일시</th>
				<th>상품 가격</th>
				<th>할인 가격</th>
			</tr>
		</thead>
		<c:choose>
		<c:when test="${empty goodsList}">
		<tbody>
			<tr>
				<td colspan="6">등록된 숙소가 아직 없습니다.</td>
			</tr>
		</tbody>
		</c:when>
		<c:otherwise>
		<c:forEach var="item" items="${goodsList}" varStatus="cnt">
		<tbody>
			<tr>
				<td style="padding:5px;">${item.goods_no}</td>
				<td><a href="${contextPath}/goods/goodsDetail.do?goods_no=${item.goods_no}">${item.goods_name}</a></td>
				<%-- <td>${fn:length(item)}</td> --%>
				<td>${item.goods_addDate}</td>
				<td><fmt:formatNumber value="${item.goods_price}" type="number"/>원</td>
				<td><fmt:formatNumber value="${item.goods_price-(item.goods_price*item.goods_discount*0.01)}" type="number"/>원</td>
			</tr>
		</tbody>
		</c:forEach>
		</c:otherwise>
		</c:choose>
	</table>
	<div style="width: 98px; margin: 0 auto;">
		<a href="${contextPath }/admin/admin_addGoods.do" class="myButton">상품등록</a>
	</div>
	<div>
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