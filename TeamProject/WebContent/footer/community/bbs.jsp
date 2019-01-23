<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 스크립트 문자 사용가능하게 라이브러리 가져오기 -->
    <%@ page import="java.io.PrintWriter" %>
    
    <%@ page import="bbs.BbsDAO" %>
    <%@ page import="bbs.BbsDTO" %>
    <%@ page import="java.util.ArrayList" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width-divice-width", initial-scale="1">
	
<title>나눔 공간 : 게시판</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- 복사 1 font -->
<link href='https://cdn.rawgit.com/openhiun/hangul/14c0f6faa2941116bb53001d6a7dcd5e82300c3f/nanumbarungothic.css' rel='stylesheet' type='text/css'>

<!-- 복사2 google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

	<style type="text/css">
		
		th{	border: 2px solid #fff;
			background-color:  #85adad;
			text-align: center;
			color: white;
			font-size: 20px;
			font-family: sans-serif;
			font-variant: small-caps;
			}
		
		td{	border: 2px solid #fff;
			background-color: #fff;}
				
		a{text-decoration: none;}
		
		table{width: auto;
			display: inline-block;
			float: left;}
	
		
	</style>
	
</head>
<body>
<%
	//현재 게시판 넘버 (기본페이지 1)
	int pageNumber = 1;
	//페이지 넘버가 파라미터로 넘어왔다면, 넘버에는 해당 파라미터값을 넣음
	if(request.getParameter("pageNumber") != null){
		//getParameter는 정수형으로 바꿔주는 Integer를 사용할 것
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
%>

<!-- 최상단 네비 바 시작 -->
<jsp:include page="../../Top.jsp" flush="false"/>
<!-- 최상단 네비 바 종료 -->

<!-- 페이지 center-->
<div class="w3-content w3-padding" style="max-width:1250px">

<!--내 위치(위쪽여백)-->
<div class="w3-container w3-padding-16 w3-margin-bottom"  align="center">
	<i class="material-icons" style="color:rgb(255,52,120);">near_me</i>
	<span id="my_location" style="font-size:20px;">내 위치</span>
</div>

	<!-- 제목 -->
	<div class="w3-container w3-padding-32" id="projects">
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">커뮤니티</h3>
		<h6 class="w3"></h6>
	</div>
	
	<!-- 게시판 테이블 만들기 -->
	<div class="container">
		<div class="row">
			<table class="w3-table" style="text-align: center;">
				<thead><!-- 테이블 제목 -->
					<tr><!-- 행 -->
						<!-- 속성넣기 -->
						<th style="text-align: center;">No</th>
						<th style="text-align: center;">Content</th>
						<th style="text-align: center;">작성자</th>
						<th style="text-align: center;">Date</th>
					</tr>
				</thead>
				<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO();
						//현재의 페이지에서 가져온 리스트(=목록)
						ArrayList<BbsDTO> list = bbsDAO.getList(pageNumber);
						//목록을 하나씩 출력
						for(int i=0; i<list.size(); i++){
					%>
					<tr>
						<!-- 현재 게시글의 정보 가져오기 -->
						<td><%= list.get(i).getBbsID() %></td>
							<!-- a태그 사용하여 제목을 눌렀을때 view를 사용하여 해당 게시글을 보여줌 -->
							<!-- view.jsp로 해당 게시글번호를 매개변수로 보내어 처리 -->
							<!-- 해당 게시글번호에 맞는 게시글을 view페이지에 볼수 있도록 해당 view페이지로 이동하도록 함 -->
						<td><a href="bView.jsp?bbsID=<%= list.get(i).getBbsID() %>"> <%= list.get(i).getBbsTitle()%></a></td>
						<td><%= list.get(i).getUserID() %></td>
							<!-- substring을 사용해 날짜를 보기좋게 출력 -->
						<td><%= list.get(i).getBbsDate().substring(0, 11)
								+	list.get(i).getBbsDate().substring(11, 13) + "시 /"
								+	list.get(i).getBbsDate().substring(14, 16) + " 분"  %></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<hr/>
			<!-- 이전, 다음 페이지 버튼 만들기 -->
			<div class="w3-row">
				<div class="col-sm-8 w3-padding w3-xlarge w3-text-orange">
				<%
					if(pageNumber != 1){ //페이지넘버가 1이 아니라면
				%>
					<!-- 화살표 모양 -->					
					<a href="bbs.jsp?pageNumber=<%= pageNumber -1 %>">
						<i class="fa fa-arrow-left"></i>
					</a>
				<%		
					} if(bbsDAO.nextPage(pageNumber + 1)){ //만약 다음페이지가 존재 한다면
				%>
					<a href="bbs.jsp?pageNumber=<%= pageNumber +1 %>">
						<i class="fa fa-arrow-right"></i>
					</a>
				<%
					}
				%>
					<div class="col-sm-2">
						<a href="home.jsp" style="float: right;"><i class="fa fa-home"></i></a>
					</div>
					<div class="col-sm-2">
						<a href="bWrite.jsp" style="float: right;"><i class="fa fa-file"></i></a>
					</div>					
				</div>		
			<!-- 글을 쓸수있는 화면 -->
				
			</div>
		</div>

	</div>
</div><!-- 페이지 끝 -->
	
	
	
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>