<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.boardPageBox{
  width: 720px;
  margin: auto;	
  padding-bottom: 10px;
  }
  
  .pageName{
    width: 120px;
    height: 45px;
    font-family: 'Inter';
    font-style: normal;
    font-size: 24px;
    line-height: 36px;
    color: #000000;
    text-align: center;
		    
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
    width: 100%;
    margin-left: 15px;
    margin-top: 59px;
   
  }

  .eventtitle{
    font-size: 23px;
    width: 120px;
    height: auto;
    margin-bottom: 5px;
  }
  
   .boardbutton{
  
    border-radius: 7px;
    color: white;
    background: #4B5578;
  
    font-size: 14px;
    margin-left: 10px;
  }
 

  .li_listpage{
    marign-right: 10px;
    margin-left: 20px;
    margin-right: 10px;
    float:left;
  }
  
  .search_btn{
  display: flex;
  
  }
  #searchBtn{
    background: #4B5578;
    border-radius: 7px;
    color: white;
    width: 60px;
    margin-left:5px;
  }
  
  #KeyWordInput{
  width: 450px;
  }


  </style>
</head>

<body>

	<div class="boardbox">
    <div class="eventtitle">1:1 문의</div>
    <form role="form" method="get" >
		<table>
		<thead>		
			<tr style="background-color:aliceblue;">
				<th>번호</th>
				<th>ID</th>
				<th>제목</th>	
        		<th>작성일</th>	       
			</tr>
		</thead> 
		<c:choose>
		<c:when test="${empty list}">
		<tbody>
			<tr>
				<td colspan="6">등록된 게시물이 없습니다.</td>
			</tr>
		</tbody>
		</c:when>
		<c:otherwise>
		
		<c:forEach items="${list}" var = "list" varStatus="i">	
			<tr> 
				<td>${(pageMaker.totalCount - (scri.page -1) * scri.perPageNum) - i.index}</td>
				<td>${list.writer_id}</td>
				<td>
				<a href="readView?bno=${list.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out value="${list.title}" /></a>
				</td>
       		    <td><fmt:formatDate value="${list.writedate}" pattern="yyyy-MM-dd"/></td> 
			</tr>
		</c:forEach>
   	</c:otherwise>
   	</c:choose>
	</table>
 	<div class="search_btn">
		<select name="searchType" style="height: 30px; margin-left:100px;">
			<%-- <option value="n"<c:out value="${scri.searchType == null ? 'selected' : '' }"/>>전체</option> --%>
			<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : '' }"/>>제목</option>
			<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : '' }"/>>내용</option>
			<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : '' }"/>>ID</option>
			<option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : '' }"/>>제목+내용</option>	
		</select>
		
		<input type="text" name="Keyword" id="KeyWordInput" value="${scri.keyword}" />
		
		<button id="searchBtn" type="submit">검색</button>
	    <button type="button" class="boardbutton" onclick="location.href='${contextPath}/board/writeView.do';">글쓰기</button>
		
		<script>
			$(function(){
				$('#searchBtn').click(function(){
					self.location = "boardlist" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
					
				});
			});
		</script>
	</div>	 
	<div class="pageList">
		<ul style="margin-left: 210px; ">
			    <c:if test="${pageMaker.prev}">
    				<li><a href="boardlist${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
   			    </c:if> 

			    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			    	<li class="li_listpage"><a href="boardlist${pageMaker.makeSearch(idx)}">${idx}</a></li>
			    </c:forEach>

			    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			    	<li><a href="boardlist${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
			    </c:if> 
		</ul>
	</div> 
	</form>
	</div>
</body>
</html>