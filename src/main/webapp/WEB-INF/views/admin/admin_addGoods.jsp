<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
	
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery.min.js"></script>

<!-- 파일 업로드 부분 -->
<script>
var cnt=0;
function fn_addFile(){
	  if(cnt == 0){
		  $("#d_file").append("<br>"+"<input type='file' name='main' id='goods_main_image' />");	  
	  }else{
		  $("#d_file").append("<br>"+"<input type='file' name='detail' />");
	  }
	
	cnt++;
}

function fn_add_new_goods(obj){
	 fileName = $('#goods_main_image').val();
	 if(fileName != null && fileName != undefined){
		 obj.submit();
	 }else{
		 alert("메인 이미지는 반드시 첨부해야 합니다.");
		 return;
	 }
	 
}

</script>

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
var cnt1=0;
function fn_addInfo_img(){
	if(true){
		$("#info_img").append("<br>"+"<input type='file' id='img' name='info_img' accept='image/*' onchange='imgUpload(event)'; multiple />");
	}
	cnt1++;
}
</script>

<style>

  /*----------------------------rightBox-------------------------  */

.tabs {
	padding:0px;
	text-align:center;
	margin-bottom:20px;
	padding-inline-start: 0px;
}

.tab_menu {
	display:table-cell;
	border:1px solid #eeeddd;
	width:200px;
	padding:10px;
	float:none;
}

.tab_menu.active {
  background:#eeeddd;
}
.tabbox, .tab-wrapper{
	width:666px;
	margin:0 auto;
}
/*-----------버튼-----------  */
.myButton {
	border-radius: 7px;
    color: white;
    background: #4B5578;
    font-size: 14px;
    margin-left: 10px;
    border: 2px solid #000000;
    padding: 3px;
}

.btn {
	cursor: pointer;
	background: #7889c1;
	color:#FFFFFF;
	border:none;
	border-radius:5px;
}
</style>

<meta charset="UTF-8">
<title>숙소 등록창</title>
</head>
<body>
<div class="AdminRightBox">
	<div class="pageName_2" >상품 등록</div>
		<div class="tabbox">
  		<ul class="tabs">
    		<li class="tab_menu"><a href="#tab1">상품 정보</a></li>
    		<li class="tab_menu"><a href="#tab2">상품 소개</a></li>
    		<li class="tab_menu"><a href="#tab3">상품 이미지</a></li>
  		</ul><br>
  		</div>
		
<form action="${contextPath}/admin/goods/addNewGoods.do" method="post" enctype="multipart/form-data">

<div class="tab-wrapper">
  <div class="tab_container">
    <div class="tab_content" id="tab1">
    <table>
    	<tr>
			<td style="width: 140px;">상품 카테고리</td>
			<td>
				<select name="goods_cate"  style="width:280px; text-align: center; font-size:15px; height:20.51px;">
					<option value="tent">텐트</option>
					<option value="table">테이블</option>
					<option value="chair">의자</option>
					<option value="sleepingbag">침낭</option>
					<option value="cookware">취사도구</option>
					<option value="tool">기타도구</option>
				</select>
			</td>			
		</tr>
		<tr>
			<td style="width: 140px;">상품 이름</td>
			<td><input name="goods_name" type="text" style="width:272px;"></td>
		</tr>
		<tr>
			<td style="width:140px;">브랜드</td>
			<td><input name="goods_brand" type="text" style="width:272px;"></td>
		<tr>
		<tr>
			<td style="width:140px;">상품 정가</td>
			<td><input name="goods_price" type="text" style="width:272px;"></td>
		<tr>
		<tr>
			<td style="width:140px;">상품 할인율</td>
			<td><input name="goods_discount" type="text" style="width:272px;"></td>
		<tr>
	</table>
    </div>
    <!--  ---------------------------------------------------------------------------- -->
    <div class="tab_content" id="tab2">
    	<table>
    		<tr>
    			<td>상품 소개</td>
    			<td><input class="btn" type="button" value="이미지 추가" onClick="fn_addInfo_img()"/></td>
    		</tr>
			<tr>
				<td><div id="info_img" style="width:570px;"></div></td> <!-- 아직 DB 업데이트 안됨 -->
			</tr> 
		</table>
	</div>
	
    <div class="tab_content" id="tab3">
    <table>
	   		<tr>
	   			<td align="right">상품 이미지 첨부</td>
	   			<td><input class="btn" type="button" value="이미지 추가" onClick="fn_addFile()"/></td>
	   		</tr>
	   		<tr>
	   		<td><div id="d_file"></div></td>
	   		
	   		</tr>
	   	</table>
    </div>
  </div><!-- //tab-container -->
  
</div><!-- //tab-wrapper -->
<button class="myButton" value="상품등록">상품 등록</button>
</form>

</div>

</body>
</html>