<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="goods" value="${goodsMap.goodsVO}" />
<c:set var="image" value="${goodsMap.imageFileList}"/>

<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
function fn_update() {
	alert("상품 수정을 완료했습니다.");
}

function fn_delete() {
	if(confirm("정말 삭제하시겠습니까?")){
		var url = "${contextPath}/admin/goods/goodsDelete.do";
		
		$("#update_form").attr("action", url);
		
		$("#update_form").submit();
	}
}
</script>
<script>
var cnt=0;
function fn_addFile(){
	if(true){
		$("#d_file").append("<br>"+"<input type='file' id='img' name='info_img' accept='image/*' onchange='imgUpload(event)'; multiple />");
	}
}

function imgUpload(event) {
    for (var image of event.target.files) {
      var reader = new FileReader();

      reader.onload = function(event) {
        var img = document.createElement("img");
        img.setAttribute("src", event.target.result);
        img.setAttribute("width", 570);
        img.setAttribute("id", 'detail_info')
        document.querySelector("td#img_box").appendChild(img);
        $("#img_box").append("<button id='img_remove' type='button' onclick='fn_imgDelete()'>첨부파일삭제</button>");
      }

      console.log(image);
      reader.readAsDataURL(image);
      
    }
}

function fn_imgDelete() {
	$("#detail_info").remove()
	$("#img_remove").remove()
}
var cnt1=0;
function fn_addInfo(){
	if(true){
		$("#d_info").append("<br>"+"<textarea name='goods_info' id='goods_info"+cnt+"' />");
	}
	cnt1++;
}
</script>
<style>
textarea {
	width:90%;
	height:200px;
	border:1px solid #000000;
	resize:none;
}
#updateBox {
  width: 100%;
  border-top: 2px solid #000000;
  border-bottom: 1px solid #000000;
  border-left:1px solid #000000;
  border-right:1px solid #000000;
  margin: auto;
  border-collapse: collapse;
  margin-bottom: 50px;
}
</style>
</head>
<body>
<div class="AdminRightBox">
	<div class="pageName_2">상품 정보 수정</div>
	<form method="post" action="${contextPath}/admin/goods/modifyGoodsInfo.do" id="update_form" enctype="multipart/form-data">
	<table id="updateBox">
		<tbody>
			<tr>
				<td rowspan="2">
					<img alt="goods_img" src="${contextPath}/thumbnails.do?goods_no=${goods.goods_no}&file_name=${goods.file_name}">
				</td>
				<td rowspan="2">
					<table>
						<tbody>
							<tr>
								<td>상품번호&nbsp:&nbsp</td>
								<td><input type="text" name="goods_no" value="${goods.goods_no}" readonly="readonly" /></td>
							</tr>
							<tr>
								<td>등록일&nbsp:&nbsp</td>
								<td colspan="2"><input type="text" name="goods_addDate" value="${goods.goods_addDate }" readonly="readonly" /></td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tbody>
		<tbody>
			<tr style="border-bottom:1px solid;">
				<td>
					<c:forEach var="image" items="${goodsMap.imageFileList}" varStatus="cnt">
  							<img alt="small_img" style="width:40px; height:40px;" src="${contextPath}/thumbnails.do?goods_no=${goods.goods_no}&file_name=${image.file_name}">
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td>상품분류</td>
				<td>
					<select onChange="" name="goods_cate">
						<option value="${goods.goods_cate}">
						<c:set var="cate" value="${goods.goods_cate}" scope="session" />
							<c:choose>
								<c:when test="${cate=='tent'}">텐트</c:when>
								<c:when test="${cate=='table'}">테이블</c:when>
								<c:when test="${cate=='chair'}">의자</c:when>
								<c:when test="${cate=='sleepingbag'}">침낭</c:when>
								<c:when test="${cate=='cookware'}">취사도구</c:when>
								<c:when test="${cate=='tool'}">기타도구</c:when>
							</c:choose>
						</option>
						<option value="tent">텐트</option>
						<option value="table">테이블</option>
						<option value="chair">의자</option>
						<option value="sleepingbag">침낭</option>
						<option value="cookware">취사도구</option>
						<option value="tool">기타도구</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>상품이름</td>
				<td><input type="text" name="goods_name" value="${goods.goods_name}" /></td>
			</tr>
			<tr>
				<td>브랜드</td>
				<td><input type="text" name="goods_brand" value="${goods.goods_brand}" /></td>
			</tr>
			<tr>
				<td>상품정가</td>
				<td><input type="text" name="goods_price" value="${goods.goods_price}" /></td>
			</tr>
			<tr>
				<td>상품할인율</td>
				<td><input type="text" name="goods_discount" value="${goods.goods_discount}" /></td>
			</tr>
			<tr>
				<td align="left">상품 이미지 첨부</td>
				<td><input type="button" value="이미지 추가" onClick="fn_addFile()"/></td>
	   		</tr>
	   		<tr>
	   			<td></td>
	   			<td id="d_file"></td>
	   		</tr>
	   	</tbody>
	   	<tbody style="text-align:center; border-top: 1px solid;">
	   		<tr>
	   			<td colspan="2">
	   				<c:forEach var="item" items="${goodsMap.imageFileList}" varStatus="cnt">
  						<div>
  							<img alt="goods_img" src="${contextPath}/thumbnails.do?goods_no=${goods.goods_no}&file_name=${item.file_name}">
						</div>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td id="img_box" colspan="2"></td>
			</tr>
		</tbody>
	</table>
	<button type="submit" class="update_btn">수정</button><button type="button" class="delete_btn" onclick="fn_delete()">삭제</button>
	</form>
</div>
</body>
</html>