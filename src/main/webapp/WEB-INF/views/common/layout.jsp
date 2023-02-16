<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
article{
width: 720px;
margin: 0px auto;

}
</style>

</head>
<body>
   <div id="outer_wrap">
		<div id="wrap">
			<header>
				   <tiles:insertAttribute name="header" />
			</header>
			 <div class="clear"></div> 
			<div>
				 <tiles:insertAttribute name="gnb" />
			</div> 
			<aside>
				<tiles:insertAttribute name="quickmenu" />
			</aside>
			<article>
			 	<tiles:insertAttribute name="body" />
			</article>
			<div class="clear"></div>
			<footer>
        		<tiles:insertAttribute name="footer" />
        	</footer>
		</div>
    </div>   
  </body>
</html>