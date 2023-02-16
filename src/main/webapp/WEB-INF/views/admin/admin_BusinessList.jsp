<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<div class="AdminRightBox">
	<div class="pageName_2">사업자 관리</div>
	
	<table>
		<thead>
			<tr>
				<th>등록번호</th>
				<th>아이디</th>
				<th>사업자 이름</th>
				<th>등록 날짜</th>
				<th>등록 상태</th>
			</tr>
		</thead>
		<c:choose>
		<c:when test="${empty businessList}">
		<tbody>
			<tr>
				<td colspan="5">
					등록된 사업자가 없습니다.
					
				</td>
			</tr>
		</tbody>
		 </c:when>
		
		
		<c:otherwise>
		<c:forEach var="item" items="${businessList}">
			<tbody>
				<tr onclick="location.href='${contextPath}/admin/admin_bnManage.do?business_id=${item.business_id }'" style="cursor:pointer;">	
					<td>${item.b_id}</td>
					<td>${item.business_id }</td>	
					<td>${item.business_name}</td>
					<td><fmt:parseDate value="${item.joinDate}" var="date" pattern="yyyy-MM-dd" /><fmt:formatDate value="${date}" pattern="yyyy-MM-dd" /></td>
					<td>${item.join_status}</td>
				</tr>
			</tbody>
		</c:forEach>
		</c:otherwise>
		</c:choose>
	</table>
	<div style="text-align:center;">
		<c:if test="${pageMaker.prev}">
			<a href="${contextPath }/admin/admin_BusinessList.do?page=${pageMaker.startPage-1}">prev &nbsp;</a>
		</c:if>
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
			<a href="${contextPath }/admin/admin_BusinessList.do?page=${pageNum}">${pageNum}</a>
		</c:forEach>
		<c:if test="${pageMaker.next}">
			<a href="${contextPath }/admin/admin_BusinessList.do?page=${pageMaker.endPage+1}">&nbsp; next</a>
		</c:if>
	</div>
</div>
</body>
</html>