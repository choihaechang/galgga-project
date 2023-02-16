<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실 선택</title>
<script type="text/javascript">
	function count(type)  {
  // 결과를 표시할 element
  const resultElement = document.getElementById('adult');
  // 현재 화면에 표시된 값
  let number = resultElement.innerText;
  // 더하기/빼기
  if(type === 'plus') {
    number = parseInt(number) + 1;
  }else if(type === 'minus')  {
    number = parseInt(number) - 1;
    number = number < 0 ? 0 : number;
  }
  // 결과 출력
  resultElement.innerText = number;
}
	function count1(type)  {

		  const resultElement = document.getElementById('child');
		  // 현재 화면에 표시된 값
		  let number = resultElement.innerText;

		  // 더하기/빼기
		  if(type === 'plus') {
		    number = parseInt(number) + 1;
		  }else if(type === 'minus')  {
		    number = parseInt(number) - 1;
		    number = number < 0 ? 0 : number;
		  }
		  
		  // 결과 출력
		  resultElement.innerText = number;
		}
	
</script>


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
    
    /* -----------------------------성인 아동 ---------*/
    .human, .text{
      font-size: 20px;
      padding-top: 4px;
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
    
    #adult, #child{
      border: 1px solid #000000;
      width:100px;
        height:26px;
       text-align:center;
       vertical-align: middle;
        padding-top:9px;
        margin: 0px 14px; 
        border-radius:8px;
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

 #plus, #minus{
 width:30px;
 font-size: 20px;
 text-weight: bold;
 }


/*------------------------객실 선택 ---------------  */



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
.myButton:hover {
	background:linear-gradient(to bottom, #4b5578 5%, #6f88b3 100%);
	background-color:#4b5578;
}
.myButton:active {
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
    border: 0.4px solid #000000;
    width: 669px;
    height: 101px;
    margin: 20px;
      
  }

    .room_img{
      width: 212px;
      height: 92px;
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
      font-size: 20px;
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
    <div class="box" style="display: flex">
    <div style="display: flex;">
      <span class="human">성인 &nbsp </span>&nbsp
    	<input type='button'onclick='count("plus")' value='+' id="plus"/>
  
	  <div id="adult" >0</div>
	  
	<input type='button' onclick='count("minus")' value='-' id="minus"/>
	</div>
    
       <div style="display: flex;">
      <span class="human">&nbsp &nbsp &nbsp 아동 &nbsp</span>
     <input type='button'onclick='count1("plus")' value='+' id="plus"/>
	  <div id="child">0</div>
	<input type='button' onclick='count1("minus")' value='-' id="minus"/>
	</div>
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
   <span><a href="/galgga/order/camping_pay.do" class="myButton">예약 하기</a></span>
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
    <a href="/galgga/lodge/campingMain_select.do"><img src="${contextPath}/resources/image/camping_room.jpg" class="room_img"></a>
    <div>
    <a href="/galgga/lodge/campingMain_select.do"><span class="siteName">Camping_A_site</span></a><br>
    <span class="roomInfo">면적 : 11.5평<br>
    기준인원 ㅇ 명 / 최대가능인원 ㅇ명</span>
    <span class="price">60,000원</span>
    </div>
  </div>
  
  
  <div class="room">
    <a href="/galgga/lodge/campingMain_select.do"><img src="${contextPath}/resources/image/camping_room.jpg" class="room_img"></a>
    <div>
    <a href="/galgga/lodge/campingMain_select.do"><div class="siteName">Camping_B_site</div><br></a>
    <span class="roomInfo">면적 : 12.5평<br>
    기준인원 ㅇ 명 / 최대가능인원 ㅇ명</span>
    <span class="price">80,000원</span>
    </div>
  </div>

  <div class="room">
    <a href="/galgga/lodge/campingMain_select.do"><img src="${contextPath}/resources/image/camping_room.jpg" class="room_img"></a>
    <div>
    <a href="/galgga/lodge/campingMain_select.do"><div class="siteName">Camping_C_site</div><br></a>
    <span class="roomInfo">면적 : 14평<br>
    기준인원 ㅇ 명 / 최대가능인원 ㅇ명</span>
    <span class="price">100,000원</span>
    </div>
  </div>

      <div class="room">
    <a href="/galgga/lodge/campingMain_select.do"><img src="${contextPath}/resources/image/camping_room.jpg" class="room_img"></a>
    <div>
    <a href="/galgga/lodge/campingMain_select.do"><div class="siteName">Camping_D_site</div><br></a>
    <span class="roomInfo">면적 : 15평<br>
    기준인원 ㅇ 명 / 최대가능인원 ㅇ 명</span>
    <span class="price">150,000원</span>
    </div>
  </div>
  </div>  
  </div>

</body>
</html>