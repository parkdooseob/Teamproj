<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 스크립트 문자 사용가능하게 라이브러리 가져오기 -->
    <%@ page import="java.io.PrintWriter" %>
    <!-- bbs클래스 가져오기 -->
    <%@ page import="bbs.BbsDTO" %>
    <%@ page import="bbs.BbsDAO" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<meta name="viewport" content="width-divice-width", initial-scale="1">
	
<title></title>
</head>
<body>
<%
	/* 뷰의 매개변수 및 기본 세팅 */
	int bbsID = 0;
	if(request.getParameter("bbsID") != null){ //bbsID가 있다면..
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}if (bbsID  == 0){ //bbsID가 0이라면
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert='유효하지 않는 글 입니다')");
		script.println("location.href='bbs.jsp'"); 
		script.println("</script>");
	}
	//해당 글의 구체적인 정보를 bbs인스턴스에 담아 가져오기
	//BbsDTO bbs = new BbsDAO().getBbs(bbsID);
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
			
	<!-- 실제로 게시글을 보여주는 부분 -->
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead><!-- 테이블 제목 -->
					<tr><!-- 행 -->
						<!-- 속성넣기 -->
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
					</tr>
				</thead>
				<tbody>
					<!-- 실제 게시글의 제목 및 작성자, 글 내용 넣기 -->
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2"><%-- <%=bbs.getBbsTitle()
											.replaceAll(" ", "&nbsp;")
											.replaceAll("<", "&lt;")
											.replaceAll(">", "&gt;")
											.replaceAll("\n", "<br>")	
											%> --%></td>
					</tr>

						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: Left;"><%-- <%=bbs.getBbsContent()
																					.replaceAll(" ", "&nbsp;")
																					.replaceAll("<", "&lt;")
																					.replaceAll(">", "&gt;")
																					.replaceAll("\n", "<br>")
																					%> --%></td>
					</tr>
				</tbody>
			</table>
			<a href="bbs.jsp" class="btn btn-primary">목록</a>
			
			<%	//현재 글 작성자가 본인이라면
				//if(email != null && email.equals(bbs.getUserID())){
					//업데이트가 가능하도록 출력(수정,삭제)
			%>	
					<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">수정</a>
					<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">삭제</a>
			<%
				//}
			%>
		</div>
	</div>
	
	
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>

</body>
</html>