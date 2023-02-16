<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
jQuery(function($){
	var quickBox = $(".quickmenu1");
	var quickTop = parseInt(quickBox.offset().top);
	$(window).scroll(function(){
		var scTop = Math.max(document.documentElement.scrollTop,document.body.scrollTop);
		quickBox.stop();
		quickBox.animate({"top":scTop + quickTop}, 300);
	});
});
</script>
<style>
.quickmenu1 {
	top:140px;
	left:1350px;
	padding: 10px 5px;
	position: absolute;
    width: 180px;
    height: auto;      
    background: #FFDE8A;
    border-radius: 18px;
    }

    .ping7 {
      width: 170px;
      margin:5px;
      border-radius: 10px;
    }

    .quickmenu2 { /* 최근본 숙소 */
      width: 168.26px;
      margin:10px auto; 
      font-size: 14px;      
      
      background: #FFF1D7;
      border-radius: 10px;
      text-align: center;
    }
    
    .text3 { /* 최근본 숙소 폰트사이즈*/
      font-size: 20px;
      text-align: center;
      
    }

    .quickmenu3 { /* date1,2 달력 */
    width: 168.54px;
    margin:10px auto;
    font-size: 12px;      
    background: #FFF1D7;
    border-radius: 7px;
    }


  .quickmenu4 {  /* 지역 */
    width: 168.54px;
    background: #FFF1D7;
    border-radius: 7px;
    margin:10px auto;
    text-align:center;
  }

  .quickmenu5 { /* 인원 수 */
    width: 168.54px;
    margin:10px auto;
    background: #FFF1D7;
    border-radius: 7px;
    text-align:center;
  }

  .quickmenu6 { /* 캠핑 글램핑 차박 카라반 */
    width: 168.54px;
    margin:10px auto;
    background: #FFF1D7;
    border-radius: 7px;
  }

    
  .quickmenu7 { /* 검색하기 */
    width: 80px;
    margin: auto;
    height: 27px;
    text-align: center;    
    background: #FFDE8A;
    border-radius: 20px;
  } 
  
.date1 { /* sidebox4 텍스트 03월 31일 ~ 04월 01일 1박 */
      width: 100px;
      left: 4.04px;
      top: 5.5px;
      font-size: 12px; 
      text-align: center;
      margin-left: 10px;
      margin-top: 1.5px;
      background:#FFF1D7;
      border-color:#FFF1D7;
      border-radius: 5px;
    }
.date2 { /* sidebox4 텍스트 03월 31일 ~ 04월 01일 1박 */
    width: 100px;
    left: 4.04px;
    top: 5.5px;
    font-size: 12px; 
    text-align: center;
    margin-left: 50px;
    margin-top: 1.5px;
    background:#FFF1D7;
    border-color:#FFF1D7;
    border-radius: 5px;
}
    .text5 { /* sidebox5 지역 */
      height: 22px;
      font-size: 12px;  
      background:#FFF1D7;
      border-radius: 5px;
      margin: 0px auto 2.5px auto;
    }

    .text6 { /* sidebox6 인원 명*/
      font-size: 12px;
      background:#FFF1D7;
      border-radius: 5px;
      margin: 0px auto 2.5px auto;
    }

    .text7 { /* sidebox7 캠핑 글램핑 차박 카라반 */
      margin: 0px auto 2.5px auto;
      font-size: 12px; 
      border-align: center;  
    }

    .side-cg { /* sidebox7 캠핑 글램핑 차박 카라반 */
      margin-top: 9px;
      text-align: center;
    }

    .text8 { /* sidebox8 검색 하기 */
      font-size: 12px; 
      text-align: center;
      background:#FFF1D7;
      border-color:#FFF1D7;
      border-radius: 5px;
      margin:0px auto;
    }
</style>

</head>
<body>
<div class="quickmenu1">
	<div class="text3">최근 본 상품</div><br>

  <div class="quickmenu2" style="padding-bottom: 10px;">
      
      <a href="/galgga/campingMain.do">
    <img class="ping7" src="${contextPath}/resources/image/tent.png" alt="최근 본 상품"></a>
      상품 이름 : 자충 매트<br><br>
      
      무게 : 5.1kg <br>
      브랜드 : 내셔널지오그래픽 <br>
      230,000원
  </div>
  
  <div class="quickmenu2" style="padding-bottom: 10px;">
            <a href="/galgga/campingMain.do">
    <img class="ping7" src="${contextPath}/resources/image/tent.png" alt="최근 본 상품"></a>
      상품 이름 : Protect 3+ 캠핑도킹 suv 차박텐트쉘터<br><br>
      
      무게 : 8.3kg <br>
      브랜드 : 어반사이드 <br>
      298,000원
  </div>

  
 </div>
</body>
</html>