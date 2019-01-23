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

	.w3-table{border: 1px solid pink;}
	
	th{	border: 2px solid #fff;
		background-color:  #669999;
		text-align: center;
		color: white;
		font-size: 20px;
		font-family: sans-serif;
		font-variant: small-caps;
		}
	
	td{	border: 2px solid #fff;
		background-color: #fff;}
	
</style>

<script type="text/javascript">

</script>

</head>
<body>
<!-- 최상단 네비 바 시작 -->
<jsp:include page="../Top.jsp" flush="false"/>
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
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">공지사항</h3>
		<h6 class="w3"></h6>
	</div>
	
	<!-- 게시판 -->
	<div class="w3-container">
	
	  <table class="w3-table">
	    <tr>
	      <th>No</th>
	      <th>Content</th>
	      <th>Date</th>
	    </tr>
	    <tr>
	      <td>1</td>
	      <td>공지사항 입니다.</td>
	      <td>2019-01-22</td>
	    </tr>
	  </table>
	</div>
	
</body>
</html>