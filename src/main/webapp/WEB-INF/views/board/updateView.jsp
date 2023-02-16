<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
 $(document).ready(function(){
	 var formObj = $("form[name='updateForm']");
	 
	 $(".cancel_btn").on("click", function(){
		 event.preventDefault();
		 location.href = "/galgga/board/boardlist";
			
	 })
	 
	 $(".update_btn").on("click", function(){
		 if(fn_valiChk()){
			 return false;
		 }
		 formObj.attr("action", "update");
		 formObj.attr("method", "post");
		 formObj.submit();
	 })
 })
 
	function fn_valiChk(){
			var updateForm = $("form[name='updateForm'] .chk").length;
			for(var i = 0; i<updateForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
		 }
	 }
 }
 </script>
<style>

.boardPageBox{
  
  width: 720px;
  margin: auto;	
  padding-bottom: 10px;
  }
  
 
    .line{
  	 margin-top: 0px;
  	  margin-bottom: 10px;
      width: 118px;
      height: 0px;
      left: 0px;
      border: 1px solid;
  }
  
  


  
  /*------------------쿠폰 확인---------------------*/
  .boardbox{
    font-size: 20px;
    height: auto;
    width: 580px;
    margin:0px auto;
    margin-top: 59px;
   
  }
  

  table {
    width: 100%;
    border-top: 2px solid #000000;
    border-bottom: 1px solid #000000;
    margin: auto;
    border-collapse: collapse;
    border-left: none;
    border-right: none;
    text-decoration: none;
    color: black;
    margin-bottom: 20px;
  }
  th{
    font-size:15px;
    padding-top:10px;
    padding-bottom:10px;
    text-decoration: none;
    color: black;
  }
  td{
    text-decoration: none;
    color: black;
    font-size:15px;

  }
  th, td {
    border-bottom: 1px solid #000000;
    text-decoration: none;
    color: black;
   /*  text-align: center; */
    }
  th:first-child, td:first-child {
    border-left: none;
    text-decoration: none;
    color: black;
    }


  .eventtitle{
    font-size: 23px;
    width: 120px;
    height: auto;
    margin-bottom: 5px;
  }
  
   .boardbutton{
    width: 90px;
    height: 40px;
    background: #4B5578;
    border-radius: 5px;
    color: white;
    margin-top: 5px;
    margin-left: 632px;
  
  }
  
  
  .nav_update_btn{
  margin-left: 220px;
  }
  
  .update_btn{
   background: #4B5578;
   border-radius: 7px;
   color: white;
   width: 60px;
  }
  
  .cancel_btn{
   background: #4B5578;
   border-radius: 7px;
   color: white;
   width: 60px;
  }
  
  
  .writer_id{
  height: 25px;
  width: 150px;
  margin-left: 15.5px;
  }
  
  .title{
  height: 25px;
  width: 300px;
  }
  
  .content{
  height:300px;
  width: 535px;
  }
  
   textarea {
    resize: none;
  }
  

  </style>
</head>

<body>

	<div class="boardPageBox">
	<div class="boardbox">
    <div class="eventtitle">1:1 문의</div>
    <form name="updateForm" role="form" method="post" action="update">
    	<input type="hidden" id="bno" name="bno" value="${update.bno}" readonly="readonly"/>
  
		<table>
		<thead>
		
			
			<tr>
				<td>
					<label style="margin-right:5px;" for="writer_id">ID</label><input type="text" class="writer_id" id="writer_id" name="writer_id" value="${update.writer_id}" readonly="readonly"/>   
				</td>    
			</tr>
				
			<tr>
				<td>
					<label style="margin-right:5px;" for="title">제목</label><input type="text" class="title" id="title" name="title" value="${update.title}" class="chk" title="제목을 입력하세요."/>   
				</td>    
			</tr>
			
			<tr>
				<td>
					<label for="content">내용</label><textarea class="content" id="content" name="content" class="chk" title="내용을 입력하세요."><c:out value="${update.content}"/></textarea>  
				</td>    
			</tr>
			
			<tr>
				<td>
					<label for="wirtedate">작성일</label>   
					<fmt:formatDate value="${update.writedate}" pattern="yyyy-MM-dd"/>
				</td>    
			</tr>
			
		</thead>
	</table>
	<div class="nav_update_btn">
				<button type="submit" class="update_btn">저장</button>
				<button type="submit" class="cancel_btn">취소</button>
	</div>
	  </form>
	</div>	 

</div>
  
</body>
</html>