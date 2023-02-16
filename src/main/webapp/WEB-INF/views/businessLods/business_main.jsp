<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

    /*-----------버튼-----------  */
.myButton {
	background:#4B5578;
	border-radius:7px;
	border:none;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-size:14px;
	padding:7px;
	text-decoration:none;
	margin: auto;	
}

.button {
	float:right;
}
.btn {
	width: 50px;
	cursor: pointer;
	background: #7889c1;
	color:#FFFFFF;
	border:none;
	border-radius:5px;
}
  </style>

</head>
<body>
<div class="businessRightBox">
	<div class="pageName_2" >숙소 등록</div>
		<table>
		<thead>
			<tr>
				<th>숙소 아이디</th>
				<th>숙소 이름</th>
				<th>숙소 카테고리</th>
				<th>등록 날짜</th>
				<th>객실 추가</th>
			</tr>
		</thead>
		
		 <c:choose>
		<c:when test="${empty myLodsList}"> 
		<tbody>
			<tr>
				<td colspan="5">
					등록된 숙소가 아직 없습니다.
					
				</td>
			</tr>
		</tbody>
		 </c:when>
		
		
		<c:otherwise>
		<c:forEach var="item" items="${myLodsList}">
			<tbody>
				<tr>	
					<td><a href="${contextPath}/businessLods/lods.do?lod_id=${item.lod_id}" style="color: black;">${item.lod_id}</a></td>	
					<td><a href="${contextPath}/businessLods/lods.do?lod_id=${item.lod_id}" style="color: black;">${item.lod_name}</a></td>
					<td><a>${item.lod_category}</a></td>
					<td><a><fmt:formatDate value="${item.add_date}" pattern="yyyy-MM-dd"/></a></td>
					<td><form action="${contextPath }/businessLods/business_addUnit.do"><input type="hidden" name="lod_id" value="${item.lod_id}"><button type="submit" class="btn" >추가</button> </form></td>
				</tr>
			</tbody>
		</c:forEach>
		</c:otherwise>
		</c:choose>
	</table>
		<div class="button">
    		<a href="${contextPath }/businessLods/business_addLod.do" class="myButton">숙소 등록</a>
    	</div>
    </div>

</body>
</html>