<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="lod"  value="${lodsDetailMap.lodVO}"  />
<c:set var="lodimg"  value="${lodsDetailMap.lodComImgList}"  />
<c:set var="unit"  value="${unitsDetailMap.unitVO}"  />
<c:set var="goods" value="${goodsMap.goodsVO}" />
<c:set var="image" value="${goodsMap.imageFileList}"/>

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
	left:1500px;
	padding: 10px 5px;
	position: absolute;
    width: 180px;
    height: auto;      
    background: #FFDE8A;
    border-radius: 18px;
    text-align:center;
    }

    .ping7 {
      width: 170px;
      height: 150px;
      margin:5px;
      border-radius: 10px;
    }

    .quickmenu2 { /* 최근본 숙소 */
      width: 168.26px;
      margin:10px auto; 
      font-size: 14px;        
      background: #FFF1D7;
      border-radius: 10px;
    }
    
    .text { /* 최근본 숙소 폰트사이즈*/
      font-size: 15px;      
    }
    
    .lodName{
    color: #8989dd;
    }
    .addressLod{
    color: #8989dd;
    }
    .NameItem{
     color: #8989dd;
    }
    .priceItem{
     color: #8989dd;
    }
 

</style>

</head>
<body>
<div class="quickmenu1">
	<a href="${contextPath}/lods/lodsDetail.do?lod_id=${lod.lod_id}">
	<c:if test="${lodimg != null }">
	    <img class="ping7" src="${contextPath}/lodThumbnails.do?lod_id=${lod.lod_id}&lod_imgName=${lodimg[0].lod_imgName}"  alt="최근 본 숙소"></a>
	</c:if>
	<div class="text">마지막으로 본 숙소</div>
	<div class="quickmenu2">   
    	<div class="lodName">숙소이름</div>${lod.lod_name}
    	<div class="addressLod">위치</div>${lod.lod_address }
	</div>
		
		
		<div class="text">마지막으로 본 상품</div>
			<div class="quickmenu2">
				<a href="${contextPath}/goods/goodsDetail.do?goods_no=${goods.goods_no}"><div class="NameItem">상품명</div>${goods.goods_name}</a>
				<div class="priceItem">가격</div>${goods.goods_price }
			</div>
 </div>
</body>
</html>