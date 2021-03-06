<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- 구글 폰트 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="../css/recharge.css" rel="stylesheet">
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<style type="text/css"></style> 
<script type="text/javascript">	
	var flag=0;
	
	$(document).ready(function() {			
		
		
		$("#host_id").keyup(function(){
			$("#btn_submit").attr("disabled",true);
			$("#host_id_check").attr("disabled",false);
			$("#p_alert").text("");
		});		
		
		 
		$("#host_id_check").click(function(){	 
			var flag = -1;		
			var host_id = $("#host_id").val();
			var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
			
			$("#btn_submit").attr("disabled",true);
			
			
			if(!getCheck.test(host_id) || host_id ==""){
				alert("형식에 맞게 입력해주세요!");
				 $("#host_id").focus();
				 return false;
			}
			
			if(host_id == "${sessionScope.hdto.host_id }"){
				alert("현재 아이디와 동일합니다.");
				 $("#host_id").focus();
				 $("#btn_submit").attr("disabled",true);
				 return false;
			}
			
			
			alert("통과");
			//ID정규표현식을 이용하여 입력한 ID값이 맞을 경우(통과)
			$.ajax({
				type : "POST",
				url  : "../HostIdCheck.do",
				data: {"host_id": host_id}, //{parameterName, data} 형식
				success: function(result){					
					flag = result;		  	
					
					if(flag==0){
						$("#p_alert").text("*등록된 아이디가 존재 합니다");
						$("#p_alert").css("color","red");
						$("#btn_submit").attr("disabled",true);
						 return false;
					}else if(flag==-1){
						$("#p_alert").text("*사용 가능한 아이디입니다.");
						$("#p_alert").css("color","blue");
						$("#btn_submit").attr("disabled",false);
						$("#host_id_check").attr("disabled",true);
						 return false;
					}		 		
					
				}
			});// ajax 끝	
	
		}); // 중복 체크버튼 이벤트 끝		
		 
		 $("#passwd_chage").click(function(){			
			 $("input[name='passwd']").val("");
			 $("input[name='passwd']").attr("disabled",false);
			 $("input[name='passwd_ch']").attr("disabled",false);
			 $("input[name='passwd_check']").attr("disabled",false);
			 flag=1;
		 });
		
	}); /*  ready 종료 */	
	
	function func_check(){				
		var txt_passwd = $("input[name='host_pass']").val();
		var txt_passwd_ch = $("input[name='passwd_ch']").val();
		var txt_passwd_check = $("input[name='passwd_check']").val();
		// 비밀번호 유효성 검증
		var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
		
		if(flag==1){			
			
			if( "${sessionScope.hdto.host_pass}" != txt_passwd){
				alert("현재 비밀번호가 다릅니다.");
				$("input[name='host_pass']").focus();
				return false;
			}
			
			if(!getCheck.test(txt_passwd_ch) || txt_passwd_ch==""){
				alert("형식에 맞게 입력해주세요");
				$("input[name='passwd_ch']").focus();
				return false;				
			}
			
			if(txt_passwd == txt_passwd_ch){
				alert("현재 비밀번호와 동일합니다.");
				$("input[name='passwd_ch']").focus();
				return false;
			}
			
			if(txt_passwd_ch != txt_passwd_check){
				alert("변경비밀번호가 일치하지 않습니다.");
				$("input[name='passwd_check']").focus();
				return false;
			}
		}
		
		// 유효성이 완료되면 전송
		document.form_hostProfile.submit();
		
	}
		
	
	
</script>
</head>
<body>
<div class="w3-container">
	<div class="w3-row">				
		<div class="w3-col m8 w3-orange w3-left">
			<p>&nbsp;&nbsp;&nbsp;<i class="w3-xxlarge  fa fa-star"></i>&nbsp;&nbsp;&nbsp;호스트 프로필 수정</p> 
		</div>		
	</div>
	<!-- 정보 수정 시작 -->
	<form action="../HostProfileUpdateController.do" method="post" name="form_hostProfile">	
	<div class="w3-row w3-margin-top" ></div>
	<div class="w3-row" >								
		<div class="w3-col m8">
			호스트 아이디
		</div>
		<div class="w3-col m4"></div>
	</div>
	<div class="w3-row" >								
		<div class="w3-col m6">
			<input type="text" id="host_id" class="w3-input" placeholder="email" name="host_id" value="${sessionScope.hdto.host_id }">
		</div>
		<div class="w3-col m2">
			<button type="button" class="w3-button w3-white w3-border w3-border-red w3-round-large" id="host_id_check">중복확인</button>	
		</div>
		<div class="w3-col m4"></div>
	</div>
	<div class="w3-row">								
		<div class="w3-col m8">
			<small>● 호스트 아이디 변경은 일반계정과는 무관합니다. </small>
		</div>	
		<div class="w3-col m4"></div>
	</div>
	<div class="w3-row" >
		<div class="w3-col m12" id="p_alert"></div>
	</div>
	
	<div class="w3-row w3-margin-top" ></div>
	<div class="w3-row" >								
		<div class="w3-col m8">
			호스트 닉네임
		</div>
		<div class="w3-col m4"></div>
	</div>
	<div class="w3-row" >								
		<div class="w3-col m8">
			<input type="text"  class="w3-input" placeholder="닉네임" name="host_nic" value="${sessionScope.hdto.host_nic }">
		</div>
		<div class="w3-col m4"></div>
	</div>	
	<div class="w3-row">								
		<div class="w3-col m8">
			<small>● 예약 회원들에게 보여질 닉네임 입니다. </small>
		</div>
		<div class="w3-col m4"></div>
	</div>
	
	<div class="w3-row w3-margin-top" ></div>
	<div class="w3-row" >								
		<div class="w3-col m8">
			호스트 휴대전화 번호
		</div>
		<div class="w3-col m4"></div>
	</div>
	<div class="w3-row" >								
		<div class="w3-col m8">
			<input type="text"  class="w3-input" placeholder="휴대전화 번호" name="host_phone" value="${sessionScope.hdto.host_phone }" maxlength="11">
		</div>
		<div class="w3-col m4"></div>
	</div>	
	<div class="w3-row">								
		<div class="w3-col m8">
			<small>● 예약 회원들에게 제공될 전화번호 입니다. </small>
		</div>
		<div class="w3-col m4"></div>
	</div>
	
	<div class="w3-row w3-margin-top" ></div>
	<div class="w3-row" >								
		<div class="w3-col m8">
			비밀번호
		</div>
		<div class="w3-col m4"></div>
	</div>
	<div class="w3-row" >								
		<div class="w3-col m6">
			<input type="password" class="w3-input" placeholder="현재 비밀번호" name="host_pass" value="${sessionScope.hdto.host_pass }" disabled="disabled">
		</div>
		<div class="w3-col m2">	
			<button type="button" class="w3-button w3-white w3-border w3-border-red w3-round-large" id="passwd_chage">비밀번호 변경</button>			
		</div>
		<div class="w3-col m4"></div>
	</div>
	<div class="w3-row">								
		<div class="w3-col m8">
			<small>● 호스트 비밀번호 입니다.</small>
		</div>
		<div class="w3-col m4"></div>
	</div>
	<div class="w3-row" >								
		<div class="w3-col m8">
			<input type="password" class="w3-input" placeholder="변경 비밀번호" name="passwd_ch" disabled="disabled">
		</div>
		<div class="w3-col m4"></div>
	</div>
	<div class="w3-row">								
		<div class="w3-col m8">
			<small>● 변경할 비밀 번호를 입력해 주세요(4자~12자 사이의 영문으로 입력)</small>
		</div>
		<div class="w3-col m4"></div>
	</div>
	<div class="w3-row" >								
		<div class="w3-col m8">
			<input type="password" class="w3-input" placeholder="변경 비밀번호 확인" name="passwd_check" disabled="disabled">
		</div>
		<div class="w3-col m4"></div>
	</div>
	<div class="w3-row">								
		<div class="w3-col m8">
			<small>● 변경할 비밀 번호를 다시 한번 입력해 주세요</small>
		</div>
		<div class="w3-col m4"></div>
	</div>
	<div class="w3-row w3-margin-top" ></div>
	<div class="w3-row">
		<div class="w3-col m8">	
			<input type="button" id="btn_submit" class="w3-button w3-block w3-red" value="저 장" onclick="func_check()">
		</div>	
	</div>
	</form>
	<!-- 정보 수정 끝-->
	<!-- 내 포인트 시작 -->
	<div class="w3-row w3-margin-top" ></div>
	<div class="w3-row w3-margin-top" ></div>
	<div class="w3-row w3-margin-top" ></div>
	<div class="w3-row w3-margin-top" ></div>
	<div class="w3-row">				
		<div class="w3-col m8 w3-orange w3-left">
			<p>&nbsp;&nbsp;&nbsp;<i class="w3-xxlarge far fa-credit-card"></i>&nbsp;&nbsp;&nbsp;내 포인트</p> 
		</div>		
	</div>
	<div class="w3-row" >								
		<div class="w3-col m7">
			<input type="text" class="w3-input" placeholder="포인트" name="point" value="${sessionScope.point }" disabled="disabled">
		</div>
		<div class="w3-col m1"><p><small>POINT</small>(원)<p></div>
		<div class="w3-col m4"></div>
	</div>
	<div class="w3-row">
		<div class="w3-col m8">	
			<input type="submit" class="w3-button w3-block w3-red"  onclick="document.getElementById('recharge').style.display='block'" value="포인트 충전 하기">
		</div>	
	</div>
</div>	
<!-- 모달창 시작 -->
<div id="recharge" class="w3-modal">
			<div class="w3-modal-content w3-card-4 w3-animate-top w3-light-grey"	id="rechargeModal">
				<header class="w3-container w3-black w3-border-bottom">
					<span onclick="document.getElementById('recharge').style.display='none'
					"class="w3-button w3-black w3-large w3-display-topright">&times;</span>
					<h5 class="w3-center"><b>캐쉬 충전</b></h5>
				</header>
				<div class="w3-container w3-padding w3-border-bottom">
					<p><b>충전 금액</b></p>
					<!-- 충전 금액 선택 창 -->
					<div class="w3-row-padding w3-light-grey" id="priceSelectSec" style="padding:5px;">		
						<span class="w3-third">
							<label for="one" class="w3-button w3-round w3-border w3-padding-small">1만원</label>
							<input type="radio" name="price" id="one" class="price fixed" value="10000">
						</span>
						<span class="w3-third">
							<label for="three" class="w3-button w3-round w3-border w3-padding-small">3만원</label>
							<input type="radio" name="price" id="three" class="price fixed" value="30000">
						</span>
						<span class="w3-third">
							<label for="five" class="w3-button w3-round w3-border w3-padding-small">5만원</label>
							<input type="radio" name="price" id="five" class="price fixed" value="50000">
						</span>
						<span class="w3-third">
							<label for="seven" class="w3-button w3-round w3-border w3-padding-small">7만원</label>
							<input type="radio" name="price" id="seven" class="price fixed" value="70000">
						</span>
						<span class="w3-third">
							<label for="ten" class="w3-button w3-round w3-border w3-padding-small">10만원</label>
							<input type="radio" name="price" id="ten" class="price fixed" value="100000">
						</span>
						<span class="w3-third">
							<label for="choice" class="w3-button w3-round w3-border w3-padding-small">다른금액</label>
							<input type="radio" name="price" id="choice" class="price" onclick="openUnfixedPrice()">
						</span>
					</div>
					
					<div id="unfixedPrice"  style="display:none; text-align: right">
						<small>1만원부터 50만원까지 충전 가능합니다.</small>
						<input type="text" id="writtenPrice" class="w3-border-0" placeholder="1만원 단위로 입력" >만원
						<input type="button" class="w3-button w3-round w3-padding-small w3-border w3-small" value="확인" onclick="setprice()">
					</div>
					
					<p><b>결제 수단</b></p>
					
					<input type="radio" name="rechargeMethod" id="creditCard">
					<label for="creditCard">신용카드</label>
					<input type="radio" name="rechargeMethod" id="transfer">
					<label for="transfer">실시간 계좌이체</label>
					<input type="radio" name="rechargeMethod" id="paypal">
					<label for="paypal">Paypal</label>
					
				</div><!-- container -->
				<footer class="w3-white w3-padding">
					<form action="../RechargeController.do" method="post" onSubmit="return CheckMethod();">
					<input type="hidden" name="email" value="${sessionScope.hdto.email }"><!-- jstl di 처리-->					
						<div id="display">
							<p align="right"> 
							현재 잔액 : <span class="display"><input type="text" size="5" id="balance"  class="w3-border-0" value="${sessionScope.point }" readonly>원</span><br/>
							충전 금액 : <span class="display"><input type="text" size="5" id="selectedPrice" class="w3-border-0" readonly>원</span><br/>
							충전 후 예상 잔액 : <span class="display"><input type="text" size="5" id="totalPrice"  name="addedPoint" class="w3-border-0" value="${sessionScope.point }" readonly>원</span>
							</p>
						</div>
						<input type="submit" value="충전하기" class="w3-button w3-round w3-center" id="rechargeSubmit" >
					</form>	
				</footer>		
				
				
			</div><!-- modal content -->
		</div><!-- modal -->
<!-- 모달창 종료 -->	
<script type="text/javascript">
/*나중에 콤마 제거(참고) 값.replace(/,/g, '');*/


/*다른 금액 입력 창 열기*/
function openUnfixedPrice(){
//		document.getElementById('unfixedPrice').style.visibility='visible';
	document.getElementById('unfixedPrice').style.display='block';
	$('#writtenPrice').focus();
}

/*다른 금액 입력 값 확인 후 전달*/
function setprice(){
	var price = document.getElementById('writtenPrice').value;
	var numberRange = /(^[1-9]{1}$|^[1-4]{1}[0-9]{1}$|^50$)/gm;
		if(!numberRange.test(price)){// 숫자 이외의 문자열을 입력 한 경우
			alert('1-50범위의 숫자만 기입 가능합니다');
			$('#writtenPrice').val('');// 값을 지우고
			$('#writtenPrice').focus();// 포커스
		}else{//값을 받아와서 충전 금액에 셋팅하고, 충전 후 예상 잔액 값 셋팅
			// 현재 잔액 받아와서 숫자 형식으로 변환
			var blance = Number($('#balance').val());
			
			// 입력 한 값 숫자 형식으로 변환
			price = Number(price)*10000;
			
				
			//셋팅
//				$('#selectedPrice').val(price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '원');
			$('#selectedPrice').val(price);
//				$('#totalPrice').val((blance+price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			$('#totalPrice').val(blance+price);
			
			// 입력 창 없애기
//				document.getElementById('unfixedPrice').style.visibility='hidden';
			document.getElementById('unfixedPrice').style.display='none';
		}
}


/*선택한 충전 금액 전달*/
$(document).ready(function() {
	$('.fixed').click(function() {
//			document.getElementById('unfixedPrice').style.visibility='hidden';
		document.getElementById('unfixedPrice').style.display='none';
		var blance = Number($('#balance').val());
//			alert(blance);
		var price = Number($(this).val());
//			$('#selectedPrice').val(price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '원');// 콤마 넣어서 전달
//			$('#totalPrice').val((blance+price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
		
		$('#selectedPrice').val(price);// 콤마 넣어서 전달
		$('#totalPrice').val(blance+price);
		
	});
});


/*최종 확인*/
function CheckMethod(){
//		alert("1");
	var price = $('#selectedPrice').val();
	var method = $(':input[name=rechargeMethod]:radio:checked').val();
//		alert(price);
	if(price == ""){
		alert('충전 금액을 선택 해주세요');
		return false;
	}

	if(method == null){
		alert('결제 수단을 선택 해주세요');
		return false;
	}
}


</script>
</body>
</html>