<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<hed>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>


<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('company_postNo').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('company_address').value = fullRoadAddr;
            }
        }).open();
    }

    /* 아이디 중복체크 */
    function fn_overlapped(){
        var _id=$("#idInput").val();
        if(_id==''){
       	 alert("ID를 입력하세요");
       	 return;
        }
        $.ajax({
           type:"post",
           async:false,  
           url:"${contextPath}/member/overlapped.do",
           dataType:"text",
           data: {id:_id},
           success:function (data,textStatus){
              if(data=='false'){
            	  $.ajax({
                      type:"post",
                      async:false,  
                      url:"${contextPath}/business/overlapped.do",
                      dataType:"text",
                      data: {id:_id},
                      success:function (data,textStatus){
                    	  if(data=='false'){
            	  			alert("사용할 수 있는 ID입니다.");
                  			$('#idInput').val(_id);
                    	  }else{
                    		  alert("사용할 수 없는 ID입니다.");
                    	  }
                      },
                      error:function(data,textStatus){
                          alert("에러가 발생했습니다.");ㅣ
                       },
                       complete:function(data,textStatus){
                          //alert("작업을완료 했습니다");
                       }
                    });  //end ajax	 
                      
              }else{
            	  alert("사용할 수 없는 ID입니다.");
              }
           },
           error:function(data,textStatus){
              alert("에러가 발생했습니다.");ㅣ
           },
           complete:function(data,textStatus){
              //alert("작업을완료 했습니다");
           }
        });  //end ajax	 
     }	
</script>
<script>
$(function(){

//비밀번호 확인
	$('#pwdInput2').blur(function(){
	   if($('#pwdInput').val() != $('#pwdInput2').val()){
	    	if($('#pwdInput2').val()!=''){
		    alert("비밀번호가 일치하지 않습니다.");
	    	    $('#pwdInput2').val('');
	          $('#pwdInput2').focus();
	       }
	    }
	})  	   
});
</script>

<script>
$(function(){

//이름 확인
	$('#businessName').blur(function(){
	   if($('#businessName').val() == ''){
		    alert("이름을 입력해주세요.");
	    	    $('#businessName').val('');	                
	    }
	})   
});
</script>

<script>
$(function(){

//전화번호 확인
	$('#businessPhone').blur(function(){
	   if($('#businessPhone').val() == ''){
		    alert("전화번호를 입력해주세요.");
	    	    $('#businessPhone').val('');	                
	    }
	})   
});
</script>

<script>
//유효성 검사 미완성
var userInfoCheck = function(){
	if($('#businessEmail').val() == ''){
		alert('이메일을 입력하세요');
		return;
	}else if($('#businessName').val() == ''){
		alert('이름을 입력하세요');
		return;
	}else if($('#businessphone').val() == ''){
		alert('전화번호를 입력하세요');
		return;
	}else{
		alert('회원가입 완료');
	}		
};

$('#userInfoCheck').click(function(){
	userInfoCheck();
});

</script>
  <style>
  
  .addBox{
  
  width: 720px;
  height: auto;
  margin: auto;	
  }
    
  .addBox2 { 
    height: 300px;
    width: 720px;
    
   /* border: 1px solid; */
  }
  
  .userAdd{

		width: 120px;
		height: 45px;
		font-family: 'Inter';
		font-style: normal;
		font-weight: 400;
		font-size: 30px;
		line-height: 36px;		
		color: #000000;
		margin-left:80px;
		margin-top:50px;
		
		    
  }
    .line{
		margin-top: 0px;

      width: 120px;
      height: 0px;
      left: 0px;

      border: 1px solid;
  }

    .text1 {

      width: 123px;
      height:28px;
      left: 409px;
      top: 208px;

      font-family: 'Inter';
      font-style: normal;
      font-weight: 400;
      font-size: 20px;
      line-height: 24px;
      color: #000000;
      
    }

/*-------------------id 입력------------------------*/
	.id_box{
	width: 582px;
	height: auto;
	}
	
    .id{
 
        width: 110px;
        height: 30px;
		    margin-left: 80px;
        margin-top: 5px;
        font-family: 'Inter';
        font-style: normal;
        font-weight: 400;
        font-size: 16px;
        line-height: 24px;
        
        color: #000000;
    }

    .idBox{

      width: 582px;
      height: 28px;
	    margin: auto;
      margin-left: 80px;
      background: #FFFFFF;
      /*border: 0.5px solid #000000;*/
      box-sizing: border-box;
    }
    .numberbox { /*  사업자 등록번호 */
      width: 460px;
      height: 28px;
    }
    .idInputBox0 { /* 아이디 칸 */
      width: 460px;
      height: 28px;
      margin-left: 35px;
      
    }
    
    .idInputBox{
      width: 545px;
      height: 28px;
      margin-left: 35px;
    }

/*-------------------pwd 입력------------------------*/
    .pwd1{
    
    width: 123px;
    height: 28px;
    margin-left: 45px;
    margin-top: 18px;
    
    
    font-family: 'Inter';
    font-style: normal;
    font-weight: 400;
    font-size: 20px;
    line-height: 24px;
    color: #000000;
    }
    
    .pwdBox1{
    
    width: 600px;
    height: 28px;
	  margin: 12px auto;
    margin-left: 45px;
    
    background: #FFFFFF;
    /*border: 0.5px solid #000000;*/
    box-sizing: border-box;
    }

    .pwdInput{
    position: absolute;
    width: 400px;
    height: 21px;
    left: 20px;
    top: 5px;
    
    font-family: 'Inter';
    font-style: normal;
    font-weight: 400;
    font-size: 13px;
    line-height: 18px;
    
    color: #CECECE;
      
    }
    
    .pwdInput2{
    position: absolute;
    width: 400px;
    height: 21px;
    left: 20px;
    top: 5px;
    
    font-family: 'Inter';
    font-style: normal;
    font-weight: 400;
    font-size: 13px;
    line-height: 18px;
    
    color: #CECECE;
      
    }
    

    .pwd2{

        width: 140px;
        height: 28px;
	    margin-left: 45px;
	    margin-top: 18px;
        
        font-family: 'Inter';
        font-style: normal;
        font-weight: 400;
        font-size: 20px;
        line-height: 24px;
        
        color: #000000;
    }

    .pwdBox2{
      width: 582px;
      height: 28px;
	  margin: auto;
      margin-left: 45px;
      
      background: #FFFFFF;
      /*border: 0.5px solid #000000;*/
      box-sizing: border-box;
    }
  
  
    

/*---------------------email-----------*/

    .emailInputBox {
      
      width: 250px;
      height: 28px;
      margin-left: 35px;
    }

    .emailInputBox2 {
      float: right;
      margin-right: 6.5px;
      width: 267px;
      height: 34px;
    }

    .checkInputBox{
      width: 250px;
      height: 28px;
      margin-left: 35px;
    }
    
    .companyaddress{
    
     height: 28px;
     margin-left: 40px;
     display: flex;
    }

    /*----------------버튼 입력----------*/
  .numberbox-button0 { /* 아이디 중복체크 */
    width: 80px;
    height: 34px;
    background: #FFFFFF;
    border-radius: 7px;
    color: black;    
    
  }

    
  .numberbox-button {
    width: 80px;
    height: 34px;
    background: #4B5578;
    border-radius: 7px;
    color: white;    
  }

  .numberbox-button1 {
    width: 100px;
    height: 30px;
    background: #4B5578;
    border-radius: 7px;
    color: white;
    margin-top: 50px;
    margin-left: 530px;
  }

.addtext { /* 약관 동의 */
 margin-top: 15px;
 margin-left: 80px;
 font-size: 15px;
}
.bigokbox {
 margin-left: 80px;
 width: 550px;
 height: 150px;
 border: 1px solid black;
 overflow: auto;
}
.sbox {
  
  height: 300px;
}

.okbox { /* 서비스 약관 동의 전체선택 */
    display: flex;
    margin-top: 5px;
    margin-left: 275px;
}

.join-button { /* 회원가입 버튼 */
    width: 120px;
    height: 40px;
    background: #4B5578;
    border-radius: 7px;
    color: white;
    margin-top: 30px;
    margin-left: 300px;
	
}

.company{
  margin-left: 35px;
  width: 150px;
  height:30px;
}

.companybutton{
	margin-left: 5px;
    width: 80px;
    height: 33px;
    background: #4B5578;
    border-radius: 7px;
    color: white;
}

.companyaddress1{
     width: 350px;
     height: 28px;
     margin-left: 40px;
     margin-top: 6px;
}
   

.companyaddress2{
      width: 350px;
    height: 28px;
    margin-left: 40px;
    margin-top: 9px;
}

#btnOverlapped{
	width: 80px;
    height: 34px;
    background: #4B5578;
    border-radius: 7px;
    color: white;
}

.cpAddrBox{
    font-size: 16px;
    margin-left: 40px;
}

.company_postbox{
	 
    height: 20px;
    margin-left: 40px;
}

.company_address2{
	
	height: 24px;
	margin-left: 40px;
}
    
 

  </style>

</head>
<body>

	<div class="addBox">
  <div class="userAdd">회원가입
  <p class="line"></p>
  </div>

  <form class="form" method="post" action="${contextPath}/business/addBusiness.do">
  <div class="id_box">
  <div class="id"><b>사업자 인증</b></div>
  <div class="idBox">
   <input type="text" onKeyup="addHypen(this);" class="numberbox" name="business_no" placeholder="사업자 등록번호 -없이 숫자만 입력">
    <input type="button" class="numberbox-button" onClick="fn_businessChk()" value="확인"/>
  </div>
  </div>

  <div class="pwdBox1">
    <input type="text" class="idInputBox0" id="idInput" name="business_id" placeholder="아이디" />
     <input type="button"  id="btnOverlapped" value="중복체크" onClick="fn_overlapped()" />
    </div>
  <div class="pwdBox1">
    <input type="password" class="idInputBox" id="pwdInput" name="business_pw" placeholder="비밀번호    
                      소문자,대문자,숫자,특수기호 사용하여 8자리 이상">
    </div>
  
  <div class="pwdBox2">
    <input type="password" class="idInputBox" id="pwdInput2" name="business_pw2" placeholder="비밀번호 확인">
  </div>

  <div class="pwdBox1">
    <input type="text" class="idInputBox" id="businessName" name="business_name" placeholder="이름">
  </div>

  <div class="pwdBox1">
    <input type="text" onKeyup="addHypen(this);" class="idInputBox" id="businessPhone" name="phone" placeholder="전화번호 -없이 입력">
  </div>

  <div class="pwdBox1">
    <input type="text" class="emailInputBox" id="businessEmail" name="email1" placeholder="이메일"> @
    <div class="emailInputBox2">
    <select class="emailInputBox2" id="businessEmail2" name="email2">
      <option value="">선택</option>
      <option value="naver.com">naver.com</option>
      <option value="google.com">google.com</option>
	  <option value="gmail.com">gmail.com</option>
	  <option value="daum.net">daum.net</option>
	  <option value="nate.com">nate.com</option>
	  <option value="selfInput">직접 입력</option>
    </select>
  </div>
  </div>
  
  <div class="pwdBox1">
  	<input type="text" class="idInputBox" id="pwdInput" name="company_name" placeholder="회사명">
  </div>
  
   <div class="companyaddress">
			<div>
				<input type="text" class="company_postbox" id="company_postNo" name="company_postNo" size=7 value="${company_info.company_postNo }" placeholder="주소"> <a href="javascript:execDaumPostcode()">우편번호검색</a>
				<p style="margin-top:7px; margin-bottom:7px;"> 
				<input type="text" class="company_address2" id="company_address" name="company_address" size="50" value="${company_info.company_address }" placeholder="회사주소">
				<!-- <span id="guide" style="color:#999"></span> -->
				</p>
		</div>
	</div>
    
    <button type="button" class="numberbox-button1">증빙서류</button>
    
  <div class="addbox2">
    <div class="addtext"><b>약관 동의</b></div>
     <div class="bigokbox">
       <div class="sbox">(text 내용-----------------)</div>
   
      
  </div>
     </div>
         <div class="okbox">
    <input type="checkbox" class="okbox" name="okbox2" value="전체선택">전체선택
    </div>

    <input type="submit" class="join-button" id="userInfoCheck" value="회원가입" />
  

  
  </form>
 </div>
  
</body>
</html>