<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
                document.getElementById('post_num').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address').value = fullRoadAddr;
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
                      url:"${contextPath}/member/overlapped.do",
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
	$('#nameInput').blur(function(){
	   if($('#nameInput').val() == ''){
		    alert("이름을 입력해주세요.");
	    	    $('#nameInput').val('');	                
	    }
	})   
});
</script>

<script type="text/javascript">
//이메일 입력방식 선택
function change() {	
	   var state = document.getElementById("selectEmail").value;
	
		if(state == '1'){ //직접입력일 경우
			 $("#email2").val('');                //값 초기화
			 $("#email2").attr("disabled",false); //활성화
		}else{ //직접입력이 아닐경우
			 $("#email2").val($(this).text());      //선택값 입력
			 $("#email2").attr("disabled",true); //비활성화
		}
}
   
</script>
<script type="text/javascript">
//이메일주소 합치기
	$("#emailId").blur(function(){
		emailId();
	});
	
	$("#selectEmail").blur(function(){
		selectEmail();
	});
	function totalemail() {
		const emailId = $("#emailId").val();
		const emailText = $("#emailText").text();
		const selectEmail = $("#selectEmail").val();
		if(emailId != "" && selectEmail != "") {
			$("#totalemail").val(emailId+emailText+selectEmail);
		}
	};
</script>

  <style>
  h2{
  margin-top: 19px;
  	font: 24px "malgun gothic";
  	font-weight: bold;
  	}
  	
  .addBox{
  border: 1px solid #000000;
  width: 720px;
  height: auto;
  margin: auto;
  padding-bottom: 25px;	
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
		margin-left:65px;
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
 
        width: 123px;
        height: 28px;
		margin-left: 45px;
        margin-top: 40px;
        font-family: 'Inter';
        font-style: normal;
        font-weight: 400;
        font-size: 18px;
        line-height: 24px;
        
        color: #000000;
    }

    .idBox{

      width: 560px;
      height: 28px;
	  margin: auto;	
      margin-left: 45px;
      background: #FFFFFF;
      display: flex;
      box-sizing: border-box;
    }
    
    .idInputBox{
      width: 560px;
      height: 30px;
    }

/*-------------------pwd 입력------------------------*/
    .pwd1{
    
    width: 123px;
    height: 28px;
    margin-left: 45px;
    margin-top: 10px;
    
    
    font-family: 'Inter';
    font-style: normal;
    font-weight: 400;
    font-size: 18px;
    line-height: 24px;
    color: #000000;
    }
    
    .pwdBox1{

    width: 582px;
    height: 28px;
	margin: auto;
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
	    margin-top: 10px;
        
        font-family: 'Inter';
        font-style: normal;
        font-weight: 400;
        font-size: 18px;
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
    /*-------------------name 입력-------------------------*/
    .name_Box{
       width: 240px;
       height: 62px;
       
    }
    .name{
      width: 140px;
      height: 28px;

      float: left;
      font-family: 'Inter';
      font-style: normal;
      font-weight: 400;
      font-size: 18px;
		margin-right:  230px;
      
      color: #000000;
    }

    .nameBox{

      width: 280px;
      height: 29px;
      background: #FFFFFF;
     /* border: 0.5px solid #000000;*/
      box-sizing: border-box;
    }
    .nameBox1{
      width: 230px;
      height: 29px;
    }
    .nameInput{

      width: 340px;
      height: 21px;

      
      font-family: 'Inter';
      font-style: normal;
      font-weight: 400;
      font-size: 13px;
      line-height: 18px;

      color: #CECECE;
    }
    /*-----------------gender 입력-----------*/
    .gender_Box{
       width: 160px;
       height: 62px;
         margin: 0px;
  		margin-letf: 40px;
    
    }
    .name_gender{
    display: flex;
    width: 588px;
    height: 63px;
    margin-left: 45px;
    margin-top: 10px;    
    }
    
    
    .gender{

    width: 140px;
    height: 29px;
    font-family: 'Inter';
    font-style: normal;
    font-weight: 400;
    font-size: 18px;
    color: #000000;

    }

    .genderSelect{
      height: 29px;
      width: 150px;
      font-size: 17px;
      text-align: center;
      
    }

    /*-------------------주민등록번호 입력-----------*/
    .resistrationNum_1{
     
        width: 588px;
    	height: 63px;
    	margin-left: 45px;
		margin-top: 10px;
    }
    .resistrationNum{
    width: 140px;
    height: 28px;

    
    font-family: 'Inter';
    font-style: normal;
    font-weight: 400;
    font-size: 20px;
    line-height: 24px;

    color: #000000;    
    }

    .firstBox{

    width: 231px;
    height: 29px;
	 margin: auto;
     
    
    background: #FFFFFF;
    /*border: 0.5px solid #000000;*/
    box-sizing: border-box;
    }
    
    .inputResistrationNum1{
    width: 250px;
    height: 29px;
    }

    .text{
   
    width: 12px;
    height: 20px;

    margin-top:30px;
    font-family: 'Inter';
    font-style: normal;
    font-weight: 400;
    font-size: 30px;
    line-height: 10px;
    
    color: #000000;
    }
  .inputResistrationNum2{
    width: 250px;
    height: 29px;
  }

    .secondBox{
 
    width: 231px;
    height: 29px;

    
    background: #FFFFFF;
    /*border: 0.5px solid #000000;*/
    box-sizing: border-box;
      
    }

/*---------------------email-----------*/
.email_main{
        width: 588px;
    	height: 63px;
    	margin-left: 45px;
		
}
    .email{
  
      width: 140px;
      height: 28px;
      font-family: 'Inter';
      font-style: normal;
      font-weight: 400;
      font-size: 18px;
      color: #000000;
    }

    .emailBox1{
    width: 172px;
    height: 28px;
    background: #FFFFFF;
    /*border: 0.5px solid #000000;*/
    box-sizing: border-box;
    }
    .emailId{
    width: 172px;
    height: 29px;
    }
    .emailText{
    width: 140px;
    height: 28px;
    
    font-family: 'Inter';
    font-style: normal;
    font-weight: 400;
    font-size: 25px;
    line-height: 30px;

    color: #000000;
    }
    .emailBox2{
      width: 173px;
      height: 29px;
      
      background: #FFFFFF;
      /*border: 0.5px solid #000000;*/
      box-sizing: border-box;
    }

    #email2{
      width: 173px;
      height: 29px;
      top:3px;
      font-size: 20px;
    }
    .emailBox3{
    width: 173px;
    height: 31px;
	margin: 6px;
    
    background: #FFFFFF;
    /*border: 0.5px solid #000000;*/
    box-sizing: border-box;
    }
    .emailSelect{
    width: 168px;
    height: 31px;
    font-size: 20px;
    }

    /*----------------전화번호------------------*/
    .phoneMain{
    	width: 588px;
    	height: 63px;
    	margin-left: 45px;
	
    }
    
    .phoneNum{
    width: 85px;
    height: 28px;  
    font-family: 'Inter';
    font-style: normal;
    font-weight: 400;
    font-size: 18px;
    line-height: 24px;
    
    color: #000000;
    }

    .phonebox1{
      width: 600px;
      height: 28px;
      background: #FFFFFF;
      /*border: 0.5px solid #000000;*/
      box-sizing: border-box;
    }
    .firstNum{
      height: 29px;
      width: 165px;  
    }
    .secondNum{
      height: 29px;
      width: 165px; 
    }
    .thirdNum{
      height: 29px;
      width: 165px; 
    }
    .text2{
    font-size: 30px;
    line-height: 10px;

    color: #000000;
    }
        .text3{
    
    font-family: 'Inter';
    font-style: normal;
    font-weight: 400;
    font-size: 30px;
    
    line-height: 20px;
    
    color: #000000;
    }

    /*----------------버튼 입력----------*/
    .button{
	  margin-left: 260px;
		margin-top: 50px;
      width: 500px;

    }
    .myButton {
    width: 120px;
    height: 40px;
    background: #4B5578;
    border-radius: 7px;
    margin-left: 22px;
    color: white;
}
.myButton:hover {
	background:linear-gradient(to bottom, #4b5578 5%, #6f88b3 100%);
	background-color:#4b5578;
}
.myButton:active {
	position:relative;
	top:1px;
}

/*--------------------------약관 동의 -------------------*/
 .agree{
 /* border: 1px solid #000000;  */
 width: 582px;
 margin-left: 45px;
 margin-top: 15px;
 }


/*  약관보기  */
 .btn.btn-primary{
 color: #000000;
 background: #ffffff;
 border: 0px;
 margin-left:230px;
 padding-top:0px;
 }

 .card.card-body{
 padding-top: 18px;
 }


.searchTerm{
 height:36px;
}
.headtext{
	margin-top: 15px;	
}

.idbutton{
	
    width: 80px;
    height: 30px;
    background: #4B5578;
    border-radius: 7px;
    margin-left: 25px;
    color: white;
}


  </style>

<script>
 function selectAll(selectAll){
	 const checkboxes = document.getElementsByName('check');
	 
	 checkboxes.forEach((checkbox) => {
		 checkbox.checked = selectAll.checked;
	 })
 }
</script>

</head>
<body>
	<div class="addBox">
  <div class="userAdd">회원가입
  <p class="line"></p>
  </div>

 <form method="post" action="${contextPath }/member/addMember.do" style="margin-left:20px;">
  <div class="id_box">
  <div class="id">아이디</div>
  <div class="idBox">
   <input type="text" class="idInputBox" id="idInput" name="member_id" placeholder="아이디를 입력하세요">
   <input type="button" class="idbutton" id="btnOverlapped"  value="중복체크" onClick="fn_overlapped()" />
  </div>
  </div>
  

  <div class="pwd1">비밀번호</div>
  <div class="pwdBox1">
    <input type="password" class="idInputBox" id="pwdInput" name="member_pw" placeholder="영소문자, 대문자, 숫자, 특수기호를 사용하여 8자리 이상 입력하세요">
  </div>
  <div class="pwd2">비밀번호 확인</div>
  <div class="pwdBox2">
    <input type="password" class="idInputBox" id="pwdInput2" placeholder="위에서 입력한 비밀변호와 동일하게 입력해주세요">
  </div>

  <div class="name_gender">
  
  <span class="name_Box">
  <span class="name">이름<br>
  <span class="nameBox">
    <input type="text" class="nameBox1" id="nameInput" name="member_name" placeholder="이름을 입력해주세요">
  </span>
  </span>
  </span>
  <span class="gender_Box">
  <span class="gender">성별<br>
  <select name="gender" class="genderSelect">
    <option value="m">남자</option>
    <option value="f">여자</option>
  </select>
  </span>
  </span>


<input type="date" name="birth_day" style="height:35px; margin-top:24px; width:160px;">

  </div>

    
    <div class="email_main">
  <div class="email">이메일</div>
  <span class="emailBox1">
      <input type="text" class="emailId" id="emailId" name="email1" />
  </span>
  <span class="emailText" id="emailText">@</span>
  <span class="emailBox2">
    <input type="text" class="emailInput" id="email2" name="email2" disabled value="">
  </span>
  
  
  <span class="emailBox3" >
   <select class="emailSelect" onchange="change()" name="email2"  id="selectEmail">
      <option value="1">직접입력</option>
	 <option value="naver.com" selected>naver.com</option>
	 <option value="hanmail.net">hanmail.net</option>
	 <option value="hotmail.com">hotmail.com</option>
	 <option value="nate.com">nate.com</option>
	 <option value="freechal.com">freechal.com</option>
	 <option value="lycos.co.kr">lycos.co.kr</option>
	 <option value="korea.com">korea.com</option>
	 <option value="gmail.com">gmail.com</option>   
   </select>
  </span>
  <input type="hidden" id="totalemail" name="totalemail" value="">
  
  </div>

   <div class="phoneMain">
  <div class="phoneNum">전화번호</div>
  <div class="phonebox1">
    <span><input type="text" class="firstNum"  name="phone1"></span><span class="text2"> - </span>
    <span><input type="text" class="secondNum" name="phone2"></span><span class="text3"> - </span>
    <span><input type="text" class="thirdNum" name="phone3"></span>
  </div>
	</div>
	<div class="dot_line">
		
			<div style="margin-left: 45px;">
				<input type="text" style="margin-top:8px;" id="post_num" name="post_num" size=7 value="${member_info.post_num }"  placeholder="주소"> <a href="javascript:execDaumPostcode()" style="text-decoration: none;">우편번호검색</a>
				<p style="margin-top:12px; margin-bottom:12px;">  
				<input type="text" id="address"  name="address" size="50" value="${member_info.address }" placeholder="도로명 주소"><br><br>
				<!-- <span id="guide" style="color:#999"></span> -->
				</p>
		    </div>
	</div>
    
    <div class="agree">
		<div style="font-weight: bold; font-size: 20px;">약관 동의</div>
    		<div class="form-check"style="font-weight: bold; margin-top: 13px;">
		  		<input class="form-check-input" type="checkbox" value="" onclick='selectAll(this)' id="allChk" name="check" />
		  		<label class="form-check-label" for="allChk" >전체 동의</label>
			</div>	
	    <div class="form-check" style="margin-top: 5px;">
		  <input class="form-check-input" type="checkbox" value="" id="firstChk" name="check" >
		  <label class="form-check-label" for="firstChk">
		    개인정보 수집 이용동의 (필수)
		  </label>
		  <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample" style="position: relative; padding: 0px; z-index:1;">
    		(약관 보기)
  			</a>
  			<div class="collapse" id="collapseExample">
			  <div class="card card-body">
			   개인정보 수집 이용동의 약관입니다.
			  </div>
			</div>
		</div>
		<div class="form-check" style="margin-top: 5px;">
		  <input class="form-check-input" type="checkbox" value="" id="secondChk" name="check" >
		  <label class="form-check-label" for="secondChk">
		    캠핑갈까 이용약관(필수)
		  </label>
		  <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample1" role="button"aria-expanded="false" aria-controls="collapseExample1" style="position: relative; margin-left: 262px; z-index:1;">
		   (약관 보기)
		  </a>
		  <div class="collapse" id="collapseExample1">
			  <div class="card card-body">이용약관 2에 대한 내용입니다</div>
		  </div>
		</div> 
		<div class="form-check" >
		  <input class="form-check-input" type="checkbox" value="Y" id="thirdChk" name="marketing">
		  <label class="form-check-label" for="thirdChk">
		    마케팅 활용 및 광고성 정보 수신 동의(선택)
		  </label>
		  <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample2" role="button"aria-expanded="false" aria-controls="collapseExample2" style="position: relative; margin-left: 122px; z-index:1;">
    		(약관 보기)
  			</a>
  			<div class="collapse" id="collapseExample2">
		  <div class="card card-body">
		     이용약관 3에 대한 내용입니다.
		  </div>
		</div>
		</div>       
    </div>
    
    
    <div class="button">
    <input class="myButton" type="submit" value="회원 가입" />
    </div>
    </div>
</form>

 
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>