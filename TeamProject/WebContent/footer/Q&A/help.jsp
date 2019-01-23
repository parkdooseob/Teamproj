<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- 복사 1 font -->
<link href='https://cdn.rawgit.com/openhiun/hangul/14c0f6faa2941116bb53001d6a7dcd5e82300c3f/nanumbarungothic.css' rel='stylesheet' type='text/css'>

<!-- 복사2 google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<style type="text/css">
	.con{
		border: 1px solid white;		
		margin-top: 75px;						
	}
	.w3-row{
		border: 1px solid white;
		width: 100%;		
	}
	.w3-col{
		border: 1px solid white;					
	}
	.ul_left>li{		
		list-style-type: none;
		padding-bottom: 10px;
	}
	.ul_left>li a{
		text-decoration: none;		
		font-size: 1.2em;
		color: grey;
	}	

	#img{margin-top: 75px;
		transform:scaleY(3);
	}
</style>

<script type="text/javascript">
$(document).ready(function() {
		
	$(".a_click1").css("color","black");
	$("#contents").load("helpPage1.jsp");
	
	$(".a_click1").click(function(){
		//alert("클릭");
		$(".a_click1").css("color","black");
		$(".a_click2").css("color","grey");
		$(".a_click3").css("color","grey");
		$(".a_click4").css("color","grey");
		$(".a_click5").css("color","grey");
		$("#contents").load("helpPage1.jsp");
	});
	$(".a_click2").click(function(){
		//alert("클릭");
		$(".a_click1").css("color","grey");
		$(".a_click2").css("color","black");
		$(".a_click3").css("color","grey");
		$(".a_click4").css("color","grey");
		$(".a_click5").css("color","grey");
		$("#contents").load("helpPage2.jsp");
	});
	$(".a_click3").click(function(){
		//alert("클릭");
		$(".a_click1").css("color","grey");
		$(".a_click2").css("color","grey");
		$(".a_click3").css("color","black");
		$(".a_click4").css("color","grey");
		$(".a_click5").css("color","grey");
		$("#contents").load("helpPage3.jsp");
	});
	$(".a_click4").click(function(){
		//alert("클릭");
		$(".a_click1").css("color","grey");
		$(".a_click2").css("color","grey");
		$(".a_click3").css("color","grey");
		$(".a_click4").css("color","black");
		$(".a_click5").css("color","grey");
		$("#contents").load("helpPage4.jsp");
	});
	
});

</script>
</head>
<body>
<!-- 최상단 네비 바 시작 -->
<jsp:include page="../../Top.jsp" flush="false"/>
<!-- 최상단 네비 바 종료 -->
<div class="w3-container w3-padding-large con">		
		<div class="w3-row">
			<div class="w3-col m2"><img id="img" src="study1_2.jpg" style="padding: 0; width: 300px; height:100%; opacity:0.8;"></div>				
			<div class="w3-col m2" align="left">
				<h1 style="padding-left: 20px;">Q&A</h1>			
				<ul class="ul_left">
					<li><a href="#" class="a_click1">사이트이용 문의</a></li>
					<li><a href="#" class="a_click2">호스팅 문의</a></li>
					<li><a href="#" class="a_click3">예약정보 문의</a></li>					
					<li><a href="#" class="a_click4">개인정보 문의</a></li>
				</ul>			
			</div>		
			<div class="w3-col m6" id="contents"></div>
			<div class="w3-col m2"></div>			
		</div>
</div>


</body>
</html>