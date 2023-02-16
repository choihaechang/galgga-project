<%@page import="com.galgga.Lods.vo.UnitImgFileVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="lod" value="${lodsMap.lodVO}"/>
<c:set var="lodComImg" value="${lodsMap.lodComImgList }"/>

<c:set var="unit" value="${unitsMap.unitVO}"/>
<c:set var="unitImg" value="${unitsMap.unitImgList }"/>


<!DOCTYPE html>
<html>
<head>
<link href="${contextPath}/resources/css/accodian.css" rel="stylesheet"/>
<meta charset="UTF-8">
<title>객실 선택</title>

<script type="text/javascript">
function unitModi(){
	document.getElementById("unitModi").submit();
}

function uModi(){
	
	document.getElementById(unit_modi).submit();
	
	
}
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
    }
    .address1{
      font-size: 15px;
      padding-left: 40px;
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
    
    .glamping{
    text-align: center;
    }
  </style>

	
</head>
<body>


<div class="mainBody">


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
  
  
</div>
   
    
   
    <div style=" width: 360px;">
   		<input  type="hidden" name="lod_id" value="${lod.lod_id}" disabled>
	    <div>${lod.lod_name}</div>
	    <div class="address">캠핑지 주소 :</div>
	    <div class="address1">&nbsp; &nbsp; ${lod.lod_address }</div><br>
	    <div style="display : block; width: 340px; height: 150px;">${lod.lod_info }</div>
	    
	    
    </div>
    
    </div>
  </div>

  
  <div class="main">
    <div class="cate">
    	<span><a href="#" class="myButton1">객실목록</a></span>
    	<span><a href="#" class="myButton1">Q & A</a></span> 
	    <span><a href="#" class="myButton1">리 뷰</a></span> 
	    <span><a href="#" class="myButton1">환불 안내</a></span>
	</div>
	

    <div class="roomlist">객실목록</div>
		
	<div class="faq">
		  <div class="room" >
		  <form id="unitModi" action="${contextPath}/businessLods/unitsModi.do" method="post">
		  	<c:forEach var="unitImg_list" items="${unitImg}" varStatus="status">
			<div>  <img class="room_img" src="${contextPath}/unitThumbnails.do?lod_id=${lod.lod_id}&unit_id=${unit.unit_id}&unit_imgName=${unitImg_list.unit_imgName}"></div>
			 </c:forEach>
			  
			  <div style="margin: 10px 0px 0px 15px;">
					   <div> <span>객실 이름 : </span><input type="text" name="unit_name" id="unit_name" value="${unit.unit_name }" style="display:inline;"><br></div>
				 	  <div>  <span>카테고리 : </span>
				 	  <select name="unit_category" id="unit_category"class="category">
				    	<option value="${unit.unit_category}" selected>${unit.unit_category}</option>
				    	<option value="camping">camping(캠핑)</option>
						<option value="car">car(차박)</option>
						<option value="caravan">caravan(카라반)</option>
						<option value="glamping">glamping(글램핑)</option>
					</select>
					</div>						
				  
				    <div><span>면적 : </span><input type="text" class="roomInfo" name="unit_extent" id="unit_extent"value="${unit.unit_extent }"></div>
				    <div><span>기준인원 :  </span> <input type="text" name="min_p" id="min_p" value="${unit.min_p}"><br> <span> 명 / 최대가능인원 : </span> <input type="text" name="max_p" value="${unit.max_p}"> <span>명</span></div>
				    <div><input type="text" name="unit_price"   id="unit_price" value="${unit.unit_price}"> <span>원</span></div>
			 <br>
			  
			  <textarea style="width: 620px; height:70px; resize:none;" name="unit_info" id="unit_info">${unit.unit_info}</textarea>
			  <span><a class="myButton"  id ="unitModi" onclick="return unitModi()"> 객실 수정 </a></span>
			  
			  <input type="hidden" name="lod_id" id="lod_id1" value="${lod.lod_id }">
			  <input type="hidden" name="lod_name" id="lod_name1" value="${lod.lod_name }">
			  <input type="hidden" name="unit_id" id="unit_id" value="${unit.unit_id }">
			  
			  
			 </div>
			  
			  <div class="panel" style="padding-bottom: 0px;">
			  
			  
			  	  
			  </div> 
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