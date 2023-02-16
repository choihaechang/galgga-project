<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="goods" value="${goodsMap._goodsVO}" />
<c:set var="order" value="${orderMap._orderVO}" />
<c:set var="mem" value="${memberInfo}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script>
function goods_pay() {
	
var IMP = window.IMP;
IMP.init('imp44640869'); 
IMP.request_pay({
    pay_method : 'card',
    merchant_uid : 'merchant',
    name : "상품명 : ${order.goods_name}",
    amount : 100,
    buyer_name : document.getElementById('order_name'),
    buyer_tel : document.getElementById('order_phone1').value + "-" + document.getElementById('order_phone2').value + "-" +
    			document.getElementById('order_phone3').value
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        alert(msg);
        document.getElementById("goods_pay").submit();

    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
        alert(msg);
        
    }
});
}

function execDaumPostcode(e) {
	if(e=='order') {
    	new daum.Postcode({
    	    oncomplete: function(data) {
    	        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	
	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	            if(fullRoadAddr !== ''){
	                fullRoadAddr += extraRoadAddr;
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('post_num1').value = data.zonecode; //5자리 새우편번호 사용
	            document.getElementById('address1').value = fullRoadAddr;
	        }
	    }).open();
	} else if(e=='receiver') {
		new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	            if(fullRoadAddr !== ''){
	                fullRoadAddr += extraRoadAddr;
	            }

	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('post_num2').value = data.zonecode; //5자리 새우편번호 사용
	            document.getElementById('address2').value = fullRoadAddr;
	        }
	    }).open();
	}
}
//주문자 동의
$(function(){
$('#agree_btn').blur(function(){
   if($('#agree_btn').val() != $('#agree_btn').val()){
    	if($('#agree_btn').val()!=''){
	    alert("주문자 동의는 필수입력사항입니다.");
    	    $('#agree_btn').val('');
          $('#agree_btn').focus();
       }
    }
})
})

function showAgreeDetail(obj) {
       if (!obj || typeof obj.id === 'undefined') {
           return ;
       }
       var id = obj.id;
       var agreeBtnId = $("#"+id);
       var agreeDetailId = $("#"+id+"Detail");

       if (agreeDetailId.css('display') === 'none') {
           agreeDetailId.show();
           agreeBtnId.text("닫기");
       } else {
           agreeDetailId.hide();
           agreeBtnId.text("자세히");
       }
}

$(document).ready(function() {
	$('#select_orderer_member').hide();
	
	$("input[name='orderer_info']").change(function(){
		
		if($("input[name='orderer_info']:checked").val()=="orderer") {
			$('#select_orderer_member').show();
			$('#select_orderer_non').hide();
			
		} else if($("input[name='orderer_info']:checked").val()=="receiver") {
			$('#select_orderer_non').show();
			$('#select_orderer_member').hide();
		}
	});
});
</script>
<style>
table {
	width:100%;
	border:1px solid;
}

.pageName{
		width: 120px;
		height: 45px;
		font-family: 'Inter';
		font-style: normal;
		font-weight: 400;
		font-size: 30px;
		line-height: 36px;		
		color: #000000;
		text-align:center;    
}

.line{
	margin-top: 0px;
    border: 1px solid;
    width:110px;
}

.paybox {
	margin:50px auto;
}
ol {
	style="padding-inline-start: 10px;
}
/*구매할 상품 정보*/

.pay_info_box {
	width:100%;
	border:1px solid;
	margin-bottom:25px;
}

/*결제방식*/
.payway_btn {
	background-color:#c4fae6;
	border-radius:26px;
	border:1px solid #5ea88a;
	display:inline-block;
	color:#222b27;
	font-size:13px;
	text-decoration:none;
	margin:20px 22px;
}
.paymentway {
	margin-top:25px;
	margin-bottom: 25px;
	border:1px solid;
}
/*결제 예상 금액*/
.payment_box {
	margin-left:10px;
	margin-bottom: 20px;
}
.pay_expect {
	margin-right:10px;
	font-size:14px;
	width:105px;
}
.pay_expect_box {
	display:flex;
	border-bottom:1px solid;
	padding:0px;
	margin:8px;
}
.pay_btn {
	margin:30px 20px;
	background:#3A8AFD;
	border-radius:5px;
	border:none;
	color:#FFFFFF;
	width:80px;
	height:30px;
}
/*결제 안내*/
.agreement {
	border-right:1px solid;
	width:460px;
}
.payment_info {
	margin:0px;
	padding:10px 10px 0px 20px;
	list-style:initial;
	font-size:10px;
}
.payment {
	display:flex;
	margin-bottom: 20px;
	margin-top:50px;
}
/*주문자 동의*/
.order_agree {
	margin-top:20px;
	line-height: 20px;
}
.order_agree_text {
	font-size:10px;
}
</style>
</head>
<body>
<div style="margin: 0px auto; width: 720px;">
	<div class="pageName_2">주문서작성<p class="line"></p></div>
	<div class="paybox">
		<form action="${contextPath}/order/addOrder.do" method="post" id="goods_pay">
		<!-- 구매할 상품 정보 -->
		<table class="pay_info_box">
			<thead>
				<tr>
					<th>이미지</th>
					<th>상품명</th>
					<th>상품 수량</th>
					<th>상품 할인</th>
					<th>배송비(기본)</th>
					<th>주문금액</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td rowspan="2">
						<img alt="goods_img" src="${contextPath}/thumbnails.do?goods_no=${goods.goods_no}&fileType=${order.fileType}&file_name=${order.file_name}">
						<input type="hidden" value="${goods.goods_no}" name="goods_no"/>
						<input type="hidden" value="${order.fileType}" name="fileType"/>
						<input type="hidden" value="${order.file_name}" name="file_name"/>
					</td>
 					<td rowspan="2"><input type="hidden" value="${goods.goods_name}" name="goods_name"/>${goods.goods_name}</td>
					<td rowspan="2"><input type="hidden" value="${order.order_qty}" name="order_qty"/>${order.order_qty}개</td>
					<td rowspan="2"><fmt:formatNumber value="${goods.goods_price*goods.goods_discount*0.01*order.order_qty}" type="number" />원</td>
					<td rowspan="2">${3000}원</td>
					<td style="color:#cecece; text-decoration: line-through;"><fmt:formatNumber value="${goods.goods_price*order.order_qty}" type="number" />원</td>
					<td><fmt:formatNumber value="${(goods.goods_price-goods.goods_price*goods.goods_discount*0.01)*order.order_qty}" type="number" />원</td>
				</tr>
			</tbody>
		</table>
		<!-- 구매자 정보 -->
		<c:choose>
		<c:when test="${empty mem.member_id}">
		<h3>주문 정보</h3><!-- 비회원 주문폼 -->
		<table>
			<tr>
				<td>주문하시는 분</td>
				<td><input type="text" id="order_name" name="order_name"></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="text" id="order_phone1" name="order_phone1">-<input type="text" id="order_phone2" name="order_phone2">-<input type="text" id="order_phone3" name="order_phone3"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="order_email1">@<input type="text" name="order_email2"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<div style="margin-left: 45px;">
						<input type="text" style="margin-top:8px;" id="post_num1" name="order_post_num" size=7 value="${mem.post_num }"  placeholder="주소"> <a href="javascript:execDaumPostcode('order')" style="text-decoration: none;">우편번호검색</a>
						<p style="margin-top:12px; margin-bottom:12px;">  
						<input type="text" id="address1"  name="order_address" size="50" value="${mem.address }" placeholder="도로명 주소"><br><br>
						</p>
					</div>
				</td>
			</tr>
			<tr>
				<td>비회원 주문 비밀번호</td>
				<td><input type="password" name="order_pw"></td>
			</tr>
		</table><br>
		</c:when>
		<c:otherwise>
			<h3>주문 정보</h3><!-- 회원 주문폼 -->
			<table>
				<tr>
					<input type="hidden" name="member_id" value="${mem.member_id }"/>
					<td>주문하시는 분</td>
					<td><input type="text" id="order_name" name="order_name" value="${mem.member_name}"></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td><input type="text" id="order_phone1" name="order_phone1" value="${mem.phone1}">-<input type="text" id="order_phone2" name="order_phone2" value="${mem.phone2}">-<input type="text" id="order_phone3" name="order_phone3" value="${mem.phone3}"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="order_email1" value="${mem.email1}">@<input type="text" name="order_email2" value="${mem.email2}"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<div style="margin-left: 45px;">
							<input type="text" style="margin-top:8px;" id="post_num1" name="order_post_num" size=7 value="${mem.post_num }"  placeholder="주소"> <a href="javascript:execDaumPostcode('order')" style="text-decoration: none;">우편번호검색</a>
							<p style="margin-top:12px; margin-bottom:12px;">  
							<input type="text" id="address1"  name="order_address" size="50" value="${mem.address }" placeholder="도로명 주소"><br><br>
							</p>
						</div>
					</td>
				</tr>
				<input type="hidden" value="${mem.member_pw}" name="order_pw"/>
			</table><br>
		</c:otherwise>
		</c:choose>
		
		<h3>배송 정보</h3>
		<div>
			<input type="radio" name="orderer_info" value="orderer">주문 정보와 동일
			<input type="radio" name="orderer_info" value="receiver" checked>새로운 배송지
		</div><br>
		<table id="select_orderer_member"><!-- 주문정보와 배송정보 동일 -->
			<tr>
				<td>받으시는 분</td>
				<td><input type="text" name="receiver_name" value="${mem.member_name}"></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="text" name="receiver_phone1" value="${mem.phone1}">-<input type="text" name="receiver_phone2" value="${mem.phone2}">-<input type="text" name="receiver_phone3" value="${mem.phone3}"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<div style="margin-left: 45px;">
						<input type="text" style="margin-top:8px;" id="post_num2" name="receiver_post_num" size=7 value="${mem.post_num }"  placeholder="주소"> <a href="javascript:execDaumPostcode('receiver')" style="text-decoration: none;">우편번호검색</a>
						<p style="margin-top:12px; margin-bottom:12px;">  
						<input type="text" id="address2"  name="receiver_address" size="50" value="${mem.address}" placeholder="도로명 주소"><br><br>
						</p>
					</div>
				</td>
			</tr>
			<tr>
				<td>배송 메모</td>
				<td>
					<select name="delivery_memo" id="selectbox" onchange="showEtc(this.value);">
						<option value="특이사항 없음">배송 시 요청사항을 입력해주세요</option>
						<option value="text1">부재 시 경비실에 맡겨주세요</option>
						<option value="text2">부재 시 택배함에 넣어주세요</option>
						<option value="text3">부재 시 짚 앞에 놔주세요</option>
						<option value="text4">배송 전 연락바랍니다</option>
						<option value="text5">파손의 위험이 있는 상품입니다. 배송 시 주의해주세요</option>
						<option value="text6">직접입력</option>
					</select>
				<textarea name="delivery_memo" id="etc_textarea"  style="display:none" value="" maxlength="50" onkeyup="return textarea_maxlength(this)" placeholder="최대 50자까지 입력 가능합니다."></textarea>
				</td>
			</tr>
		</table>
		<table id="select_orderer_non"><!-- 새로운 배송지 -->
			<tr>
				<td>받으시는 분</td>
				<td><input type="text" name="receiver_name"></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="text" name="receiver_phone1">-<input type="text" name="receiver_phone2">-<input type="text" name="receiver_phone3"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<div style="margin-left: 45px;">
						<input type="text" style="margin-top:8px;" id="post_num2" name="receiver_post_num" size=7 value="${member_info.post_num }"  placeholder="주소"> <a href="javascript:execDaumPostcode('receiver')" style="text-decoration: none;">우편번호검색</a>
						<p style="margin-top:12px; margin-bottom:12px;">  
						<input type="text" id="address2"  name="receiver_address" size="50" value="${member_info.address }" placeholder="도로명 주소"><br><br>
						</p>
					</div>
				</td>
			</tr>
			<tr>
				<td>배송 메모</td>
				<td>
					<select name="delivery_memo" id="selectbox" onchange="showEtc(this.value);">
						<option value="특이사항 없음">배송 시 요청사항을 입력해주세요</option>
						<option value="text1">부재 시 경비실에 맡겨주세요</option>
						<option value="text2">부재 시 택배함에 넣어주세요</option>
						<option value="text3">부재 시 짚 앞에 놔주세요</option>
						<option value="text4">배송 전 연락바랍니다</option>
						<option value="text5">파손의 위험이 있는 상품입니다. 배송 시 주의해주세요</option>
						<option value="text6">직접입력</option>
					</select>
				<textarea name="delivery_memo" id="etc_textarea"  style="display:none" value="" maxlength="50" onkeyup="return textarea_maxlength(this)" placeholder="최대 50자까지 입력 가능합니다."></textarea>
				</td>
			</tr>
		</table>
		
		<!-- 결제 안내 -->
		<div class="payment">
			<div class="agreement">
				<h4 style="margin:0px;">결제 안내</h4>
				<ul class="payment_info">
					<li>주문 변경 시 카드사 혜택 및 할부 적용 여부는 해당 카드사 정책에 따라 변경될 수 있습니다.
					<li>네이버페이는 네이버ID로 별도 앱 설치 없이 신용카드 또는 은행계좌 정보를 등록하여 네이버페이 비밀번호로 결제할 수 있는 간편결제 서비스입니다.
					<li>결제 가능한 신용카드: 신한, 삼성, 현대, BC, 국민, 하나, 롯데, NH농협, 씨티, 카카오뱅크
					<li>결제 가능한 은행: NH농협, 국민, 신한, 우리, 기업, SC제일, 부산, 경남, 수협, 우체국, 미래에셋대우, 광주, 대구, 전북, 새마을금고, 제주은행, 신협, 하나은행, 케이뱅크, 카카오뱅크, 삼성증권
					<li>네이버페이 카드 간편결제 시 카드사별 무이자, 청구할인은 네이버페이에서 제공하는 혜택만 적용됩니다.(무신사에서 제공하는 혜택은 적용 제외)
				</ul>
				<!-- 주문자 동의 -->
	<div class="order_agree">
		<h4 style="margin:0px;">주문자 동의</h4>
        <div class="order_agree_title" style="font-size:11px;">
            <br><b>회원 본인은 구매 조건, 주문 내용 확인 및 결제에 동의합니다<input type="checkbox" name="agree" id="agree_btn" /></b>
        </div>
        <div class="order_agree_text">
            <span class="font_basic">개인정보 수집 및 이용 동의</span>
            <a href="javascript:void(0)" class="order-agree__more" onclick="showAgreeDetail(this); return false;" id="secondAgree">자세히</a>
            <div id="secondAgreeDetail" class="order-agree__section" style="display:none;">
                <strong>개인정보 수집 및 이용 동의</strong>
                <ol>
                    <li>
                        1. 수집목적
                        <br>판매자와 구매자의 거래의 원활한 진행, 본인의사의 확인, 고객 상담 및 불만처리, 상품과 경품 배송을 위한 배송지 확인 등
                    </li>
                    <li>
                        2. 수집 항목
                        <br>구매자 정보: 성명, 전화번호, ID, 휴대전화 번호, 메일주소, 상품 구매정보
                        <br>수령자 정보: 성명, 전화번호, 휴대전화 번호, 배송지 주소
                    </li>
                    <li>
                        3. 보유기간
                        <br>개인정보 수집 및 이용목적 달성 시 및 관련 법령에 따른 기간까지 보관
                    </li>
                    <li>
                        4. 동의 거부시 불이익
                        <br>본 개인정보 수집 및 이용 등에 동의하지 않을 권리가 있습니다. 다만, 필수항목에 동의를 하지 않을경우 거래가 제한될 수 있습니다.
                    </li>
                </ol>
            </div>
        </div>
        <div class="order_agree_text">
            <span class="font_basic">개인정보 제 3자 제공 동의</span>
            <a href="javascript:void(0)" class="order-agree__more" onclick="showAgreeDetail(this); return false;" id="thirdAgree">자세히</a>
            <div id="thirdAgreeDetail" class="order-agree__section" style="display:none;">
                <p>무신사의 회원계정으로 상품 및 서비스를 구매하고자 할 경우, (주)무신사는 거래 당사자간 원활한 의사소통 및 배송, 상담 등 거래이행을 위하여 필요한 최소한의 개인정보만을 무신사
                    입점업체 판매자 및 배송업체에 아래와 같이 공유하고 있습니다.</p>
                <ol>
                    <li>1. (주)무신사는 귀하께서 무신사 입점업체 판매자로부터 상품 및 서비스를 구매하고자 할 경우, 개인정보보호법 제 17조 (개인정보의 제공)에 따라 아래와 같은 사항은 안내하고 동의를 받아 귀하의 개인정보를 판매자에게 공유합니다.</li>
                    <li>2. 개인정보를 공유받는자 : 주식회사 비케이브
                    <li>3. 공유하는 개인정보 항목 - 구매자 정보: 성명, 전화번호, ID, 휴대전화 번호, 메일주소, 상품 구매정보 - 수령자 정보: 성명, 전화번호, 휴대전화 번호, 배송지주소</li>
                    <li>4. 개인정보를 공유받는 자의 이용 목적 : 판매자와 구매자의 거래의 원활한 진행, 본인의사의 확인, 고객 상담 및 불만처리, 상품과 경품 배송을 위한 배송지 확인 등</li>
                    <li>5. 개인정보를 공유받는 자의 개인정보 보유 및 이용 기간 : 상품 구매/배송/반품 등 서비스 처리 완료 후 180일간 보관 후 파기</li>
                    <li>6. 동의 거부 시 불이익 : 본 개인정보 공유에 동의하지 않으시는 경우, 동의를 거부할 수 있으며, 이 경우 거래가 제한됩니다.</li>
                </ol>
            </div>
        </div>

        <div class="order_agree_text">
            <span class="font_basic">전자결제대행 이용 동의</span>
            <a href="javascript:void(0)" class="order-agree__more" onclick="showAgreeDetail(this); return false;" id="fifthAgree">자세히</a>
            <div id="fifthAgreeDetail" class="order-agree__section" style="display:none;">
                <strong>[토스페이먼츠]</strong><br>
                <strong>전자금융거래 기본약관(이용자용)</strong><br>

                <strong>제1조 (목적)</strong>
                <ol>
                    <li>이 약관은 전자지급결제대행서비스 및 결제대금예치서비스를 제공하는 토스페이먼츠 주식회사(이하 '회사'라 합니다)와 이용자 사이의 전자금융거래에 관한 기본적인 사항을 정함으로써 전자금융거래의 안정성과 신뢰성을 확보함에 그 목적이 있습니다.</li>
                </ol>
				<strong>제2조 (용어의 정의)</strong>
                <ol>
                    <li>이 약관에서 정하는 용어의 정의는 다음과 같습니다.</li>
                    <li>① 전자금융거래'라 함은 회사가 전자적 장치를 통하여 전자지급결제대행서비스 및 결제대금예치서비스(이하 '전자금융거래 서비스'라고 합니다)를 제공하고, 이용자가 회사의 구성원과 직접 대면하거나 의사소통을 하지 아니하고 전산화된 방식으로 이를 이용하는 거래를 말합니다.</li>
                    <li>② '전자지급결제대행 서비스'라 함은 전자적 방법으로 재화의 구입 또는 용역의 이용에 있어서 지급결제정보를 송신하거나 수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는 서비스를 말합니다.</li>
                    <li>③ ‘결제대금예치서비스'라 함은 이용자가 재화의 구입 또는 용역의 이용에 있어서 그 대가(이하 '결제대금'이라 한다)의 전부 또는 일부를 재화 또는 용역(이하 '재화 등'이라 합니다)을 공급받기 전에 미리 지급하는 경우, 회사가 이용자의 물품수령 또는 서비스 이용 확인 시점까지 결제대금을 예치하는 서비스를 말합니다.</li>
                    <li>④ '이용자'라 함은 이 약관에 동의하고 회사가 제공하는 전자지급결제대행 서비스를 이용하는 자를 말합니다.</li>
                    <li>⑤ '접근매체'라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에 준하는 전자적 정보(신용카드번호를 포함한다), '전자서명법'상의 인증서, 금융기관 또는 전자금융업자에 등록된 이용자번호, 이용자의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등 전자금융거래법 제2조 제10호에서 정하고 있는 것을 말합니다.</li>
                    <li>⑥ '거래지시'라 함은 이용자가 전자금융거래계약에 따라 금융기관 또는 전자금융업자에게 전자금융거래의 처리를 지시하는 것을 말합니다.</li>
                    <li>⑦ '오류'라 함은 이용자의 고의 또는 과실 없이 전자금융거래가 전자금융거래계약 또는 이용자의 거래지시에 따라 이행되지 아니한 경우를 말합니다.</li>
                </ol>
				<strong>제3조 (약관의 명시 및 변경)</strong>
                <ol>
                    <li>① 회사는 이용자가 전자지급결제대행 서비스를 이용하기 전에 이 약관을 게시하고 이용자가 이 약관의 중요한 내용을 확인할 수 있도록 합니다.</li>
                    <li>② 회사는 이용자의 요청이 있는 경우 서면제공 방식 또는 전자문서의 전송방식에 의하여 본 약관의 사본을 이용자에게 교부합니다.</li>
                    <li>③ 회사가 약관을 변경하는 때에는 그 시행일 1월 전에 변경되는 약관을 지급결제정보 입력화면 및 회사의 홈페이지에 게시함으로써 이용자에게 공지합니다.</li>
                    <li>④ 이용자는 제3항의 규정에 따른 약관의 변경내용이 게시되거나 통지된 후부터 변경되는 약관의 시행일 전의 영업일까지 전자금융거래의 계약을 해지할 수 있습니다. 전단의 기간 안에 이용자가 약관의 변경내용에 대하여 이의를 제기하지 아니하는 경우에는 약관의 변경을 승인한 것으로 봅니다.</li>
                </ol>

                <strong>제4조 (전자지급결제대행서비스의 종류)</strong>
                <ol>
                    <li>회사가 제공하는 전자지급결제대행서비스는 지급결제수단에 따라 다음과 같이 구별됩니다.</li>
                    <li>① 신용카드결제대행서비스: 이용자가 결제대금의 지급을 위하여 제공한 지급결제수단이 신용카드인 경우로서, 회사가 전자결제시스템을 통한 신용카드 지불정보의 송,수신 및
                        결제대금의 정산을 대행하거나 매개하는 서비스를 말합니다.
                    </li>
                    <li>② 계좌이체대행서비스: 이용자가 결제대금을 회사의 전자결제시스템을 통하여 금융기관에 등록한 자신의 계좌에서 출금하여 원하는 계좌로 이체할 수 있는 실시간 송금 서비스를
                        말합니다.
                    </li>
                    <li>③ 가상계좌서비스: 이용자가 결제대금을 현금으로 결제하고자 경우 회사의 전자결제시스템을 통하여 자동으로 이용자만의 고유한 일회용 계좌의 발급을 통하여 결제대금의 지급이
                        이루어지는 서비스를 말합니다.
                    </li>
                    <li>④ 기타: 회사가 제공하는 서비스로서 지급결제수단의 종류에 따라 '휴대폰 결제대행서비스', 'KT전화(ARS,폰빌)결제대행서비스', '상품권결제대행서비스'등이 있습니다.
                    </li>
                </ol>

                <strong>제5조 (결제대금예치서비스의 내용)</strong>
                <ol>
                    <li>① 이용자(이용자의 동의가 있는 경우에는 재화 등을 공급받을 자를 포함합니다. 이하 본조에서 같습니다)는 재화 등을 공급받은 사실을 재화 등을 공급받은 날부터 3영업일
                        이내에 회사에 통보하여야 합니다.
                    </li>
                    <li>② 회사는 이용자로부터 재화 등을 공급받은 사실을 통보 받은 후 회사와 통신판매업자간 사이에서 정한 기일 내에 통신판매업자에게 결제대금을 지급합니다.</li>
                    <li>③ 회사는 이용자가 재화 등을 공급받은 날부터 3영업일이 지나도록 정당한 사유의 제시 없이 그 공급받은 사실을 회사에 통보하지 아니하는 경우에는 이용자의 동의 없이
                        통신판매업자에게 결제대금을 지급할 수 있습니다.
                    </li>
                    <li>④ 회사는 통신판매업자에게 결제대금을 지급하기 전에 이용자에게 결제대금을 환급받을 사유가 발생한 경우에는 그 결제대금을 소비자에게 환급합니다.</li>
                    <li>⑤ 회사는 이용자와의 결제대금예치서비스 이용과 관련된 구체적인 권리,의무를 정하기 위하여 본 약관과는 별도로 결제대금예치서비스이용약관을 제정할 수 있습니다.</li>
                </ol>

                <strong>제6조 (접근매체의 선정, 관리 등)</strong>
                <ol>
                    <li>① 회사는 전자지급결제대행 서비스 제공 시 접근매체를 선정하여 이용자의 신원, 권한 및 거래지시의 내용 등을 확인할 수 있습니다.</li>
                    <li>② 이용자는 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 제공할 수 없습니다.</li>
                    <li>③ 이용자는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근매체의 도용이나 위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다.
                    </li>
                    <li>④ 회사는 이용자로부터 접근매체의 분실이나 도난 등의 통지를 받은 때에는 그 때부터 제3자가 그 접근매체를 사용함으로 인하여 이용자에게 발생한 손해를 배상할 책임이
                        있습니다.
                    </li>
                </ol>

                <strong>제7조 (회사의 책임)</strong>
                <ol>
                    <li>① 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여 배상책임이 있습니다. 다만, 이용자가 접근매체를 제3자에게 대여하거나 그 사용을 위임한
                        경우 또는 양도나 담보의 목적으로 제공한 경우, 회사가 보안강화를 위하여 전자금융거래 시 요구하는 추가적인 보안조치를 이용자가 정당한 사유 없이 거부하여 정보통신망에
                        침입하여 거짓이나 그 밖의 부정한 방법으로 획득한 접근매체의 이용으로 사고가 발생한 경우, 이용자가 제6조 제2항에 위반하거나 제3자가 권한 없이 이용자의 접근매체를
                        이용하여 전자금융거래를 할 수 있음을 알았거나 알 수 있었음에도 불구하고 이용자가 자신의 접근매체를 누설 또는 노출하거나 방치한 경우 그 책임의 전부 또는 일부를 이용자가
                        부담하게 할 수 있습니다.
                    </li>
                    <li>② 회사는 계약체결 또는 거래지시의 전자적 전송이나 처리과정에서 발생한 사고로 인하여 이용자에게 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다. 다만, 본조
                        제1항 단서에 해당하거나 법인('중소기업기본법' 제2조 제2항에 의한 소기업을 제외한다)인 이용자에게 손해가 발생한 경우로서 회사가 사고를 방지하기 위하여 보안절차를
                        수립하고 이를 철저히 준수하는 등 합리적으로 요구되는 충분한 주의의무를 다한 경우 그 책임의 전부 또는 일부를 이용자가 부담하게 할 수 있습니다.
                    </li>
                    <li>③ 회사는 전자금융거래를 위한 전자적 장치 또는 ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’ 제2조제1항제1호에 따른 정보통신망에 침입하여 거짓이나 그 밖의 부정한
                        방법으로 획득한 접근매체의 이용으로 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다.
                    </li>
                </ol>

                <strong>제8조 (거래내용의 확인)</strong>
                <ol>
                    <li>① 회사는 이용자와 미리 약정한 전자적 방법을 통하여 이용자의 거래내용(이용자의 '오류정정 요구사실 및 처리결과에 관한 사항'을 포함합니다)을 확인할 수 있도록 하며,
                        이용자의 요청이 있는 경우에는 요청을 받은 날로부터 2주 이내에 전자적양식, 모사전송, 서면 등의 방법으로 거래내용에 관한 서면을 교부합니다. 전자적 장치의 운영장애, 그
                        밖의 사유로 거래내용을 확인하게 할 수 없는 때에는 인터넷 등을 이용하여 즉시 그 사유를 알리고, 그 사유가 종료된 때부터 이용자가 거래내용을 확인할 수 있도록 하여야
                        합니다.
                    </li>
                    <li>② 회사가 이용자에게 제공하는 거래내용 중 거래계좌의 명칭 또는 번호, 거래의 종류 및 금액, 거래상대방을 나타내는 정보, 거래일자, 전자적 장치의 종류 및 전자적 장치를
                        식별할 수 있는 정보와 해당 전자금융거래와 관련한 전자적 장치의 접속기록은 5년간, 건당 거래금액이 1만원 이하인 소액 전자금융거래에 관한 기록, 전자지급수단 이용시
                        거래승인에 관한 기록, 이용자의 오류정정 요구사실 및 처리결과에 관한 사항은 1년간의 기간을 대상으로 하되, 회사가 가맹점에 대한 전자지급결제대행 서비스 제공의 대가로
                        수취한 수수료에 관한 사항은 제공하는 거래내용에서 제외됩니다.
                    </li>
                    <li>③ 이용자가 본조 제1항에서 정한 서면교부를 요청하고자 할 경우 다음의 주소 및 전화번호로 요청할 수 있습니다.</li>
                    <li>주소 : 서울특별시 강남구 테헤란로 131 한국지식재산센터 15층 토스페이먼츠 주식회사</li>
                    <li>이메일 주소 : support@tosspayments.com</li>
                    <li>전화번호 : 1544-7772</li>
                </ol>

                <strong>제9조 (오류의 정정 등)</strong>
                <ol>
                    <li>① 이용자는 전자지급결제대행 서비스를 이용함에 있어 오류가 있음을 안 때에는 회사에 대하여 그 정정을 요구할 수 있습니다.</li>
                    <li>② 회사는 전항의 규정에 따른 오류의 정정요구를 받은 때에는 이를 즉시 조사하여 처리한 후 정정요구를 받은 날부터 2주 이내에 그 결과를 이용자에게 알려 드립니다.</li>
                    <li>③ 이용자는 다음의 주소 및 전화번호로 본 조항상의 정정 요구를 할 수 있습니다.</li>
                    <li>주소 : 서울특별시 강남구 테헤란로 131 한국지식재산센터 15층 토스페이먼츠 주식회사</li>
                    <li>이메일 주소 : support@tosspayments.com</li>
                    <li>전화번호: 1544 - 7772</li>
                    <li>④ 회사는 스스로 전자금융거래에 오류가 있음을 안 때에는 이를 즉시 조사하여 처리한 후 오류가 있음을 안 날부터 2주 이내에 오류의 원인과 처리 결과를 이용자에게 알려
                        드립니다.
                    </li>
                </ol>

                <strong>제10조 (전자지급결제대행 서비스 이용 기록의 생성 및 보존)</strong>
                <ol>
                    <li>① 회사는 이용자가 전자지급결제대행 서비스 이용거래의 내용을 추적, 검색하거나 그 내용에 오류가 발생한 경우에 이를 확인하거나 정정할 수 있는 기록을 생성하여
                        보존합니다.
                    </li>
                    <li>② 전항의 규정에 따라 회사가 보존하여야 하는 기록의 종류 및 보존방법은 제8조 제2항에서 정한 바에 따릅니다.</li>
                </ol>

                <strong>제11조 (거래지시의 철회 제한)</strong>
                <ol>
                    <li>① 이용자가 전자지급거래를 한 경우, 지급의 효력은 ‘전자금융거래법’ 제13조 각호의 규정에 따릅니다.</li>
                    <li>② 이용자는 ‘전자금융거래법’ 제13조 각호의 규정에 따라 지급의 효력이 발생하기전까지 거래지시를 철회할 수 있습니다. 단, 금융기관, 이동통신사 등의 규정에 의거
                        거래지시의 철회가 제한될 수 있습니다.
                    </li>
                    <li>③ 전자지급수단별 거래지시의 철회 방법 및 제한 등은 다음 각호와 같습니다.</li>
                    <li>신용카드결제, 계좌이체결제, 가상계좌결제 : 전자상거래 등에서의 소비자보호에 관한 법률 등 관련 법령에서 정한 바에 따라 재화의 구입 또는 용역의 이용 거래에서의 청약의
                        철회 등을 한 경우에 한하여 철회가 가능합니다.
                    </li>
                    <li>휴대폰결제, KT전화(ARS,폰빌)결제: 전 가호의 방법에 따른 청약철회 요청건 중 이동통신사의 규정에 의거 결제일 해당월 말일까지 발생한 거래건에 한하여 철회가
                        가능합니다.
                    </li>
                    <li>상품권결제: 전 가호의 방법에 따른 청약철회 요청 건 중 시스템 장애 등으로 정상적인 서비스를 이용하지 못한 경우에 한하여 결제일로부터 10일 이내 청약 철회가
                        가능합니다.
                    </li>
                </ol>

                <strong>제12조 (추심이체의 출금 동의 및 철회)</strong>
                <ol>
                    <li>① 회사는 이용자의 요청이 있는 경우 이용자의 계좌가 개설되어 있는 금융회사 등이 추심이체를 실행할 수 있도록 금융회사 등을 대신하여 전자금융거래법령 등 관련 법령에 따른
                        방법으로 출금에 대한 동의를 진행합니다.
                    </li>
                    <li>② 회사는 전 항에 따른 이용자의 동의 사항을 추심 이체를 실행하는 해당 금융회사 등에 제출합니다.</li>
                    <li>③ 이용자는 이용자의 계좌의 원장에 출금기록이 끝나기 전까지 회사 또는 해당 금융회사 등에 제1항의 규정에 따른 동의의 철회를 요청할 수 있습니다.</li>
                    <li>④ 전 항에도 불구하고 회사 또는 금융회사 등은 대량으로 처리하는 거래 또는 예약에 따른 거래 등의 경우에는 미리 이용자와 정한 약정에 따라 동의의 철회시기를 달리 정할 수
                        있습니다.
                    </li>
                    <li>⑤ 이용자가 제3항에 따라 출금 동의 철회를 요청한 경우, 이용자는 출금 동의 철회 요청 이후 발생한 출금에 대해서 제14조 제1항의 담당자에게 이의를 제기할 수 있습니다.
                        다만, 본 조항은 동의 철회요청 이전에 발생한 출금에 대해서는 적용되지 않습니다.
                    </li>
                </ol>

                <strong>제13조 (전자금융거래정보의 제공금지)</strong>
                <ol>
                    <li>회사는 전자지급결제대행서비스 및 결제대금예치서비스를 제공함에 있어서 취득한 이용자의 인적사항, 이용자의 계좌, 접근매체 및 전자금융거래의 내용과 실적에 관한 정보 또는
                        자료를 이용자의 동의를 얻지 아니하고 제3자에게 제공,누설하거나 업무상 목적 외에 사용하지 아니합니다. 단, ‘금융실명 거래 및 비밀 보장에 관한 법률’ 제4조 제1항
                        단서의 규정에 따른 경우 그 밖의 다른 법률에서 정하는 바에 따른 경우에는 그러하지 아니합니다.
                    </li>
                </ol>

                <strong>제14조 (분쟁처리 및 분쟁조정)</strong>
                <ol>
                    <li>① 이용자는 다음의 분쟁처리 책임자 및 담당자에 대하여 전자지급결제대행 서비스 및 결제대금예치서비스 이용과 관련한 의견 및 불만의 제기, 손해배상의 청구 등의
                        분쟁처리를 요구할 수 있습니다.
                    </li>
                    <li>담당자 : 토스페이먼츠 RM(리스크)팀</li>
                    <li>연락처 : 전화번호 1544-7772, 팩스 02-6919-2354</li>
                    <li>이메일 : rm@tosspayments.com</li>
                    <li>② 이용자가 회사에 대하여 분쟁처리를 신청한 경우에는 회사는 15일 이내에 이에 대한 조사 또는 처리 결과를 이용자에게 안내합니다.</li>
                    <li>③ 이용자는 '금융위원회의 설치 등에 관한 법률' 제51조의 규정에 따른 금융감독원의 금융분쟁조정위원회나 '소비자기본법' 제35조 제1항의 규정에 따른 소비자원에
                        회사의 전자지급결제대행서비스 및 결제대금예치서비스의 이용과 관련한 분쟁조정을 신청할 수 있습니다.
                    </li>
                </ol>

                <strong>제15조 (회사의 안정성 확보 의무)</strong>
                <ol>
                    <li>회사는 전자금융거래의 안전성과 신뢰성을 확보할 수 있도록 전자금융거래의 종류별로 전자적 전송이나 처리를 위한 인력, 시설, 전자적 장치 등의 정보기술부문 및
                        전자금융업무에 관하여 금융위원회가 정하는 기준을 준수합니다.
                    </li>
                </ol>

                <strong>제16조 (이용시간)</strong>
                <ol>
                    <li>① 회사는 이용자에게 연중무휴 1일 24시간 전자금융거래 서비스를 제공함을 원칙으로 합니다. 단, 금융기관 기타 결제수단 발행업자의 사정에 따라 변경될 수
                        있습니다.
                    </li>
                    <li>② 회사는 정보통신설비의 보수, 점검 기타 기술상의 필요나 금융기관 기타 결제수단 발행업자의 사정에 의하여 서비스 중단이 불가피한 경우, 서비스 중단 3일 전까지
                        게시가능한 전자적 수단을 통하여 서비스 중단 사실을 게시한 후 서비스를 일시 중단할 수 있습니다. 다만, 시스템 장애보국, 긴급한 프로그램 보수, 외부요인 등
                        불가피한 경우에는 사전 게시없이 서비스를 중단할 수 있습니다.
                    </li>
                </ol>

                <strong>제17조 (약관외 준칙 및 관할)</strong>
                <ol>
                    <li>① 이 약관에서 정하지 아니한 사항에 대하여는 전자금융거래법, 전자상거래 등에서의 소비자 보호에 관한 법률, 통신판매에 관한 법률, 여신전문금융업법 등 소비자보호
                        관련 법령에서 정한 바에 따릅니다.
                    </li>
                    <li>② 회사와 이용자간에 발생한 분쟁에 관한 관할은 민사소송법에서 정한 바에 따릅니다.</li>
                </ol>
                <br><br><br>
                <strong>[엔에이치엔한국사이버결제]</strong><br>
                <strong>전자금융거래 기본약관</strong><br>

                <strong>제1조 (목적)</strong>
                <ol>
                    <li>이 약관은 엔에이치엔한국사이버결제 주식회사(이하 '회사'라 합니다)가 제공하는 전자지급결제대행서비스 및 결제대금예치서비스를 이용자가 이용함에 있어 회사와 이용자 사이의
                        전자금융거래에 관한 기본적인 사항을 정함을 목적으로 합니다.
                    </li>
                </ol>

                <strong>제2조 (용어의 정의)</strong>
                <ol>
                    <li>이 약관에서 정하는 용어의 정의는 다음과 같습니다.</li>
                    <li>1. '전자금융거래'라 함은 회사가 전자적 장치를 통하여 전자지급결제대행서비스 및 결제대금예치서비스(이하 '전자금융거래 서비스'라고 합니다)를 제공하고, 이용자가 회사의
                        종사자와 직접 대면하거나 의사소통을 하지 아니하고 자동화된 방식으로 이를 이용하는 거래를 말합니다.
                    </li>
                    <li>2. '전자지급결제대행서비스'라 함은 전자적 방법으로 재화의 구입 또는 용역의 이용에 있어서 지급결제정보를 송신하거나 수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는
                        서비스를 말합니다.
                    </li>
                    <li>3. '결제대금예치서비스'라 함은 이용자가 재화의 구입 또는 용역의 이용에 있어서 그 대가(이하 '결제대금'이라 한다)의 전부 또는 일부를 재화 또는 용역(이하 '재화
                        등'이라 합니다)을 공급받기 전에 미리 지급하는 경우, 회사가 이용자의 물품수령 또는 서비스 이용 확인 시점까지 결제대금을 예치하는 서비스를 말합니다.
                    </li>
                    <li>4. ‘가맹점’이라 함은 금융기관 또는 전자금융업자와의 계약에 따라 직불전자지급수단이나 선불전자지급수단 또는 전자화폐에 의한 거래에 있어서 이용자에게 재화 또는 용역을
                        제공하는 자로서 금융기관 또는 전자금융업자가 아닌 자를 말합니다.
                    </li>
                    <li>5. '이용자'라 함은 이 약관에 동의하고 회사가 제공하는 전자금융거래 서비스를 이용하는 자를 말합니다.</li>
                    <li>6. '접근매체'라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에
                        준하는 전자적 정보(신용카드번호를 포함한다), '전자서명법'상의 인증서, 회사에 등록된 이용자번호, 이용자의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등
                        전자금융거래법 제2조 제10호에서 정하고 있는 것을 말합니다.
                    </li>
                    <li>7. '거래지시'라 함은 이용자가 본 약관에 의하여 체결되는 전자금융거래계약에 따라 회사에 대하여 전자금융거래의 처리를 지시하는 것을 말합니다.</li>
                    <li>8. '거래지시'라 함은 이용자가 본 약관에 의하여 체결되는 전자금융거래계약에 따라 회사에 대하여 전자금융거래의 처리를 지시하는 것을 말합니다.</li>
                </ol>

                <strong>제3조 (약관의 명시 및 변경)</strong>
                <ol>
                    <li>① 회사는 이용자가 전자금융거래 서비스를 이용하기 전에 이 약관을 게시하고 이용자가 이 약관의 중요한 내용을 확인할 수 있도록 합니다.</li>
                    <li>② 회사는 이용자의 요청이 있는 경우 전자문서의 전송방식에 의하여 본 약관의 사본을 이용자에게 교부합니다.</li>
                    <li>③ 회사가 약관을 변경하는 때에는 그 시행일 1월 전에 변경되는 약관을 회사가 제공하는 전자금융거래 서비스 이용 초기화면 및 회사의 홈페이지에 게시함으로써 이용자에게
                        공지합니다. 다만, 법령의 개정으로 인하여 긴급하게 약관을 변경하는 경우에는 즉시 공지합니다.
                    </li>
                    <li>④ 이용자가 변경된 약관사항에 동의하지 않는 경우에는 서비스의 이용이 불가하며 이용자는 이용 계약을 해지할 수 있습니다.</li>
                </ol>

                <strong>제4조 (전자지급결제대행서비스의 종류)</strong>
                <ol>
                    <li>회사가 제공하는 전자지급결제대행서비스는 지급결제수단에 따라 다음과 같이 구별됩니다.</li>
                    <li>1. 신용카드결제대행서비스: 이용자가 결제대금의 지급을 위하여 제공한 지급결제수단이 신용카드인 경우로서, 회사가 전자결제시스템을 통하여 신용카드 지불정보를 송,수신하고
                        결제대금의 정산을 대행하거나 매개하는 서비스를 말합니다.
                    </li>
                    <li>2. 계좌이체대행서비스: 이용자가 결제대금을 회사의 전자결제시스템을 통하여 금융기관에 등록한 자신의 계좌에서 출금하여 원하는 계좌로 이체할 수 있는 실시간 송금 서비스를
                        말합니다.
                    </li>
                    <li>3. 가상계좌서비스: 이용자가 결제대금을 현금으로 결제하고자 경우 회사의 전자결제시스템을 통하여 자동으로 이용자만의 고유한 일회용 계좌의 발급을 통하여 결제대금의 지급이
                        이루어지는 서비스를 말합니다.
                    </li>
                    <li>4. 기타: 회사가 제공하는 서비스로서 지급결제수단의 종류에 따라 '휴대폰 결제대행서비스', 'ARS결제대행서비스', '상품권결제대행서비스', '교통카드결제대행서비스' 등이
                        있습니다.
                    </li>
                </ol>

                <strong>제5조 (결제대금예치서비스의 내용)</strong>
                <ol>
                    <li>① 이용자(이용자의 동의가 있는 경우에는 재화 등을 공급받을 자를 포함합니다. 이하 본조에서 같습니다)는 재화 등을 공급받은 사실을 재화 등을 공급받은 날부터 3영업일
                        이내에 회사에 통보하여야 합니다.
                    </li>
                    <li>② 회사는 이용자로부터 재화 등을 공급받은 사실을 통보받은 후 회사와 통신판매업자간 사이에서 정한 기일 내에 통신판매업자에게 결제대금을 지급합니다.</li>
                    <li>③ 회사는 이용자가 재화 등을 공급받은 날부터 3영업일이 지나도록 정당한 사유의 제시없이 그 공급받은 사실을 회사에 통보하지 아니하는 경우에는 이용자의 동의없이
                        통신판매업자에게 결제대금을 지급할 수 있습니다.
                    </li>
                    <li>④ 회사는 통신판매업자에게 결제대금을 지급하기 전에 이용자에게 결제대금을 환급받을 사유가 발생한 경우에는 그 결제대금을 소비자에게 환급합니다.</li>
                    <li>⑤ 회사는 이용자와의 결제대금예치서비스 이용과 관련된 구체적인 권리,의무를 정하기 위하여 본 약관과는 별도로 결제대금예치서비스이용약관을 제정할 수 있습니다.</li>
                </ol>

                <strong>제6조 (이용시간)</strong>
                <ol>
                    <li>① 회사는 이용자에게 연중무휴 1일 24시간 전자금융거래 서비스를 제공함을 원칙으로 합니다. 단, 금융기관 기타 결제수단 발행업자의 사정에 따라 달리 정할 수 있습니다.
                    </li>
                    <li>② 회사는 정보통신설비의 보수, 점검 기타 기술상의 필요나 금융기관 기타 결제수단 발행업자의 사정에 의하여 서비스 중단이 불가피한 경우, 서비스 중단 3일 전까지 게시
                        가능한 전자적 수단을 통하여 서비스 중단 사실을 게시한 후 서비스를 일시 중단할 수 있습니다. 다만, 시스템 장애복구, 긴급한 프로그램 보수, 외부요인 등 불가피한 경우에는
                        사전 게시없이 서비스를 중단할 수 있습니다.
                    </li>
                </ol>

                <strong>제7조 (접근매체의 선정과 사용 및 관리)</strong>
                <ol>
                    <li>① 회사는 전자금융거래 서비스 제공 시 접근매체를 선정하여 이용자의 신원, 권한 및 거래지시의 내용 등을 확인할 수 있습니다.</li>
                    <li>② 이용자는 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 제공할 수 없습니다.</li>
                    <li>③ 이용자는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근매체의 도용이나 위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다.
                    </li>
                    <li>④ 회사는 이용자로부터 접근매체의 분실이나 도난 등의 통지를 받은 때에는 그 때부터 제3자가 그 접근매체를 사용함으로 인하여 이용자에게 발생한 손해를 배상할 책임이
                        있습니다.
                    </li>
                </ol>

                <strong>제8조 (거래내용의 확인)</strong>
                <ol>
                    <li>① 회사는 이용자와 미리 약정한 전자적 방법을 통하여 이용자의 거래내용(이용자의 '오류정정 요구사실 및 처리결과에 관한 사항'을 포함합니다)을 확인할 수 있도록 하며,
                        이용자의 요청이 있는 경우에는 요청을 받은 날로부터 2주 이내에 모사전송 등의 방법으로 거래내용에 관한 서면을 교부합니다. 다만, 전자적 장치의 운영 장애, 그 밖의 사유로
                        거래내용을 제공할 수 없는 때에는 즉시 이용자에게 전자문서 전송(전자우편을 이용한 전송을 포함합니다)의 방법으로 그러한 사유를 알려야 하며, 거래내용을 제공할 수 없는
                        기간은 서면교부 기간에 산입하지 아니합니다.
                    </li>
                    <li>② 회사가 이용자에게 제공하는 거래내용 중 거래계좌의 명칭 또는 번호, 거래의 종류 및 금액, 거래상대방을 나타내는 정보, 거래일자, 전자적 장치의 종류 및 전자적 장치를
                        식별할 수 있는 정보와 해당 전자금융거래와 관련한 전자적 장치의 접속기록 회사가 전자금융거래의 대가로 받은 수수료, 이용자의 출금 동의에 관한 사항, 전자금융거래의 신청 및
                        조건의 변경에 관한 사항, 건당 거래금액이 1만원을 초과하는 전자금융거래에 관한 기록은 5년간, 건당 거래금액이 1만원 이하인 소액 전자금융거래에 관한 기록, 전자지급수단
                        이용시 거래승인에 관한 기록, 이용자의 오류정정 요구사실 및 처리결과에 관한 사항은 1년간의 기간을 대상으로 보존하고, 회사가 전자지급결제대행 서비스 제공의 대가로 수취한
                        수수료에 관한 사항을 제공합니다.
                    </li>
                    <li>③ 이용자가 제1항에서 정한 서면교부를 요청하고자 할 경우 다음의 주소 및 전화번호로 요청할 수 있습니다.</li>
                    <li>주소: 서울시 구로구 디지털로26길 72(구로동, NHN한국사이버결제)</li>
                    <li>이메일 주소: help@kcp.co.kr</li>
                    <li>전화번호: 1544-8667</li>
                </ol>

                <strong>제9조 (오류의 정정 등)</strong>
                <ol>
                    <li>① 이용자는 전자금융거래 서비스를 이용함에 있어 오류가 있음을 안 때에는 회사에 대하여 그 정정을 요구할 수 있습니다.</li>
                    <li>② 회사는 전항의 규정에 따른 오류의 정정요구를 받은 때 또는 스스로 오류가 있음을 안 때 에는 이를 즉시 조사하여 처리한 후 정정요구를 받은 날 또는 오류가 있음을 안
                        날부터 2주 이내에 그 결과를 이용자에게 문서, 전화 또는 전자우편으로 알려 드립니다.
                    </li>
                </ol>

                <strong>제10조 (가맹점의 준수사항 등)</strong>
                <ol>
                    <li>① 가맹점은 직불전자지급수단이나 선불전자지급수단 또는 전자화폐(이하 "전자화폐등"이라 한다)에 의한 거래를 이유로 재화 또는 용역의 제공 등을 거절하거나 이용자를 불리하게
                        대우하여서는 아니 됩니다.
                    </li>
                    <li>② 가맹점은 이용자로 하여금 가맹점수수료를 부담하게 하여서는 아니 됩니다.</li>
                    <li>③ 가맹점은 다음 각 호의 어느 하나에 해당하는 행위를 하여서는 아니 됩니다.</li>
                    <li> 1. 재화 또는 용역의 제공 등이 없이 전자화폐등에 의한 거래를 한 것으로 가장(가장)하는 행위</li>
                    <li> 2. 실제 매출금액을 초과하여 전자화폐등에 의한 거래를 하는 행위</li>
                    <li> 3. 다른 가맹점 이름으로 전자화폐등에 의한 거래를 하는 행위</li>
                    <li> 4. 가맹점의 이름을 타인에게 빌려주는 행위</li>
                    <li> 5. 전자화폐등에 의한 거래를 대행하는 행위</li>
                    <li>④가맹점이 아닌 자는 가맹점의 이름으로 전자화폐등에 의한 거래를 하여서는 아니 됩니다.</li>
                </ol>

                <strong>제11조 (가맹점 모집 등)</strong>
                <ol>
                    <li>① 회사는 가맹점을 모집하는 경우에는 가맹점이 되고자 하는 자의 영업여부 등을 확인하여야 합니다. 다만, 「여신전문금융업법」 제16조의2의 규정에 따라 이미 확인을 한
                        가맹점인 경우에는 그러하지 아니합니다.
                    </li>
                    <li>② 회사는 다음 각 호의 사항을 금융위원회가 정하는 방법에 따라 가맹점에 알려야 합니다.</li>
                    <li> 1. 가맹점수수료</li>
                    <li> 2. 제2항의 규정에 따른 가맹점에 대한 책임</li>
                    <li> 3. 전조 규정에 따른 가맹점의 준수사항</li>
                    <li>③ 회사는 가맹점이 전조의 규정을 위반하여 형의 선고를 받거나 관계 행정기관으로부터 위반사실에 대하여 서면통보를 받는 등 대통령령이 정하는 사유에 해당하는 때에는 특별한
                        사유가 없는 한 지체 없이 가맹점계약을 해지하여야 합니다. ‘대통령령이 정하는 사유’라 함은 다음 각 호의 어느 하나에 해당하는 경우를 말합니다.
                    </li>
                    <li> 1. 가맹점이 전자금융거래법 제 26조 또는 전조 제3항 제3호 내지 제5호를 위반하여 형을 선고받은 경우</li>
                    <li> 2. 가맹점이 전조 제1항, 제2항 또는 제3항 제3호 내지 제5호를 위반한 사실에 관하여 관계 행정기관으로부터 서면통보가 있는 경우</li>
                    <li> 3. 관계 행정기관으로부터 해당 가맹점의 폐업사실을 서면으로 통보 받은 경우</li>
                </ol>

                <strong>제12조 (회사의 책임)</strong>
                <ol>
                    <li>① 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여 배상책임이 있습니다. 다만 이용자가 제7조 제2항에 위반하거나 제3자가 권한 없이 이용자의
                        접근매체를 이용하여 전자금융거래를 할 수 있음을 알았거나 알 수 있었음에도 불구하고 이용자가 자신의 접근매체를 누설 또는 노출하거나 방치한 경우 그 책임의 전부 또는 일부를
                        이용자가 부담하게 할 수 있습니다.
                    </li>
                    <li>② 회사는 계약체결 또는 거래지시의 전자적 전송이나 처리과정에서 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다. 다만 본조
                        제1항 단서에 해당하거나 법인('중소기업기본법' 제2조 제2항에 의한 소기업을 제외합니다)인 이용자에게 손해가 발생한 경우로서 회사가 사고를 방지하기 위하여 보안절차를
                        수립하고 이를 철저히 준수하는 등 합리적으로 요구되는 충분한 주의의무를 다한 경우에는 그러하지 아니합니다.
                    </li>
                    <li>③ 회사는 이용자로부터의 거래지시가 있음에도 불구하고 천재지변, 회사의 귀책사유가 없는 정전, 화재, 통신장애 기타의 불가항력적인 사유로 처리 불가능하거나 지연된 경우로서
                        이용자에게 처리 불가능 또는 지연사유를 통지한 경우(금융기관 또는 결제수단 발행업체나 통신판매업자가 통지한 경우를 포함합니다)에는 이용자에 대하여 이로 인한 책임을 지지
                        아니합니다.
                    </li>
                    <li>④ 회사는 전자금융거래를 위한 전자적 장치 또는 ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’ 제 2조 제 1항 제 1호에 따른 정보통신망에 침입하여 거짓이나 그 밖의
                        부정한 방법으로 획득한 접근매체의 이용으로 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다. 다만, 다음과 같은 경우 회사는
                        이용자에 대하여 일부 또는 전부에 대하여 책임을 지지 않습니다.
                    </li>
                    <li> 1. 회사가 접근매체에 따른 확인 외에 보안강화를 위하여 전자금융거래 시 요구하는 추가적인 보안조치를 이용자가 정당한 사유 없이 거부하여 전자금융거래법 제9조 제1항
                        제3호에 따른(이하 ‘사고’라 한다)사고가 발생한 경우.
                    </li>
                    <li> 2. 이용자가 동항 제 1호의 추가적인 보안조치에서 사용되는 매체, 수단 또는 정보에 대하여 다음과 같은 행위를 하여 사고가 발생하는 경우</li>
                    <li> 가. 누설, 누출 또는 방치한 행위</li>
                    <li> 나. 제 3자에게 대여하거나 그 사용을 위임한 행위 또는 양도나 담보의 목적으로 제공한 행위</li>
                </ol>

                <strong>제13조 (전자지급거래계약의 효력)</strong>
                <ol>
                    <li>① 회사는 이용자의 거래지시가 전자지급거래에 관한 경우 그 지급절차를 대행하며, 전자지급거래에 관한 거래지시의 내용을 전송하여 지급이 이루어지도록 합니다.</li>
                    <li>② 회사는 이용자의 전자지급거래에 관한 거래지시에 따라 지급거래가 이루어지지 않은 경우 수령한 자금을 이용자에게 반환하여야 합니다.</li>
                </ol>

                <strong>제14조 (거래지시의 철회)</strong>
                <ol>
                    <li>① 이용자는 전자지급거래에 관한 거래지시의 경우 지급의 효력이 발생하기 전까지 다음의 주소, 전자우편 및 연락처에 연락을 취함으로써 거래지시를 철회할 수 있습니다.</li>
                    <li>주소: 서울시 구로구 디지털로26길 72(구로동, NHN한국사이버결제)</li>
                    <li>이메일 주소: help@kcp.co.kr</li>
                    <li>전화번호: 1544-8667</li>
                    <li>② 전항의 지급의 효력이 발생 시점이란 (i) 전자자금이체의 경우에는 거래지시된 금액의 정보에 대하여 수취인의 계좌가 개설되어 있는 금융기관의 계좌 원장에 입금기록이 끝난
                        때 (ii) 그 밖의 전자지급수단으로 지급하는 경우에는 거래지시된 금액의 정보가 수취인의 계좌가 개설되어 있는 금융기관의 전자적 장치에 입력이 끝난 때를 말합니다.
                    </li>
                    <li>③ 이용자는 지급의 효력이 발생한 경우에는 전자상거래 등에서의 소비자보호에 관한 법률 등 관련 법령상 청약의 철회의 방법 또는 본 약관 제5조에서 정한 바에 따라 결제대금을
                        반환받을 수 있습니다.
                    </li>
                </ol>

                <strong>제15조 (전자지급결제대행 서비스 이용 기록의 생성 및 보존)</strong>
                <ol>
                    <li>① 회사는 이용자가 전자금융거래의 내용을 추적, 검색하거나 그 내용에 오류가 발생한 경우에 이를 확인하거나 정정할 수 있는 기록을 생성하여 보존합니다.</li>
                    <li>② 전항의 규정에 따라 회사가 보존하여야 하는 기록의 종류 및 보존방법은 제8조 제2항에서 정한 바에 따릅니다.</li>
                </ol>

                <strong>제16조 (전자금융거래정보의 제공금지)</strong>
                <ol>
                    <li>회사는 전자금융거래 서비스를 제공함에 있어서 취득한 이용자의 인적사항, 이용자의 계좌, 접근매체 및 전자금융거래의 내용과 실적에 관한 정보 또는 자료를 이용자의 동의를 얻지
                        아니하고 제3자에게 제공, 누설하거나 업무상 목적 외에 사용하지 아니합니다. 단, 통신비밀보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 관계법령에 의하여
                        적법한 절차에 따르는 경우에는 그러하지 아니합니다.
                    </li>
                </ol>

                <strong>제17조 (계약해지 및 이용제한)</strong>
                <ol>
                    <li>① 이용자는 서비스 홈페이지 또는 고객센터를 통하여 서비스 계약을 해지할 수 있습니다.</li>
                    <li>② 회사는 이용자가 본 약관의 의무를 이행하지 않을 경우 사전 통지 없이 즉시 서비스 이용계약을 해지하거나 서비스 이용을 제한할 수 있습니다. 회사의 조치에 대하여 이의가
                        있는 경우에는 서비스 홈페이지 또는 고객센터를 통하여 이의신청을 할 수 있습니다.
                    </li>
                    <li>③ 전 항의 이의가 정당하다고 판단되는 경우 회사는 서비스의 이용을 즉시 재개합니다.</li>
                </ol>

                <strong>제18조 (분쟁처리 및 분쟁조정)</strong>
                <ol>
                    <li>① 이용자는 다음의 분쟁처리 책임자 및 담당자에 대하여 전자금융거래 서비스 이용과 관련한 의견 및 불만의 제기, 손해배상의 청구 등의 분쟁처리를 요구할 수 있습니다.
                    </li>
                    <li>담당자: RM팀</li>
                    <li>연락처(전화번호, 전자우편주소) : 070-5075-8041, minwon@kcp.co.kr</li>
                    <li>② 이용자가 회사에 대하여 분쟁처리를 신청한 경우에는 회사는 15일 이내에 이에 대한 조사 또는 처리 결과를 이용자에게 안내합니다.</li>
                    <li>③ 이용자는 '금융위원회의 설치 등에 관한 법률' 제51조의 규정에 따른 금융감독원의 금융분쟁조정위원회나 '소비자기본법' 제33조의 규정에 따른 한국소비자원에 회사의
                        전자금융거래 서비스의 이용과 관련한 분쟁조정을 신청할 수 있습니다.
                    </li>
                </ol>

                <strong>제19조 (회사의 안정성 확보 의무)</strong>
                <ol>
                    <li>회사는 전자금융거래가 안전하게 처리될 수 있도록 선량한 관리자로서의 주의를 다하며 전자금융거래의 안전성과 신뢰성을 확보할 수 있도록 전자금융거래의 종류별로 전자적 전송이나
                        처리를 위한 인력, 시설, 전자적 장치 등의 정보기술부문 및 전자금융업무에 관하여 금융위원회가 정하는 기준을 준수합니다.
                    </li>
                </ol>

                <strong>제20조 (약관 외 준칙 및 관할)</strong>
                <ol>
                    <li>① 회사와 이용자 사이에 개별적으로 합의한 사항이 이 약관에 정한 사항과 다를 때에는 그 합의사항을 이 약관에 우선하여 적용합니다.</li>
                    <li>② 이 약관에서 정하지 아니한 사항에 대하여는 전자금융거래법, 전자상거래 등에서의 소비자 보호에 관한 법률, 통신판매에 관한 법률, 여신전문금융업법 등 소비자보호 관련
                        법령에서 정한 바에 따릅니다.
                    </li>
                    <li>③ 회사와 이용자간에 발생한 분쟁에 관한 관할은 민사소송법에서 정한 바에 따릅니다.</li>
                </ol>

                <ol>
                    <li>부칙 < 제 1 호, 2006.12.26. ></li>
                    <li>본 약관은 2007년 1월 1일부터 시행한다</li>
                    <br>
                    <li>부칙 < 제 2 호, 2011.01.17. ></li>
                    <li>본 약관은 2011년 02월 21일부터 시행한다.</li>
                    <li>(제 2조 4항 신설, 제 8조 2항 일부 개정, 제 10조 신설, 제11조 신설)</li>
                    <br>
                    <li>부칙 < 제 3 호, 2015.10.14. ></li>
                    <li>본 약관은 2015 10월 14일부터 시행한다</li>
                    <li>(제 17조 제1항 일부 개정, 제 12조 제 5항 신설)</li>
                    <br>
                    <li>부칙 < 제 4 호, 2016.04.08. ></li>
                    <li>본 약관은 2016년 4월 26일부터 시행한다</li>
                    <li>(제 1조 일부 개정, 제 8조 제 3항 일부 개정)</li>
                    <br>
                    <li>부칙 < 제 5 호, 2016.11.11. ></li>
                    <li>본 약관은 2016 11월 21일부터 시행한다</li>
                    <li>(제 17조 신설, 제3조 제3항 및 제4항, 제9조 제2항, 제14조 제1항, 제16조, 제18조 제3항 일부 개정)</li>
                    <br>
                    <li>부칙 < 제 6 호, 2016.11.28. ></li>
                    <li>본 약관은 2016 11월 28일부터 시행한다</li>
                    <li>(제12조 제1항 삭제, 제6조 제2항, 제8조 제1항 및 제2항, 제9조 제2항, 제19조 개정, 제20조 제1항 신설)</li>
                    <br>
                    <br>
                    <br>
                    <li>부칙 < 제 7 호, 2018.01.19. ></li>
                    <li>본 약관은 2018년 02월 22일부터 시행한다</li>
                    <li>(제12조 제1항, 제2항 일부 개정)</li>
                    <br>
                    <li>부칙 < 제 8 호, 2018.07.23. ></li>
                    <li>본 약관은 2018년 07월 31일부터 시행한다</li>
                    <li>(제18조 제1항 일부 개정)</li>
                    <br>
                    <li>부칙 < 제 9 호, 2018.11.15. ></li>
                    <li>본 약관은 2018년 12월 20일부터 시행한다</li>
                    <li>(제8조 제3항, 제14조 제1항 개정)</li>
                    <br>
                    <li>부칙 < 제 10 호, 2019.05.21. ></li>
                    <li>본 약관은 2019년5월 31일부터 시행한다</li>
                    <li>(제8조 제3항, 제14조 제1항 개정)</li>
                </ol>
            </div>
        </div>

        <div class="order_agree_text" style="display:none">
            <span class="font_basic">주문제작 상품 주문 후 취소 불가 동의</span>
            <a href="javascript:void(0)" class="order-agree__more" onclick="showAgreeDetail(this); return false;" id="fourthAgree">자세히</a>
            <div id="fourthAgreeDetail" class="order-agree__section" style="display:none;">
                ■ 주문 상품 중 주문 후 상품의 제작에 들어가는 주문제작 상품의 경우 소비자의 주문에 의하여 개별 생산 되며<br/>
                생산이 시작된 이 후 해당 재화를 타인에게 판매가 불가능 함으로 주문 후 취소, 주문 후 교환, 주문 후 환불이 불가능 합니다. <br/>
                주문 시 해당 내용을 참고하여 신중한 구매 부탁 드립니다.<br/>
                [관련 조항]<br/>
                전자상거래 등에서 소비자보호에 관한 법률 시행령[시행 2015.1.1.] [대통령령 제25840호, 2014.12.0., 타법개정]<br/>
                제 21조(청약철회등의 제한) 법 제 17조 2항제5호에서 “대통령령으로 정하는 경우＂란 소비자의 주문에 따라 개별적으로 생산되는 재화등 <br/>
                또는 이와 유사한 재화등에 대하여 법 제 13조제2항제5호에 따른 청약 철회등(이하 :쳥약철회등＂이라한다.)을 인정하는 경우 <br/>
                통신판매업자에게 회복할 수 없는 중대한 피해가 예상되는 경우로서 사전에 해당 거래에 대하여<br/>
                별도로 그 사실을 고지하고 소비자의 서면(전자문서를 포함한다)에 의한 동의를 받은 경우를 말한다.<br/>
            </div>
        </div>
    </div>
		</div>
			<!-- 결제 예상 금액 -->
			<div class="payment_box">
				<h4 style="margin:0px;">결제 예상 금액</h4>
				<ul class="pay_expect_box">
					<li class="pay_expect">상품 금액</li>
					<li><fmt:formatNumber value="${goods.goods_price*order.order_qty}" type="number" />원</li>
				</ul>
				<ul class="pay_expect_box">
					<li class="pay_expect">상품 할인</li>
					<li><fmt:formatNumber value="${goods.goods_price*goods.goods_discount*0.01*order.order_qty}" type="number" />원</li>
				</ul>
				<ul class="pay_expect_box">
					<li class="pay_expect">배송비</li>
					<li><fmt:formatNumber value="${3000}" type="number" />원</li>
				</ul>
				<ul class="pay_expect_box">
					<li class="pay_expect">최종 결제 금액</li>
					<li><input type="hidden" value="${(goods.goods_price-goods.goods_price*goods_discount*0.01)*order.order_qty+3000}" name="total_price" /><fmt:formatNumber value="${(goods.goods_price-goods_price*goods_discount*0.01)*order.order_qty+3000}" type="number" />원</li>
				</ul>
				<div style="text-align:center;"><button type="button" class="pay_btn" onclick="goods_pay()">결제하기</button></div>
			</div>
			</div><!-- payment -->
			</form>
		</div><!-- paybox -->
	</div>
</body>
</html>