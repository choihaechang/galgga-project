<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
window.onload = function before(){
	
	
	
	
	  for(var x=1; x < ${category.size()}; x++){
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
	
   	function zzim(x){
  		
  		var $lod_id = "lod_id"+x;
  		var _lod_id = document.getElementById($lod_id).value;
  		var _m_id = ${memberInfo.m_id};
  		var _hrtimg = "heart"+x;
  		  		
  		$.ajax({
  			type:"get",
  			url:"${contextPath}/getData/lodCart.do",
  			data : {lod_id : _lod_id, m_id : _m_id },
  			dataType: "json",
  			success : function(data){
  				var result = data.result;
				var state = data.state;
				var hrtImg = "heart"+x;
				if(state == "do"){
					imgsrc="${contextPath}/resources/image/heart-line.svg";
					document.getElementById(_hrtimg).src = imgsrc;
					
				}		
				if(state =="no"){
					imgsrc="${contextPath}/resources/image/heart-red.svg";
					document.getElementById(_hrtimg).src = imgsrc;
					
				}
				if(result == "_m_id null"){
					alert("로그인 이후 이용 가능합니다.");
				}
				
				
				if(result == "insert"){
					alert("찜 목록에 추가했습니다.");
				}
				if(result == "delete"){
					alert("찜 목록에서 삭제했습니다.");
					}
		},
		error: function(){
			alert("ajax 실패 zzim()");
		}
	
  		});
	
  	}
</script>

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
	  border-radius:4px;
      display: inline-block;
      
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
    height: AUTO;
    padding-bottom: 15px;
    clear: both;
   	margin: 20px;
     display:flex;
     padding-right: 10px; 
     cursor: pointer;
  }

    .lod_img{
    width: 250px;
    height: 140px;
    margin: 5px 5px;
    }
    .siteName{
      font-size: 20px;
      font-weight:bold;
      width: 400px;
      display:block;
    }

    .price{
      width:200px;
      margin-left: 200px;
      font-size: 18px;
      margin-bottom: 5px;
      display: float-right;
      display:inline-block;
      text-align: right;
    }
    .button{
    background-color: white;
    border: 0px;
    width : 669px;
    height: 120px;
    cursor: pointer;
    text-align:left;
    font-size: 15px;
    }
    
        /* starpoint */
    #star{
    margin-top: -18px;
    }
	 #star fieldset{
	    display: inline-block;
	    direction: rtl;
	    border:0;
	    
		}
		#star fieldset legend{
		    text-align: right;
		}
		#star input[type=radio]{
		    display: none;
		}
		#star label{
		    font-size: 1.5em;
		    color: transparent;
		    text-shadow: 0 0 0 #f0f0f0;
		}
		
		#star input[type=radio]:checked ~ label{
		    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
		}
		#starContents {
		    width: 100%;
		    height: 50px;
		    padding: 5px 0px 5px 0px;
		    box-sizing: border-box;
		    border: solid 1.5px #D3D3D3;
		    border-radius: 5px;
		    font-size: 14px;
		    resize: none;
		}
    
    
    .bag{
    width: 440px;
    }
    .heart{
    	width:25px; 
		height:25px; 
		cursor:pointer;
    }
    
  </style>

</head>
<body>
<div class="mainBody">
    <div class="lodlist">숙소 목록</div>
    <c:forEach var="cate" items="${category}">
    <c:set var="x" value="${x+1 }"/>
		 <div class="lod" >
		    <a class="button" id="button" type="button" onclick="location.href='${contextPath}/lods/lodsDetail.do?lod_id=${cate.lod_id}'">
		    <img src="${contextPath}/lodThumbnails.do?lod_id=${cate.lod_id}&lod_imgName=${cate.lod_imgName}" alt="${cate.lod_name }" class="lod_img" ></a>
		    <div class="bag">
		    
		    <div class="siteName" onclick="location.href='${contextPath}/lods/lodsDetail.do?lod_id=${cate.lod_id}'">${cate.lod_name }</div><br>
		    <div class="lodInfo" onclick="location.href='${contextPath}/lods/lodsDetail.do?lod_id=${cate.lod_id}'">${cate.lod_address }<br></div><br>
		    
		    <div>
		    <div id="star" onclick="location.href='${contextPath}/lods/lodsDetail.do?lod_id=${cate.lod_id}'">
				    <c:set var="o" value="${o+1 }"/>
				    <fieldset style="padding: 0px;">
						    <c:choose>
								<c:when test="${cate.lod_starpoint >= 1.0 && cate.lod_starpoint < 2.0}">
											<input  type="radio" name="lod" value="5" id="lod1" readonly><label style=" cursor:pointer;" for="#">★★★★</label>
											<input  type="radio" name="lod${o}" value="1" id="lod5" style="float:right;" checked readonly><label style="cursor:pointer;" for="#">★</label>					
								</c:when>
								<c:when test="${cate.lod_starpoint >= 2.0 && cate.lod_starpoint < 3.0}">
											<input type="radio" name="lod" value="3" id="lod3" readonly><label style=" cursor:pointer;" for="#">★★★</label>
											<input type="radio" name="lod${o}" value="2" id="lod4" checked readonly><label style="cursor:pointer;" for="#">★★</label>
								</c:when>
								<c:when test="${cate.lod_starpoint >= 3.0 && cate.lod_starpoint < 4.0}">
											<input type="radio" name="lod" value="4" id="lod2" readonly><label style=" cursor:pointer;" for="#">★★</label>
											<input type="radio" name="lod${o}" value="3" id="lod3" checked readonly><label style="cursor:pointer;" for="#">★★★</label>		
								</c:when>
								<c:when test="${cate.lod_starpoint >= 4.0 && cate.lod_starpoint < 5.0}">
											<input  type="radio" name="lod" value="5" id="lod1" readonly><label style=" cursor:pointer;" for="#">★</label>
											<input  type="radio" name="lod${o}" value="4" id="lod2" checked readonly><label style="cursor:pointer;" for="#">★★★★</label>
								</c:when>
								<c:when test="${cate.lod_starpoint eq 5.0}">
											<input  type="radio" name="lod${o}" value="5" id="lod1" checked readonly><label style="cursor:pointer;" for="#">★★★★★</label>
								</c:when> 
								<c:otherwise>
											<input type="radio" name="lod" value="5" id="lod1" readonly><label style=" cursor:pointer;" for="#">★★★★★</label>
								
								</c:otherwise>
							</c:choose>
					</fieldset>
					
					<span>  (<fmt:formatNumber type="number" pattern="0.00" value="${cate.lod_starpoint}"/>)</span>
				    </div></div>
				    <div class="price"><fmt:formatNumber type="number" value="${cate.lod_price}"/>원
				    <img id="heart${x}" class="heart"  src="${contextPath}/resources/image/heart-line.svg" onclick="return zzim(${x})"/></div>
	  				<input type="hidden" id="lod_id${x}" value="${cate.lod_id}">
				    
		    </div>
		   	   
		  </div>
	</c:forEach>

 

  </div> 

</body>
</html>