<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약 확인</title>
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
<style type="text/css">
body{
	font-family: "Nanum Barun Gothic"; 
	letter-spacing: 1px;
}

h2{
	font-weight: bold;
	color:grey;
}

.w3-bar > a{
	text-decoration: none;
	font-weight: bold;
 	color: white !important;

}

.w3-bar > a:hover{
 	color: green !important;

}

</style>

<script type="text/javascript">
function tog(show, hide) {
	document.getElementById(show).style.display='block';
	document.getElementById(hide).style.display='none';
}



</script>
</head>
<body>

<h2 class="w3-left">내 예약 정보<i class="material-icons" style="font-size:60px; vertical-align: middle;">event</i></h2>
<span class="w3-right">3개의 내역</span>
<div class="w3-bar w3-green">
  <a href="../ReservationController.do" class="w3-bar-item w3-hover-white w3-padding">전체보기</a>
  <a href="#" class="w3-bar-item w3-hover-white w3-padding">지난 예약</a>
  <a href="#" class="w3-bar-item w3-hover-white w3-padding">다가올 예약</a>
  <a href="#" class="w3-bar-item w3-hover-white w3-padding">취소 내역</a>
 
</div>
<%!String status; %>
<div class="w3-row">
  <div class="w3-third w3-container w3-border">
    <img src="../img/room01.jpg" style="width: 100%; height: 100%"/>
  </div>
  <div class="w3-rest w3-container w3-border">
    <h4>공간 이름 </h4>
    <hr style="margin: 3px;">
    <div id="reservContent" style="display: block;">
    	<table width="100%">
      		<tr>
	    		<td width=25%>예약 상태:</td>
	    		<td width=25%></td>
	    		<td width=25%>결제 금액:</td>
	    		<td width=25%></td>
    		</tr>
    		<tr>
	    		<td width=25%>예약 날짜:</td>
	    		<td width=25%></td>
	    		<td width=25%>예약 시간:sta:00~ endT</td>
	    		<td width=25%></td>
    		</tr>
    	</table>
    </div>
    <div id="reviewContent" style="display: none;">
    	<span style="color: grey;">취소된 예약입니다</span>
    	<span style="color: grey;">공간 사용 전입니다</span>
    	<span style="color: grey;">작성된 리뷰가 없습니다</span><a href="m_detail.jsp?roomno">리뷰 작성</a>
    	<textarea rows="3" cols="30" >리뷰 수정 삭제</textarea>
    </div>
  	<button class="w3-button w3-blue" onclick="tog('reservContent', 'reviewContent')">예약 보기</button>&nbsp;
  	<button class="w3-button w3-blue" onclick="tog('reviewContent', 'reservContent')">리뷰 보기</button>&nbsp;
  	<button class="w3-button w3-blue" onclick="home.jsp">다시 예약</button>&nbsp;
 	
  </div>
</div>
</body>
</html>