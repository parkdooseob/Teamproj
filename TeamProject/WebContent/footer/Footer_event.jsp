<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	/* <jsp:include page="../Top.jsp" flush="false"/>
		동적 페이지 폴더 변경 */
	String servlet = request.getServletPath();
	String path = "../";
	String path1 = ".";
	String path2 = "../user/";
	if(servlet.equals("/home.jsp") || servlet.equals("/Footer.jsp")){
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
  

<title>나눔 공간</title>
<script type="text/javascript">
$(document).ready(function() {	  
	
// 	<!-- 구글 로그인 구현 -->
// 	<!-- 구글 CLIENT_ID : 463533794318-unijrkh4odbf94n2pms494toetghdgir.apps.googleusercontent.com -->
// 	<!-- 구글 redirect_uri : http://localhost:8080/TeamProj/google-->
// 	<!-- 구글 client_secret : Vwl1rm1fi2naT41YevXIP7IB -->
	$("#google-sign").click(function(){	
		var popUrl ="https://accounts.google.com/o/oauth2/v2/auth?"
			+"redirect_uri=http://localhost:8181/TeamProj/google&"
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
			+"&redirect_uri=http://localhost:8181/TeamProj/kakao&response_type=code";	
			//팝업창에 출력될 페이지 URL
	
	var popOption = "width=400, height=500, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
	
	var win = window.open(popUrl,"",popOption);		
		
   });	
	
});
</script>
<style type="text/css">
a{
   text-decoration:none;
}

#footerDiv{	
	width: 100%; height: auto;
	
	/*background-image: url("../img/header.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	background-position: top center;
	padding: 15px 5% 10px 5%;*/
	
}

p{
 font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
}

.list-group{
	display: inline-block;
}

</style>
</head>
<body>

<div id="footerDiv">
	<div class="w3-container w3-blue-grey w3-center"> <br>	
			<div class="row">
				<div  class="col-sm-2" style="text-align: right;"><img src="e_img/footer_img.jpg"><br/>
				</div>
				<div class="col-sm-8" style="text-align: left;">
					<h5>Copyright&copy; Share Space</h5>
					대표이사: (주) Share Space | 6강2조 | 주소: 부산 아이티윌 <br/>
					메일: help@sharespace.com | tel: 1644-1234(9am-6pm)<br/>
					호스팅 서비스 제공자: (주)Share Space<br/>
					<div class="w3-container w3-small"><p style="padding: 15px 0;">
					(주)Share Space는 통신판매중개자로서, 통신판매의 당사자가 아니라는 사실을 고지하며<br/>
					상품의 예약, 이용 및 환불 등과 관련한 의무와 책임은 각 판매자에게 있습니다<br/>
					</p></div>
				</div>
				<div class="col-sm-1"><h6 style="text-align: center;">SNS</h6>
					<div class="list-group">
						<a href="event/event.jsp"><button class="w3-button w3-round">페이스북</button></a>
						<a href="event/event.jsp"><button class="w3-button w3-round">인스타</button></a>
						<a href="event/event.jsp"><button class="w3-button w3-round">유튜브</button></a>
					</div>
				</div>
				<div class="col-sm-1"><h6 style="text-align: center;">NOTICE</h6>
					<div class="list-group">
						<a href="event/event.jsp"><button class="w3-button w3-round">공지사항</button></a>
						<a href="event/event.jsp"><button class="w3-button w3-round">Q&A</button></a>
						<a href="event/event.jsp"><button class="w3-button w3-round">이용약관</button></a>
					</div>
				</div>
		</div>

<!-- Footer 
	<footer class="w3-center w3-white w3-padding-50">
			<div class="w3-cell-row">
				<div class="w3-container w3-blue-grey w3-cell w3-mobile w3-display-bottomleft w3-hight-100">
					<img src="img/footer_img.jpg">
		 	 	</div>
		 	 	<div class="w3-container  w3-blue-grey w3-cell w3-mobile w3-display-bottommiddle w3-hight-'142'">
					<div class="w3-bar-item w3-left">
					대표이사: (주) Share Space | 6강2조 | 주소: 부산 아이티윌 <br/>
					메일: help@sharespace.com | tel: 1644-1234(9am-6pm)<br/>
					호스팅 서비스 제공자: (주)Share Space<br/>
					</div>
					<div class="w3-small">(주)Share Space는 통신판매중개자로서, 통신판매의 당사자가 아니라는 사실을 고지하며<br/>
					상품의 예약, 이용 및 환불 등과 관련한 의무와 책임은 각 판매자에게 있습니다
					</div>
		 	 	</div>
		 	 	<div class="w3-container  w3-blue-grey w3-cell w3-mobile">
					
		 	 	</div>
				 <div class="w3-container w3-blue-grey w3-cell w3-mobile">			 	
					<p class="w3-left">대표이사: (주) Share Space | 6강2조 | 주소: 부산 아이티윌 <br/>
					메일: help@sharespace.com | tel: 1644-1234(9am-6pm)<br/>
					호스팅 서비스 제공자: (주)Share Space<br/></p>
					<div class="w3-small">(주)Share Space는 통신판매중개자로서, 통신판매의 당사자가 아니라는 사실을 고지하며<br/>
					상품의 예약, 이용 및 환불 등과 관련한 의무와 책임은 각 판매자에게 있습니다
					</div>					
				</div>			
		 	 </div>		 	
	</footer>
 Footer 종료  -->



</body>
</html>