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
<style>

  /*--------------AdminRightBox------------*/
  
  table {
  width: 100%;
  border-top: 2px solid #000000;
  border-bottom: 1px solid #000000;

  margin-bottom: 50px;
  
  border-collapse: collapse;
  border-left: none;
  border-right: none;
  }
  th{
  font-size:15px;
  padding-top:10px;
  padding-bottom:10px;
  }
  td{
  font-size:15px;
  padding:5px;
  }
  th, td {
  border-bottom: 1px solid #000000;
 
  text-align: center;
  }
    th:first-child, td:first-child {
    border-left: none;
    }
  </style>

</head>
<body>
<div class="AdminRightBox">
	<div class="pageName_2">회원 관리</div>
	
	<table>
		<thead>
			<tr>
				<th>등록번호</th>
				<th>회원 아이디</th>
				<th>회원 이름</th>
				<th>가입 날짜</th>
				<th>회원 상태</th>
				<th></th>
			</tr>
		</thead>
		<c:choose>
		<c:when test="${empty memberList}"> 
		<tbody>
			<tr>
				<td colspan="5">
					등록된 회원이 없습니다.
					
				</td>
			</tr>
		</tbody>
		 </c:when>
		
		
		<c:otherwise>
		<tbody>
		<c:forEach var="item" items="${memberList}">
			<tr onclick="location.href='${contextPath}/admin/admin_memManage.do?member_id=${item.member_id}';" style="cursor:pointer;">
				<td>${item.m_id}</td>	
				<td>${item.member_id}</td>
				<td>${item.member_name}</td>
				<td><fmt:parseDate value="${item.joinDate}" var="date" pattern="yyyy-MM-dd" /><fmt:formatDate value="${date}" pattern="yyyy-MM-dd" /></td>
				<td>${item.join_status}</td>
				<td><input type="button" value="복구" onclick="fn_restore();"/></td>
			</tr>
		</c:forEach>
		</tbody>
		</c:otherwise>
		</c:choose>
	</table>
	<div style="text-align:center;">
		<c:if test="${pageMaker.prev}">
			<a href="${contextPath }/admin/admin_MemberList.do?page=${pageMaker.startPage-1}">prev &nbsp;</a>
		</c:if>
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
			<a href="${contextPath }/admin/admin_MemberList.do?page=${pageNum}">${pageNum}</a>
		</c:forEach>
		<c:if test="${pageMaker.next}">
			<a href="${contextPath }/admin/admin_MemberList.do?page=${pageMaker.endPage+1}">&nbsp; next</a>
		</c:if>
	</div>
</div>
</body>
</html>