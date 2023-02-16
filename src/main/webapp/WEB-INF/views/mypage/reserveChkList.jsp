<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="reserve" value="${myReserveList}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.myPageBox{
  /*border: 1px solid #000000;*/
  width: 720px;
  height: 700px;
  margin: auto;	
  padding-bottom: 10px;
  }
  
  .pageName{
		width: 150px;
		height: 45px;
		font-family: 'Inter';
		font-style: normal;
		font-weight: 400;
		font-size: 28px;
		line-height: 36px;		 
		color: #000000;
		margin-left:0px;
		margin-top:0px;
		
		    
  }
    .line{
  		margin-top: 0px;
  		margin-bottom: 40px;
      width: 140px;
      height: 0px;
      left: 0px;
      border: 1px solid;
  }
  
  /*-------------유저이름, 포인트, 쿠폰-----------------*/
  .userInfo{
    height: auto;
  
  }
  .userName{
    font-size: 20px;
    width: 130px;
    float: left;
    height: 51px;
    text-align: center;
   
   
  }

  .mypagelist { /* OOO님 포인트 보유 ,쿠폰 */
    float: right;
    width: 550px;
    height: 50px;
    margin-bottom: 5px;
    
    
  }

  .point{
  	width: 190px;
    float: right;
    height: 51px;
   
  }
  
  .pointText{
  margin-left: 50px;
  width: 105px;

  }
  
  .pointimg {
  	width: 50px;
  	height: 25px;
  }
  
  
  .coupon{
    margin-left: 50px;
    width: 150px;
    float: right;
  }
  .couponText{
  margin-left: 80px;
  
  }
  
  .couponimg {
  	width: 40px;
  	height: 25px;
  }

  .lodgingbutton { /* 예약취소 버튼 */
    float: right;    
    border-radius: 5px;
    background: #FFFFFF;
    
  }
   

  
  /*------------------숙소 내역 확인----------------------*/
  .campingNameChk{
    font-size: 20px;
    height: 400px;
    width: 550px;
    margin-left: 170px;
    margin-top: 20px;
  }
  
  .reserveInfoText{
  font-size: 15px;
  margin-right: 25px;
  margin-left: 12px;
  width:680px;
  }

  .reserveInfo{
  float: right;
  width:550px;
  margin-top: 10px;
  border-top: 2px solid;
  border-bottom: 1px solid;
  padding-top: 10px;
  padding-bottom: 10px;
  
  }
  .list{
 	font: 30px;
 	width: 260px;
 	margin-left: 350px;
 	margin-top: 200px;
  }

  table {
    width: 100%;
    border-top: 2px solid #000000;
    border-bottom: 1px solid #000000;
    margin: auto;
    border-collapse: collapse;
    border-left: none;
    border-right: none;
    text-decoration: none;
    color: black;
    margin-bottom: 20px;
  }
  th{
    font-size:15px;
    padding-top:10px;
    padding-bottom:10px;
    text-decoration: none;
    color: black;
  }
  td{
    text-decoration: none;
    color: black;
    font-size:15px;

  }
  th, td {
    border-bottom: 1px solid #000000;
    text-decoration: none;
    color: black;
    text-align: center;
    }
  th:first-child, td:first-child {
    border-left: none;
    text-decoration: none;
    color: black;
    }

  .mypageleftbox { /* 사이드메뉴 */
  margin-top: 80px;
  float: left;
  width: 140px;
  height: 410px;
  border: 1px solid black;
  top: 255px;
  }

  .leftbox1 {  /* 회원정보 수정 */
  margin: 7px auto;
  width: 140px;
  height: 32px;
  text-align:center;
  border-bottom: 0.2px dashed #000000;
  }

  .leftbox2 {  /* 포인트 쿠폰 */
  margin: 7px auto;
  width: 140px;
  height: 32px;
  text-align:center;
  border-bottom: 0.2px dashed #000000;
  }

  .leftbox3 {  /* 숙소 찜 */
  margin: 7px auto;
  width: 140px;
  height: 32px;
  text-align:center;
  border-bottom: 0.2px dashed #000000;
  }
 
  .leftbox4 {  /* 숙소 예약 확인 */
  margin: 7px auto;
  width: 140px;
  height: 32px;
  text-align:center;
  border-bottom: 0.2px dashed #000000;
  }

  .leftbox5 {  /* 상품 예약 확인 */
  margin: 7px auto;
  width: 140px;
  height: 32px;
  text-align:center;
  border-bottom: 0.2px dashed #000000;
  }

  .leftbox6 {  /* 상품 찜 */
  margin: 7px auto;
  width: 140px;
  height: 32px;
  text-align:center;
  border-bottom: 0.2px dashed #000000;
  }

  .leftbox7 {  /* 장바구니 */
  margin: 7px auto;
  width: 140px;
  height: 32px;
  text-align:center;
  border-bottom: 0.2px dashed #000000;
  }

  .leftbox8 {  /* 주문 내역 조회 */
  margin: 7px auto;
  width: 140px;
  height: 32px;
  text-align:center;
  border-bottom: 0.2px dashed #000000;
  }

  .leftbox9 {  /* 1:1 문의 */
  margin: 7px auto;
  width: 140px;
  height: 32px;
  text-align:center;
  border-bottom: 1px solid black;
  }

  

  .leftbox10 {  /* 이벤트 공지 */
 
  width: 140px;
  height: 32px;
  text-align:center;
  
  }


  .lefttext1 { /* 회원정보 수정 */
  font-size: 16px;
  color: black;
  text-decoration: none;
    
  }

  </style>
</head>

<body>

	<div class="myPageBox">
	  <div class="pageName">마이페이지
	  <p class="line"></p>
	  </div>

    <div class="mypageleftbox">
      <div class="leftbox1">
      <a href="#" class="lefttext1">회원정보 수정</a>
      </div>
      
      <div class="leftbox2">
       <a href="#" class="lefttext1">포인트/쿠폰</a>
      </div>

      <div class="leftbox3">
       <a href="#" class="lefttext1">숙소 찜</a>
      </div>

      <div class="leftbox4">
       <a href="#" class="lefttext1">숙소 예약 확인</a>
      </div>

      <div class="leftbox5">
       <a href="#" class="lefttext1">상품 예약 확인</a>
      </div>

      <div class="leftbox6">
       <a href="#" class="lefttext1">상품 찜</a>
      </div>

      <div class="leftbox7">
       <a href="#" class="lefttext1">장바구니</a>
      </div>

      <div class="leftbox8">
       <a href="#" class="lefttext1">주문 내역 조회</a>
      </div>

       <div class="leftbox9">
       <a href="#" class="lefttext1">1:1 문의</a>
      </div>

      <div class="leftbox10">
       <a href="#" class="lefttext1">이벤트 공지창</a>
      </div>

    </div>

    <div class="mypagelist">
    <div class="mypage-point">
	 	<div class="userName">OOO님</div>
	    <div class="userInfo">
		


<span>
	
	<div class="coupon">
 	<img class="couponimg" src="./image/coupon.JPG" alt="쿠폰"/>
			<span>보유 쿠폰 > </span><br>
			<div class="couponText"> 5장</div>
	</div>
</span>

<span>
	
	<div class="point">
	<img class="pointimg"  src="./image/point.JPG" alt="포인트"/>
			<span>보유 포인트 > </span><br>
			<div class="pointText"> 20,000포인트</div>
	</div>
</span>
	</div>
    </div>
    </div>

  
	<div class="campingNameChk">숙소 예약 확인
    <button type="button" class="lodgingbutton">예약취소</button>
		<table>
		<thead>
			<tr>
				<th>숙소 이름</th>
				<th>결제 일자</th>
				<th>결제 금액</th>
				<th>방문 예정일</th>
				<th>예약 성함</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="res" items="${reserve}">
			<tr> 
				<td><a href="/galgga/campingMain.do"><input type="checkbox" name="lodgingcheckbox" value="">${res.lod_name }</a></td>
				<td>2022-05-23</td>
				<td>${res.unit_price }</td>
				<td>${res.checkIn_date }</td>
				<td>${res.member_name }</td>
		</c:forEach>
			</tr>
			
		</tbody>
	</table>
	</div>
		

</div>
  
</body>
</html>