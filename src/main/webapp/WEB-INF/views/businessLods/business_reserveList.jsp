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

  
  /*--------------AdminRightBox------------*/
  a{
  text-decoration:none;
  }
  
   .businessRightBox{
      width: 100%;
	  height: 550px;				/*높이 나중에 오토로 변경 예정*/
	  padding-bottom: 10px;
	  display: inlin-flex;
  }
  
  .pageName_1{
  font-weight:bold;
  font-size: 25px;
  margin-bottom: 20px;
  display: flex;
  }

  
  .pageName_2{
  margin-left: 5px;
  font-weight:bold;
  font-size: 23px;
  margin-bottom: 10px;
 
  }

 
  </style>

</head>
<body>
<div class="businessRightBox">
	<div class="pageName_2" >예약 리스트 확인</div>
		<table>
		<thead>
			<tr style="background:aliceblue;">
				<th>숙소 이름</th>
				<th>객실 이름</th>
				<th>예약자</th>
				<th>체크인</th>
				<th>체크아웃</th>
				<th>핸드폰 번호</th>
			</tr>
		</thead>
		
		 <c:choose>
		<c:when test="${empty myLodsReserveList}"> 
		<tbody>
			<tr>
				<td colspan="6">
					예약자가 없습니다.
					
				</td>
			</tr>
		</tbody>
		 </c:when>
		
		
		<c:otherwise>
		<c:forEach var="item" items="${myLodsReserveList}">
			<tbody>
				<tr>	
					<td>${item.lod_name}</td>	
					<td>${item.unit_name}</td>
					<td>${item.member_name}</td>
					<td><fmt:parseDate value="${item.checkIn_date}" var="date" pattern="yy-MM-dd"/><fmt:formatDate value="${date}" pattern="yy-MM-dd"/></td>
					<td><fmt:parseDate value="${item.checkOut_date}" var="date" pattern="yy-MM-dd"/><fmt:formatDate value="${date}" pattern="yy-MM-dd"/></td>
					<td>${item.phone1}-${item.phone2 }-${item.phone3 }</td>		
				</tr>
			</tbody>
		</c:forEach>
		</c:otherwise>
		</c:choose>
	</table>
		</div>
</body>
</html>