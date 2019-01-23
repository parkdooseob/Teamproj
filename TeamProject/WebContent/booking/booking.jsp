<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
	border: 1px solid white;
	margin-top: 55px;	
}
.div_left{
	border: 1px solid white;
	padding : 25px;
	
}
.div_right{		
	padding : 25px;	
}
.div_hr{
	margin:10px 0;
}
.div_sticky{
	position: sticky;
	top: 55px;	
}

small{
	/* border: 1px solid white; */
}
.div_table{

	border-left : 1px solid grey;	
	border-right: 1px solid grey;
	border-bottom: 1px solid grey;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("#chk_1").click(function(){
			if($("#chk_1").is(":checked")){
				$("#div_add1").append("<div class='w3-row'><div class='w3-col m6'>	주차 :</div><div class='w3-col m6' align='right'>1000원</div></div>");	
			}else{
				$("#div_add1").empty();
				
			}
						
		});
		$("#chk_2").click(function(){
			if($("#chk_2").is(":checked")){
				$("#div_add2").append("<div class='w3-row'><div class='w3-col m6'>	무선인터넷 :</div><div class='w3-col m6' align='right'>1000원</div></div>");	
			}else{
				$("#div_add2").empty();
				
			}
						
		});
		$("#chk_3").click(function(){
			if($("#chk_3").is(":checked")){
				$("#div_add3").append("<div class='w3-row'><div class='w3-col m6'>	빔프로젝트 :</div><div class='w3-col m6' align='right'>1000원</div></div>");	
			}else{
				$("#div_add3").empty();
				
			}
						
		});
		$("#chk_4").click(function(){
			if($("#chk_4").is(":checked")){
				$("#div_add4").append("<div class='w3-row'><div class='w3-col m6'>	컴퓨터 :</div><div class='w3-col m6' align='right'>1000원</div></div>");	
			}else{
				$("#div_add4").empty();
				
			}
						
		});
		$("#chk_5").click(function(){
			if($("#chk_5").is(":checked")){
				$("#div_add5").append("<div class='w3-row'><div class='w3-col m6'>	사물함 :</div><div class='w3-col m6' align='right'>1000원</div></div>");	
			}else{
				$("#div_add5").empty();
				
			}
						
		});
			
		
	});
	
</script>
</head>
<body>
<!-- 앞페이지에서 넘어올 파라미터 값 -->
<c:set var="book_date" value="${book_date }"/> <!-- 체크인 날짜 -->
<c:set var="book_time" value="${book_time }"/> <!-- 체크인 시간 -->
<c:set var="total_price" value="${total_price }"/> <!-- 총 금액 -->
<c:set var="room_no" value="${room_no }"/> <!-- 룸번호 -->
<!-- t10 ~ t21 시간 값 -->
<!-- 최상단 네비 바 시작 -->
<jsp:include page="../Top.jsp" flush="false"/>
<!-- 최상단 네비 바 종료 -->
<!-- 본문 시작 -->
	<form action="">		
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
						<h5>예약시간</h5>
					</div>
				</div>
				<hr>
				<div class="w3-row">
					<div class="w3-col m12">
						<h5>유료 부대시설</h5>
						<input type="checkbox" id="chk_1" class="w3-check" value="1"><b> 주차</b> &nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox" id="chk_2" class="w3-check" value="1"><b> 무선 인터넷</b>  &nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox" id="chk_3" class="w3-check" value="1"><b> 빔 프로젝트</b>  &nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox" id="chk_4" class="w3-check" value="1"><b> 컴퓨터</b>  &nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox" id="chk_5" class="w3-check" value="1"><b> 사물함</b>  &nbsp;&nbsp;&nbsp;&nbsp;
						<p>각 유료 부대시설은 각각의 요금이 다르며 해당 가격 표는 아래와 같습니다.</p>
						<p>주차 : 1000원</p>
						<p>무선 인터넷 : 1000원</p>
						<p>빔 프로젝트 : 1000원</p>
						<p>컴퓨터 : 1000원</p>
						<p>사물함 : 1000원</p>
						
					</div>
				</div>
				<hr>
				<div class="w3-row">
					<div class="w3-col m12">
						<h5>취소 및 환불 규정</h5>
						<div class="w3-col m6 w3-dark-grey" align="center">
							<h6>취소 기준일</h6>
						</div>
						<div class="w3-col m6 w3-dark-grey" align="center">
							<h6>취소 수수료</h6>
						</div>
						<div class="w3-col m6 div_table" align="center">
							<h6>입실 1일 전</h6>
						</div>
						<div class="w3-col m6 div_table" align="center">
							<h6>없음</h6>
						</div>
						<div class="w3-col m6 div_table" align="center">
							<h6>당일</h6>
						</div>
						<div class="w3-col m6 div_table" align="center">
							<h6>환불 불가</h6>
						</div>
						<div class="w3-col m12 w3-margin-top">
							● 취소 규정이 적용되는 기준은 체크인 입니다.
						</div>
						<div class="w3-col m12">
							● 취소 수수료는 판매금액을 기준으로 계산 됩니다.
						</div>
											
					</div>
				</div>
				<hr>
				<div class="w3-row">
					<h5>필수 입력사항</h5>
					<div class="w3-row">
						<div class="w3-col m2">
							<p>이메일</p>
						</div>
						<div class="w3-col m4">
							<input type="text" class="w3-input" placeholder="예약자 이메일" name="email" value="" disabled="disabled">
						</div>
					</div>
					<div class="w3-row">
						<div class="w3-col m2">
							<p>휴대 전화</p>
						</div>
						<div class="w3-col m4">
							<input type="password" class="w3-input" placeholder="예약자 전화번호" name="book_phone" value="">
						</div>
						<div class="w3-col m3" align="right">
							<button type="button" class="w3-button w3-white w3-border w3-border-red w3-round-large" id="phone_check">인증번호 전송</button>
						</div>
					</div>
					<div class="w3-row">
						<div class="w3-col m2">
							<p></p>
						</div>
						<div class="w3-col m10">
							<small>● 입력한 휴대전화 번호는 안심번호로 변경되어 호스트에게 전달 됩니다.</small>
						</div>						
					</div>					
					<div class="w3-row w3-margin-top">
						<div class="w3-col m2">
							<p> </p>
						</div>
						<div class="w3-col m4">
							<input type="password" class="w3-input" placeholder="인증번호" name="book_phone" value="">
						</div>
						<div class="w3-col m2" align="right">
							<button type="button" class="w3-button w3-white w3-border w3-border-red w3-round-large" id="phone_check">확인</button>
						</div>
					</div>
				</div>
				<hr>
				<div class="w3-row">
					<div class="w3-col m12">
						<h5>공지 사항</h5>
						<p><small>● 해당 공간의 호스트 사정으로 인한 취소 발생시 100% 환불 가능 합니다.</small></p>
						<p><small>● 해당 공간의 호스트 사정으로 객실 정보가 수시로 변경될 수 있습니다. 이로인한 불이익은 당사가 책임지지 않습니다.</small></p>
					</div>
				</div>
				<hr>				
			</div>
			<div class="div_sticky">		
				<div class="w3-col m3 div_right w3-dark-grey w3-margin-bottom">
					<div class="w3-row">					
						<div class="w3-col m12">							
							<h5>예약일</h5>
						</div>	
						<div class="w3-col m12">
							<font size="10px"><b>2019-01-31</b></font>
						</div>							
						<div class="w3-col m12">
						<hr>
						</div>
						<div class="w3-col m6">
							<small>예약시간</small>
						</div>
						<div class="w3-col m6" align="right">	
							<small>1 시간</small>
						</div>
					</div>
				</div>			
				<div class="w3-col m3 div_right w3-dark-grey">
					<div class="w3-row">					
						<div class="w3-col m6">						
							예약 인원
						</div>
						<div class="w3-col m6" align="right">						
							1
						</div>												
					</div>
					<hr>
					<div class="w3-row">					
						<div class="w3-col m6">						
						   <h4>보유 포인트</h4> 
						</div>
						<div class="w3-col m6" align="right">						
							<h3>-100000</h3>
						</div>												
					</div>
					
					<hr>
					<div class="w3-row">					
						<div class="w3-col m6">						
							<h6>옵션</h6>
						</div>
						<div class="w3-col m6" align="right">						
						</div>												
					</div>					
					<div id="div_add1"></div>
					<div id="div_add2"></div>
					<div id="div_add3"></div>
					<div id="div_add4"></div>
					<div id="div_add5"></div>									
					
					<hr>
					<div class="w3-row">					
						<div class="w3-col m6">						
							<h3><font color="red">결제금액</font></h3>
						</div>
						<div class="w3-col m6" align="right">
							<h2><font color="red">40000</font></h2>						
						</div>												
					</div>
					
					
				</div>				
				<div class="w3-col m3">
					<div class="w3-row">
						<div class="w3-col m12">						
							 <input type="button" id="btn_submit" class="w3-button w3-block w3-xlarge w3-red" value="결제하기" onclick="">
						</div>
					</div>
				</div>				
				<div class="w3-col m2"><p> </p></div>			
			</div>
		</div>
	</form>	
<!-- 본문 종료 -->
</body>
</html>