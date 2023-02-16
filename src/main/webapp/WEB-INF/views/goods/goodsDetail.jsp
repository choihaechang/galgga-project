<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="goods" value="${goodsMap.goodsVO}" />
<c:set var="image" value="${goodsMap.imageList}" />
<c:set var="review" value="${ reviewMap.reviewVO}" />
<c:set var="reviewImg" value="${reviewMap.reviewImg }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
$(document).ready(function() {

	//When page loads...
	$(".tab_content").hide(); //Hide all content
	$("ul.tabs li:first").addClass("active").show(); //Activate first tab
	$(".tab_content:first").show(); //Show first tab content

	//On Click Event
	$("ul.tabs li").click(function() {

		$("ul.tabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".tab_content").hide(); //Hide all tab content

		var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
		$(activeTab).fadeIn(); //Fade in the active ID content
		return false;
	});

});
</script>
<script type="text/javascript">
function addCart() {
	var form = $("#orderForm").serialize();
	
	$.ajax({
		type:"post",
		async:false,
		url:"${contextPath}/cart/addGoodsInCart.do",
		data:form,
		success : function(data, textStatus) {
			if(data.trim()=='add_success') {
				alert("장바구니에 담았습니다.");
				location.href="${contextPath}/goods/goodsDetail.do?goods_no=${goods.goods_no}";
			} else if(data.trim()=='already_existed') {
				alert("이미 카트에 등록된 상품입니다.");
			}
		},
		error : function(data, textStatus) {
			alert("에러가 발생했습니다." + data);
		},
		complete : function(data, textStatus) {
			
		}
	});
}

/*function imagePopup(type) {
	if (type == 'open') {
		// 팝업창을 연다.
		jQuery('#layer').attr('style', 'visibility:visible');

		// 페이지를 가리기위한 레이어 영역의 높이를 페이지 전체의 높이와 같게 한다.
		jQuery('#layer').height(jQuery(document).height());
	}

	else if (type == 'close') {

		// 팝업창을 닫는다.
		jQuery('#layer').attr('style', 'visibility:hidden');
	}
}*/
//수량변경
function qty(q){
	var countEl = document.getElementById("count");
	console.log("수량", countEl)
	if(q=='plus'){
    count++;
    countEl.value = count;
	} else if(q=='minus') {
		count--;
    	count = count < 0 ? 0 : count;
    	countEl.value = count;
	}
}

/* QA 작성  */
function QAadd(){
	var con = document.getElementById("QA");
	var don = document.getElementById("QAList");
	
	if(con.style.display=='none'){
		con.style.display='block';
	}else{
		con.style.display='none';
	}
	
	if(don.style.display=='none'){
		don.style.display='block';
	}else{
		don.style.display='none';
	}
}
/*
function QAUpdateForm(y){
	var content = "content"+y;
	var con = document.getElementById(content);
	var updateForm= "updateForm"+y
	var don = document.getElementById(updateForm);
	
	if(con.style.display=='revert'){
		con.style.display='none';
	}
	
	if(don.style.display=='none'){
		don.style.display='revert';
	}else{
		don.style.display='none';
	}
}

	function QAUpdate(y){
		var QAUpdateForm = "QAUpdateForm" + y;
		document.getElementById(QAUpdateForm).submit();
		
	}

	function add(){
		document.getElementById("QA").submit();
		var lod_id = ${lod.lod_id};
		alert("등록하였습니다.");
		
	}


	function test(y){
		var content = "content"+y;
		var updateForm = "updateForm"+y;
		var con = document.getElementById(content);
		var don = document.getElementById(updateForm);
		if(con.style.display=='none'){
			con.style.display='revert';
		}else{
			con.style.display='none';
		}
		
		if(don.style.display='revert'){
			don.style.display='none';
		}
	}
	*/
	function reviewadd(){
		var con = document.getElementById("review");
		var list = document.getElementById("reviewList")
		if(con.style.display=='none'){
			con.style.display='block';
		}else{
			con.style.display='none';
		}
		
		if(list.style.display=='none'){
			list.style.display='block';
		}else{
			list.style.display='none';
		}
		
	}

var count=0;
function addImg(){
	if (count==0){
		$("#imgfile").append("<br>"+"<input  type='file' name='imgName_main' id='imgName' style='height: 40px ' />");	  
	}else if(count == 1 || count < 10){
		$("#imgfile").append("<br>"+"<input  type='file' name='imgName_common"+count+"' id='imgName' style='height: 40px ' />");	  
	}
	count++;
}
	
/*	
	function addReview(){
		document.getElementById("review").submit();
	} */
</script>
<style>
.main_img {
	width: 500px;
	height: 500px;
	text-align: center;
	vertical-align: middle;
}

.tabs {
	padding: 0px;
	text-align: center;
	margin-bottom: 20px;
	padding-inline-start: 0px;
}

.tab_menu {
	display: table-cell;
	border: 1px solid #eeeddd;
	width: 200px;
	padding: 10px;
	float: none;
}

.tab_menu.active {
	background: #eeeddd;
}
.myButton {
	border-radius: 5px;
	border: 1px solid;
	display: inline-block;
	cursor: pointer;
	color: white;
    background: #4B5578;
	font-weight: bold;
}

.myButton2 {
	font-size:17px;
	padding:10px;
	border-radius: 5px;
	border: 1px solid;
	display: inline-block;
	cursor: pointer;
	color: white;
    background: #4B5578;
	font-weight: bold;
}

#count {
     width: 50px;
    height: 23px;
    padding: 0 2px 0 3px;
    line-height: 23px;
    border: 1px solid #d4d8d9;
    border-radius: 3px 0 0 3px;
}
#input_div {
	display: inline-block;
    position: relative;
    vertical-align: top;
}
#plus {
	position: absolute;
    left: 28px;
    top: 0;
}
#minus {
	position: absolute;
    left: 28px;
    top: 12px;
}
</style>
</head>
<body>
	
	<table style="width: 900px; margin: 0px auto;">
		<tbody>
			<tr>
				<c:forEach var="item" items="${image}" varStatus="cnt">
					<c:if test="${item.fileType=='main'}">
						<td class="main_img" rowspan="2"><img style="width:400px; height:400px;" alt="goods_img" src="${contextPath}/thumbnails.do?goods_no=${goods.goods_no}&fileType=${item.fileType}&file_name=${item.file_name}"></td>
					</c:if>
				</c:forEach>
				<td>
				<form id="orderForm" action="${contextPath}/order/orderForm.do" method="post">
					<table style="width: 100%;">
						<tbody>
							<tr>
								<input type="hidden" value="${goods.goods_no}" name="goods_no">
								<input type="hidden" value="${item.fileType}" name="fileType">
								<input type="hidden" value="${item.file_name}" name="file_name">
								<td colspan="2"><input type="text" value="${goods.goods_name}" name="goods_name" style="line-height: 50px; font-size: 20px; border: none; font-weight: bold;" readonly></td>
							</tr>
							<tr>
								<td style="width: 50%;">브랜드</td>
								<td><input type="hidden" value="${goods.goods_brand}" name="goods_brand">${goods.goods_brand}</td>
							</tr>
							<tr>
								<td>원가</td>
								<td><input type="hidden" value="${goods.goods_price}" name="goods_price"><fmt:formatNumber value="${goods.goods_price}" type="number" />원</td>
							</tr>
							<tr>
								<td>할인가</td>
								<td><input type="hidden" value="${goods.goods_discount}" name="goods_discount"><fmt:formatNumber value="${goods.goods_price-(goods.goods_price*goods.goods_discount*0.01)}" type="number" />원(${goods.goods_discount}% 할인)</td>
							</tr>
							<tr>
								<td></td>
								<td><button class="myButton" onclick="">쿠폰받기</button></td>
							</tr>
							<tr>
								<td>수량</td>
								<td>
									<div id="input_div">
										<input id="count" name="order_qty" value="1" type="number">
										<a href="javascript:qty('plus')"></a>
										<a href="javascript:qty('minus')"></a>
									</div>
								</td>
							</tr>
							<tr>
								<td><button class="myButton2" type="button" onclick="javascript:addCart()">장바구니</button></td>
								<td><button type="submit" class="myButton2">구매하기</button></td>
							</tr>
						</tbody>
					</table>
					</form>
				</td>
			</tr>
		</tbody>
		<tbody>
			<tr>
				<td><c:forEach var="item" items="${image}" varStatus="cnt">
						<c:if test="${item.fileType=='main' || item.fileType=='detail'}">
							<img alt="small_img" style="width: 50px; height: 50px;" src="${contextPath}/thumbnails.do?goods_no=${goods.goods_no}&fileType=${item.fileType}&file_name=${item.file_name}">
						</c:if>
					</c:forEach></td>
			</tr>
		</tbody>
	</table>
	<div class="tabbox">
		<ul class="tabs">
			<li class="tab_menu"><a href="#tab1">상품 정보</a></li>
			<li class="tab_menu"><a href="#tab2">Q & A</a></li>
			<li class="tab_menu"><a href="#tab3">리 뷰</a></li>
			<li class="tab_menu"><a href="#tab4">환불 안내</a></li>
		</ul>
	</div>
	<div class="tab-wrapper">
		<div class="tab_container">
			<div class="tab_content" id="tab1">
				<c:forEach var="item" items="${image}" varStatus="cnt">
					<c:if test="${item.fileType=='info_img'}">
						<img style="width: 700px;" alt="info_img" src="${contextPath}/thumbnails.do?goods_no=${goods.goods_no}&fileType=${item.fileType}&file_name=${item.file_name}">
					</c:if>
				</c:forEach>
			</div>
			<div class="tab_content" id="tab2">
				<div style="vertical-align: middle;">
					<a class="myButton2" onclick="QAadd()" style="margin-left: 620px;">Q & A 작성</a>
				</div>
					<form id="QA" action="${contextPath}/board/QA_add.do" style="display: none; width: 700px;" method="post">
					<table style="width: 708px;">
						<tr>
							<td style="width: 100px;">제목</td>
							<td><input name="QA_title" style="width: 392px;"></td>
						</tr>
						<tr>
							<td style="width: 100px;">작성자</td>
							<td><input name="member_id" style="width: 392px;" value="${memberInfo.member_id }"></td>

						</tr>
						<tr>
							<td style="width: 100px;">질문 내용</td>
							<td><textarea name="QA_content" style="width: 392px; height: 300px; resize: none;"></textarea></td>
							<td><input type="hidden" name="goods_no" value="${goods.goods_no }"></td>
							<td><input type="hidden" name="m_id" value="${m_id}"></td>
							<td><a class="myButton2" onclick="return add()" style="margin: 150px 0px 0px 0px;">Q & A 등록</a></td>
						</tr>
						<tr>
							<td colspan="2">
						
						</tr>

					</table>

				</form>

				<table
					style="width: 100%; text-align: center; border-collapse: collapse; resize: none;">
					<thead>
						<tr>
							<th style="width: 70px;">번호</th>
							<th style="width: 70px;">답변 여부</th>
							<th style="width: 272px;">제 목</th>
							<th style="width: 100px;">작성자</th>
							<th style="width: 100px;">등록 날짜</th>
							<td style="width: 90px;">수정 / 삭제</td>
						</tr>
					</thead>

					<c:choose>
						<c:when test="${empty QAList}">
							<tbody>
								<tr style="text-align: center; font-size: 18px; height: 70px;">
									<td colspan="5"><strong>등록된 Q & A 가 아직 없습니다.</strong></td>
								</tr>
							</tbody>
						</c:when>
						<c:otherwise>
							<c:forEach var="qa" items="${QAList}" varStatus="status">
								<c:set var="y" value="${y+1 }" />
								<tr>
									<td><a>${fn:length(QAList) - status.index}</a></td>
									<td>아직</td>
									<td><a onclick="return test(${y})"
										style="cursor: pointer;">${qa.QA_title }</a></td>
									<td>${qa.member_id }</td>
									<td><a><fmt:formatDate value="${qa.addDate }"
												pattern="yyyy-MM-dd" /></a></td>
									<td>
										<c:if test="${qa.member_id eq memberInfo.member_id }">
											<span><a style="cursor: pointer" onclick="QAUpdateForm(${y})" class="myButton3">내용 수정</a></span>
											<span><a style="cursor: pointer" onclick="location.href='${contextPath}/lods/QADelete.do?QA_id=${qa.QA_id}&lod_id=${lod.lod_id}'" class="myButton3">삭제</a></span>
										</c:if>
									</td>
								</tr>
								<tr style="text-align: center;">
									<td colSpan="5" style="text-align: center; display: none;" id="content${y}"><a>${qa.QA_content}</a></td>
								</tr>
								<tr style="text-align: center; display: none;" id="updateForm${y}">
									<td colSpan="5" style="text-align: center;">
										<form action="${contextPath}/lods/QAUpdate.do" id="QAUpdateForm${y}" method="post">
											<input type="hidden" name="QA_id" value="${qa.QA_id }">
											<input type="hidden" name="lod_id" value="${qa.lod_id }">
											<input type="hidden" name="m_id" value="${m_id }"> <input type="hidden" name="member_id" value="${memberInfo.member_id }"> <input type="hidden" name="QA_title" value="${qa.QA_title }">
											<textarea name="QA_content" style="resize: none; width: 380px; height: 50px; margin: 5px 0px 0px 0px;">${qa.QA_content} </textarea>
										</form>
									</td>
									<td><a style="cursor: pointer;" onclick="QAUpdate(${y})" class="myButton3">수정하기</a></td>
								</tr>


							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>



			</div>
			<div class="tab_content" id="tab3">
				<a style="cursor: pointer" onclick="reviewadd()" class="myButton2">리뷰 쓰기</a>
					<form style="display: none; margin-left: 90px;" id="review" action="${contextPath}/lods/addReveiw.do" method="post" enctype="multipart/form-data">
					<table>
						<tr>
							<td style="text-align: center;" colspan="2">
								<fieldset>
									<span class="text-bold">별점을 선택해주세요</span>
									<input type="radio" name="starpoint" value="5" id="rate1"><label for="rate1">★</label>
									<input type="radio" name="starpoint" value="4" id="rate2"><label for="rate2">★</label>
									<input type="radio" name="starpoint" value="3" id="rate3"><label for="rate3">★</label>
									<input type="radio" name="starpoint" value="2" id="rate4"><label for="rate4">★</label>
									<input type="radio" name="starpoint" value="1" id="rate5"><label for="rate5">★</label>
								</fieldset>
							</td>
						</tr>
						<tr>
							<td style="text-align: center;">리뷰 제목</td>
							<td><input type="text" name="review_title" style="width: 400px;"></td>
						</tr>
						<tr>
							<td>이용한 객실 :</td>
							<td></td>

						</tr>

						<tr>
							<td style="text-align: center;">리뷰 내용</td>
							<td><textarea name="review_content" style="resize: none; width: 400px; height: 200px;"></textarea></td>
							<td><input type="hidden" name="lod_id" value="${lod.lod_id }"></td>
						</tr>
					</table>
					<input type="hidden" name="member_id" value="${memberInfo.member_id }">
					<input type="hidden" name="m_id" value="${m_id}">

					<div>
						<input type="button" value="이미지 추가" onClick="addImg()" />리뷰 이미지 첨부
					</div>
					<a style="font-size: 14px;">(리뷰 이미지는 최대 10장까지 등록 가능합니다.)</a>
					<div id="imgfile"></div>


					<a style="cursor: pointer" onclick="addReview()" class="myButton2">리뷰 등록</a>

				</form>
				<!-- 이부분 수정 필 -->
				<div id="reviewList">
					<c:forEach var="re" items="${review}">
						<div
							style="bordertop: 1px solid #000000; border-bottom: 2px solid #000000; margin-bottom: 10px;">
							<c:set var="z" value="${z+1}" />
							<div style="font-size: 20px;">
								<strong>리뷰 제목 : </strong>${re.review_title }</div>
							<div style="margint-top: 10px;">
								<span style="float: right;"> <fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${re.addDate }" />
								</span><br> <span style="float: right;"><strong>작성자 : ${re.member_id } </strong></span>
							</div>

							<div id="review" style="width: 200px;">
								<fieldset style="border: none; padding-left: 0px;">
									<c:choose>
										<c:when test="${re.starpoint eq '1'}">
											<input type="radio" name="starpoint${z}" value="1" id="rate5"
												style="float: right;" checked readonly>
											<label for="rate5">★</label>
										</c:when>
										<c:when test="${re.starpoint eq '2'}">
											<input type="radio" name="starpoint${z}" value="2" id="rate4" checked readonly>
											<label for="rate4">★</label>
											<input type="radio" name="starpoint" value="1" id="rate5">
											<label for="rate5">★</label>
										</c:when>
										<c:when test="${re.starpoint eq '3'}">
											<input type="radio" name="starpoint${z}" value="3" id="rate3" checked readonly>
											<label for="rate3">★</label>
											<input type="radio" name="starpoint" value="2" id="rate4">
											<label for="rate4">★</label>
											<input type="radio" name="starpoint" value="1" id="rate5">
											<label for="rate5">★</label>
										</c:when>
										<c:when test="${re.starpoint eq '4'}">
											<input type="radio" name="starpoint${z}" value="4" id="rate2" checked readonly>
											<label for="rate2">★</label>
											<input type="radio" name="starpoint" value="3" id="rate3">
											<label for="rate3">★</label>
											<input type="radio" name="starpoint" value="2" id="rate4">
											<label for="rate4">★</label>
											<input type="radio" name="starpoint" value="1" id="rate5">
											<label for="rate5">★</label>
										</c:when>
										<c:when test="${re.starpoint eq '5'}">
											<input type="radio" name="starpoint${z}" value="5" id="rate1" checked readonly>
											<label for="rate1">★</label>
											<input type="radio" name="starpoint" value="4" id="rate2">
											<label for="rate2">★</label>
											<input type="radio" name="starpoint" value="3" id="rate3">
											<label for="rate3">★</label>
											<input type="radio" name="starpoint" value="2" id="rate4">
											<label for="rate4">★</label>
											<input type="radio" name="starpoint" value="1" id="rate5">
											<label for="rate5">★</label>
										</c:when>
									</c:choose>

								</fieldset>
							</div>
							<c:forEach var="reImg" items="${reviewImg }">
								<c:if test="${re.review_id eq reImg.review_id }">
									<span><img style="width: 250px; height: 150px; margin-top: 10px;" src="${contextPath}/reivewThumnail.do?lod_id=${lod.lod_id}&imgName=${reImg.imgName}&review_id=${re.review_id}" alt="${reImg.imgName }"></span>
								</c:if>
							</c:forEach>
							<div style="font-size: 19px; margin-top: 8px;">
								<strong>리뷰 내용 : ${re.review_content }</strong>
							</div>
						</div>


					</c:forEach>
				</div>
			</div>
			<div class="tab_content" id="tab4">
				<h3>배송안내</h3>
				· 배송은 입금확인된 날짜로부터 1~3일 소요되며 최대 7일 이내 출고됩니다.<br>&nbsp;(공휴일, 기상악화 등 불가피한 상황에 따라 추가 지연될 수 있습니다.)<br>
				· 상품은 조기 배송될 수 있으며	배송일 지정은 불가합니다.<br>
				<h3>교환 및 환불 안내</h3>
				· 교환/반품 신청은 배송완료 후 7일 이내에 가능합니다.<br>
				· 상품 불량의 경우 배송비는 쇼핑몰에서 부담하게 됩니다.<br>
				· 상품 불량 사유와 사진을 남겨 주시면 빠른 처리가 가능합니다.<br>
				· 변심 교환/반품의 경우 왕복 택배비를 부담해 주셔야 합니다. (택배비 상품별 상이)<br>
				· 구매자가 배송지 주소를 잘못 기입한 경우, 반송/재발송 모두 택배비를 부담하셔야 합니다.<br>&nbsp;(꼭 정확한 주소를 기입해 주세요)<br>
				<h3>반품/교환 불가능 사유</h3>
				1. 반품요청기간이 지난 경우<br>
				2. 구 매자의 부주의로 상품이 훼손, 파손된 경우<br>
				3. 구매자의 부주의로 상품 가치가 현저히 상실된 경우
				<h3>기타 안내</h3>
				· 교환/반품/AS 등은 "공정거래위원회"에서 정한 소비자 분쟁 해결 기준을 따르고	있습니다.<br>
				· 일부 상품에 대해서 교환/반품 정책이 위와 상이할 수 있습니다.<br>
				· 반드시 고객센터 접수 후 안내에 따라 진행해주세요.
			</div>
		</div>
	</div>
</body>
</html>