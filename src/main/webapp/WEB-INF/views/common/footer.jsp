<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
	
<%request.setCharacterEncoding("UTF-8");%> 
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	
  
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>

      .footbox {
        width: 720px;
        height: 130px;
        margin: 60px auto;

        font-family: 'Inter';
        font-style: normal;
        font-weight: 400;
        font-size: 14px;
        line-height: 17px;
        text-align: center;

        color: #000000;
      }
      
      .banner-body {
      margin: 20px auto;
      width: 720px;
      height: auto;
      overflow:hidden;
         
 
    }
    
     .banner-body ul{width:720px;display:flex;animation:slide 51s infinite; padding-left: 0px;} /* slide를 51초동안 진행하며 무한반복 함 */
     .banner-body li{width:720px;height:170px;}
      
      .banner { /* 하단 배너 */
     
      margin: 0px auto;
      bottom: 0px;
      width: 720px;
      height: 200px;
      
    }
    
 

    
     @keyframes slide {
      0% {margin-left:0;} /* 0 ~ 10  : 정지 */
      10% {margin-left:0;} /* 10 ~ 25 : 변이  */
      25% {margin-left:-100%;} /* 25 ~ 35 : 정지  */
      35% {margin-left:-100%;} /* 35 ~ 50 : 변이  */
      50% {margin-left:-200%;}
      60% {margin-left:-200%;}
      100% {margin-left:-100%;}
    } 
    </style>
  </head>

  <body>
  
        <div class="footbox">
         <div class="banner-body">
         <ul>
         	<li><a href="#"><img class="banner" src="${contextPath}/resources/image/banner1.jpg" alt="banner img"></a></li>
         	<li><a href="#"><img class="banner" src="${contextPath}/resources/image/banner2.jpg" alt="banner img"></a></li>
         	<li><a href="#"><img class="banner" src="${contextPath}/resources/image/banner3.jpg" alt="banner img"></a></li>
         </ul>
   		
   		</div>
   		<a href="${contextPath }/main/main.do"><img alt="camping1" src="${contextPath}/resources/image/camping1.JPG" style="width:96px; height:69px;" /></a>
			<div style="margin:0px;">
			캠핑갈까<br>
			회사 대표번호 : 042-1111-1111<br>
    		회사주소 : 대전광역시 도마 16길 54<br>
    		</div>
    </div>

  </body>

  </html>