<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>Insert title here</title>
<style type="text/css">
div{
	padding: 0;
	margin: 0;
}
body{
	padding-top: 55px;
}
.con{
	border: 1px solid red;
	margin-top: 55px;	
}
.div_left{
	border: 1px solid blue;
	padding : 25px;
	
}
.div_right{
	border: 1px solid green;	
	padding : 25px;
	position: sticky;
}
.div_hr{
	margin:10px 0;
}

small{
	/* border: 1px solid white; */
}
.small_time{
	padding-right: 270px;
}
</style>
</head>
<body>
<!-- 최상단 네비 바 시작 -->
<jsp:include page="../Top.jsp" flush="false"/>
<!-- 최상단 네비 바 종료 -->
<!-- 본문 시작 -->	
		<div class="w3-row">
			<div class="w3-col m2"><p> </p></div>				
			<div class="w3-col m5 div_left" align="left">
				<div class="w3-row">
					<div class="w3-col m5">		
						<img alt="" src="../img/room01.jpg" width="270" height="170">
					</div>
					<div class="w3-col m3">
						<h2>제 목</h2>
						<p>11111111111111111</p>
					</div>
				</div>
				
				<hr>
				<div class="w3-row">
					<div class="w3-col m5">
						<h5>이용시간</h5>
					</div>
				</div>
				<hr>
								
			</div>		
			<div class="w3-col m3 div_right w3-dark-grey w3-margin-bottom">
				<div class="w3-row">					
					<div class="w3-col m12">
						<h5>예약일</h5>
						<p>2019-01-31</p>
						<hr>
						<small class="small_time">예약시간</small>
						<small>1 시간</small>
					</div>
				</div>
			</div>			
			<div class="w3-col m3 div_right w3-dark-grey">
				<div class="w3-row">					
					<div class="w3-col m6">						
						1
					</div>
					<div class="w3-col m6">						
						1
					</div>
				</div>
			</div>
			<div class="w3-col m2"><p> </p></div>			
		</div>
<!-- 본문 종료 -->
</body>
</html>