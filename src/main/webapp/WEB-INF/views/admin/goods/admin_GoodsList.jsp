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

.myButton {
	border-radius: 7px;
    color: white;
    background: #4B5578;
    font-size: 14px;
    margin-left: 10px;
    border: 2px solid #000000;
    padding: 3px;
}

.search_btn{
	display: flex;
  	margin-left:60px;
}
#searchBtn{
	background: #4B5578;
    border-radius: 7px;
    color: white;
    width: 60px;
    margin-left:5px;
    cursor:pointer;
  }
  
#keywordInput{
  width: 450px;
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
				<th>상품명</th>
				<th>상품 가격</th>
				<th>할인 가격</th>
				<th>등록 일시</th>
			</tr>
		</thead>
		<c:choose>
		<c:when test="${empty goodsList}">
		<tbody>
			<tr>
				<td colspan="5">등록된 상품이 없습니다.</td>
			</tr>
		</tbody>
		</c:when>
		<c:otherwise>
		<c:forEach var="item" items="${goodsList}" varStatus="cnt">
		<tbody>
			<tr>
				<td style="">${item.goods_no}</td>
				<td><a href="${contextPath}/admin/goods/goodsUpdateForm.do?goods_no=${item.goods_no}">${item.goods_name}</a></td>
				<%-- <td>${fn:length(item)}</td> --%>
				<td><fmt:formatNumber value="${item.goods_price}" type="number"/>원</td>
				<td><fmt:formatNumber value="${item.goods_price-(item.goods_price*item.goods_discount*0.01)}" type="number"/>원</td>
				<td><fmt:parseDate value="${item.goods_addDate}" var="date" pattern="yyyy-MM-dd" /><fmt:formatDate value="${date}" pattern="yyyy-MM-dd" />
			</tr>
		</tbody>
		</c:forEach>
		</c:otherwise>
		</c:choose>
	</table>
	<div class="search_btn">
		<select name="searchType" style="height: 30px;">
			<option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : '' }"/>>상품번호+상품명</option>
			<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : '' }"/>>상품번호</option>
			<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : '' }"/>>상품명</option>	
		</select>
		
		<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" />
		
		<button id="searchBtn" type="submit">검색</button>
		<a href="${contextPath }/admin/admin_addGoods.do" class="myButton">상품등록</a>
		<script>
			$(function(){
				$('#searchBtn').click(function(){
					self.location = "admin_GoodsList.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
					
				});
			});
		</script>
	</div>
	<div style="text-align:center; margin-top:50px;">
		<c:if test="${pageMaker.prev}">
    				<a href="admin_GoodsList.do${pageMaker.makeSearch(pageMaker.startPage- 1)}">이전</a>
   			    </c:if> 

			    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			    	<a href="admin_GoodsList.do${pageMaker.makeSearch(idx)}">${idx}</a>
			    </c:forEach>

			    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			    	<a href="admin_GoodsList.do${pageMaker.makeSearch(pageMaker.endPage+ 1)}">다음</a>
		</c:if>
	</div>
</div>
</body>
</html>