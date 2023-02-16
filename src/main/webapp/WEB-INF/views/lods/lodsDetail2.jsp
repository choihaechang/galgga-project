<%@page import="com.galgga.Lods.vo.UnitImgFileVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<c:set var="lod" value="${lodsDetailMap.lodVO}"/>
<c:set var="lodComImg" value="${lodsDetailMap.lodComImgList }"/>


<c:set var="unit" value="${unitsDetailMap.unitVO}"/>
<c:set var="unitImg" value="${unitsDetailMap.unitImgList }"/>
<c:set var="unitImgCom" value="${unitsDetailMap.unitComImgList }"/>

<c:set var="review" value="${ reviewMap.reviewVO}"/>
<c:set var="reviewImg" value="${reviewMap.reviewImg }"/>
<c:set var="QARepl" value="${QAReplList}"/>
<!DOCTYPE html>
<html>
<head>


<link href="${contextPath}/resources/css/accodian.css" rel="stylesheet"/>


<!-- datepicker -->
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
     
    
    
    
    
    
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7e1f279904ced01102e1631108f40253&libraries=services,clusterer,drawing"></script>
<meta charset="UTF-8">
<title>객실 선택</title>



<script>

function reserveChk(){
	var _lod_id = ${lod.lod_id};
	var _m_id = ${m_id};
	

	$.ajax({
		type:"get",
		url:"${contextPath}/getData/checkReserve.do",
		data:{lod_id : _lod_id, m_id : _m_id  },
		dataType: "json",
		success : function (data){				
				var result = data.result;
					if(result == "true"){
						reviewadd();
					}
					else{
						alert("해당 숙소를 이용하셨던 분만 리뷰를 작성 할 수 있습니다.");
					}
		},
		error: function(){
			alert("ajax 실패");
		}
	});


}

function beforeqa(){
	$.ajax({
		type:"get",
		url:"${contextPath}/getData/beforeqa.do",
		dataType: "json",
		success : function (data){				
				var result = data.result;
					if(result == "true"){
						QAadd();
					}
					else{
											
						if(confirm("로그인 이후 가능한 서비스 입니다. 로그인하시겠습니까?")){
							location.href='${contextPath}/member/loginForm.do';
						}
						return false;
						
					}
		},
		error: function(){
			alert("ajax 실패");
		}
	});
}


 window.onload =function before(){
	var _lod_id = ${lod.lod_id};
	var _m_id = ${m_id};
	var heartImg = document.querySelector('#heart');
	
		
	$.ajax({
		type:"get",
		url:"${contextPath}/getData/lodCartCheck.do",
		data : {lod_id : _lod_id, m_id : _m_id },
		dataType: "json",
		success : function(data){
				
				var state = data.state;
				
				
				if(state == "no"){
					heartImg.src="${contextPath}/resources/image/heart-line.svg";
				}		
				if(state =="do"){
					heartImg.src="${contextPath}/resources/image/heart-red.svg";
				}
			},
		error: function(){
			alert("ajax 실패 before");
		}
	});
	
}



/* 장바구니에 이미 담겨져 있어서 true가 반환되면 장바구니 목록에서 삭제,
1장바구니에 없어서 false가 반환되면 장바구니 등록 */
function zzim(){
	var _lod_id = ${lod.lod_id};
	var _m_id = ${m_id};
	var hrtImg = document.querySelector('#heart');
	
	
	$.ajax({
		type:"get",
		url:"${contextPath}/getData/lodCart.do",
		data : {lod_id : _lod_id, m_id : _m_id },
		dataType: "json",
		success : function(data){
				var result = data.result;
				var state = data.state;
				if(state == "do"){
					hrtImg.src="${contextPath}/resources/image/heart-line.svg";
				}		
				if(state =="no"){
					hrtImg.src="${contextPath}/resources/image/heart-red.svg";
				}
				if(result == "_m_id null"){
					alert("로그인 이후 이용 가능합니다.")
				}
				
				
				if(result == "insert"){
					alert("장바구니에 추가했습니다.")
				}
				if(result == "delete"){
					alert("장바구니에 삭제했습니다.")
					}
		},
		error: function(){
			alert("ajax 실패 zzim()");
		}
	});
}


	
function reserve(){ 

	var chkIn = document.getElementById("chkIn");
	var chkOut = document.getElementById("chkOut");	
	
	document.getElementById("reserve").submit();	
}

function res(x){

	var In = document.getElementById("chkIn").value;
	var Out = document.getElementById("chkOut").value;	
	
	var chkIn = "chkIn"+x;
	var chkOut = "chkOut"+x;
	document.getElementById(chkIn).value = In;
	document.getElementById(chkOut).value = Out;
	
	var reserve = "reserve"+x;
	var unit_id= "unit_id"+x;
	var unit_name="unit_name"+x;

	
	var id =document.getElementById(unit_id).value
	var name =document.getElementById(unit_name).value


	
	document.getElementById(reserve).submit();
	
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




/* QA 작성  */
 function QAadd(){
	var con = document.getElementById("QA");
	var don = document.getElementById("QAList");
	
	if(con.style.display=='none'){
		con.style.display='block';
	}else{
		con.style.display='none';
	}
	
	if(don.style.display=='none'){
		don.style.display='block';
	}else{
		don.style.display='none';
	}
}

	function QAUpdateForm(y){
		var content = "content"+y;
		var con = document.getElementById(content);
		var updateForm= "updateForm"+y
		var don = document.getElementById(updateForm);
		
		if(con.style.display=='revert'){
			con.style.display='none';
		}
		
		if(don.style.display=='none'){
			don.style.display='revert';
		}else{
			don.style.display='none';
		}
	}
	
	function QAUpdate(y){
		var QAUpdateForm = "QAUpdateForm" + y;
		document.getElementById(QAUpdateForm).submit();
		
	}
	
	function replyQA(y){
		var replyQA = "replyQA"+y;
		var con = document.getElementById(replyQA);
		var replyBu = "replyBu"+y
		var don = document.getElementById(replyBu);
		
		if(con.style.display=='none'){
			con.style.display='revert';
		}else{
			con.style.display='none';
		}
		
		if(don.style.display=='none'){
			don.style.display='revert';
		}else{
			don.style.display='none';
		}
		
	}
	
	function qaReply(y){
		var replyQA = "replyQA"+y;
		
		document.getElementById(replyQA).submit();
	}
	
	

	function add(){
		document.getElementById("QA").submit();
		var lod_id = ${lod.lod_id};
		
			
		alert("등록하였습니다.");
		
	}

	
	function test(y){
		var content = "content"+y;
		var updateForm = "updateForm"+y;
		var repl = "repl"+y;
		var repldate = "repldate"+y;
		var answer= "answer" +y;
		var why = "why"+y;
		var con = document.getElementById(content);
		var don = document.getElementById(updateForm);
		var zon = document.getElementById(repl);
		var an = document.getElementById(answer);
		var bn = document.getElementById(why);
		var dn = document.getElementById(repldate);
		if(con.style.display=='none'){
			con.style.display='revert';
		}else{
			con.style.display='none';
		}
		
		if(zon.style.display=='none'){
			zon.style.display='revert';
		}else{
			zon.style.display='none';
		}
		
		if(an.style.display=='none'){
			an.style.display='revert';
		}else{
			an.style.display='none';
		}
		if(bn.style.display=='none'){
			bn.style.display='revert';
		}else{
			bn.style.display='none';
		}
		if(dn.style.display=='none'){
			dn.style.display='revert';
		}else{
			dn.style.display='none';
		}
		
		if(don.style.display='revert'){
			don.style.display='none';
		}
	}
	
	function reviewadd(){
		var con = document.getElementById("review");
		var list = document.getElementById("reviewList")
		if(con.style.display=='none'){
			con.style.display='block';
		}else{
			con.style.display='none';
		}
		
		if(list.style.display=='none'){
			list.style.display='block';
		}else{
			list.style.display='none';
		}
		
	}
	
	
	var count=0;
	function addImg(){
		if (count==0){
			$("#imgfile").append("<br>"+"<input  type='file' name='imgName_main' id='imgName' style='height: 40px ' />");	  
		}else if(count == 1 || count < 10){
			$("#imgfile").append("<br>"+"<input  type='file' name='imgName_common"+count+"' id='imgName' style='height: 40px ' />");	  
		}
		count++;
	}
	
	
	function addReview(){
		document.getElementById("review").submit();
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
      vertical-align: top;
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
      text-align:left;
      color:#8989dd;
    }
    .address1{
      font-size: 15px;
      padding-left: 5px;
      text-align:left;
  
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
      width: 200px;
      text-align:center;
    }
    
    /* -----------------------------성인 아동 ---------*/
    .human, .text{
      font-size: 20px;
      padding-top: 4px;
    }
     .number{
      
      padding-left: 15px;
      padding-top: 5px;
      
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

 #plus, #minus, #plus1, #minus1{
 width:30px;
 font-size: 20px;
 text-weight: bold;
 cursor: pointer;
 }


/*------------------------객실 선택 ---------------  */



    .roomName, .optionSelect{
      font-size: 17px;
      height: 28px;
	  width: 170px;
	  text-align:center;      
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
	font-size:15px;
	font-weight:bold;
	padding:5px 10px;
	text-decoration:none;
	text-shadow:0px 0px 0px #283966;
    float: right;
 	margin: 0px 0px 0px 280px;
 	
}
.myButton:hover {
	background:linear-gradient(to bottom, #4b5578 5%, #6f88b3 100%);
	background-color:#4b5578;
}
.myButton:active {
	position:relative;
	top:1px;
}

	 .myButton4{box-shadow: 0px 0px 0px 2px #4f5f8c;
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
	padding:3px 6px;
	text-decoration:none;
	text-shadow:0px 0px 0px #283966;
    
    margin: 20px 0px 10px 0px;
	
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
	font-size:13px;
	font-weight:bold;
	padding:4px 7px;
	text-decoration:none;
	text-shadow:0px 0px 0px #283966;
   
    margin: 20px 0px 10px 520px;
  
}
.myButton2:hover {
	background:linear-gradient(to bottom, #4b5578 5%, #6f88b3 100%);
	background-color:#4b5578;
}
.myButton2:active {
	position:relative;
	top:1px;
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
	font-size:11px;
	font-weight:bold;
	padding:1px 3px;
	text-decoration:none;
	text-shadow:0px 0px 0px #283966;
   
    
  
}
.myButton3:hover {
	background:linear-gradient(to bottom, #4b5578 5%, #6f88b3 100%);
	background-color:#4b5578;
}
.myButton3:active {
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
 /*    padding-bottom: 20px; */
  }

    .room_img{
      width: 230px;
      height: 130px;
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
    
    
    
    
    .room_comImg{
    width: 600px;
    height: 320px;
    margin-bottom: 10px;
    
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
     
     tr {
  border-bottom: 1px solid #444444;
  }
     td{
	height: auto;     
     }
    .lodInfo{
    text-align:left;
    color:#8989dd;
    }
    
   /* star point */
     
     #review fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
    
	}
	#review fieldset legend{
	    text-align: right;
	}
	#review input[type=radio]{
	    display: none;
	}
	#review label{
	    font-size: 1.6em;
	    color: transparent;
	    text-shadow: 0 0 0 #f0f0f0;
	    
	}
	#review label:hover{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#review label:hover ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#review input[type=radio]:checked ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#reviewContents {
	    width: 100%;
	    height: 150px;
	    padding: 10px;
	    box-sizing: border-box;
	    border: solid 1.5px #D3D3D3;
	    border-radius: 5px;
	    font-size: 14px;
	    resize: none;
	}
     
     
     
      #unitReview fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
	}
	#unitReview fieldset legend{
	    text-align: right;
	}
	#unitReview input[type=radio]{
	    display: none;
	}
	#unitReview label{
	    font-size: 1.7em;
	    color: transparent;
	    text-shadow: 0 0 0 #f0f0f0;
	}
	
	#unitReview input[type=radio]:checked ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#unitReviewContents {
	    width: 100%;
	    height: 150px;
	    padding: 5px 0px 5px 0px;
	    box-sizing: border-box;
	    border: solid 1.5px #D3D3D3;
	    border-radius: 5px;
	    font-size: 14px;
	    resize: none;
	}
	
	.content{
	width: 374px;
	min-height: 80px;
	border: 1px solid #000000;
	text-align: left;
	margin: 5px 0px 5px 5px;
	padding: 2px 5px;
	font-size: 14px;
	border-radius: 8px;
	}
	.tit{
	font-size: 14px;
	vertical-align: top;
	padding-top: 8px;
	}
	.reviewBox{
	width: 590px;
	border-top: 2px solid #000000;
	border-bottom: 2px solid #000000;
	text-align: center;
	padding: 60px;
	font-weight: 600px;
	font-size: 18px;
	height: 40px;
	}
	#map{
		padding: 0px;
		width: 670px; 
		height: 350px; 
		margin:20px 20px 5px 20px; 
	}
	
	#heart{
	padding: 5px;
	}

	
	/*--------------------------------------   카카오맵   --------------------------------------  */
	.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap {position:relative;width:670px;height:200px;}
#category {position:absolute;top:10px;left:30px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
#category li.on {background: #eee;}
#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
#category li:last-child{margin-right:0;border-right:0;}
#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
#category li .category_bg { margin:auto; background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
#category li .bank {background-position: -10px 0;}
#category li .mart {background-position: -8px -36px;}
#category li .pharmacy {background-position: -8px -72px;}
#category li .oil {background-position: -8px -108px;}
#category li .cafe {background-position: -8px -144px;}
#category li .store {background-position: -8px -180px;}
#category li.on .category_bg {background-position-x:-46px;}
.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.placeinfo .tel {color:#0f7833;}
.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
	/* ------------------------------------------------------------------------------------------- */
  </style>

	
	
	
	
	
	
	
	
</head>
<body>



<div class="mainBody">
<form id="reserve" action="${contextPath}/order/camping_pay.do" method="post">

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
   
   
    
    <div style="width: 330px; margin-left:5px;">
   
	    <div id="campingName">${lod.lod_name} <img id="heart" class="heart" style="width:25px; height:25px; cursor:pointer" src="${contextPath}/resources/image/heart-line.svg" onclick="return zzim()"/></div>
	    <div id="unitReview" >
				    <c:set var="o" value="${o+1 }"/>
				    <fieldset style="padding: 0px;">
						    <c:choose>
								<c:when test="${lod.lod_starpoint >= 1.0 && lod.lod_starpoint < 2.0}">
											<input  type="radio" name="lod" value="5" id="lod1" readonly><label style=" cursor:pointer;" for="#">★★★★</label>
											<input  type="radio" name="lod${o}" value="1" id="lod5" style="float:right;" checked readonly><label style="cursor:pointer;" for="#">★</label>					
								</c:when>
								<c:when test="${lod.lod_starpoint >= 2.0 && lod.lod_starpoint < 3.0}">
											<input type="radio" name="lod" value="3" id="lod3" readonly><label style=" cursor:pointer;" for="#">★★★</label>
											<input type="radio" name="lod${o}" value="2" id="lod4" checked readonly><label style="cursor:pointer;" for="#">★★</label>
								</c:when>
								<c:when test="${lod.lod_starpoint >= 3.0 && lod.lod_starpoint < 4.0}">
											<input type="radio" name="lod" value="4" id="lod2" readonly><label style=" cursor:pointer;" for="#">★★</label>
											<input type="radio" name="lod${o}" value="3" id="lod3" checked readonly><label style="cursor:pointer;" for="#">★★★</label>		
								</c:when>
								<c:when test="${lod.lod_starpoint >= 4.0 && lod.lod_starpoint < 5.0}">
											<input  type="radio" name="lod" value="5" id="lod1" readonly><label style=" cursor:pointer;" for="#">★</label>
											<input  type="radio" name="lod${o}" value="4" id="lod2" checked readonly><label style="cursor:pointer;" for="#">★★★★</label>
								</c:when>
								<c:when test="${lod.lod_starpoint eq 5.0}">
											<input  type="radio" name="lod${o}" value="5" id="lod1" checked readonly><label style="cursor:pointer;" for="#">★★★★★</label>
								</c:when> 
								<c:otherwise>
											<input type="radio" name="lod" value="5" id="lod1" readonly><label style=" cursor:pointer;" for="#">★★★★★</label>
								
								</c:otherwise>
							</c:choose>
					</fieldset>
					
					<span>  (<fmt:formatNumber type="number" pattern="0.00" value="${lod.lod_starpoint}"/>)</span>
				    </div>
	    <div class="address">캠핑지 주소 : </div>
	    <div class="address1">${lod.lod_address }</div><br>
	    <div class="lodInfo">숙소 정보 : </div>
	    <div style="display : block; width: 335px; text-align:left;">${lod.lod_info }</div>
    </div>
    
    </div>
    
    
    
    
    
    <div class="reservationDate">
      <span class="reservBox">예약 날짜 &nbsp; : &nbsp;
        <span><input class="reserveDate" type="text" name="checkIn_date" id="chkIn"  onchange="possibleDate()"/></span>
        <span style="font-size: 20px;"><strong>  -</strong></span>
   		<span><input class="reserveDate" type="text" name="checkOut_date" id="chkOut" /></span>
      <span><c:set var='chkIn' value="#{chkIn}"/></span>
       </span>
    </div>    
  </div>

	<input type="hidden" name="lod_id" value="${lod.lod_id }">
	<input type="hidden" name="lod_name" value="${lod.lod_name }">

  
  
  
  <div class="number">
    <div class="box" style="display: flex">
    <div style="display: flex;">
    <div style="font-size:20px;">성인</div> &nbsp; &nbsp;
			<div id="input_div">
				    <input type="button" value="-" id="minus">
				    	<input type="text" size="1"  value="2" id="count" name="adult">
				    <input type="button" value="+" id="plus">
			</div>
	</div>
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	    <div style="font-size:20px;">아동</div> &nbsp; &nbsp;
			<div id="input_div">
				    <input type="button" value="-" id="minus1">
				   		 <input type="text" size="1"  value="0" id="count1" name="child">
				    <input type="button" value="+" id="plus1">
			</div>
	</div>

    </div>
 







  <div class="roomSelec">
    <span>객실이름 : </span> &nbsp;
    
    <select class="roomName" ID="roomName" name="unit_name" onchange="return possibleDate()">
    <c:forEach var="unit_name" items="${unit}" varStatus="price">
	      <option value="${unit_name.unit_name}">${unit_name.unit_name}</option>
    </c:forEach>
    </select><br>
    
     <div id="result"></div>
    
   <div style="vertical-align: middle;"><a class="myButton" onclick="return reserve()">예약 하기</a></div>
  </div>
</form>

<form id="dateForm" action ="${contextPath}/lods/checkDate.do" method="post" target="nomove">
<input type="hidden" id="lod_id" name="lod_id" value="${lod.lod_id }">
<input type="hidden" id="date_unit_name" name="unit_name" value="">
</form>
 <iframe name="nomove" style="display: none;"></iframe> <!-- submit 이후 위치 이동 발생 안함, 404 에러는 발생함 -->


  
 
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
	<c:forEach var="item" items="${unit}" varStatus="status">
	
	<c:set var="x" value="${x+1 }"/>
	
	<div class="faq">
		  <div class="room" >
		  			
		  		    <input style="display: none;" id="unit_id" value="${item.unit_id}">
				    <input style="display: none;" id="unit_name" value="${item.unit_name }">  
				      
							
		  	<button class="accordion" id="accodian${x}">
		  		
			   <img class="room_img" src="${contextPath}/unitThumbnails.do?lod_id=${lod.lod_id}&unit_id=${item.unit_id}&unit_imgName=${unitImg[status.index].unit_imgName}" alt="숙소 이미지">
			  <div>
			  	 	<div style="display: none;" id="unit_id_1">${item.unit_id }</div>
				    <div class="siteName" id="unit_name_1">${item.unit_name }</div>
					<div id="unitReview" style=" cursor:pointer;"> <!-- lod 별점 줄때 input name 다르게 설정 해야댐 -->
				    <c:set var="o" value="${o+1 }"/>
				    <fieldset style="padding: 0px;">
						    <c:choose>
								<c:when test="${item.starpoint >= 1 && item.starpoint < 2}">
											<input style=" cursor:pointer;" type="radio" name="star" value="5" id="star1" readonly><label style=" cursor:pointer;" for="#">★★★★</label>
											<input style=" cursor:pointer;" type="radio" name="star${o}" value="1" id="star5" style="float:right;" checked readonly><label style="cursor:pointer;" for="#">★</label>					
								</c:when>
								<c:when test="${item.starpoint >= 2 && item.starpoint < 3 }">
											<input style=" cursor:pointer;" type="radio" name="star" value="3" id="star3" readonly><label style=" cursor:pointer;" for="#">★★★</label>
											<input style=" cursor:pointer;" type="radio" name="star${o}" value="2" id="star4" checked readonly><label style="cursor:pointer;" for="#">★★</label>
								</c:when>
								<c:when test="${item.starpoint >= 3 && item.starpoint < 4}">
											<input style=" cursor:pointer;" type="radio" name="star" value="4" id="star2" readonly><label style=" cursor:pointer;" for="#">★★</label>
											<input style=" cursor:pointer;" type="radio" name="star${o}" value="3" id="star3" checked readonly><label style="cursor:pointer;" for="#">★★★</label>		
								</c:when>
								<c:when test="${item.starpoint >= 4 && item.starpoint < 5}">
											<input style=" cursor:pointer;" type="radio" name="star" value="5" id="star1" readonly><label style=" cursor:pointer;" for="#">★</label>
											<input style=" cursor:pointer;" type="radio" name="star${o}" value="4" id="star2" checked readonly><label style="cursor:pointer;" for="#">★★★★</label>
								</c:when>
								<c:when test="${item.starpoint eq '5'}">
											<input style=" cursor:pointer;" type="radio" name="star${o}" value="5" id="star1" checked readonly><label style="cursor:pointer;" for="#">★★★★★</label>
								</c:when> 
								<c:otherwise>
											<input style=" cursor:pointer;" type="radio" name="star" value="5" id="star1" readonly><label style=" cursor:pointer;" for="#">★★★★★</label>
								
								</c:otherwise>
							</c:choose>
					</fieldset>
					
					<span>  (<fmt:formatNumber type="number" pattern="0.00" value="${item.starpoint}"/>)</span><br>
				    </div>
				    <span class="category">${item.unit_category} &nbsp; &nbsp;</span> <span class="roomInfo">면적 : ${item.unit_extent }<br>
				    기준인원 ${item.min_p} 명 / 최대가능인원 ${item.max_p} 명</span>
				    <span class="price" id="unit_price"><fmt:formatNumber type="number" value="${item.unit_price}"/>원</span>
			  </div><br>
			  
			  </button>
			  
			   <div class="panel" >
			  
			  
			 
			  <c:forEach var="imgCom" items="${unitImgCom}" varStatus="status1">
				  <c:if test="${item.unit_id eq imgCom.unit_id }">
				  	<img class="room_comImg" src="${contextPath}/unitThumbnails.do?lod_id=${lod.lod_id}&unit_id=${item.unit_id}&unit_imgName=${imgCom.unit_imgName}" alt="객실 이미지">
				  </c:if>
			  </c:forEach>
						  
			  <form id="reserve${x}" action="${contextPath}/order/camping_pay.do" method="post">
			  	  <input type="hidden" name="lod_id" id="lod_id1" value="${lod.lod_id }">
				  <input type="hidden" name="lod_name" id="lod_name1" value="${lod.lod_name }">
				  <input type="hidden" name="unit_name" id="unit_name${x }" value="${item.unit_name}" >
				  <input type="hidden" name="unit_id" id="unit_id${x }" value="${item.unit_id}">
				  <input type="hidden" name="unit_price" id="unit_price${x }" value="${item.unit_id}">
				  <input type="hidden" name="checkIn_date" id="chkIn${x}" value="">
				  <input type="hidden" name="checkOut_date" id="chkOut${x}" value="">
				  <input type="hidden"  id="now" value="${x}">
			  
			  
			  </form>
  				 <div style="width: 600px;">${item.unit_info}</div>
  				 
  				 <span style="margin-left: 460px;padding-bottom: 10px;"> <label for="accodian${x }"><a class="myButton4"  id="res" >객실 접기</a></label>
  				 	<a style="margin-left: 10px;" class="myButton4"  id ="res" onclick="return res(${x})">예약 하기</a></span>
  			</div>
		  </div>
		  </div> 
	</c:forEach>
	
	
	<!-- api map test -->
		<div class="map_wrap">
		    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
		    <ul id="category">
		             
		        <li id="MT1" data-order="1"> 
		            <span class="category_bg mart"></span>
		            마트
		        </li>  
		        <li id="PM9" data-order="2"> 
		            <span class="category_bg pharmacy"></span>
		            약국
		        </li>  
		        <li id="OL7" data-order="3"> 
		            <span class="category_bg oil"></span>
		            주유소
		        </li>  
		        <li id="CE7" data-order="4"> 
		            <span class="category_bg cafe"></span>
		            카페
		        </li>  
		        <li id="CS2" data-order="5"> 
		            <span class="category_bg store"></span>
		            편의점
		        </li>      
		    </ul>
		</div>
	
	

	
	<div style="margin-left:20px"> <a href="https://map.kakao.com/link/search/${lod.lod_address}">카카오맵에서 보기</a></div>
	
	
	
	
  </div>
  
  
  <div class="tab_content" id="tab2">
  
   <div style="vertical-align: middle;"><a class="myButton2" onclick="beforeqa()" style="margin-left: 620px;">Q & A 작성</a></div>
   
 
   
   
   
   <form id="QA" action="${contextPath}/board/QA_add.do" style="display: none; width: 700px;" method="post">
   <table style="width: 708px;">
   	<tr>
   		<td style="width: 100px;">제목</td>
   		<td><input name="QA_title" style="width: 392px;"></td>
   	</tr>
   	<tr>
	   	<td style="width: 100px;">작성자</td>
	   	<td><input name="member_id" style="width: 392px;" value="${memberInfo.member_id }" readonly></td>
	   	
   	</tr>
   	<tr>
	   	<td style="width: 100px;">질문 내용</td>
	   	<td><textarea name="QA_content" style="width: 392px; height: 300px; resize: none;"></textarea></td>
	   	<td><input type="hidden" name="lod_id" value="${lod.lod_id }"></td>
	   	<td><input type="hidden" name="m_id" value="${m_id }"></td>
	   	<td><a class="myButton2" onclick="return add()" style="margin: 150px 0px 0px 0px; ">Q & A 등록</a></td>
   	</tr>
   	<tr>
   	<td colspan="2">
   	
   	</tr>

   </table>

   </form>
	<table id="QAList" style="width: 100%; text-align: center; border-collapse: collapse; resize:none; display:block;">
		<thead>
			<tr>
				<th style="width: 70px;">번호</th>
				<th style="width: 70px;">답변 여부</th>
				<th style="width: 272px;">제 목</th>
				<th style="width: 100px;">작성자</th>
				<th style="width: 100px;">등록 날짜</th>
				<c:if test="${memberInfo != null && memberInfo != '' }">
					<th style="width: 90px;">수정 / 삭제</th>
				</c:if>
				<c:if test="${businessInfo != null && businessInfo !='' }">
					<th style="width: 90px;">답변 달기</th>
				</c:if>
			</tr>
		</thead>
		
		 <c:choose>
		<c:when test="${empty QAList}"> 
		<tbody>
			<tr style="text-align: center; font-size: 18px; height: 70px;">
				<td colspan="5">
					<strong>등록된 Q & A 가 아직 없습니다.</strong>
				</td>
			</tr>
		</tbody>
		 </c:when>
		  <c:otherwise>
			 	<c:forEach var="qa" items="${QAList}" varStatus="status">
			 	<c:set var="y" value="${y+1 }"/>
			 	<tr>
					<td><a>${fn:length(QAList) - status.index}</a></td>
					<td>${qa.state} </td>
					<td><div onclick="return test(${y})" style="cursor: pointer;">${qa.QA_title }</div></td>
					<td>${qa.member_id }</td>
			 		<td><a><fmt:formatDate value="${qa.addDate }" pattern="yyyy-MM-dd"/></a></td>
			 		<td>
				 		<c:if test="${qa.member_id eq memberInfo.member_id }">
					 		<span><a style="cursor: pointer" onclick="QAUpdateForm(${y})" class="myButton3">내용 수정</a></span>
					 		<span><a style="cursor: pointer" onclick="location.href='${contextPath}/lods/QADelete.do?QA_id=${qa.QA_id}&lod_id=${lod.lod_id}'" class="myButton3">삭제</a></span>
					 	</c:if>
					 	
					 	<c:if test="${lod.b_id eq businessInfo.b_id}">
					 		
					 			<span><a style="cursor: pointer" onclick="replyQA(${y})" class="myButton3">답변 등록</a></span>
					 		
					 	</c:if>
				 	</td>
			 	</tr>
			 	
			 		 	<tr>
			 		 		<td class="tit" colspan="2" style="text-align: right; display: none;" id="why${y }">질문 사항 :</td>
					 		<td colSpan="2" style="text-align: center; display: none;" id="content${y}"><div class="content">${qa.QA_content}</div></td>
					 	</tr>
					 	
					 	<tr>
					 		<td class="tit" colspan="2" style="text-align: right; display: none; height: auto;" id="answer${y}">사업자 답변 : </td>
					 		<td colspan="2" style="text-align: center; display: none;" id="repl${y}"><div class="content">${qa.QA_replCon}</div></td>
					 		<td colspan="2" style="text-align: center; display: none;" id="repldate${y}">답변 시간 : <br> <a><fmt:formatDate pattern="yyyy-MM-dd" value="${qa.replDate}"/></a></td>
					 	</tr>
					 	
					 	
					 	<tr style="text-align: center; display: none;" id="updateForm${y}">
					 		<td colSpan="5" style="text-align: center;" >
					 		<form action="${contextPath}/lods/QAUpdate.do" id="QAUpdateForm${y}" method="post">
						 		<input type="hidden" name="QA_id" value="${qa.QA_id }">
						 		<input type="hidden" name="lod_id" value="${qa.lod_id }">
						 		<input type="hidden" name="m_id" value="${m_id }">
						 		<input type="hidden" name="member_id" value="${memberInfo.member_id }">
						 		<input type="hidden" name="QA_title" value="${qa.QA_title }">
						 		<textarea name="QA_content" style="resize:none; width: 380px; height:50px; margin: 5px 0px 0px 0px;">${qa.QA_content} </textarea> 
						 		</form>
						 	</td>
					 		<td><a style="cursor: pointer;"  onclick="QAUpdate(${y})" class="myButton3">수정하기</a></td>
					 	</tr>
					 	
						<tr id="replyBu${y}" style="display: none;">						
							<td colSpan="5" style="text-align: center;">
								<form id="replyQA${y}" action="${contextPath}/lods/QAReply.do" style="display: none; width: 620px;" method="post" >
									<input type="hidden" name="QA_id" value="${qa.QA_id }">
									<input type="hidden" name="lod_id" value="${lod.lod_id }">
									<textarea name="QA_replCon" style="resize: none; width:600px; height: 80px; margin: 5px 0px 5px 0px;"></textarea>
								</form>
							</td>
							<td>
								<a  class="myButton2" onclick="qaReply(${y})" style="margin: 0px 0px 0px 0px;">등록 하기</a>
							</td>
						</tr>		
					
								
			 	</c:forEach>
			 </c:otherwise>
		 </c:choose>
  </table>
  
  			

  </div>
  
  
     <div class="tab_content" id="tab3">


  <a style="cursor: pointer" onclick="reserveChk()" class="myButton2">리뷰 쓰기</a>
   
   
   <form style="display: none; margin-left: 90px;" id="review" action="${contextPath}/lods/addReveiw.do" method="post" enctype="multipart/form-data">
    <table>
   	   <tr>
	   		<td style="text-align: center;" colspan="2">
	   						    <fieldset>
									<span class="text-bold">별점을 선택해주세요</span>
									<input type="radio" name="starpoint" value="5" id="rate1"><label for="rate1">★</label>
									<input type="radio" name="starpoint" value="4" id="rate2"><label for="rate2">★</label>
									<input type="radio" name="starpoint" value="3" id="rate3"><label for="rate3">★</label>
									<input type="radio" name="starpoint" value="2" id="rate4"><label for="rate4">★</label>
									<input type="radio" name="starpoint" value="1" id="rate5"><label for="rate5">★</label>
								</fieldset>
								</td>
	   </tr>
	   <tr>
	   		<td style="text-align: center;">리뷰 제목</td>
	   		
	   		<td><input type="text" name="review_title" style="width: 400px;"></td>
	   </tr>
	   <tr>
	   		<td>이용한 객실 : </td>
	   		<td> 
	   		   		<select name="unit_id">
						    <c:forEach var="nam" items="${unit}" varStatus="p">
							      <option value="${nam.unit_id}">${nam.unit_name}</option>
							      
						    </c:forEach>
				    </select> 
	   		</td>
	   </tr>
	   <tr>
	   		<td style="text-align: center;">리뷰 내용</td>
	   		<td><textarea name="review_content" style="resize: none;width: 400px; height: 200px;"></textarea></td>
	   		<td><input type="hidden" name="lod_id" value="${lod.lod_id }"></td>
   	  </tr>   
   </table>
   <input type="hidden" name="member_id" value="${memberInfo.member_id }">
   <input type="hidden" name="m_id" value="${m_id}" >
   
   <div><input type="button" value="이미지 추가" onClick="addImg()"/>리뷰 이미지 첨부</div> <a style="font-size: 14px;">(리뷰 이미지는 최대 10장까지 등록 가능합니다.)</a>
   <div id="imgfile"></div>
   
   
    <a style="cursor: pointer" onclick="addReview()" class="myButton2">리뷰 등록</a>
   
   </form>
 <!-- 이부분 수정 필 -->
 <div id="reviewList">
 <c:if test="${empty review}">
 <div class="reviewBox">아직 등록된 리뷰가 없습니다.</div>
 </c:if>
 <c:forEach var="re" items="${review}"> 
   <div style="bordertop: 1px solid #000000; border-bottom: 1px solid #000000; margin-bottom: 10px;" >
   <c:set var="z" value="${z+1}"/>
   <div style="font-size: 20px;"><strong>리뷰 제목 : </strong>${re.review_title }</div>
		<div style="margint-top: 10px;">  <span style="float:right;"> <fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${re.addDate }"/> </span><br>	<span style="float: right;"><strong>작성자 : ${re.member_id } </strong></span></div> 

		<div id="unitReview" style="width: 200px;">
		<fieldset style="border:none; padding: 0px; height: 28px;">
		<c:choose>
			<c:when test="${re.starpoint eq '1'}">
						<input style=" cursor:pointer;" type="radio" name="starpoint" value="5" id="star1" readonly><label style=" cursor:pointer;" for="#">★★★★</label>
						<input style=" cursor:pointer;" type="radio" name="starpoint${z }" value="1" id="star5" style="float:right;" checked readonly><label style="cursor:pointer;" for="#">★</label>					
								
			</c:when>
			<c:when test="${re.starpoint eq '2'}">
						<input style=" cursor:pointer;" type="radio" name="starpoint" value="3" id="star3" readonly><label style=" cursor:pointer;" for="#">★★★</label>
						<input style=" cursor:pointer;" type="radio" name="starpoint${z}" value="2" id="star4" checked readonly><label style="cursor:pointer;" for="#">★★</label>
											
			</c:when>
			<c:when test="${re.starpoint eq '3'}">
											<input style=" cursor:pointer;" type="radio" name="starpoint" value="4" id="star2" readonly><label style=" cursor:pointer;" for="#">★★</label>
											<input style=" cursor:pointer;" type="radio" name="starpoint${z}" value="3" id="star3" checked readonly><label style="cursor:pointer;" for="#">★★★</label>
			</c:when>
			<c:when test="${re.starpoint eq '4'}">
						<input style=" cursor:pointer;" type="radio" name="starpoint" value="5" id="star1" readonly><label style=" cursor:pointer;" for="#">★</label>
						<input style=" cursor:pointer;" type="radio" name="starpoint${z}" value="4" id="star2" checked readonly><label style="cursor:pointer;" for="#">★★★★</label>
			</c:when>
			<c:when test="${re.starpoint eq '5'}">
						<input style=" cursor:pointer;" type="radio" name="starpoint${z}" value="5" id="star1" checked readonly><label style="cursor:pointer;" for="#">★★★★★</label>								
			</c:when>
			<c:otherwise>
				<input style=" cursor:pointer;" type="radio" name="star" value="5" id="star1" readonly><label style=" cursor:pointer;" for="#">★★★★★</label>			
			</c:otherwise>
			
		</c:choose>
		</fieldset>
		<span>(${re.starpoint})</span></div>
		<c:forEach var="reImg" items="${reviewImg }">
				<c:if test="${re.review_id eq reImg.review_id }">
				<span><img style="width: 250px; height: 150px; margin-top:10px;"src="${contextPath}/reivewThumnail.do?lod_id=${lod.lod_id}&imgName=${reImg.imgName}&review_id=${re.review_id}" alt="${reImg.imgName }"> </span>
				</c:if>
		</c:forEach>
		<div style="font-size:19px; margin-top:8px;"> <strong>리뷰 내용 : </strong></div>   
		<div style="margin-left: 85px; margin-bottom: 15px; font-size: 17px; width: 520px; font-weight: 500;">${re.review_content }</div>
   </div>
   
   
   </c:forEach>
   <!-- 페이징 들어가야 할 부분 -->
   </div>
   
   
  </div>
  
  
   <div class="tab_content" id="tab4">
   <div>${lod.refund}</div> 
   
   
   
   
   
   
  </div>
  </div>
</div>
</div>
</div>

<!--  -->
	<script type="text/javascript">
	function possibleDate(){
		var _lod_id = ${lod.lod_id};
		var _unit_name = document.getElementById("roomName").value;
		var dateRange=[];
		
		$.ajax({
			type:"get",
			url:"${contextPath}/getData/checkDate.do",
			data:{lod_id : _lod_id, unit_name : _unit_name},
			dataType: "json",
			success : function (data){
						var dateRange=[];				
						cantDate(data);					
			},
			
			error: function(){
				alert("실패");
			}
			
		});
		
		
		function cantDate(data){
			for(var m in data){ // for(변수 ; 조건 ; 증감)과 동일함

				var _checkIn_date = data[m].checkIn_date;
				var _checkOut_date = data[m].checkOut_date;
					
				for(var j = new Date(_checkIn_date); j < new Date(_checkOut_date); j.setDate(j.getDate()+1) ){
					dateRange.push($.datepicker.formatDate('yy-m-d', j));
					}
		};
			
		};
		
		
		
	    $.datepicker.setDefaults({
	        dateFormat: 'yy-m-d',
	        prevText: '이전 달',
	        nextText: '다음 달',
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	        showMonthAfterYear: true,
	        yearSuffix: '년',
	        minDate: 0,
	  	  beforeShowDay: 	function disableDate(date){
	  			var month = date.getMonth(), dates = date.getDate(), year = date.getFullYear();	
	  			for(var w = 0; w < dateRange.length; w++){
	  				if($.inArray(year+'-'+(month+1)+'-'+dates, dateRange) != -1){
	  					return [false];
	  				}
	  			}
	  			return [true];
	  		}
	      });	
	}

	possibleDate();

	$(function(){
		$("#chkIn").datepicker();
		$("#chkOut").datepicker();
	});
	</script>

<script src="${contextPath}/resources/js/accodian.js"></script>
</body>
<script>




/*--------------------------------------------------------------- 편의 시설용 -------------------------------------------------------*/
 var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
    markers = [], // 마커를 담을 배열입니다
    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
 
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(map); 

// 지도에 idle 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', searchPlaces);

// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
contentNode.className = 'placeinfo_wrap';

// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

// 커스텀 오버레이 컨텐츠를 설정합니다
placeOverlay.setContent(contentNode);  

// 각 카테고리에 클릭 이벤트를 등록합니다
addCategoryClickEvent();

// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
function addEventHandle(target, type, callback) {
    if (target.addEventListener) {
        target.addEventListener(type, callback);
    } else {
        target.attachEvent('on' + type, callback);
    }
}

// 카테고리 검색을 요청하는 함수입니다
function searchPlaces() {
    if (!currCategory) {
        return;
    }
    
    // 커스텀 오버레이를 숨깁니다 
    placeOverlay.setMap(null);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
        displayPlaces(data);
    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

    } else if (status === kakao.maps.services.Status.ERROR) {
        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
        
    }
}

// 지도에 마커를 표출하는 함수입니다
function displayPlaces(places) {

    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
    var order = document.getElementById(currCategory).getAttribute('data-order');

    

    for ( var i=0; i<places.length; i++ ) {

            // 마커를 생성하고 지도에 표시합니다
            var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

            // 마커와 검색결과 항목을 클릭 했을 때
            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
            (function(marker, place) {
                kakao.maps.event.addListener(marker, 'click', function() {
                    displayPlaceInfo(place);
                });
            })(marker, places[i]);
    }
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, order) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
function displayPlaceInfo (place) {
    var content = '<div class="placeinfo">' +
                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

    if (place.road_address_name) {
        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
    }  else {
        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
    }                
   
    content += '    <span class="tel">' + place.phone + '</span>' + 
                '</div>' + 
                '<div class="after"></div>';

    contentNode.innerHTML = content;
    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
    placeOverlay.setMap(map);  
}


// 각 카테고리에 클릭 이벤트를 등록합니다
function addCategoryClickEvent() {
    var category = document.getElementById('category'),
        children = category.children;

    for (var i=0; i<children.length; i++) {
        children[i].onclick = onClickCategory;
    }
}

// 카테고리를 클릭했을 때 호출되는 함수입니다
function onClickCategory() {
    var id = this.id,
        className = this.className;

    placeOverlay.setMap(null);

    if (className === 'on') {
        currCategory = '';
        changeCategoryClass();
        removeMarker();
    } else {
        currCategory = id;
        changeCategoryClass(this);
        searchPlaces();
    }
}

// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
function changeCategoryClass(el) {
    var category = document.getElementById('category'),
        children = category.children,
        i;

    for ( i=0; i<children.length; i++ ) {
        children[i].className = '';
    }

    if (el) {
        el.className = 'on';
    } 
} 

//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();

//지도에 컨트롤을 추가해야 지도위에 표시됩니다
//kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch('${lod.lod_address}', function(result, status) {

  // 정상적으로 검색이 완료됐으면 
   if (status === kakao.maps.services.Status.OK) {

      var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

      // 결과값으로 받은 위치를 마커로 표시합니다
      var marker = new kakao.maps.Marker({
          map: map,
          position: coords
      });

      // 인포윈도우로 장소에 대한 설명을 표시합니다
      var infowindow = new kakao.maps.InfoWindow({
          content: '<div style=" width:150px;text-align:center;padding:6px 0;">숙소 위치</div>'
      });
      infowindow.open(map, marker);

      // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
      map.setCenter(coords);
  } 
}); 

</script>

</html>