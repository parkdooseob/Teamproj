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
<div class="w3-content w3-padding" style="max-width:800px">

 <!--내 위치(위쪽여백)-->
  <div class="w3-container w3-padding-16 w3-margin-bottom"  align="center">
    <i class="material-icons" style="color:rgb(255,52,120);">near_me</i>
    <span id="my_location" style="font-size:20px;">내 위치</span>
  </div>
  
  
  
  <!-- 이벤트 제목 -->
  <div class="w3-container w3-padding-32" id="projects">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">회원가입 이벤트</h3>
    <h6 class="w3"></h6>
  </div>
  
  	<!-- 이벤트 -->
		<img class="w3-image" src="e_img/e01.jpg" width="100%">
    <!-- 이벤트 끝 -->
        
    <div>
    	<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16"></h3>
		<a href="event.jsp">
    		<button href="event.jsp" class="w3-button w3-teal w3-border w3-round-large w3-right">Event list</button>
		</a>
    </div>
    
    <br/><br/>
    
</div>
<!-- center 끝 -->

</body>
</html>