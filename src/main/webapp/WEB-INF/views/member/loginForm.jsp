<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
 <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
 <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- 로그인 alert -->
<c:if test='${not empty message }'>
<script>
window.onload=function()
{
  result();
}
function result(){
	alert('${message}');
}
</script>
</c:if>
<!-- 로그인 탭 -->
<script>
$(document).ready(function() {

	//When page loads...
	$(".tab_content").hide(); //Hide all content
	$("ul.tabnav li:first").addClass("active").show(); //Activate first tab
	$(".tab_content:first").show(); //Show first tab content

	//On Click Event 
	$("ul.tabnav li").click(function() {

		$("ul.tabnav li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".tab_content").hide(); //Hide all tab content

		var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
		$(activeTab).fadeIn(); //Fade in the active ID content
		return false;
	});

});

</script>

<script type='text/javascript'>
window.Kakao.init("3e6e1bed577493233d6c4a2e9283d39a");
function kakaoLogin() {
	window.Kakao.Auth.login({
		scope:'profile_nickname, profile_image, account_email, gender',
	 	success: function(authObj) {
			console.log(authObj);
			window.Kakao.API.request({
				url: '/v2/user/me',
				success: res =>{
					const kakao_account = res.kakao_account;
					console.log(kakao_account);
				}
			});
		}	
	});
}


window.Kakao.init("3e6e1bed577493233d6c4a2e9283d39a");
function kakaoLogin() {
	window.Kakao.Auth.login({
		scope:'profile_nickname, profile_image, account_email, gender',
	 	success: function(authObj) {
			console.log(authObj);
			window.Kakao.API.request({
				url: '/v2/user/me',
				success: res =>{
					const kakao_account = res.kakao_account;
					console.log(kakao_account); 
				}
			});
		}	
	});
}


var naver_id_login = new naver_id_login("3oDDicugqKAvJSXGjfFP", "http://localhost:8080/galgga/member/loginForm.do");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("white", 2,40);
	naver_id_login.setDomain("http://localhost:8080");
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();

	
	 var naver_id_login = new naver_id_login("3oDDicugqKAvJSXGjfFP", "http://localhost:8080/galgga/member/loginForm.do");
	  // 접근 토큰 값 출력
	  alert(naver_id_login.oauthParams.access_token);
	  // 네이버 사용자 프로필 조회
	  naver_id_login.get_naver_userprofile("naverSignInCallback()");
	  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	  function naverSignInCallback() {
	    alert(naver_id_login.getProfileData('email'));
	    alert(naver_id_login.getProfileData('nickname'));
	    alert(naver_id_login.getProfileData('age'));
	  }

</script>
<style>

    /* 로그인창 */
    .login { 
		margin: 25px auto;
    	padding: 0px;
		width:300px;
		height:auto;
	}
	.btn_login { /*로그인버튼*/
		width:300px;
		height:40px;
		background:#3A8AFD;
		color:#FFFFFF;
		border-radius:5px;
		border:1px solid #3A8AFD;
	}
	.btn_login:hover {
		text-decoration: none;
		background-color: #5999F5;
		}
	h1 {
		text-align:center;
	}
	.loginbox {/*아이디, 비밀번호 입력창*/
		width:292px;
		height:40px;
	}
	.btn_naver {/*네이버 로그인 버튼*/
		width:140px;
		height:40px;
	}
	.btn_kakao {/*카카오 로그인 버튼*/
		width:140px;
		height:40px;
		float:right;		
	}
	.autoLogin {/*자동로그인 체크박스*/
		width:15px;
		height:15px;
	}

	.findbox {/*회원정보찾기버튼*/
		margin-left:27px;
	}
	.addbox {/*회원가입버튼*/
		float:right;
		margin-right:43px;
	}
.section {
	width:720px;
	margin: 70px auto;
    padding: 0px;
}
/* 탭 기능 */
.login_tabs > ul.tabnav{
	padding:0px;
	text-align:center;
	margin-bottom:20px;
	padding-inline-start: 0px;
}
ul.tabnav li {
	display:table-cell;
	border:1px solid #CECECE;
	width:98px;
	padding:5px;
	float:none;
	
}

ul.tabnav li.active {
  background:#CECECE;
  opacity: 1;
}


</style>
</head>
<body>

<div class="section">
<div class="login">
	<h1>로그인</h1>
	<div class="login_tabs">
		<ul class="tabnav">
			<li><a href="#member_tab">일반회원</a></li>
			<li><a href="#business_tab">사업자</a></li>
			<li><a href="#admin_tab">관리자</a></li>
		</ul>
	</div>
	<div class="tab_content" id="member_tab">
		<form method="post" action="${contextPath }/member/login.do">
    		<input type="text" name="member_id" id="member_id" placeholder="아이디" class="loginbox" />
        	<input type="password" name="member_pw" id="member_pwd" placeholder="비밀번호" class="loginbox" style="margin-top:10px" />
        	<br><br>
        	<input type="checkbox" name="autoLogin" class="autoLogin" />자동로그인 
        	<br><br>
        	<button type="submit" class="btn_login" id="id,pwdChk">로그인</button>
    	</form>
    </div>
    
    <div class="tab_content" id="business_tab"> 
    	<form method="post" action="${contextPath }/business/login.do">
    		<input type="text" name="business_id" id="business_id" placeholder="아이디" class="loginbox" />
        	<input type="password" name="business_pw" id="business_pw" placeholder="비밀번호" class="loginbox" style="margin-top:10px" />
        	<br><br>
        	<input type="checkbox" name="autoLogin" class="autoLogin" />자동로그인 
        	<br><br>
        	<button type="submit" class="btn_login" id="id,pwdChk">로그인</button>
    	</form>
    </div>
    
    <div class="tab_content" id="admin_tab">
    	<form method="post" action="${contextPath }/admin/login.do">
    		<input type="text" name="Ad_id" id="admin_id" placeholder="아이디" class="loginbox" />
        	<input type="password" name="Admin_pw" id="admin_pw" placeholder="비밀번호" class="loginbox" style="margin-top:10px" />
        	<br><br>
        	<input type="checkbox" name="autoLogin" class="autoLogin" />자동로그인 
        	<br><br>
        	<button type="submit" class="btn_login" id="id,pwdChk">로그인</button>
    	</form>
    </div>
    <br><br>
    
    
    <%
    String clientId = "3oDDicugqKAvJSXGjfFP";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8080/galgga/member/loginForm.do", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %>
    
    
   <a href="<%%>"><img src="${contextPath}/resources/image/btn_NaverLogin.png" class="btn_naver"/></a>
    <a href="javascript:kakaoLogin()"><img src="${contextPath}/resources/image/btn_KakaoLogin.png" class="btn_kakao"/></a>
	<br><br>
	<div class="loginbox2">
		<a href="${contextPath }/member/info.do" class="findbox">회원정보찾기</a><a href="${contextPath }/member/selectAdd.do"class="addbox">회원가입</a>
	</div>
    </div>
</div>
    

</div>

</body>
</html>