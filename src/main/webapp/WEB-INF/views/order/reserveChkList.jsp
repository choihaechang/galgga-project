<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="reserve" value="${myReserveList}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$(".lodgingbutton").click(function(){
			if(confirm("예약 취소하시겠습니까?")){
				$("#rsvForm").submit();
			} return;
		});
	});
</script>
<style>

.lodgingbutton { /* 예약취소 버튼 */
	float: right;
	border-radius: 8px;
	width: 80px;
	height: 35px;
	color: white;
	background: #4B5578;
	cursor: pointer;
}



</style>
</head>

<body>
<div class="myPageRightBox">
	<div class="pageName_2">숙소 예약 확인</div>
	 <form method="post" action="reserve_remove" id="rsvForm">
			<table>
		<thead>
			<tr style="background:aliceblue;">
				<th>선택</th>
				<th>숙소 이름</th>
				<th>결제 일자</th>
				<th>예약 성함</th>
				<th>방문 예정일</th>
			</tr>
		</thead>
		
		<tbody>
		<c:forEach var="res" items="${reserve}">
			<tr> 
				<td><input type="checkbox" name="R_id" value="${res.r_id}"></td>
				<td><a href="/galgga/lods/lodsDetail.do?lod_id=${res.lod_id }">${res.lod_name }</a></td>
				<td><fmt:formatDate value="${res.reserve_date }" pattern="yyyy-MM-dd"/></td>
				<td>${res.member_name }</td>
				<td>${res.checkIn_date }</td>
			</tr>
		</c:forEach>				
		</tbody>
	</table>
		<button type="button" class="lodgingbutton">예약취소</button>
		</form>
	</div>
</body>
</html>  