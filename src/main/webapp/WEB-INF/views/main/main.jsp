<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="value" value="${lodsListValue }" />
<c:set var="reserve" value="${lodsListReserve }"/>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title>메인</title>
  <link href="style.css" rel="stylesheet" type="text/css" />
  <script>
   	function zzim(o){
  		
  		var $lod_id = "lod_id"+o;
  		var _lod_id = document.getElementById($lod_id).value;
  		var _m_id = ${memberInfo.m_id};
  		var _hrtimg = "heart"+o;
  		  		
  		$.ajax({
  			type:"get",
  			url:"${contextPath}/getData/lodCart.do",
  			data : {lod_id : _lod_id, m_id : _m_id },
  			dataType: "json",
  			success : function(data){
  				var result = data.result;
				var state = data.state;
				var hrtImg = "heart"+o;
				if(state == "do"){
					imgsrc="${contextPath}/resources/image/heart-line.svg";
					document.getElementById(_hrtimg).src = imgsrc;
					after();
				}		
				if(state =="no"){
					imgsrc="${contextPath}/resources/image/heart-red.svg";
					document.getElementById(_hrtimg).src = imgsrc;
					after();
				}
				if(result == "_m_id null"){
					alert("로그인 이후 이용 가능합니다.");
				}
				
				
				if(result == "insert"){
					alert("찜 목록에 추가했습니다.");
				}
				if(result == "delete"){
					alert("찜 목록에 삭제했습니다.");
					}
		},
		error: function(){
			alert("ajax 실패 zzim()");
		}
	
  		});
	
  	}
  
  </script>
  <style>
	 .main-body {
      height: auto;
      margin: 0px auto;
    }

    .bodybox-text { /* 별점순 ,예약많은순 */
     display: flex;
     margin: 0px auto;
    }

    .text1 { /* 별점순 */
      font-weight: bold;
      height: 30px;
      font-size: 20px;
      color: #c96a18;
      margin-left: 200px;
    }

    .text2 { /* 예약 많은 순 */
      font-weight: bold;
      height: 30px;
      font-size: 20px;
      color: darkblue;
      margin-left: 450px;
    }
    
    .bodybox1 { 
      margin-right: auto;      
      background: #EFEBEB;
    }
    
    .ping_box {
    margin:0px auto;
    width:460px;
    }
    .ping {
      width: 100%;
      height: 220px;      
    }
    
    .ping_title{
    text-align:left;
    padding-left: 10px;
    font-size: 19px;
    }
 	.ping_price{
 	text-align:right;
 	font-weight: 600;
 	font-size: 18px;
 	}
  
    .bodybox2 {
      background: #EFEBEB;
    }
  
    .button-body { /* 숙소 더 보기 */
      text-align: center;
      height: 20px;
      width: 719px;
    }
    
    .camping-button { /* 숙소 더보기 */
    font-size: 15px;
    text-align: center;
    background: #FFF1D7;
    border-color: #FFF1D7;
    border-radius: 5px;
    margin: 40px auto;
    }
	
    
    /* starpoint */
    #unitReview{
    margin-top: -18px;
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
		    font-size: 1.5em;
		    color: transparent;
		    text-shadow: 0 0 0 #ffffff;
		}
		
		#unitReview input[type=radio]:checked ~ label{
		    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
		}
		#unitReviewContents {
		    width: 100%;
		    height: 50px;
		    padding: 5px 0px 5px 0px;
		    box-sizing: border-box;
		    border: solid 1.5px #D3D3D3;
		    border-radius: 5px;
		    font-size: 14px;
		    resize: none;
		}
		
  .addressPrice {
    width: 420px;
    display: inline-block;
    font-weight: 600;
    margin-left: 7px;
}
		
		.heart{
		width:25px; 
		height:25px; 
		cursor:pointer;
		}
  </style>
</head>
  
<body>
  <div class="main-body">
  <div class="bodybox-text">
  	<div class="text1">별점순</div>
  	<div class="text2">예약 많은 순</div>
  </div>
    <div style="display: flex">
  <div class="bodybox1">
  
  
  <c:forEach var="item" items="${value}" begin="0" end="4">
  <c:set var="o" value="${o+1 }"/>
  <input type="hidden"  value=0 > 
    <div class="ping_box">
	  	<a href="${contextPath}/lods/lodsDetail.do?lod_id=${item.lod_id}">
	  	<img class="ping" src="${contextPath}/lodThumbnails.do?lod_id=${item.lod_id}&lod_imgName=${item.lod_imgName}" alt="${item.lod_name }"></a>
	  	<div style="display: flex; width: 336px; cursor:pointer" onclick="location.href='${contextPath}/lods/lodsDetail.do?lod_id=${item.lod_id}'">
	  	<div class="ping_title"> <a href="${contextPath}/lods/lodsDetail.do?lod_id=${item.lod_id}">
	  	<b>${item.lod_name}</b></a></div> </div>
	  	<div id="unitReview" style=" cursor:pointer; text-align:right; width:auto;"> <!-- lod 별점 줄때 input name 다르게 설정 해야댐 -->
				    
				    <fieldset style="padding: 0px;">
						    <c:choose>
								<c:when test="${item.lod_starpoint >= 1.0 && item.lod_starpoint < 2.0}">
											<input style=" cursor:pointer;" type="radio" name="lod" value="5" id="lod1" readonly><label style=" cursor:pointer;" for="#">★★★★</label>
											<input style=" cursor:pointer;" type="radio" name="lod${o}" value="1" id="lod5" style="float:right;" checked readonly><label style="cursor:pointer;" for="#">★</label>					
								</c:when>
								<c:when test="${item.lod_starpoint >= 2.0 && item.lod_starpoint < 3.0}">
											<input style=" cursor:pointer;" type="radio" name="lod" value="3" id="lod3" readonly><label style=" cursor:pointer;" for="#">★★★</label>
											<input style=" cursor:pointer;" type="radio" name="lod${o}" value="2" id="lod4" checked readonly><label style="cursor:pointer;" for="#">★★</label>
								</c:when>
								<c:when test="${item.lod_starpoint >= 3.0 && item.lod_starpoint < 4.0}">
											<input style=" cursor:pointer;" type="radio" name="lod" value="4" id="lod2" readonly><label style=" cursor:pointer;" for="#">★★</label>
											<input style=" cursor:pointer;" type="radio" name="lod${o}" value="3" id="lod3" checked readonly><label style="cursor:pointer;" for="#">★★★</label>		
								</c:when>
								<c:when test="${item.lod_starpoint >= 4.0 && item.lod_starpoint < 5.0}">
											<input style=" cursor:pointer;" type="radio" name="lod" value="5" id="lod1" readonly><label style=" cursor:pointer;" for="#">★</label>
											<input style=" cursor:pointer;" type="radio" name="lod${o}" value="4" id="lod2" checked readonly><label style="cursor:pointer;" for="#">★★★★</label>
								</c:when>
								<c:when test="${item.lod_starpoint eq 5.0}">
											<input style=" cursor:pointer;" type="radio" name="lod${o}" value="5" id="lod1" checked readonly><label style="cursor:pointer;" for="#">★★★★★</label>
								</c:when> 
								<c:otherwise>
											<input style=" cursor:pointer;" type="radio" name="lod" value="5" id="lod1" readonly><label style=" cursor:pointer;" for="#">★★★★★</label>
								
								</c:otherwise>
							</c:choose>
					</fieldset>
					
					<span>  (<fmt:formatNumber type="number" pattern="0.00" value="${item.lod_starpoint}"/>)</span>
				    </div>
				    
	  	
	 		<div><div class="addressPrice" style="cursor:pointer" onclick="location.href='${contextPath}/lods/lodsDetail.do?lod_id=${item.lod_id}'">(${item.lod_address})	
	 <div class="ping_price"> 
	  	<fmt:formatNumber type="number" value="${item.lod_price }"/>원</div></div>
	  	<img id="heart${o}" class="heart"  src="${contextPath}/resources/image/heart-line.svg" onclick="return zzim(${o})"/></div>
	  	<input type="hidden" id="lod_id${o}" value="${item.lod_id}">
  	</div>
  	</c:forEach>
  	</div>
  
  

  <div class="bodybox2">
  
  	<c:forEach var="res" items="${reserve }">
  	<c:set var="o" value="${o+1 }"/>
  	<div class="ping_box" >
  	
  	<a href="${contextPath}/lods/lodsDetail.do?lod_id=${res.lod_id}">
  	<img class="ping" src="${contextPath}/lodThumbnails.do?lod_id=${res.lod_id}&lod_imgName=${res.lod_imgName}" alt="${res.lod_name }"></a>
	  		<div style="display: flex; width: 336px; cursor: pointer;" onclick="location.href='${contextPath}/lods/lodsDetail.do?lod_id=${res.lod_id}'">
	  	<div class="ping_title"> <a href="${contextPath}/lods/lodsDetail.do?lod_id=${res.lod_id}">
	  	<b>${res.lod_name}</b></a></div> </div>
	  	<div id="unitReview" style=" cursor:pointer; text-align:right; width:auto;"> <!-- lod 별점 줄때 input name 다르게 설정 해야댐 -->
				    
				    <fieldset style="padding: 0px;">
						    <c:choose>
								<c:when test="${res.lod_starpoint >= 1.0 && res.lod_starpoint < 2.0}">
											<input style=" cursor:pointer;" type="radio" name="lod" value="5" id="lod1" readonly><label style=" cursor:pointer;" for="#">★★★★</label>
											<input style=" cursor:pointer;" type="radio" name="lod${o}" value="1" id="lod5" style="float:right;" checked readonly><label style="cursor:pointer;" for="#">★</label>					
								</c:when>
								<c:when test="${res.lod_starpoint >= 2.0 && res.lod_starpoint < 3.0}">
											<input style=" cursor:pointer;" type="radio" name="lod" value="3" id="lod3" readonly><label style=" cursor:pointer;" for="#">★★★</label>
											<input style=" cursor:pointer;" type="radio" name="lod${o}" value="2" id="lod4" checked readonly><label style="cursor:pointer;" for="#">★★</label>
								</c:when>
								<c:when test="${res.lod_starpoint >= 3.0 && res.lod_starpoint < 4.0}">
											<input style=" cursor:pointer;" type="radio" name="lod" value="4" id="lod2" readonly><label style=" cursor:pointer;" for="#">★★</label>
											<input style=" cursor:pointer;" type="radio" name="lod${o}" value="3" id="lod3" checked readonly><label style="cursor:pointer;" for="#">★★★</label>		
								</c:when>
								<c:when test="${res.lod_starpoint >= 4.0 && res.lod_starpoint < 5.0}">
											<input style=" cursor:pointer;" type="radio" name="lod" value="5" id="lod1" readonly><label style=" cursor:pointer;" for="#">★</label>
											<input style=" cursor:pointer;" type="radio" name="lod${o}" value="4" id="lod2" checked readonly><label style="cursor:pointer;" for="#">★★★★</label>
								</c:when>
								<c:when test="${res.lod_starpoint eq 5.0}">
											<input style=" cursor:pointer;" type="radio" name="lod${o}" value="5" id="lod1" checked readonly><label style="cursor:pointer;" for="#">★★★★★</label>
								</c:when> 
								<c:otherwise>
											<input style=" cursor:pointer;" type="radio" name="lod" value="5" id="lod1" readonly><label style=" cursor:pointer;" for="#">★★★★★</label>
								
								</c:otherwise>
							</c:choose>
					</fieldset>
					
					<span>  (<fmt:formatNumber type="number" pattern="0.00" value="${res.lod_starpoint}"/>)</span>
				    </div>
				    
		  <div><div class="addressPrice" style="cursor:pointer" onclick="location.href='${contextPath}/lods/lodsDetail.do?lod_id=${res.lod_id}'">(${res.lod_address})	
	 		<div class="ping_price"><fmt:formatNumber type="number" value="${res.lod_price }"/>원 </div></div>
	 		<img id="heart${o}" class="heart"  src="${contextPath}/resources/image/heart-line.svg" onclick="return zzim(${o})"/></div>
	 		<input type="hidden" id="lod_id${o}" value="${res.lod_id}">
	 		
    </div>
    </c:forEach>
  </div>
  

  </div>
   <div class="button-body">
   <!--  <button type="button" class="camping-button" onclick="fn_imgadd()">숙소 더 보기</button> -->
    </div>
  
  </div>

  <script src="script.js"></script>
  </body>
  <script>
  window.onload = function before(){
	  var valu = ${value.size()};
	  var rese = ${reserve.size()};
	  var num = valu+rese+1;
	  for(var x=1; x < num; x++){
		  var lods_id = "lod_id"+x;
		 	var _lod_id = document.getElementById(lods_id).value;
		 	var _m_id = ${memberInfo.m_id};
				
			(function(x){					
		$.ajax({
			type:"get",
			url:"${contextPath}/getData/lodCartCheck.do",
			data : {lod_id : _lod_id, m_id : _m_id },
			 async:false,
			dataType: "json",
			success : function(data){
					var state = data.state;
					var _hrtimg = "heart"+x;				
					if(state == _lod_id+"no"){
						imgsrc="${contextPath}/resources/image/heart-line.svg";
						document.getElementById(_hrtimg).src = imgsrc;
					}		
					if(state == _lod_id+"do"){
						imgsrc="${contextPath}/resources/image/heart-red.svg";
						document.getElementById(_hrtimg).src = imgsrc;
					}
				},
			error: function(request, status, error){
				alert("code : "+request.status+"\n"+"message : " +request.responseText+"\n"+"error : " +error);
			}
		});
		
				})(x);
		
	  }
	}	
  
  function after(){
	  var valu = ${value.size()};
	  var rese = ${reserve.size()};
	  var num = valu+rese+1;
	  
	  for(var x=1; x < num; x++){
		  var lodge_id = "lod_id"+x;
		 	var _lod_id = document.getElementById(lodge_id).value;
		 	var _m_id = ${memberInfo.m_id};
				
			(function(x){
				
				
				
								
		$.ajax({
			type:"get",
			url:"${contextPath}/getData/lodCartCheck.do",
			data : {lod_id : _lod_id, m_id : _m_id },
			async:false,
			dataType: "json",
			success : function(data){
					var state = data.state;
					var _hrtimg = "heart"+x;
					
					
					
					if(state == _lod_id+"no"){
						imgsrc="${contextPath}/resources/image/heart-line.svg";
						document.getElementById(_hrtimg).src = imgsrc;
					}		
					if(state == _lod_id+"do"){
						imgsrc="${contextPath}/resources/image/heart-red.svg";
						document.getElementById(_hrtimg).src = imgsrc;
					}
				},
			error: function(request, status, error){
				alert("code : "+request.status+"\n"+"message : " +request.responseText+"\n"+"error : " +error);
			}
		});
		
				})(x);
		
	  }
	}	
  </script>
</html>