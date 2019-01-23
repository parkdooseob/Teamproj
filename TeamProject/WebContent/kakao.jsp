<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script type="text/javascript">

function popupOpen(){

	var popUrl ="https://accounts.google.com/o/oauth2/v2/auth?"
			+"redirect_uri=http://localhost:8181/TeamProj/google&"
			+"response_type=code&"
			+"client_id=463533794318-unijrkh4odbf94n2pms494toetghdgir.apps.googleusercontent.com&"
			+"scope=openid%20email&"
			+"access_type=offline";	
			//팝업창에 출력될 페이지 URL
	
	var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
	
	var win = window.open(popUrl,"",popOption);
		

		//win.close();
	}
	
	$(document).ready(function(){
		
		$("#div_load").load("index.jsp");
			
		
		
	});
		
	
	
	
</script>
<head>    
</head>
<body>
	<!-- Rest API 키  :  7bed2c2cc35da2f635429b5665085d84 -->
	<!-- /PrivateProject1225/kakao -->
	<!-- “https://kauth.kakao.com/oauth/authorize?client_id=7bed2c2cc35da2f635429b5665085d84
	&redirect_uri=http://localhost:8181/TeamProj/kakao&response_type=code” -->
	<a href="https://kauth.kakao.com/oauth/authorize?client_id=7bed2c2cc35da2f635429b5665085d84
	&redirect_uri=http://localhost:8181/TeamProj/kakao&response_type=code">카카오 로그인</a>
	
	
	<a href="https://kapi.kakao.com/v1/user/logout">로그아웃</a>
	<br>
	<br>
	<!-- 구글 로그인 구현 -->
	<!-- 구글 CLIENT_ID : 463533794318-unijrkh4odbf94n2pms494toetghdgir.apps.googleusercontent.com -->
	<!-- 구글 redirect_uri : http://localhost:8080/TeamProj/google-->
	<!-- 구글 client_secret : Vwl1rm1fi2naT41YevXIP7IB -->
	<a href="https://accounts.google.com/o/oauth2/v2/auth?
			redirect_uri=http://localhost:8181/TeamProj/google&
			response_type=code&
			client_id=463533794318-unijrkh4odbf94n2pms494toetghdgir.apps.googleusercontent.com&
			scope=openid%20email&
			access_type=offline">로그인</a>
	
	<a href="javascript:popupOpen();"> 열려라 팝업창! </a>
	
	<a href="https://www.google.com/accounts/Logout">구글 로그아웃</a><br>
	
	<input type="text" maxlength="3" name="name">
	
	<div id=div_load></div>
</body>
</html>