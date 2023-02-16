<%@page import="com.galgga.Lods.vo.UnitImgFileVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="lod" value="${lodsDetailMap.lodVO}"/>

<c:set var="lodComImg" value="${lodsDetailMap.lodComImgList }"/>


<c:set var="unit" value="${unitsDetailMap.unitVO}"/>
<c:set var="unitImg" value="${unitsDetailMap.unitImgList }"/>

<!DOCTYPE html>
<html>
<head>
<link href="${contextPath}/resources/css/accodian.css" rel="stylesheet"/>
<meta charset="UTF-8">
<title>객실 선택</title>

<script type="text/javascript">
function modi(){
	
	
		
		document.getElementById("modi").submit();
		var _lod_id = ${lod.lod_id};
		var _refund = document.getElementById("refund").value;
		
		$.ajax({
			type:"GET",
			url:"${contextPath}/businessLods/refund.do",
			data: $('#refundForm').serialize(),
			
			success : function (data){
				alert("refund 수정 완료");
			},
			error :function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		
		
		
	
}







/* 탭 기능   */

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
	
	let today = new Date();
	let year = today.getFullYear();
	let month = today.getMonth() + 1;
	month = month >= 10 ? month : '0' + month;
	let date = today.getDate();
	date = date >= 10 ? date : '0' + date;
	
	let stringTime = year + '-' + month + '-' + date;
	
	$(".reserveDate").attr('min', stringTime);
});
</script>

<style> 
      a{
      text-decoration: none;  
      }    
      .mainBody{
      height: auto;
      }
    /*-----------이미지, 인포--------*/
    .camping{
      padding: 7px;
      padding-left: 8px;
      border: 1px solid #000000;
      height: auto;
      width: 700px;
	  display: flex;
      margin: auto;
      margin-bottom: 8px;
    }
    #campingMain{
      height: 175px;
      width: 335px;
      float: left;
    }
    #campingName{
      font-size: 18px;
      font-weight:bold;
      margin: 5px;
      display: block;
    }
    .address{
     font-size: 15px;
      padding-left: 5px;
      text-align:center;
      color:#8989dd;
    }
    .address1{
      font-size: 15px;
      padding-left: 5px;
      text-align:center;
  	  background-color: #f0f0f0;
  	  width:335px;
    }
    
   .lod_info{
   border: 1px solid #000000;
   resize: none;
   height: 150px;
   }


/*------------------------객실 선택 ---------------  */



    .roomName, .optionSelect{
      font-size: 17px;
      height: 28px;
      
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
  margin-left: 320px;
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
   	display: flex;
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
    height: auto;
    margin: 20px;
      
  }

    .room_img{
      width: 212px;
      height: 100px;
      margin: 5px 5px;
      float: left;
      z-index: 2;
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
    
    .roomAdd{
    padding-top: 7px;
    padding-left: 15px;
    width: 650px;
    height: 38px;
    margin:auto;
    }
    
    
    
    
    
    
    
         /* tab 기능   */
    .tab-wrapper {
  margin: 60px auto;
  width: 712px;
  
}

.tab-menu li {
  position:relative;
  background-color: #fff;
  color:#bcbcbc;
  display: inline-block;
  padding: 20px 40px;
  opacity: 0.8;
  cursor:pointer;
  z-index:0;
}


.tab-content>div {
  background-color: #fff;
  box-sizing:border-box;
  /* width: 100%; */
  padding: 50px;   
  min-height:200px;
}

ul.tabs{
	padding:0px;
	text-align:center;
	margin-bottom:20px;
	padding-inline-start: 0px;
}
ul.tabs li{
	display:table-cell;
	border:1px solid #000000;
	width:98px;
	padding: 0px 45px;
	float:none;
	vertical-align: middle;
	
}

ul.tabs li.active{
  background:#eeeddd;
  opacity: 1;
} 


.refund{
	width: 430px;
	height: 300px;
	resize:none;
}
  </style>

	
</head>
<body>


<div class="mainBody">
<form id="modi" action="${contextPath}/businessLods/lodsModi.do" method="post">

  <div>
    <div class="camping" >
	<div class="container">
	<a class="prev" onclick="plusSlides(-1)">❮</a>
	<c:forEach var="lodCom" items="${lodComImg}" varStatus="common">

	  <div class="mySlides">
	    <img id="campingMain" src="${contextPath}/lodThumbnails.do?lod_id=${lod.lod_id}&lod_imgName=${lodCom.lod_imgName}">
	  </div>
	  
	
		</c:forEach>
		  <a class="next" onclick="plusSlides(1)">❯</a>
		  
		  
	  <div class="row" style="dsiplay:flex; width:335px;, height: 77px;">
	  	<c:forEach var="lodCom" items="${lodComImg}" varStatus="common" >
	  
	    <div class="column">
	      <img class="demo cursor" src="${contextPath}/lodThumbnails.do?lod_id=${lod.lod_id}&lod_imgName=${lodCom.lod_imgName}" style="width:100%" onclick="currentSlide(${common.index}+1)" alt="숙소">
	    </div>
	    </c:forEach>
	  </div>
  	<input type="hidden" name="lod_id" value="${lod.lod_id }">
  	
</div>

    <div style=" width: 330px;">
   		<input type="hidden" name="lod_id" value="${lod.lod_id}">
	    <input value="${lod.lod_name}" name="lod_name">
	    <div class="address">캠핑지 주소</div>
	    <input class="address1" value="${lod.lod_address }" readonly>
	    <textarea style="display : block; width: 340px; height: 150px;resize: none;" name="lod_info">${lod.lod_info }</textarea>
	    <textarea style="display: none;" name="refund" id="refund"></textarea>
	    
    </div>
    
    </div>
  </div>
</form>
  <a class="myButton" style="margin: 10px 0px 10px;" onclick="return modi()">숙소 수정</a>
  <div class="main">
  <div class="tab-wrapper">
  
	<ul class="tabs">
	    <li style="height: 45px;"><a href="#tab1">객실목록</a></li>
	    <li><a href="#tab2">Q & A</a></li>
	    <li><a href="#tab3">리 뷰</a></li>
	    <li><a href="#tab4">환불 안내</a></li>
	  </ul><br>
<div class="tab_container">
	
	<div class="tab_content" id="tab1">
    <div class="roomlist">객실목록</div>
		<c:forEach var="unit" items="${unit}" varStatus="status">
	
	<c:set var="i" value="${i+1 }"/>
	
	<div class="faq">
		  <div class="room" >
		  			
		  		    <input style="display: none;" id="unit_id" value="${unit.unit_id}">
				    <input style="display: none;" id="unit_name" value="${unit.unit_name }">  
		  	<button class="accordion" id="accodian">
			  <img class="room_img" src="${contextPath}/unitThumbnails.do?lod_id=${lod.lod_id}&unit_id=${unit.unit_id}&unit_imgName=${unitImg[status.index].unit_imgName}">
			 
			  <div>
			  	 	<div style="display: none;" id="unit_id_1">${unit.unit_id }</div>
				    <div class="siteName" id="unit_name_1">${unit.unit_name }</div><br>
				    <span class="category">${unit.unit_category} &nbsp; &nbsp;</span> <span class="roomInfo">면적 : ${unit.unit_extent }<br>
				    기준인원 ${unit.min_p} 명 / 최대가능인원 ${unit.max_p} 명</span>
				    <span class="price" id="unit_price">${unit.unit_price}원</span>
			  </div><br>
			  
			  </button>
			  
			  <div class="panel" style="padding-bottom: 0px;">
			  
			  <form id="reserve${i}" action="${contextPath}/order/camping_pay.do" method="post">
			  	  <input type="hidden" name="lod_id" id="lod_id1" value="${lod.lod_id }">
				  <input type="hidden" name="lod_name" id="lod_name1" value="${lod.lod_name }">

				  <input type="hidden" name="unit_name" id="unit_name${i }" value="${unit.unit_name}" >
				  <input type="hidden" name="unit_id" id="unit_id${i }" value="${unit.unit_id}">
				  <input type="hidden" name="unit_price" id="unit_price${i }" value="${unit.unit_id}">

				  
				  
				  <input type="hidden" name="checkIn_date" id="chkIn${i}" value="">
				  <input type="hidden" name="checkOut_date" id="chkOut${i}" value="">
				  
				  <input type="hidden"  id="now" value="${i}">

			  <span><a class="myButton"  id ="res" onclick="return res(${i})">예약 하기</a></span>
			  
			  </form>
  					 <span style="width: 620px;">${unit.unit_info}</span>
  					 
				</div>
			   
		  </div>
		 
		  </div> 
	</c:forEach>
	</div>
	
	
	<div class="tab_content" id="tab4">
	<form id="refundForm" action="${contextPath}/businessLods/refund.do" method="post">
	<table>
	    <tr>
	    	<td style="width: 138px; text-align: center;">환불 규정</td>
	    	<td><textarea class="refund" id="refund"  name="refund" >${lod.refund}</textarea></td>
	    	<td><input type="hidden" name="lod_id" value="${lod.lod_id}"></td>
	    </tr>
    </table>
    </form>
	</div>
	
	
	
	</div>
	
	
	
	
	
	</div>
  </div>
  
   <div class="roomAdd" style="padding: 6px 7px;"><a href="${contextPath}/businessLods/business_addUnit.do?lod_id=${lod.lod_id}" class="myButton">객실 추가 하기</a></div>
  </div>




<!--  -->











<script src="${contextPath}/resources/js/accodian.js"></script>
</body>
</html>