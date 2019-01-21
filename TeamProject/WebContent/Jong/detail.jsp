<%@page import="DB.DAO"%>
<%@page import="DB.SelectDTO"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script
  src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
  integrity="sha256-3edrmyuQ0w65f8gfBsqowzjJe2iM6n0nKciPUp8y+7E="
  crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<style type="text/css">
*{
	box-sizing: border-box;
}
body{
margin: 0px;
padding: 0px;
}
#nav2 div{
	margin-left: 50px;
	font-size: 17px;
}
#nav2 div a:link{
text-decoration: none;
}
#nav2 div a:hover{
text-decoration: underline;
}
.starR1{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR2{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR1.on{background-position:0 0;}
.starR2.on{background-position:-15px 0;}
</style>

<script type="text/javascript">
$(document).ready(function() {
	
	$('.starRev span').click(function(){
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
		  return false;
		});
	
	
});
</script>

</head>
<body>
		
	<div style="width:100%;">		
			
			
				<div class="w3-bar" style="width: 100%; position: fixed; z-index: 9999; height:80px;">
				  <div class="w3-bar w3-green">
				  	<div class="w3-bar-item">팀장님</div></div>
				  <div class="w3-bar w3-white " id="nav2" style="border-bottom:1px solid;">
				  	<div class="w3-bar-item"><a href="http://localhost:8080/TeamProj/detailPageController.do?a=1">전체</a></div>
				  	<div class="w3-bar-item"><a href="http://localhost:8080/TeamProj/detailPageController.do?a=2">카페</a></div>
				  	<div class="w3-bar-item"><a href="http://localhost:8080/TeamProj/detailPageController.do?a=3">강의실</a></div>
				  	<div class="w3-bar-item"><a href="http://localhost:8080/TeamProj/detailPageController.do?a=4">룸</a></div>
				  </div>
				</div>	
				
				
				
			<!-- 왼쪽 영역 , 오른쪽 영역 시작 -->
			<!-- 좌측 영역  -->
			<div style="float: left; width: 50%; margin-top: 80px">
			
		
		
				<table width="100%">
					<%										
						DAO dao = new DAO();
						Vector<SelectDTO> vector = null;
						
						if(request.getAttribute("vector") == null){
							vector = dao.select(1);	
						}else if(request.getAttribute("vector") != null){							
							vector = (Vector<SelectDTO>)request.getAttribute("vector");
						}
					
							for(int i=0; i < vector.size() ; i++){
								SelectDTO dto = vector.get(i);
								
					%>					
					<tr align="center" height="300px;">
						<td width="40%"><div style="width: 90%"><img src="img/<%=dto.getPost()%>" width="100%"></div></td>
						<td width="50%" style="text-align:left; position: relative;">
							<div style="position: absolute; top: 0px;">
								<h1 style="margin-bottom: -3px;"><%= dto.getTitle() %></h1>
								<div class="starRev">
								  <span class="starR1 on">별1_왼쪽</span>
								  <span class="starR2">별1_오른쪽</span>
								  <span class="starR1">별2_왼쪽</span>
								  <span class="starR2">별2_오른쪽</span>
								  <span class="starR1">별3_왼쪽</span>
								  <span class="starR2">별3_오른쪽</span>
								  <span class="starR1">별4_왼쪽</span>
								  <span class="starR2">별4_오른쪽</span>
								  <span class="starR1">별5_왼쪽</span>
								  <span class="starR2">별5_오른쪽</span>
								  <p style="font-size: 24px; color: gray; display: inline;">&nbsp;&nbsp; 후기 : n개</p>
								</div>
							</div>
							<div style="margin-top: 50px;">
								<p style="margin-bottom: 0px"><b>대실</b>&nbsp;&nbsp; 영업 시작시간:<%=dto.getaTime()%> &nbsp;&nbsp; <img alt="예약가" src="re.JPG">&nbsp;&nbsp; <span style="font-size: 28px;"><%=dto.getRoom_sum() %></span></p>
							</div>
							<div>
								<p><b>참고사항</b></p>
								<%=dto.getContent() %>
							</div>
							
						</td>
						<td width="10%" align="right"></td>
					</tr>	
					<%
							}
					
					%>
					
				</table>
			
			</div>
			<!-- 오른쪽 영역 시작 -->
			<div style="width: 50%; position: fixed; right: 0; margin-top: 80px; height:100%">
					
					<div id="map" style="width:100%; height:100%;"></div>
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55bb85418a60e0c25e4702007dc138fe"></script>
						<script>
						var container = document.getElementById('map');
						var options = {
							center: new daum.maps.LatLng(33.450701, 126.570667),
							level: 3
						};
				
						var map = new daum.maps.Map(container, options);
						</script>		
			</div>	
			
				
		</div>	

</body>
</html>