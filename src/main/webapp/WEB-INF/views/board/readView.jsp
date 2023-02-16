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
			var formObj = $("form[name='readForm']");
			
			// 수정 화면가기
			$(".update_btn").on("click", function(){
				formObj.attr("action", "updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
	
			// 삭제
			$(".delete_btn").on("click", function(){
				var deleteYN = confirm("삭제 하시겠습니까?");
				if(deleteYN == true){
				
				formObj.attr("action", "delete");
				formObj.attr("method", "post");
				formObj.submit();
				
				}
			})
				//목록 (취소)
				$(".list_btn").on("click", function(){
				location.href = "boardlist?page=${scri.page}"
	  			 +"&perPageNum=${scri.perPageNum}"
	   			 +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			})	
			
			// 댓글 작성
			$(".replyWriteBtn").on("click", function(){
				var formObj = $("form[name='replyForm']");
				formObj.attr("action","replyWrite");
				formObj.submit();
			});
			
			//댓글 수정 
			$(".replyUpdateBtn").on("click", function(){
				var parent = $(this).parent().parent();
				var sib = $(parent).siblings(".replyMod");
				
				$(sib).css("display", "block");
			});
			
			//댓글 삭제 
			$(".replyDeleteBtn").on("click", function(){
				if(confirm("정말 삭제하시겠습니까?")) {
				location.href = "replyDelete.do?bno=${read.bno}"
							  + "&page=${scri.page}"
							  + "&perPageNum=${scri.perPageNum}"
							  + "&searchType=${scri.searchType}"
							  + "&keyword=${scri.keyword}"
							  + "&rno="+$(this).attr("data-rno");
				} return;
			});

			$(".replyCancelBtn").on("click", function(){
			 	var parents = $(this).parents(".replyMod");
				$(parents).css("display", "none");
			});
			
			$(".replyFormBtn").on("click", function(){
				var rno = $(this).data("rno");
				
				var input = $(this).siblings("input");
				
				var content = $(input).val();
				
				var parents = $(this).parents(".replyMod");
				
				var p = $(parents).siblings("p");
				
				console.log(p);
				
				$.ajax({
	                type : "POST",          
	                url : "replyUpdate",
	                data : { "rno" : rno, "content" : content  }, 
	                dataType : "json",
	                success : function(res){
	                    var content = res.content;
	                    
	                    $(p).text(content);
	                    $(parents).css("display", "none");
	                },
	                error : function(XMLHttpRequest, textStatus, errorThrown){ 
	                	alert("오류가 발생했습니다!!!");
	                }
	            });
			});
		})
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
    margin: 0px auto;
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
    /* text-align: center; */
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
    border-radius: 7px;
    color: white;
    margin-top: 5px;
    margin-left: 632px;
  
  }
 
  
  .nav_read_btn{
  margin-left: 170px;
  }
  
  .update_btn{
   background: #4B5578;
   border-radius: 7px;
   color: white;
   margin-left: 105px;
   width: 60px;
  }
  
  .delete_btn{
   background: #4B5578;
   border-radius: 7px;
   color: white;
   width: 60px;
  }
  
  .list_btn{
   background: #4B5578;
   border-radius: 7px;
   color: white;
   margin-left: 90px;
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
  
  .writer_up{
  width: 560px;
  height: auto;
  margin-top: 10px;  
  margin-left: 15px;
  }
  
  
  .reply_up{
  width: 540px;
  height: auto;
  margin-left: 15px;
  }
  
  .label_up{
  font-size: 14px;
  }
  
  .input_up{
  width: 110px;
  margin-left: 5px;
  }
  
  .input_up2{
  width: 450px;
  }
  
  .replyWriteBtn{
   background: #4B5578;
   border-radius: 7px;
   color: white;
   width: 80px;
  }
  
  .reply_font{
  font-size: 15px;
  }
  
  .reply_font2{
  font-size: 15px;
  }
  
  .write_line{
  border: 0.5px solid;
  color: gray;
  width: 545px;
  }
  
  .replyUpdateBtn{
   background: #565d75;
   border-radius: 7px;
   color: white; 
   margin-left:190px;
  }
  
  .replyFormBtn {
   background: #565d75;
   border-radius: 7px;
   color: white;
   margin-top: 7px;
  }
  
  .replyDeleteBtn{
   background: #565d75;
   border-radius: 7px;
   color: white; 
  }
  
  .replyCancelBtn{
   background: #565d75;
   border-radius: 7px;
   color: white;
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
    <form name="readForm" role="form" method="post">
    	<input type="hidden" id="bno" name="bno" value="${read.bno}" />
    	<input type="hidden" id="page" name="page" value="${scri.page}" />
    	<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" />
    	<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" />
    	<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" /> 	
    </form>
		<table>
		<thead>
		<%-- 	<tr>
				<td>
					<label for="bno">번호</label><input type="text" id="bno" name="bno" value="${read.bno}"  />   
				</td>    
			</tr>
			 --%>
			
			<tr>
				<td>
					<label style="margin-right:5px;" for="writer_id">ID</label><input type="text" class="writer_id" id="writer_id" name="writer_id" value="${read.writer_id}" readonly="readonly"  />   
				</td>    
			</tr>
			
			<tr>
				<td>
					<label style="margin-right:5px;" for="title">제목</label><input type="text" class="title" id="title" name="title" value="${read.title}" readonly="readonly"/>   
				</td>    
			</tr>
			
			<tr>
				<td>
					<label for="content">내용</label><textarea class="content" id="content" name="content" readonly="readonly" ><c:out value="${read.content}" /></textarea>    
				</td>    
			</tr>
			
			<tr>
				<td>
					<label for="wirtedate">작성일</label>   
					<fmt:formatDate value="${read.writedate}" pattern="yyyy-MM-dd"/>
				</td>    
			</tr>
			
		</thead>
	</table>
	<div class="nav_read_btn">
					<button type="submit" class="list_btn">목록</button>	
			 <c:if test="${memberInfo.member_id == read.writer_id}"> 
					<button type="submit" class="update_btn">수정</button>
					<button type="submit" class="delete_btn">삭제</button>
			 </c:if>			
	</div>
	
	<!-- 댓글 -->
	
	<form name="replyForm" method="post">
		<input type="hidden" id="bno" name="bno" value="${read.bno}" />
		<input type="hidden" id="page" name="page" value="${scri.page }" />
		<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum }" />
		<input type="hidden" id="searchType" name="searchType" value="${scri.searchType }" />
	 	<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
	
	<div class="writer_up">
		<div style="margin-top:20px; margin-block-end:8px;" class="write_line"></div>
		<c:choose>
			<c:when test="${memberInfo.member_id != null}">		
			<label class="label_up" for="writer">댓글 작성자</label><input class="input_up" type="text" id="writer" name="writer_id" readonly="readonly" value="${memberInfo.member_id}"/>
			</c:when>
			<c:when test="${adminInfo.ad_id != null}">
			<label class="label_up" for="writer">댓글 작성자</label><input class="input_up" type="text" id="writer" name="writer_id" readonly="readonly" value="${adminInfo.ad_id}"/>
			</c:when>
		</c:choose>
		<br/>
		<c:if test="${read.writer_id == memberInfo.member_id || adminInfo.ad_id != null}">
		<label class="label_up2" for="content"></label><input class="input_up2" type="text" id="content" placeholder="댓글 추가..." name="content"/>
		<button type="submit" class="replyWriteBtn">작성하기</button>
		</c:if>
		<p class="write_line"></p>
	</div>
	</form>
	
	
	<div id="reply" class="reply_up">
		<ol style="padding-inline-start:0px;">
			<c:forEach items="${replyList}" var="replyList" varStatus="status">
			<c:choose>
				<c:when test="${replyList.writer_id == 'admin'}">
				<li style="list-style:none; border: 2px solid; padding: 8px; width:530px; margin-bottom:5px; border-color:red;"/>
				</c:when>
				<c:otherwise>
				<li style="list-style:none; border: 1px solid; padding: 8px; width:530px; margin-bottom:5px; border-color:darkblue;"/>
				</c:otherwise>
			</c:choose>
					<div class="reply_font">
					 ${replyList.writer_id} &nbsp;<fmt:formatDate value="${replyList.writedate }" pattern="yyyy-MM-dd" />
					 <span style="float:right;">
					 <c:if test="${memberInfo.member_id == replyList.writer_id || adminInfo.ad_id != null}"> 
						<button type="button" class="replyUpdateBtn" data-rno="${replyList.rno}">수정</button>
						<button type="button" class="replyDeleteBtn" data-rno="${replyList.rno}">삭제</button>		  
					</c:if>			
						<%-- <button type="submit" style="width:45px;" class="replyWriteBtn" data-rno="${replyList.rno}">댓글</button> --%>
					</span>
					</div>					
					<p style="width:530px; display:inline-block;" class="reply_font2">${replyList.content}</p>
					<div class="replyMod" style="display:none;">
						<table>
							<thead>
								<tr>
									<td>
										<label for="content">내용</label>
										<input type="text" title="내용을 입력하세요." class="input_up2" value="${replyList.content}">
										<button type="button" class="replyFormBtn" data-rno="${replyList.rno}">확인</button>
										<button type="button" class="replyCancelBtn" data-rno="${replyList.rno}">취소</button>
									</td>    
								</tr>
							</thead>
						</table>
					</div>							
			</c:forEach>
		</ol>
		
	</div>
	</div>	 
</div>
</body>
</html>