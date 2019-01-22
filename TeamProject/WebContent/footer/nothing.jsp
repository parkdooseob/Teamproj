<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
* {
margin: 0; padding: 0;
}

body{width: 1200px; 	height: auto;
	font-family: "Nanum Barun Gothic"; 
	letter-spacing: 1px;}

	section{ width: 1200px;
		display: inline-block;
		margin-left: 300px;
		margin-top: 100px;}
	#bt{float: left;
		 width: 400px;}
	#if{float: right;
		 width: 800px;}


	iframe{
		width: 300px; 
	}
</style>

</head>
<body>
<!-- Navbar 복사4-->
<jsp:include page="../Top.jsp" flush="false"/>
<!-- 복사4종료  -->


	<!-- 제목 -->
	<section>
	  <div class="w3-container w3-padding-32" id="projects">
	    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">공지사항</h3>
	    <h6 class="w3"></h6>
	  </div>  
	
		<!-- 버튼
		<div id="bt" src=iframe>
			<button>공지사항</button>
		</div> -->
		
		<div class="w3-container">
		  <h2>Buttons (w3-button)</h2>
		  <input type="button" class="w3-button w3-black" value="Input Button"><br/><br/>
		  <button class="w3-button w3-black">Button Button</button><br/><br/>
		  <a href="#" class="w3-button w3-black">Link Button</a><br/><br/>
		</div>
		
		<!-- i프레임 -->
		<div id="if">
			<iframe src="../homeTim.jsp">
			  <p>Your browser does not support iframes.</p>
			</iframe>
		</div>
		
	</section>
	
	
	<div class="w3-container w3-padding-large con">		
		<div class="w3-row">
			<div class="w3-col m2"></div>				
			<div class="w3-col m2" align="left">
				<h1 style="padding-left: 20px;">목록</h1>			
				<ul class="ul_left">
					<li><a href="#" class="a_click1">프로필 수정</a></li>
					<li><a href="#" class="a_click2">예약 정보</a></li> <!-- 예약 현황 게시판 -->
					<li><a href="#" class="a_click3">후기</a></li> <!-- 예약한 공간에 대한 후기 -->
					<li><a href="#" class="a_click4">추천글</a></li>					
					<li><a href="#" class="a_click5">결제 정보</a></li>
				</ul>			
			</div>		
			<div class="w3-col m6" id="contents"></div>
			<div class="w3-col m2"></div>			
		</div>
</div>
	




</body>
</html>