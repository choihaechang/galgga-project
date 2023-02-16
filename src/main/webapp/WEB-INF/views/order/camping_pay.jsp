<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="data" value="${beforeResMap }"/>
<c:set var="ready" value="${beforeResMap.beforeResVO }"/>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

<meta charset="UTF-8">
<title>예약하기</title>
<script>
function reserve(){
	
	IMP.init('imp44640869');
	IMP.request_pay({
		pay_method : 'card',
		merchant_uid : 'merchant_' + new Date().getTime(),
		name : "숙소명 : ${ready.lod_name}, 객실명 : ${ready.unit_name}",
		amount : ${ready.unit_price*data.difDate},
		buyer_name : document.getElementById('member_name'),
		buyer_tel : document.getElementById('phone1').value +"-"+document.getElementById('phone2').value + "-" + document.getElementById('phone3').value,
		
	},
	
	function (rsp) {
    console.log(rsp);
    if (rsp.success) {
      var msg = '결제가 완료되었습니다.';
      alert(msg);
      document.getElementById("reserve").submit();
      
    } else {
      var msg = '결제에 실패하였습니다.';
      msg += '에러내용 : ' + rsp.error_msg;
      alert(msg);
    }
  });
	
	
	
	
	

}









</script>
<style>
.reserveBox{
 
  width: 720px;
  height: auto;
  margin: auto;	
  padding-bottom: 10px;
  }
   
  .reserveText{

		width: auto;
		height: 45px;
		font-family: 'Inter';
		font-style: normal;
		font-weight: 400;
		font-size: 30px;
		line-height: 36px;		
		color: #000000;
		margin-left:80px;

		
		    
  }
    .line{
		margin-top: 0px;
		margin-bottom: 40px;
      width: 120px;
      height: 0px;
      left: 0px;

      border: 1px solid;
  }


/*-------------------메인 시작------------------------*/
    .campingName{
        width: 500px;
        height: 28px;
		margin-left: 45px;
        margin-top: 20px;
        margin-bottom: 5px;
        font-family: 'Inter';
        font-style: normal;
        font-weight: 500;
        font-size: 22px;
        line-height: 24px;
        color: #000000;
    
    }
    
    .optionText{
        width: 500px;
        height: 28px;
		margin-left: 45px;
        margin-top: 20px;
        margin-bottom: 5px;
        font-family: 'Inter';
        font-style: normal;
        font-weight: 400;
        font-size: 22px;
        line-height: 24px;
        color: #000000;
    }

	.roomNameChkName{
	margin:auto;
	width: 600px;
	border: 1px solid #000000;
	font-size: 22px;
    font-weight: 800;
	border-radius:10px;
	padding: 2px 0px 2px 20px;
	
	}



	.member_name{
	margin:auto;
	width: 630px;
	
	font-size: 22px;
    font-weight: 400;
	border-radius:10px;
	padding: 2px 0px 10px 0px;
	
	}
	.member{
	margin-left: 50px;
	border: 1px solid #000000;
	border-radius:10px;
	width: 605px;
	height: 30px;
	padding-left:10px;
	font-size: 20px;
	}

	.phoneNum{
	margin:auto;
	width: 630px;
	
	font-size: 22px;
    font-weight: 400;
	border-radius:10px;
	padding: 2px 0px 10px 0px;
	}
	.phone{
	margin-left: 50px;	
	}
	.phone1, .phone2, .phone3{
	height: 30px;
    border: 1px solid #000000;
    width: 140px;
    border-radius: 10px;
	}





	.the_date{
	margin:auto;
	width: 600px;
	border: 1.5px solid #000000;
	font-size: 19px;
	height:28px;
	border-radius:10px;
	padding: 2px 0px 2px 20px;
	font-weight: 500;
	}
		
	.tle{
	margin-bottom: 10px;
	}
	
	.roomNameChk{
	    width: 500px;
        height: 28px;
		margin-left: 45px;
        margin-bottom: 5px;
        font-family: 'Inter';
        font-style: normal;
        font-weight: 500;
        font-size: 22px;
        line-height: 24px;
        
        color: #000000;
	}
	
	/*-----------옵션시작----------*/
	.optionBox{
	margin: auto;
	margin-top: 10px;
	width: 620px;
	padding: 20px 0px 20px 0px;
	border: 1px solid #000000;
	border-radius:10px;
	height: auto;
	}
	
	.optionName{
	font-size: 21px;
	font-weight: 530;
	}
	.optionInfo{
	font-size: 16px;
	margin-bottom: 13px;
	width: 500px; 
	}
	
	.optionNum{
	text-align: right;
	text-weight: 600;
	font-size: 20px;
	}
	
	
	
	
	.num{
	font-size: 16px;
	padding-right: 20px;
	float: right;
	margin-right: 10px;
	margin-top: 1px;
	
	}
	.numSelec{
	text-align: center;
	}

	.box{
	width:550px;
		margin:auto;
	
	margin-bottom: 14px;
	padding: 10px;
	height:auto;
	border-bottom: 1.5px dotted #000000;
	}
	/*--------------결제금액---------------*/ 
	.pay{
	font-size: 20px;
	font-weight:bold;
	text-align: right;
	margin-right: 25px;
	}
	.pay_money{
	font-size: 17px;
	margin-left:40px;
	}
	.money{
	font-size: 22px;
	font-weight:bold;
	float: right;
	margin-right: 50px;
	}
	.usepoint{
	font-size: 16px;
	float:right;
	margin-right: 10px;
	}
	/*--------------button---------------*/
	.myButton1:hover, .myButton2:hover {
	background:linear-gradient(to bottom, #4b5578 5%, #6f88b3 100%);
	background-color:#4b5578;
	}
	.myButton1:active, .myButton2:active {
		position:relative;
		top:1px;
	}
	.myButton1, .myButton2 {
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
    text-align: center;
    }
    
  
    .myButton2{
    margin-top: 40px;
    margin-left: 243px;
    margin-bottom: 10px;
   	}
    
  </style>

</head>
<body>

<form action="${contextPath}/order/haveReserve.do" method="post" id="reserve">
<div class="reserveBox">
  <div class="reserveText">예약하기
  <p class="line"></p>
  </div>
  
   
	<div class="tle">
	  <div class="campingName">숙소 이름 : ${ready.lod_name}</div>
	  <div class="the_date"> ${data.checkIn_date } - ${data.checkOut_date } &nbsp; &nbsp; &nbsp;   ${data.difDate}박 ${data.difDate+1}일</div>
	</div>

	<div class="tle">
	  	<div class="roomNameChk">객실 확인 </div>
	  	<div class="roomNameChkName">${ready.unit_name }</div>
	</div>
	
	<div class="tle">
	<div class="member_name" >예약자 명 (필수)</div>
	<input type="text" class="member" name="member_name" id="member_name">
	</div>
	
	
	
	<div class="tle">
	<div class="phoneNum">핸드폰 번호 (필수)</div>
	<div class="phone">
		<input type="text" class="phone1" id="phone1" name="phone1"><strong> - </strong><input type="text" class="phone2"name="phone2" id="phone2"><strong> - </strong><input type="text" class="phone3" id="phone3" name="phone3">
	</div>
	</div>
	   
  
  
  <div class="optionText"> 옵션 공지</div>
  
  	<div class="optionBox">
  	<c:if test="${ready.lod_option1 != null && ready.lod_option1 !=''}">
  		<div class="box">		
			  <div class="optionName">${ready.lod_option1}</div><br>
			  <div class="optionInfo">${ready.lod_option1_info}</div>	 
			  <div class="optionNum">${ready.lod_option1_price }원</div>
 		 </div>
 		</c:if> 
 		  	<c:if test="${ready.lod_option2 != null && ready.lod_option2 !=''}">
  		<div class="box">		
			  <div class="optionName">${ready.lod_option2}</div><br>
			  <div class="optionInfo">${ready.lod_option2_info}</div>	 
			  <div class="optionNum">${ready.lod_option2_price }원</div>
 		 </div>
 		</c:if> 
 		  	<c:if test="${ready.lod_option3 != null && ready.lod_option3 !=''}">
  		<div class="box">		
			  <div class="optionName">${ready.lod_option3}</div><br>
			  <div class="optionInfo">${ready.lod_option3_info}</div>	 
			  <div class="optionNum">${ready.lod_option3_price }원</div>
 		 </div>
 		</c:if> 
 		  	<c:if test="${ready.lod_option4 != null && ready.lod_option4 !=''}">
  		<div class="box">		
			  <div class="optionName">${ready.lod_option4}</div><br>
			  <div class="optionInfo">${ready.lod_option4_info}</div>	 
			  <div class="optionNum">${ready.lod_option4_price }원</div>
 		 </div>
 		</c:if> 
 		  	<c:if test="${ready.lod_option5 != null && ready.lod_option5 !=''}">
  		<div class="box">		
			  <div class="optionName">${ready.lod_option5}</div><br>
			  <div class="optionInfo">${ready.lod_option5_info}</div>	 
			  <div class="optionNum">${ready.lod_option5_price }원</div>
 		 </div>
 		</c:if> 
 		  	<c:if test="${ready.lod_option6 != null && ready.lod_option6 !=''}">
  		<div class="box">		
			  <div class="optionName">${ready.lod_option6}</div><br>
			  <div class="optionInfo">${ready.lod_option6_info}</div>	 
			  <div class="optionNum">${ready.lod_option6_price }원</div>
 		 </div>
 		</c:if> 
 		 
  		<div class="box">
  		<div style="font-size: 17px; font-weight: bold; margin: auto; width: 460px;">옵션 사용할 고객님은 방문전에 미리 전화해서 말해주세요!!</div>
  		<br>
  		</div>  	
  		  	
  		  	
  		  	
  		  	
  		  	
 		 
 		 <div class="box">		
			  <span class="optionName">보유 쿠폰 사용</span>
			  <span class="optionNum">
				  	<select class="num">
				  		<option value="">보유 쿠폰 사용</option>
				  		<option class="numSelec"value="1">10% 할인</option>
				  		<option class="numSelec"value="2">13% 할인</option>
				  		<option class="numSelec"value="3">7% 할인</option>
				  		<option class="numSelec"value="4">15% 할인</option>
				  		<option class="numSelec"value="5">5% 할인</option>
				  		<option class="numSelec"value="non">해당안함</option>
				  	</select><br>
				  </span>
				  <span class="optionInfo">쿠폰 할인 사용</span>	 
 		 </div>
 		 <div class="box">		
			  <span class="optionName">마일리지 사용</span>
			  <span class="optionNum">
				  	<input type="text" class="usepoint" placeholder="보유 마일리지 사용">
				  	
				  </span><br>
				  <span class="optionInfo">보유 마일리지 사용<br> 현 30,000포인트 보유</span>	test ${data.adult } 
 		 </div>
 		 
 		
 		 	
 		 	 <input type="hidden" name="adult" value="${data.adult }">
 		 	 <input type="hidden" name="child" value="${data.child }">
	 		 <input type="hidden" name="lod_name" value="${ready.lod_name }">
	 		 <input type="hidden" name="checkIn_date" value="${data.checkIn_date}">
	 		 <input type="hidden" name="checkOut_date" value="${data.checkOut_date}">
	 		 <input type="hidden" name="unit_name" value="${ready.unit_name}">
	 		 <input type="hidden" name="unit_price" value="${ready.unit_price}">
	 		 <input type="hidden" name="unit_id" value="${ready.unit_id }">
	 		 <input type="hidden" name="lod_id" value="${ready.lod_id }">
	 		 <input type="hidden" name="m_id" value="${data.m_id }">
 		 
 		 
 		 
 		 <div class="pay">예상금액 : ${ready.unit_price*data.difDate}원</div>
 		 <div class="reserve">
	     
	     <a class="myButton2" onclick="return reserve()">예약 하기</a>
	  </div>
	  
	  </div>
	 </div>
</form>
</body>
</html>