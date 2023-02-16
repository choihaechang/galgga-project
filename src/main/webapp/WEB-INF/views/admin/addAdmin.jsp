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
<script src="//code.jquery.com/jquery.min.js"> 
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
           url:"${contextPath}/admin/overlapped.do",
           dataType:"text",
           data: {id:_id},
           success:function (data,textStatus){
              if(data=='false'){
            	  $.ajax({
                      type:"post",
                      async:false,  
                      url:"${contextPath}/admin/overlapped.do",
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
                          alert("에러가 발생했습니다.");
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
              alert("에러가 발생했습니다.");
           },
           complete:function(data,textStatus){
              //alert("작업을완료 했습니다");
           }
        });  //end ajax	 
     }	
</script>


  <style>
  h2{margin-top: 19px;
  	font: 24px "malgun gothic";
  	font-weight: bold;}
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
.id{
		margin-left: 45px;
        margin-top: 40px;
        font-family: 'Inter';
        font-style: normal;
        font-weight: 400;
        font-size: 20px;
        line-height: 24px;
        
        color: #000000;
    }

    .idBox{
	  margin: auto;
      margin-left: 45px;
      background: #FFFFFF;
      /*border: 0.5px solid #000000;*/
      box-sizing: border-box;
    }
    
    .idInputBox{
      width: 500px;
      height: 28px;
    }

/*-------------------pwd 입력------------------------*/
    .pwd1{
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

    width: 500px;
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

    .pwd2{
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
      width: 500px;
      height: 28px;
	  margin: auto;
      margin-left: 45px;
      
      background: #FFFFFF;
      /*border: 0.5px solid #000000;*/
      box-sizing: border-box;
    }
    /*-------------------name 입력-------------------------*/
    .name_Box{
       width: 288px;
       height: 62px;
       
    }
    .name{
      width: 140px;
      height: 28px;

      float: left;
      font-family: 'Inter';
      font-style: normal;
      font-weight: 400;
      font-size: 20px;
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
      width: 270px;
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
       width: 270px;
       height: 62px;
         margin: 0px;
  		margin-letf: 40px;
    
    }
    .name_gender{
    display: flex;
    width: 588px;
    height: 63px;
    margin-left: 45px;
    margin-top: 18px;    
    }


    /*-------------------주민등록번호 입력-----------*/
    .resistrationNum_1{
     
        width: 588px;
    	height: 63px;
    	margin-left: 45px;
		margin-top: 18px;
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
		margin-top: 18px;
}
    .email{
  
      width: 140px;
      height: 28px;
      font-family: 'Inter';
      font-style: normal;
      font-weight: 400;
      font-size: 20px;
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

    .emailInput{
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
    width: 173px;
    height: 30px;
    font-size: 20px;
    }

    /*----------------전화번호------------------*/
    .phoneMain{
    	width: 588px;
    	height: 63px;
    	margin-left: 45px;
		margin-top: 18px;
    }
    
    .phoneNum{
    width: 85px;
    height: 28px;  
    font-family: 'Inter';
    font-style: normal;
    font-weight: 400;
    font-size: 20px;
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
      width: 170px;  
    }
    .secondNum{
      height: 29px;
      width: 170px; 
    }
    .thirdNum{
      height: 29px;
      width: 170px; 
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
    color: white;
    margin-left:40px;
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

#btnOverlapped{
    width: 80px;
    height: 30px;
    background: #4B5578;
    border-radius: 7px;
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

 <form method="post" action="${contextPath }/admin/addAdmin.do">
  <div class="id_box">
  <div class="id">아이디</div>
  <div class="idBox">
   <input type="text" class="idInputBox" id="idInput" name="Ad_id" placeholder="아이디를 입력하세요">
   <input type="button"  id="btnOverlapped" value="중복체크" onClick="fn_overlapped()"/>
  </div>
  </div>

  <div class="pwd1">비밀번호</div>
  <div class="pwdBox1">
    <input type="password" class="idInputBox" id="pwdInput" name="Admin_pw" placeholder="영소문자, 대문자, 숫자, 특수기호를 사용하여 8자리 이상 입력하세요">
  </div>
  <div class="pwd2">비밀번호 확인</div>
  <div class="pwdBox2">
    <input type="password" class="idInputBox" id="pwdInput" placeholder="위에서 입력한 비밀변호와 동일하게 입력해주세요">
  </div>

  <div class="name_gender">
  
  <span class="name_Box">
  <span class="name">이름<br>
  <span class="nameBox">
    <input type="text" class="nameBox1" id="nameInput" name="Admin_name" placeholder="이름을 입력해주세요">
  </span>
  </span>
  </span>

  </div>

    
    <div class="email_main">
  <div class="email">이메일</div>
  <span class="emailBox1">
      <input type="text" class="emailId" name="email" />
  </span>
  <span class="emailText">@</span>
  <span class="emailBox2">
    <input type="text" class="emailInput" id="emailInput" name="email" placeholder="직접입력">
  </span>
  <span class="emailBox3">
   <select class="emailSelect" onChange="" title="직접입력" name="email">
     <option value="naver.com">naver.com</option>
     <option value="gmail.com">gmail.com</option>
     <option value="daum.net">daum.net</option>
     <option value="nate.com">nate.com</option>
     <option value="hanmail.net">hanmail.net</option>
     <option value="selfInput">직접 입력</option>
     
     <!-- 이메일 더 찾아서 넣어야댐-->
   </select>
  </span>
  </div>

   <div class="phoneMain">
  <div class="phoneNum">전화번호</div>
  <div class="phonebox1">
    <span><input type="text" class="firstNum" name="phone1"></span><span class="text2"> - </span>
    <span><input type="text" class="secondNum" name="phone2"></span><span class="text3"> - </span>
    <span><input type="text" class="thirdNum" name="phone3"></span>
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