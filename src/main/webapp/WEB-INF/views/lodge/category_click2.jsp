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
      /* border: 1px solid #000000; */
      width:720px;
      margin: auto;
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

    .lodName, .optionSelect{
      font-size: 17px;
    }
    
    




    /*------------------main------------------*/

    
  

    .lodlist{
      font-size: 18px;
      font-weight:bold;
      margin: 15px;
    }
  .lod{
    margin-top: 20px;
    border: 0.4px solid #000000;
    width: 669px;
    height: 120px;
    
   	margin:auto;
   	margin: 20px;
      
  }

    .lod_img{
      width: 212px;
      height: 92px;
      margin: 5px 5px;
      float: left;
    }
    .siteName{
      font-size: 20px;
      font-weight:bold;
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
    <div class="lodlist">숙소 목록</div>
    
 <div class="lod">
    <a href="/galgga/lodge/campingMain.do"><img src="${contextPath}/resources/image/glampingsite2.jpg" class="lod_img"></a>
    <div>
    <a href="/galgga/lodge/campingMain.do"><div class="siteName">Glamping_A_site</div><br></a>
    <span class="lodInfo">면적 : 12.5평<br>
    기준인원 ㅇ 명 / 최대가능인원 ㅇ명</span>
    <span class="price">60,000원</span>
    </div>
  </div>
  
  
  <div class="lod">
    <a href="/galgga/lodge/campingMain.do"><img src="${contextPath}/resources/image/glampingsite2.jpg" class="lod_img"></a>
    <div>
    <a href="/galgga/lodge/campingMain.do"><div class="siteName">Glamping_B_site</div><br></a>
    <span class="lodInfo">면적 : 12.5평<br>
    기준인원 ㅇ 명 / 최대가능인원 ㅇ명</span>
    <span class="price">80,000원</span>
    </div>
  </div>

  <div class="lod">
     <a href="/galgga/lodge/campingMain.do"><img src="${contextPath}/resources/image/glampingsite2.jpg" class="lod_img"></a>
    <div>
    <a href="/galgga/lodge/campingMain.do"><div class="siteName">Glamping_C_site</div><br></a>
    <span class="lodInfo">면적 : 14평<br>
    기준인원 ㅇ 명 / 최대가능인원 ㅇ명</span>
    <span class="price">100,000원</span>
    </div>
  </div>
  
  

     <div class="lod">
    <a href="/galgga/lodge/campingMain.do"><img src="${contextPath}/resources/image/glampingsite2.jpg" class="lod_img"></a>
    <div>
    <a href="/galgga/lodge/campingMain.do"><div class="siteName">Glamping_D_site</div><br></a>
    <span class="lodInfo">면적 : 15평<br>
    기준인원 ㅇ 명 / 최대가능인원 ㅇ 명</span>
    <span class="price">150,000원</span>
    </div>
  </div>
  
  

     <div class="lod">
    <a href="/galgga/lodge/campingMain.do"><img src="${contextPath}/resources/image/glampingsite2.jpg" class="lod_img"></a>
    <div>
    <a href="/galgga/lodge/campingMain.do"><div class="siteName">Glamping_E_site</div><br></a>
    <span class="lodInfo">면적 : 15평<br>
    기준인원 ㅇ 명 / 최대가능인원 ㅇ 명</span>
    <span class="price">180,000원</span>
    </div>
  </div>  
  
     <div class="lod">
     <a href="/galgga/lodge/campingMain.do"><img src="${contextPath}/resources/image/glampingsite2.jpg" class="lod_img"></a>
    <div>
    <a href="/galgga/lodge/campingMain.do"><div class="siteName">Glamping_F_site</div><br></a>
    <span class="lodInfo">면적 : 15평<br>
    기준인원 ㅇ 명 / 최대가능인원 ㅇ 명</span>
    <span class="price">150,000원</span>
    </div>
  </div>
        
        
     <div class="lod">
    <a href="/galgga/lodge/campingMain.do"><img src="${contextPath}/resources/image/glampingsite2.jpg" class="lod_img"></a>
    <div>
    <a href="/galgga/lodge/campingMain.do"><div class="siteName">Glamping_G_site</div><br></a>
    <span class="lodInfo">면적 : 15평<br>
    기준인원 ㅇ 명 / 최대가능인원 ㅇ 명</span>
    <span class="price">150,000원</span>
    </div>
  </div>
  

  </div> 
  </div>
  

  
</body>
</html>