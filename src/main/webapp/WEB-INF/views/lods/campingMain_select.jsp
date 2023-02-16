<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
      a{
      text-decoration: none;  
      }    
      .mainBody{
      
      }
    /*-----------이미지, 인포--------*/
    .camping{
      padding: 7px;
      padding-left: 8px;
      border: 1px solid #000000;
      height: 190px;
      width: 700px;

      margin: auto;
      margin-bottom: 8px;
    }
    .campingMain{
      height: 175px;
      width: 335px;
      float: left;
    }
    .campingName{
      font-size: 18px;
      font-weight:bold;
      margin: 5px;
    }
    .address{ 
     font-size: 15px;
      padding-left: 5px;
    }
    .address1{
      font-size: 15px;
      padding-left: 40px;
    }
    /*-----------예약 날짜---------*/
    .reservationDate{
      padding-top: 7px;
      padding-left: 15px;
      height: 35px;
      width: 650px;
      border: 1px solid #000000;
      border-radius:10px;

      font-size: 18px;
      margin: auto;
      margin-bottom: 8px;
    }
    .reserveDate{
      font-size: 18px;
      border-radius:10px;
      padding-left: 45px;
    }
    .human, .text{
      font-size: 20px;
    }
     .number{
      padding-left: 15px;
      height: 38px;
      width: 650px;
      border: 1px solid #000000;
      border-radius:10px;
      
      margin: auto;
      margin-bottom: 8px;
		}
    
		.minus, .plus{
      cursor:pointer;
			width: 20px;
			height: 30px;
			background:#f2f2f2;
			border-radius:4px;
			
			border:1px solid #ddd;
      display: inline-block;
      text-align: center;
      font-size: 20px;
      margin: 0 auto;
      padding:3px;
		}
		.text{
			height:25px;
      width: 100px;
      text-align: center;
      font-size: 17px;
			border:1px solid #ddd;
			border-radius:4px;
      display: inline-block;
      
    }

    .roomName, .optionSelect{
      font-size: 17px;
      
    }
    
    
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
  float: right;
  margin-top: 3px;
  margin-right: 10px;
}
.myButton:hover, .myButton2:hover, .myButton3:hover {
	background:linear-gradient(to bottom, #4b5578 5%, #6f88b3 100%);
	background-color:#4b5578;
}
.myButton:active .myButton2:active, .myButton3:active {
	position:relative;
	top:1px;
}

    
  .roomSelec{
    padding-top: 7px;
    padding-left: 15px;
    width: 650px;
    height: 38px;
    border: 1px solid #000000;
    font-size: 20px;
   
    border-radius:10px;
    margin: auto;
    margin-bottom: 8px;
  }


    /*------------------main------------------*/
    .main{
    width: 712px;
    height: auto;
   
    margin: auto;
  	padding-bottom: 40px;
    }
    .cate{
      display: inline-block;
    }		
    
  .myButton1 {
	border:1px solid #000000;
	cursor:pointer;
	color:#000000;
	font-size:20px;
	font-weight:bold;
  	text-align: center;
	text-decoration:none; /*밑줄 제거*/
	width: 175px;
	height: 42px;
	float: left;
	line-height: 44px;
  }
  
  
  .myButton1:hover {
	background-color:#E1DFDF;
  }
  .myButton1:active {
	position:relative;
	top:1px;
  }

    .roomlist{
      font-size: 18px;
      font-weight:bold;
      margin: 15px;
    }
  .room{
    margin-top: 10px;
    border: 2px solid #000000;
    width: 669px;
    height: auto;
    margin: 20px;
      
  }
.roomData{
	
   
	height: 210px;
}
    .room_img{
      width: 400px;
      height: 200px;
      margin: 5px 5px;
      float: left;
    }
    .siteName{
      font-size: 20px;
      font-weight:bold;
    }
    .room_info{
      
    }
    .price{
      float: right;
      margin-right: 10px;
      margin-top: 100px;
      font-size: 20px;
    }
    .room_data{
    	white-space: pre-line;
    	width: 665px;	
    	padding: 5px;
    }
    .myButton2 {
	box-shadow: 0px 0px 0px 2px #4f5f8c;
	background:linear-gradient(to bottom, #6f88b3 5%, #4b5578 100%);
	background-color:#6f88b3;
	border-radius:7px;
	border:1px solid #6880c7;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size: 20px;
	font-weight:bold;
	padding:4px 20px;
	text-decoration:none;
	text-shadow:0px 0px 0px #283966;
  float: right;
  margin-top: 15px;
  margin-right: 10px;
}
.myButton3 {
	box-shadow: 0px 0px 0px 2px #4f5f8c;
	background:linear-gradient(to bottom, #6f88b3 5%, #4b5578 100%);
	background-color:#6f88b3;
	border-radius:7px;
	border:1px solid #6880c7;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size: 20px;
	font-weight:bold;
	padding:4px 20px;
	text-decoration:none;
	text-shadow:0px 0px 0px #283966;
  float: right;
  margin-top: 15px;
  margin-right: 10px;
}
.reserve{
margin-top: 10px;
margin-bottom:20px;
}
  </style>

</head>
<body>


<div class="mainBody">
  <div>
    <div class="camping">
    <span><img class="campingMain" src="${contextPath}/resources/image/campingMain.jpg"></span>
    <span class="campingName">더시크릿가든</span><br>
    <span>
    <a class="address">캠핑지 주소 :</a><br>
    <a class="address1">경기도 가평군 설악면 유명산길 122-10</a>
    </span>
    </div>
    
    <div class="reservationDate">
      <span class="reservBox">예약 날짜 &nbsp : &nbsp
      <span><input class="reserveDate" type="date"></span> &nbsp &nbsp / &nbsp &nbsp
      <span><input class="reserveDate" type="date"></span>
        </span>
    </div>    
  </div>


  
  
  <div class="number">
    <div class="box">
      <span class="human">성인 &nbsp </span>&nbsp
    	<input class="text" type="text" value="1"/>&nbsp
      <span class="minus">-</span>
    	<span class="plus">+</span>
    
        
      <span class="human">&nbsp &nbsp &nbsp 아동 &nbsp</span>
    	<input class="text" type="text" value="1"/>
      <span class="minus">-</span>
    	<span class="plus">+</span>
    </div>
      
  </div>


  
  
  <div class="roomSelec">
    <span>객실이름 : </span>
    <select class="roomName" >
      <option value="room_A">room_A</option>
      <option value="room_B">room_B</option>
      <option value="room_C">room_C</option>
      <option value="room_D">room_D</option>
    </select>
    &nbsp
    <select class="optionSelect">
      <option value="">옵션을 선택하세요</option>
      <option value="non">선택 안함</option>
      <option value="peoplePlus">인원 추가</option>
      <option value="gogi">삼겹살</option>
      <option value="kimch">김치</option>
      <option value="barbecue">바베큐준비</option>
    </select>
    <span>금액 80,000원</span>
    <span><a href="/galgga/camping_pay.do" class="myButton">예약 하기</a></span>
  </div>


  
  <div class="main">
    <div class="cate">
    	<span><a href="#" class="myButton1">객실목록</a></span>
    	<span><a href="#" class="myButton1">Q & A</a></span> 
	    <span><a href="#" class="myButton1">리 뷰</a></span> 
	    <span><a href="#" class="myButton1">환불 안내</a></span>
	</div>

    <div class="roomlist">객실목록</div>
    
  <div class="room">
  	<div class="roomData">
    <a href="#"><img src="${contextPath}/resources/image/camping_room.jpg" class="room_img"></a>
    <a href="#"><span class="siteName">Camping_A_site</span></a><br>
    <span class="roomInfo">면적 : 11.5평<br>
    기준인원 ㅇ 명 / 최대가능인원 ㅇ명</span>
    <span class="price">230,000원</span>
   </div>
    <pre class="room_data">
    	[Camping_A_site]
			집에 있는 아기용 풀(3x3) 을 가져오시면 차가운 계곡물 받아드립니다
			
			감성스팟 캠프지라운드의 글램핑존는 일본의 스노우피크사 와 유니프레임사의 텐트군으로 구성되어있으며,조용하고 이국적인 감성의 힐링 캠프를 위해서 퀄리티있게 관리되어있는 리얼캠핑체험놀이공간입니다.(모든 감성캠핑장비로 구비되어있습니다).<침낭4개포함>
			-기본 안내 사항
			스노우피크 또는 유니프레임 텐트(랜덤)사용하며 내부에서 전기 사용이 가능합니다.
			6M X 7M 의 데크도 함께 사용합니다.
			<글램핑 존에서는 침낭 제공>
			<침낭은 사용후 고온건조 세척으로 청결 유지하고 있으나,예민하신 고객은 각자 쓰실 이불 가지고 오셔도됩니다.>
			
			-차량에 관련된 사항
			주차장에 구비되어 있는 케이어를 활용해 짐을 날러주시기를 권장합니다
			사이트 1개 당 차량 수는 1대이며 옵션선택으로 추가 1대까지 가능합니다.
			-화로 사용에 관한 사항
			잔디 위에서 사용 시 화로 받침대에 장작 또는 돌등을 화로 아래에 받치고
			사용 해주시고 텐트 및 기타 가연성 소재와의 안전 거리를 확보하신 후
			사용하시기 바랍니다.
			화재 발생에 대비하여 소화기 위치를 확인 해 주시고 화로로 인한 데크
			손상 시 캠핑장에서 수리 비용을 청구할 수 있습니다.
			-반려동물동반에 대한 사항
			사이트당 최대 2마리까지만 가능
			반려동물에 관련된 민원 발생 시 주의
			반려동물의 배설물은 꼭 치워주시기 바랍니다.
			
			기준인원 2명 / 최대인원 4명
			
			사이트 입퇴실 시간
			*입실 15:00 / 퇴실 11:00*
			동계시즌 입퇴실 시간 12월~3월
			*입실 14:00 / 퇴실 10:30*
			
			데크 사이즈 6M x 7M
			
			분리수거 안내
			일반쓰레기 / 재활용쓰레기(플라스틱, 캔, 병) 구분하여 분리수거통에 담아주세요.
			캠핑용품이나 생활가전 등은 캠핑장에 버리고 갈 수 없습니다.
			
			-21시이후는 매너타임.소곤소곤 대화 부탁드립니다.(엄격관리)
			-동계는 난로와장작은 필수입니다.(예약시 옵션신청하시면 겨울에도 춥지않고 동계캠핑의 매력에 푹 빠지실꺼예여^^)
			
			[시설정보]
			- 글램핑 , 데크 , 글램핑 , 데크
    </pre>
          <div class="reserve">
	     <a href="/galgga/campingMain.do" class="myButton2">더 둘러보기</a>
	     <a href="/galgga/camping_pay.do" class="myButton3">예약 하기</a>
	  </div>
     </div>


  </div>

  
  
  </div>
 
  

 
</body>
</html>