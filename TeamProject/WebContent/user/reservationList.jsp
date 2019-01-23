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
</head>
<body>
<i class="material-icons" style="font-size:80px;color:#333;">event</i>
<p>내 예약 정보</h2>
<div class="w3-bar w3-green">
  <a href="../ReservationController.do" class="w3-bar-item w3-hover-white w3-padding">London</a>
  <a href="#" class="w3-bar-item w3-hover-white w3-padding">Paris</a>
  <a href="#" class="w3-bar-item w3-hover-white w3-padding">Tokyo</a>
</div>
</body>
</html>