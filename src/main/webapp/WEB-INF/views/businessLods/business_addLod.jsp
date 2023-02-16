<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
	
<!DOCTYPE html>
<html>
<head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>

<script>
function execDaumPostcode() {
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
            document.getElementById('post_num').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('lod_address').value = fullRoadAddr;
        }
    }).open();
}
var cnt=0;
function fn_addFile(){
	  if(cnt == 0){
		  $("#d_file").append("<br>"+"<input  type='file' name='lod_img_main' id='f_main_image' style='height: 40px ' /> <a>메인 이미지</a>");	  
	  }else{
		  $("#d_file").append("<br>"+"<input  type='file' name='lod_img_common"+cnt+"' /> <a>일반 이미지</a>");
	  }
	
	cnt++;
}

var cnt1=0;
function fn_addFile1(){
	  if(cnt1 == 0){
		  $("#d_file1").append("<br>"+"<input  type='file' name='unit_img_main' id='f_main_image' style='height: 40px ' /> <a>메인 이미지</a>");	  
	  }else{
		  $("#d_file1").append("<br>"+"<input  type='file' name='unit_img_common"+cnt1+"' /> <a>일반 이미지</a>");
	  }
	
	cnt1++;
}


var num = 2;
 
function addOption(){
	if(num < 7){
		
	$("#option").append(	
			"<tr>"+
				"<td>객실 옵션_"+num+"</td>"+
				"<td><input name='lod_option"+num+"' type='text' style='width:274px;'></td>"+
			"</tr>"+
			"<tr>"+ 
				"<td>객실 옵션_"+num+" 가격</td>"+
				"<td><input name='lod_option"+num+"_price' type='text' style='width:274px;''></td>"+ 
			"</tr>"+
			"<tr>"+
				"<td>객실 옵션_"+num+" 정보</td>"+
				"<td><textarea name='lod_option"+num+"_info' rows='5' cols='37'></textarea></td>"+
			"</tr>"
			)
			
			num = num+1;
	} else {
		alter("옵션은 최대 6개까지만 가능합니다.");
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
	font-size: 15px;
	font-weight: 600;
	display:table-cell;
	border:1px solid #eeeddd;
	width:200px;
	padding:10px;
	float:none;
}

.tab_menu.active {
  background:#eeeddd;
}


/*-----------버튼-----------  */
.myButton {
	box-shadow: 0px 0px 0px 2px #4f5f8c;
	background:linear-gradient(to bottom, #6f88b3 5%, #4b5578 100%);
	background-color:#6f88b3;
	border-radius:10px;
	border:1px solid #6880c7;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:18px;
	font-weight:bold;
	padding:5px 15px;
	text-decoration:none;
	text-shadow:0px 0px 0px #283966;
	margin-left: 40%;
	margin-top:50px;
}
.myButton:hover {
	background:linear-gradient(to bottom, #4b5578 5%, #6f88b3 100%);
	background-color:#4b5578;
}
.myButton:active {
	position:relative;
	top:1px;
}
textarea {
	resize:none;
}

.post_num{
	width:80px;
	height:21px;
}
.lod_address{
 width: 465px;
 height: 21px;	
}

	
.refund{
	width: 430px;
	height: 300px;
	resize:none;
}
</style>

<meta charset="UTF-8">
<title>숙소 등록창</title>
</head>
<body>

<!-- ------------------------------------------------------------------------------------  -->	
	<div class="businessRightBox">
		<div class="pageName_2" >숙소 등록</div>
		<div class="tabbox">
			<ul class="tabs">
   				<li class="tab_menu"><a href="#tab1">숙소 정보</a></li>
    			<li class="tab_menu"><a href="#tab2">숙소 및 객실 소개</a></li>
    			<li class="tab_menu"><a href="#tab3">숙소 이미지</a></li>
    			<li class="tab_menu"><a href="#tab4">환불 규정</a></li>
  			</ul><br>
  		</div>
<form action="${contextPath}/businessLods/addNewLods.do" method="post" enctype="multipart/form-data">

<div class="tab-wrapper">
  <div class="tab_container">
    <div class="tab_content" id="tab1">
    <table id="lod" style="width:100%;">
			<tr>
				<td>숙소명</td>
				<td><input name="lod_name" type="text" style="width:274px;"></td>			
			</tr>
			<tr>
				<td colspan="2"><input type="text" class="post_num" id="post_num" name="post_num" size=7 value="${lod_info.post_num }" placeholder="주소"> <a href="javascript:execDaumPostcode()">우편번호검색</a></td>
			</tr>
			<tr>
				<td colspan="2"><input type="text" class="lod_address" id="lod_address" name="lod_address" size="50" value="${lod_info.lod_address }" placeholder="숙소 주소"><td>
			</tr>
			<tr>
				<td>숙소 대표 카테고리</td>
				<td>
					<select name="lod_category"  style="width:282px; text-align: center; font-size:15px; height:20.51px;">
						<option value="camping">캠핑</option>
						<option value="car">차박</option>
						<option value="caravan">카라반</option>
						<option value="glamping">글램핑</option>
					</select>
				</td>			
			</tr>
			<tr>
				<td>객실 옵션_1</td>
				<td><input name="lod_option1" type="text" style="width:274px;"></td> 
			</tr>
			<tr>
				<td>객실 옵션_1 가격</td>
				<td><input name="lod_option1_price" type="text" style="width:274px;"></td> 
			</tr>
			<tr >
				<td>객실 옵션_1 정보</td>
				<td><textarea name="lod_option1_info" rows="5" cols="37"></textarea></td>
			</tr >
			<tbody id="option"></tbody>
			<tr>
				<td><input type="button" value="옵션 추가" onClick="addOption()"/></td>
			</tr>
		</table>
					<!-- ----------------객실--------------------- -->
		<table style="width:100%;">
			<tr><td style="text-align: center;"colspan="2">객실</td></tr>
			<tr>
				<td>객실 이름</td>
				<td><input name="unit_name" type="text" style="width:274px;"></td>
				
			</tr>
			<tr>			
				<td >객실 카테고리</td>
				<td>
					<select name="unit_category" style="width:282px; text-align: center; font-size:15px; height:20.51px;">
						<option value="camping">캠핑</option>
						<option value="car">차박</option>
						<option value="caravan">카라반</option>
						<option value="glamping">글램핑</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>객실 면적</td>
				<td><input name="unit_extent" type="text" style="width:274px;"></td>
			</tr>
			<tr>
				<td>객실 가격</td>
				<td><input name="unit_price" type="text" style="width:274px;"></td>
			</tr>
			<tr>
				<td>기준 수용 인원 (명)</td>
				<td><input name="min_p" type="text" style="width:274px;"></td>
			</tr>
			<tr>
				<td>최대 수용 인원 (명)</td>
				<td><input name="max_p" type="text" style="width:274px;"></td>
			</tr>
			
			</table>
			
			</div>
			
			
    <!--  ---------------------------------------------------------------------------- -->
    <div class="tab_content" id="tab2">
    	<table>
			<tr>
				<td style="width: 95px;">숙소 소개</td>
				<td><textarea name="lod_info" rows="20" cols="50"></textarea></td> <!-- 아직 DB 업데이트 안됨 -->
			</tr>
		</table>
		<table>			
			<tr>
				<td style="width: 95px;">객실 소개</td>
				<td><textarea name="unit_info" rows="20" cols="50"></textarea></td>
			</tr> 
		</table>
		<table id="unitInfoTable"></table>
		
	</div>
	
	
	
	<!-- ----------------------------------------------------------------------------------- -->
	
	
    <div class="tab_content" id="tab3">
    <table>
	   		<tr>
	   			<td style="height: 50px;"><input type="button" value="이미지 추가" onClick="fn_addFile()"/>&nbsp; 숙소 이미지 첨부</td>
	   		</tr>
	   		<tr>
	   		<td><div id="d_file" ></div></td>
	   		
	   		</tr>
	   	</table>
	   	<br>
	   	
	    <table>
	   		<tr>
	   			<td style="height: 50px;"><input type="button" value="이미지 추가" onClick="fn_addFile1()"/>&nbsp; 객실 이미지 첨부</td>
	   		</tr>
	   		<tr>
	   		<td><div id="d_file1" ></div></td>
	   		</tr>
	   	</table>
	   	
	   	<table id="unitImgTable"></table>

    </div>
    
    <div class="tab_content" id="tab4">
    <table>
    <tr>
    	<td style="width: 138px; text-align: center;">환불 규정</td>
    	<td><textarea class="refund" name="refund"></textarea></td>
    </tr>
    </table>
    </div>
  </div><!-- //tab-content -->
  
</div><!-- //tab-wrapper -->
<button class="myButton" value="숙소등록">등록하기</button>
</form>

</div>

</body>
</html>