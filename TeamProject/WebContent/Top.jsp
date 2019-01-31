<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	/* <jsp:include page="../Top.jsp" flush="false"/>
		동적 페이지 폴더 변경 */
	String servlet = request.getServletPath();
	// 이미지 동적경로 지정시
	String path = "../";
	// 컨트롤러 동적경로 지정시
	String path1 = ".";
	// 페이지 동적경로 지정시
	String path2 = "../user/";
	if(servlet.equals("/home.jsp") || servlet.equals("/Top.jsp")){
		path="";
		path1="";
		path2 = "user/";
	}
	request.setAttribute("path", path);
	request.setAttribute("path1", path1);
	request.setAttribute("path2", path2);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<!-- 복사 1 font -->
<link href='https://cdn.rawgit.com/openhiun/hangul/14c0f6faa2941116bb53001d6a7dcd5e82300c3f/nanumbarungothic.css' rel='stylesheet' type='text/css'>

<!-- 복사2 google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
<!-- awsome icon -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" 
integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">

<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
//일반회원 0, 호스트회원 1
var login_flag=0;

$(document).ready(function() {	  
	
// 	<!-- 구글 로그인 구현 -->
// 	<!-- 구글 CLIENT_ID : 463533794318-unijrkh4odbf94n2pms494toetghdgir.apps.googleusercontent.com -->
// 	<!-- 구글 redirect_uri : http://localhost:8080/TeamProj/google-->
// 	<!-- 구글 client_secret : Vwl1rm1fi2naT41YevXIP7IB -->
	$("#google-sign").click(function(){	
		var popUrl ="https://accounts.google.com/o/oauth2/v2/auth?"
			+"redirect_uri=http://localhost:8181/TeamProject/google&"
			+"response_type=code&"			
			+"client_id=463533794318-unijrkh4odbf94n2pms494toetghdgir.apps.googleusercontent.com&"
			+"scope=openid%20email&"
			+"access_type=offline";	
			//팝업창에 출력될 페이지 URL
	
	var popOption = "width=400, height=500, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
	
	var win = window.open(popUrl,"",popOption);		
		
   });
// 	<!-- Rest API 키  :  7bed2c2cc35da2f635429b5665085d84 -->
// 	<!-- /PrivateProject1225/kakao -->
// 	<!-- “https://kauth.kakao.com/oauth/authorize?client_id=7bed2c2cc35da2f635429b5665085d84
// 	&redirect_uri=http://localhost:8181/TeamProj/kakao&response_type=code” -->	
	$("#kakao-sign").click(function(){	
		var popUrl ="https://kauth.kakao.com/oauth/authorize?client_id=7bed2c2cc35da2f635429b5665085d84"
			+"&redirect_uri=http://localhost:8181/TeamProject/kakao&response_type=code";	
			//팝업창에 출력될 페이지 URL
	
	var popOption = "width=400, height=500, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
	
	var win = window.open(popUrl,"",popOption);		
		
   });
   
   // 로그인 모달 호스트 로그인 체크박스 이벤트
   $("#host_login").click(function(){
	   
	   if($("#host_login").is(":checked")){
		   
		   if(confirm("호스트 로그인 하시겠습니까?")){
			   $(".lbl_email").text("호스트 아이디");
			   $(".lbl_pass").text("호스트 비밀번호");
			   $("input[name='email']").attr("placeholder","호스트 아이디");
			   $("input[name='email']").val("");
			   $("input[name='pass']").attr("placeholder","호스트 비밀번호");
			   $("input[name='pass']").val("");
			   login_flag = 1;
		   }
		   
	   }else{		   
		   $(".lbl_email").text("이메일");
		   $(".lbl_pass").text("비밀번호");
		   $("input[name='email']").attr("placeholder","이메일");
		   $("input[name='email']").val("");
		   $("input[name='pass']").attr("placeholder","비밀번호");
		   $("input[name='pass']").val("");
		   login_flag = 0;
	   }
	   
   });		
	
	
});

// 모달 로그인 버튼 클릭시
function login_click(){
	// action="${path1}./UserLoginController.do" 
	// login_flag == 0 일반회원 로그인
	// login_flag == 1 호스트회원 로그인
	if(login_flag == 0 ){
		document.login_form.action = "${path1}./UserLoginController.do";
		document.login_form.submit();	
	}else{		
		document.login_form.action = "${path1}./HostLoginController.do";
		document.login_form.submit();		
	}
}

function host_click_modal() {
	
	 var y = document.getElementById("drop_host");
	 if (y.className.indexOf("w3-show") == -1) {
		    y.className += " w3-show";
		  } else { 
		    y.className = y.className.replace(" w3-show", "");
	 }
}

function host_space(){
	/*  location.href="${path2}hostSignUp.jsp"; */
	alert("공간등록 준비중입니다.");
 }
</script>
<style type="text/css">
a{
   text-decoration:none;
}
 .w3-bar-item{
  letter-spacing: 1px;
  font-family: "Nanum Barun Gothic" !important; 
  color: #666666;
  font-style: bold;
}
#drop>a{
	border-bottom: 1px solid #f2f2f2;
}
#drop>a:HOVER{
	border-bottom: 1px solid black;
}	

.nav_top{	
	height: 55px;
}
</style>
</head>
<body>
<!-- Navbar 복사4-->
<div class="w3-top">
  <div class="w3-bar w3-white w3-wide w3-padding w3-card  nav_top">
    <a href="${path}index.jsp" class="w3-bar-item w3-button"><b>SS</b> share space</a>
    <c:set var="email" value="${sessionScope.udto.email }"/>
    <c:set var="host_id" value="${sessionScope.hdto.host_id }"/>
    <div class="w3-right w3-hide-small">   		      
      <c:choose>
      	<%-- 일반 회원이 로그인 됐을 때 --%>
      	<c:when test="${email ne null }">      		 		
      		<a href="#about" class="w3-bar-item w3-button" onclick="star_click()"><i class="material-icons">stars</i></a>
      		<a href="${path2}userPage.jsp" class="w3-bar-item w3-button">마이페이지</a>
      		<div class="w3-dropdown-click">
      			<button onclick="click_modal()" class="w3-bar-item w3-button">${sessionScope.udto.name }</button>
      			<div id="drop" class="w3-dropdown-content w3-bar-block w3-card-4  w3-animate-zoom" style="right:0; width: 200px; top:56px;">
      				<small>&nbsp;&nbsp;${sessionScope.udto.email} &nbsp;&nbsp;보유 포인트 : ${sessionScope.udto.point}</small>      				   				
      				<a href="${path1}./UserLogoutController.do" class="w3-bar-item w3-button">로그아웃</a>      				
    			</div>
      		</div>	
      		<%-- <a href="${path1}./UserLogoutController.do" class="w3-bar-item w3-button">로그아웃</a> --%> 
      	</c:when>
      		
      	<%-- 호스트 회원이 로그인 됐을 때 --%>	
      	<c:when test="${host_id ne null }">	      		
   			<a href="#about" class="w3-bar-item w3-button" onclick="host_space()"><i class="material-icons">stars</i></a>
   			<a href="${path2}hostPage.jsp" class="w3-bar-item w3-button">마이페이지</a>
   			<div class="w3-dropdown-click">
   				<button onclick="host_click_modal()" class="w3-bar-item w3-button">${sessionScope.hdto.host_nic }</button>
   				<div id="drop_host" class="w3-dropdown-content w3-bar-block w3-card-4  w3-animate-zoom" style="right:0; width: 200px; top:56px;">
   					<small>&nbsp;&nbsp;${sessionScope.hdto.email} &nbsp;&nbsp;보유 포인트 : ${sessionScope.point}</small>
   					      				   				
   					<a href="${path1}./HostLogoutController.do" class="w3-bar-item w3-button">로그아웃</a>      				
 				</div>
   			</div>	
      	</c:when>		
      	
      	<%-- 일반회원 또는 호스트회원 로그인이 둘다 안되있을 떄 --%>
      	<c:otherwise>
      		<a href="${path2}userSingUp_auth.jsp" class="w3-bar-item w3-button">회원가입</a>
      		<a href="#home" class="w3-bar-item w3-button" onclick="document.getElementById('id01').style.display='block'">로그인</a><!-- 로그아웃 -->     	
      	</c:otherwise>	
      </c:choose>      
    </div>
  </div>
</div>
<!-- 복사4종료  -->
<!-- 모달창 시작 -->
<div class="w3-container">  
  <div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">	
	  <header class="w3-container w3-teal w3-center"> 
	    <span onclick="document.getElementById('id01').style.display='none'" 
	          class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
	    <h2><i class="w3-xxlarge fa fa-user"></i>회원 로그인</h2>
	  </header>
      <form class="w3-container" name="login_form" method="post">
        <div class="w3-section">        
          <label><b class="lbl_email">이메일</b></label>
          <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="이메일" name="email" required>
          <label><b class="lbl_pass">비밀번호</b></label>
          <input class="w3-input w3-border" type="password" placeholder="비밀번호" name="pass" required>
          <input class="w3-check w3-margin-top" type="checkbox" id="host_login""> 호스트 로그인
          <button class="w3-button w3-block w3-green w3-section w3-padding" type="button" onclick="login_click()">로그인</button>
       	  <span class="w3-right w3-padding w3-hide-small">비밀번호를 잊으셨거나 변경이 필요하신가요? <a href="#">비밀번호 재설정</a></span>
        </div>
      </form>
      	<hr>
      	<div class="w3-container w3-center">또는</div>
      <div class="w3-container w3-center w3-margin-bottom"><br>
      	<img src="${path}img/btn_google_signin_dark_normal_web@2x.png" height="60px" width="50%" id="google-sign"
      	onmouseover="this.src='${path}img/btn_google_signin_dark_focus_web@2x.png';" onmouseout="this.src='${path}img/btn_google_signin_dark_normal_web@2x.png';">        
        <img src="${path}img/kakao_account_login_btn_medium_narrow.png" height="55px" width="48%" id="kakao-sign"
        onmouseover="this.src='${path}img/kakao_account_login_btn_medium_narrow_ov.png';" onmouseout="this.src='${path}img/kakao_account_login_btn_medium_narrow.png';">       
      
      </div>      	
      <div class="w3-container w3-border-top w3-padding-16 w3-teal">
        <button onclick="document.getElementById('id01').style.display='none'" type="button" class="w3-button w3-red">Cancel</button>
        <span class="w3-right w3-padding w3-hide-small">share space의 회원이 아니신가요? <a href="#">회원 가입</a></span>
      </div>

    </div>
  </div>
</div>

<!-- 모달창 종료 -->
<script type="text/javascript">
 function click_modal() {
  var x = document.getElementById("drop");  
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else { 
    x.className = x.className.replace(" w3-show", "");
  }  
} 

 // 상단 호스트 별표 클릭시

 function star_click(){	 
	 if("${sessionScope.udto.host_check}" != 1){		 

	 	if(confirm("호스트 등록이 되어있지 않습니다. 호스트 가입 하시겠습니까?")){
			 location.href="${path2}hostSignUp.jsp";
		}		 
	 }else{
		 alert("회원님은 이미 호스트가입이 되어 있습니다. 호스트 로그인 해주십시오.");
		 
	 }	
 }


</script>

</body>
</html>