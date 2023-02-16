<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="cart"  value="${cartList}"  />
<c:set var="goodsImg"  value="${goodsImgList}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
function remove(){
	var form = $("#cartForm").serialize();
	
	$.ajax({
		type:"post",
		async:false,
		url:"${contextPath}/cart/removeCartGoods.do",
		data:form,
		success : function(data, textStatus) {
			alert("삭제되었습니다.");
		},
		error : function(data, textStatus) {
			alert("에러가 발생했습니다." + data);
		},
		complete : function(data, textStatus) {
			
		}
	});
}
<%--
function fn_order_all_cart_goods(){
//	alert("모두 주문하기");
	var order_qty;
	var goods_no;
	var objForm=document.frm_order_all_cart;
	var cart_goods_qty=objForm.cart_goods_qty;
	var h_order_each_goods_qty=objForm.h_order_each_goods_qty;
	var checked_goods=objForm.checked_goods;
	var length=checked_goods.length;
	
	
	//alert(length);
	if(length>1){
		for(var i=0; i<length;i++){
			if(checked_goods[i].checked==true){
				order_goods_no=checked_goods[i].value;
				order_qty=cart_goods_qty[i].value;
				cart_goods_qty[i].value="";
				cart_goods_qty[i].value=goods_no+":"+order_qty;
				//alert(select_goods_qty[i].value);
				console.log(cart_goods_qty[i].value);
			}
		}	
	}else{
		goods_no=checked_goods.value;
		order_qty=cart_goods_qty.value;
		cart_goods_qty.value=goods_no+":"+order_qty;
		//alert(select_goods_qty.value);
	}
		
 	objForm.method="post";
 	objForm.action="${contextPath}/order/orderAllCartGoods.do";
	objForm.submit();
}--%>
</script>
<style>
.myButton {
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
	<div class="pageName_2">장바구니</div>
	<table>
		<thead>
			<tr style="background:aliceblue;">
				<th>전체</th>
				<th><input type="checkbox"></th>
				<th colspan="2">상품정보</th>
				<th>상품가격</th>
				<th>수량</th>
				<th>주문금액</th>
				<th>주문관리</th>
				<th>배송비</th>
			</tr>
		</thead>
		<c:choose>
		<c:when test="${empty cart}">
		<tbody>
			<tr>
				<td colspan="9">장바구니에 상품이 없습니다.</td>
			</tr>
		</tbody>
		</c:when>
		<c:otherwise>
		<c:forEach var="item" items="${cart}" varStatus="cnt">
		
		<c:set var="x" value="${x+1 }"/>
		<form id="cartForm" action="${contextPath}/order/orderForm.do" method="post">
			<tbody style="font-size:14px;">
			
				<tr>
					<td>${item.cart_id}</td>
					<td><input type="checkbox" value="${item.cart_id}"></td>
					<td colspan="2">
						<a href="${contextPath}/goods/goodsDetail.do?goods_no=${item.goods_no}"><div>
							<c:if test="${goodsImg[cnt.index].fileType=='main' }">
								<img src="${contextPath}/thumbnails.do?goods_no=${item.goods_no}&fileType=${goodsImg[cnt.index].fileType}&file_name=${goodsImg[cnt.index].file_name}" alt="이미지" >
							</c:if>
						</div></a>
						<input type="hidden" value="${item.goods_no}" name="goods_no"><input type="hidden" value="${goodsImg[cnt.index].fileType}" name="fileType"><input type="hidden" value="${goodsImg[cnt.index].file_name}" name="file_name">
						<ul>
							<li><input type="hidden" value="${item.goods_name}" name="goods_name">${item.goods_name}</li>
							<li>옵션</li>
						</ul>
					</td>
					<td><input type="hidden" value="${item.goods_price}" name="goods_price"><fmt:formatNumber value="${item.goods_price}" type="number"/>원</td>
					<td><input type="hidden" value="${item.cart_goods_qty}" name="order_qty">${item.cart_goods_qty}개</td>
					<td><input type="hidden" value="${item.goods_discount}" name="goods_discount"><fmt:formatNumber value="${item.goods_price-(item.goods_price*item.goods_discount*0.01)}" type="number"/>원</td>
					<td><button type="button" class="btn" onclick="remove()">삭제</button><button type="submit" class="btn">주문하기</button></td>
					<td>{3000}(기본 배송비)</td>
				</tr>
				
			</tbody>
			</form>
		</c:forEach>
		
		</c:otherwise>
		</c:choose>
	</table>
	<button class="myButton" type="button" onclick="fn_order_all_cart_goods()">주문하기</button>
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