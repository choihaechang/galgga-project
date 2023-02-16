<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
	
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.myPageBox{
 
  width: 100%;
  height: 700px;
  margin: auto;	
  margin-left:20px;
  margin-top:55px;
  padding-bottom: 10px;
  }
.pageName_2{
    font-size: 23px;
    margin-bottom: 10px;
}
 

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div class="myPageBox">
		<div class="likeBox">
		<div class="campingNameChk">
		<div class="pageName_2">숙소 찜 확인</div>
		<table id="cartList">
		<thead>
			<tr style="background:aliceblue;">
				<th style="width: 70px;">번호</th>
				<th style="width: 70px;">숙소 이름</th>
				<th style="width: 70px;">주소</th>
				<th style="width: 70px;">가격</th>
				<th style="width: 70px;">찜<br>담은 날짜</th>
			</tr>
		</thead>
		<c:choose>
		<c:when test="${empty lodCartList }">
		<tbody>
			<tr style="text-align: center; font-size: 18px; height: 70px;">
				<td colspan="5">
					<strong>찜 목록이 아직 없습니다.</strong>
				</td>
			</tr>
		</tbody>
		</c:when>
		<c:otherwise>
		<tbody>
		<c:forEach var="lodCart" items="${lodCartList}" varStatus="status">
			<tr>
				<td>${fn:length(lodCartList) - status.index}</td>
				<td><a href="${contextPath}/lods/lodsDetail.do?lod_id=${lodCart.lod_id }">${lodCart.lod_name}</a></td>
				<td>${lodCart.lod_address }</td>
				<td>${lodCart.lod_price }</td>
				<td><fmt:formatDate value="${lodCart.lodcart_add }" pattern="yyyy-MM-dd"/></td>
			</tr>
		</c:forEach>
		</tbody>
		</c:otherwise>
		</c:choose>
	</table>
	</div>
	</div>
	</div>


</body>
</html>