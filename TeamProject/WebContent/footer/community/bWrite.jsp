<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 스크립트 문자 사용가능하게 라이브러리 가져오기 -->
    <%@ page import="java.io.PrintWriter" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>나눔 공간 : 글쓰기</title>
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
		
		td>input, textarea{
			width: 1150px;
		}
		
		th{
			border: 2px solid #fff;
			background-color:  #85adad;
			text-align: center;
			color: white;
			font-size: 20px;
			font-family: sans-serif;
			font-variant: small-caps;
		}
		
		a,i {color: #669999;
			float: right;
			text-decoration: none;}
	</style>
	
</head>
<body>

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
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">커뮤니티
			
		</h3>
		<h6 class="w3"></h6>
	</div>
	
	<!-- 게시판 테이블 만들기 -->
	<div class="container">
		<div class="row">
			<!-- form태그로 액션페이지 보내기 -->
			<form action="<%=request.getContextPath()%>/BbsController.do" method="post">
			
			  <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead><!--테이블 제목 -->
					<tr>
						<!-- 행 속성넣기 -->
						<th colspan="2" style="text-align: center;">글 작성하기</th>
					</tr>
				</thead>
				<tbody>
				<!-- 특정 정보 액션페이지 넣기 -->
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlenth="50"></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlenth="2048" style="height:350px;"></textarea></td>
					</tr>
					
					<!-- 파일 업로드 넣기 -->
					<tr>
						<td>
						<!-- 업로드할 파일선택 :--> <input type="file" name="upFile"></td>
					</tr>	
				</tbody>
			</table>
			<hr/>				
				<button type="submit" class="w3-button w3-padding-small w3-black">Register</button> 
			</form>
			<a href="bbs.jsp" class="w3-button w3-padding-small w3-black">menu</a>
			
		</div>
	</div>
	
	
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</body>
</html>