<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- id 처리, filter 함수 -->
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

#filterbar > a{
	text-decoration: none;
	font-weight: bold;
 	color: white !important;

}

#filterbar > a:hover{
 	color: green !important;

}


.w3-third {
  height: 170px;
}  
.w3-rest{
 height: 170px;
}  


</style>

<script type="text/javascript">
function tog(show, hide) {
	document.getElementById(show).style.display='block';
	document.getElementById(hide).style.display='none';
}




// 0 다가올
// 1 지난
// 2 취소
$('#all').click(function () {  
	$('.rStatus_0').css("display", "block");
	$('.rStatus_1').css("display", "block");
	$('.rStatus_2').css("display", "block");

});

$('#coming').click(function () {  
	$('.rStatus_0').css("display", "block");
	$('.rStatus_1').css("display", "none");
	$('.rStatus_2').css("display", "none");

});

$('#last').click(function () {  
	$('.rStatus_0').css("display", "none");
	$('.rStatus_1').css("display", "block");
	$('.rStatus_2').css("display", "none");

});

$('#cancled').click(function () {  
	$('.rStatus_0').css("display", "none");
	$('.rStatus_1').css("display", "none");
	$('.rStatus_2').css("display", "block");

});





</script>
</head>
<body>
<h2 class="w3-left">내 예약 정보<i class="material-icons" style="font-size:60px; vertical-align: middle;">event</i></h2>
<span class="w3-right">총 ${fn:length(rList)}개의 내역</span>
<div class="w3-bar w3-green" id="filterbar">
  <a class="w3-bar-item w3-hover-white w3-padding" id="all">전체보기</a>
  <a class="w3-bar-item w3-hover-white w3-padding" id="last">지난 예약</a>
  <a class="w3-bar-item w3-hover-white w3-padding" id="coming">다가올 예약</a>
  <a class="w3-bar-item w3-hover-white w3-padding" id="cancled">취소 내역</a>
 
</div>
<c:set var="size" value="${fn:length(rList)}"/>
<c:if test="${size == 0}">
<p align="center" style="color: grey">예약 내역이 없습니다</p>
</c:if>
<!-- ReservationController에서 넘겨받은 request영역안에 있는 백터를 꺼내서 백터 사이즈만큼 반복 -->
<c:forEach var="rList"  items="${requestScope.rList}">
<div class="rStatus_${rList.rStatus} w3-row w3-border-top w3-border-bottom" style="margin: 10px auto; display: block;'">
  <div class="w3-third w3-container ">
    <img src="${rList.pic1}" style="width: 100%; height: 100%"/>
  </div>
  <div class="w3-rest w3-container ">
    <h5>${rList.subject}<!-- 공간이름 --> </h5>
    <p style="margin:2px;">${rList.room_type}</p>
    <hr style="margin: 3px;"/>
    <div id="reservContent_${rList.book_no}" style="display: block; height: 60px">
    
    	<table width="100%">
      		<tr>
	    		<td width=25%>예약 상태:</td>
	    		<td width=25%>
	    			      <c:choose>
        					 <c:when test = "${rList.rStatus == 0}">
						     	다가 올 예약
						     </c:when>
						     <c:when test = "${rList.rStatus == 1}">
						     	지난 예약
						     </c:when>
						     <c:when test = "${rList.rStatus == 2}">
						     	취소 된 예약
						     </c:when>
					      </c:choose>
	    		</td>
	    		<td width=25%>결제 금액:</td>
	    		<td width=25%>${rList.total_price}</td>
    		</tr>
    		<tr>
	    		<td width=25%>예약 날짜:</td>
	    		<td width=25%>${rList.book_date}</td>
	    		<td width=25%>예약 시간:</td>
	    		<td width=25%>${rList.startT}:00 ~ ${rList.endT}:50</td>
    		</tr>
    	</table>
    </div>
    <div id="reviewContent_${rList.book_no}" style="display: none; height: 60px">
    	<c:choose>
        	<c:when test = "${rList.rStatus == 0}">
				<span style="color: grey;">공간 사용 전입니다</span>
			</c:when>
			<c:when test = "${rList.rStatus == 1}">
				<c:if test="${rList.re_content eq null}">
					<span style="color: grey;">작성된 리뷰가 없습니다</span>
					<a href="m_detail.jsp?${rList.room_no}">리뷰 작성</a>
				</c:if>
				<c:if test="${rList.re_content ne null}">
					<p style="margin:2px;">별점:${rList.re_point}점 </p>
					<textarea rows="2" cols="30" readonly="readonly" style="border:none; height: 2em;">${rList.re_content}</textarea>
				</c:if>
				
			</c:when>
			<c:when test = "${rList.rStatus == 2}">
				<span style="color: grey;">취소된 예약입니다</span>
			</c:when>
		</c:choose>
    	
    	
    	
    </div>
    <div>
	  	<button class="w3-button w3-blue w3-padding-small" onclick="tog('reservContent_${rList.book_no}', 'reviewContent_${rList.book_no}')">예약 보기</button>&nbsp;
	  	<button class="w3-button w3-blue w3-padding-small" onclick="tog('reviewContent_${rList.book_no}', 'reservContent_${rList.book_no}')">리뷰 보기</button>&nbsp;
	  	<button class="w3-button w3-blue w3-padding-small" onclick="location.href='m_detail?num=${rList.room_no}'">다시 예약</button>&nbsp;
 	</div>
  </div>
</div>
</c:forEach>


</body>
</html>