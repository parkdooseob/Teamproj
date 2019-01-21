<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<title>나눔 공간</title>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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

	<script type="text/javascript">
	</script>
	<style>
	body{	
		font-family: "Nanum Barun Gothic"; 
		letter-spacing: 1px;	 
	}	
	</style>

<body>
<!-- Navbar 복사4-->
<jsp:include page="../Top.jsp" flush="false"/>
<!-- 복사4종료  -->

<!-- Header시작 -->
<header class="w3-display-container w3-content w3-wide" style="max-width:100%;" id="home">


</header>

<!-- 페이지 center-->
<div class="w3-content w3-padding" style="max-width:1564px">

 <!--내 위치(위쪽여백)-->
  <div class="w3-container w3-padding-16 w3-margin-bottom"  align="center">
    <i class="material-icons" style="color:rgb(255,52,120);">near_me</i>
    <span id="my_location" style="font-size:20px;">내 위치</span>
  </div>
  
  
  
  <!-- 이벤트제목 -->
  <div class="w3-container w3-padding-32" id="projects">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">진행중인 이벤트</h3>
    <h6 class="w3"></h6>
  </div>
  
  	<!-- 이벤트 -->
	<div class="w3-row-padding">
	<div class="w3-col l3 w3-margin-bottom">
      <a href="#" class="w3-btn" style="padding: 3px">
	      <div class="w3-display-container">
		    <div class="w3-display-topleft w3-blue w3-padding">호스트이벤트</div>
		    <img src="e_img/e_img4.jpg" alt="event" style="width:100%">
	      </div>
      </a> 
      <h6 class="w3-border-bottom w3-border-light-grey w3-padding-16">
			[호스트되기]</br> 나의 첫 스터디룸 제공, 모두 놀러오세요! </br>
			2019.02.05 ~ 2019.12.05
	  </h6>
	</div>  
	
    <div class="w3-col l3 w3-margin-bottom">
      <a href="#" class="w3-btn" style="padding: 3px">
	      <div class="w3-display-container">
		     <div class="w3-display-topleft w3-blue w3-padding">친구랑 쿠폰나눠쓰기</div>
		     <img src="e_img/e_img3.jpg" alt="event" style="width:100%">
	      </div>
      </a>
      <h6 class="w3-border-bottom w3-border-light-grey w3-padding-16">
			[추천아이디]</br> 친구에게 나의 아이디를 알려줘요 click! </br>
			2019.02.05 ~ 2019.12.05
	  </h6>
    </div>
    
	<div class="w3-col l3 w3-margin-bottom">
      <a href="#" class="w3-btn" style="padding: 3px">
	      <div class="w3-display-container">
		    <div class="w3-display-topleft w3-blue w3-padding">첫후기쓰고 쿠폰받자</div>
		    <img src="e_img/e_img2.jpg" alt="event" style="width:100%">
	      </div>
      </a>
      <h6 class="w3-border-bottom w3-border-light-grey w3-padding-16">
			[리뷰게시판]</br> 첫후기 시 쿠폰 15% 증정 이벤트 </br>
			2019.02.05 ~ 2019.12.05
	  </h6>
    </div>
    
	<div class="w3-col l3 w3-margin-bottom">
      <a href="e01.jsp" class="w3-btn" style="padding: 3px">
	      <div class="w3-display-container">
		    <div class="w3-display-topleft w3-blue w3-padding">회원가입 이벤트</div>
		    <img src="e_img/e_img1.jpg" alt="event" style="width:100%">
	      </div>
      </a>
      <h6 class="w3-border-bottom w3-border-light-grey w3-padding-16">
			[가입 시 자동증정]</br> 모든 가입고객께 드리는 Share Space의 선물 </br>
			2019.02.05 ~ 2019.12.31
	  </h6>
	</div>
    <!-- 이벤트 끝 -->
    
</div>
<!-- center 끝 -->

</body>
</html>