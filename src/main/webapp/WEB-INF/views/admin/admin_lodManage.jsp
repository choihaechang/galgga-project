<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

  /*--------------AdminRightBox------------*/
  
  #lodginName{
  font-size: 18px;
  	width: auto;
    border-right: 2px solid #5B5B5B;
  } 
  #BusinessName{
  width: auto;
  font-size: 18px;
  }
  #MainImageAdd{
  width: 283px;
  height: 156px;
  }
  .MainImgBox{
  display: flex;
  width: 283px;
  justify-content: space-around;
  }
  #MainImageAdd1, #MainImageAdd2, #MainImageAdd3{
  width: 80px;
  height: 59px;
  margin: auto;
  }
  #UnitImgAdd_1_Main{
  width: 283px;
  height: 156px;
  margin-bottom: 10px;
  }
  #UnitImgAdd_1_1, #UnitImgAdd_1_2, #UnitImgAdd_1_3{
  width: 80px;
  height: 59px;
  margin: auto;
  }
  
  #UnitName{
  margin-left: 10px;
  margin_bottom: 20px;
  font-size: 20px;
  font-weight:bold;
  }
  
 /*------------------------버튼 부분----------------------------------*/ 
  
.myButton {
	box-shadow: 0px 0px 0px 2px #4f5f8c;
	background:linear-gradient(to bottom, #6f88b3 5%, #4b5578 100%);
	background-color:#6f88b3;
	border-radius:7px;
	border:1px solid #6880c7;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:13px;
	font-weight:bold;
	padding:4px 7px;
	text-decoration:none;
	text-shadow:0px 0px 0px #283966;
 	align: center;
	margin-top: 3px;
}
	.myButton{
	
	margin-right: 10px;	
	}
.myButton:hover {
	background:linear-gradient(to bottom, #4b5578 5%, #6f88b3 100%);
	background-color:#4b5578;
}
.myButton:active{
	position:relative;
	top:1px;
}
  </style>

</head>
<body>
<div class="AdminRightBox">
	<div class="pageName_2">숙소 관리</div>
	
	<div style="display:flex;  margin-top:10px;">
		<div id="lodgingName">같이가자&nbsp;</div>
		<div id="BusinessName">&nbsp;같이 가자 사업자 등록 신청건입니다.</div>
	</div>
	
	<div>
		<div style="margin-top:10px; font-size: 15px;">메인 이미지</div>
		<div>
				<img id="MainImageAdd" src="../image/campingAdd_main.jpg" alt="메인이미지">
					<div class="MainImgBox">
						<div><img id="MainImageAdd1" src="../image/campingAdd_main.jpg" alt="메인이미지_1"></div>
						<div><img id="MainImageAdd2" src="../image/campingAdd_main.jpg" alt="메인이미지_2"></div>
						<div><img id="MainImageAdd3" src="../image/campingAdd_main.jpg" alt="메인이미지_3"></div>
					</div>
		</div>
	 
		<div style="margin-top:10px; font-size: 15px;">각 객실 또는 사이트 사진</div>
		<div style="display: flex; margin-bottom: 15px;">
			<div>
				<img id="UnitImgAdd_1_Main" src="../image/campingAdd_Unit.jpg" alt="서브이미지">
					<div class="MainImgBox">
						<div><img id="UnitImgAdd_1_1" src="../image/campingAdd_Unit.jpg" alt="서브이미지_1"></div>
						<div><img id="UnitImgAdd_1_2" src="../image/campingAdd_Unit.jpg" alt="서브이미지_2"></div>
						<div><img id="UnitImgAdd_1_3" src="../image/campingAdd_Unit.jpg" alt="서브이미지_3"></div>
					</div>
			</div>
				<div>
					<div id="UnitName">Camping_A_Site</div>
					<div id="UnitArea">&nbsp; 면적 : 6M(미터) X 7M(미터)</div>
					<div id="UnitAble">&nbsp; 기준 인원 : 0 명  /  최대 인원 : 0 명</div>
				</div>			
		</div>
	
		<div style="display: flex; margin-bottom: 15px;">
			<div>
			<!-- img id 부분  UnitImgAdd_1_1 >>> UnitImgAdd_${id}_1처럼 수정해야함 -->
				<img id="UnitImgAdd_1_Main" src="../image/campingAdd_Unit.jpg" alt="서브이미지">
					<div class="MainImgBox">
						<div><img id="UnitImgAdd_1_1" src="../image/campingAdd_Unit.jpg" alt="서브이미지_1"></div>
						<div><img id="UnitImgAdd_1_2" src="../image/campingAdd_Unit.jpg" alt="서브이미지_2"></div>
						<div><img id="UnitImgAdd_1_3" src="../image/campingAdd_Unit.jpg" alt="서브이미지_3"></div>
					</div>
			</div>
				<div>
					<div id="UnitName">Camping_B_Site</div>
					<div id="UnitArea">&nbsp; 면적 : 6M(미터) X 7M(미터)</div>
					<div id="UnitAble">&nbsp; 기준 인원 : 0 명  /  최대 인원 : 0 명</div>
				</div>			
		</div>
		
		<div style="display: flex; margin-bottom: 15px;">
			<div>
			
				<img id="UnitImgAdd_1_Main" src="../image/campingAdd_Unit.jpg" alt="서브이미지">
					<div class="MainImgBox">
						<div><img id="UnitImgAdd_1_1" src="../image/campingAdd_Unit.jpg" alt="서브이미지_1"></div>
						<div><img id="UnitImgAdd_1_2" src="../image/campingAdd_Unit.jpg" alt="서브이미지_2"></div>
						<div><img id="UnitImgAdd_1_3" src="../image/campingAdd_Unit.jpg" alt="서브이미지_3"></div>
					</div>
			</div>
				<div>
					<div id="UnitName">Camping_C_Site</div>
					<div id="UnitArea">&nbsp; 면적 : 6M(미터) X 7M(미터)</div>
					<div id="UnitAble">&nbsp; 기준 인원 : 0 명  /  최대 인원 : 0 명</div>
				</div>			
		</div>
		<div style="margin: auto; width: 163px;">
			<a href="#" class="myButton">승인 하기</a>
			<a href="#" class="myButton">반려 하기</a>
		</div>
	</div>
</div>
</body>
</html>