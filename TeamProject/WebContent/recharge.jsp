<!-- 값 충전은 submit하는데 모달창으로 띄워서 할게 아닌것 같은데 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="css/recharge.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 

<!-- 구글 폰트 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<head>
<script type="text/javascript">
	/*나중에 콤마 제거(참고) 값.replace(/,/g, '');*/
	
	
	/*다른 금액 입력 창 열기*/
	function openUnfixedPrice(){
// 		document.getElementById('unfixedPrice').style.visibility='visible';
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
// 				$('#selectedPrice').val(price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '원');
				$('#selectedPrice').val(price);
// 				$('#totalPrice').val((blance+price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
				$('#totalPrice').val(blance+price);
				
				// 입력 창 없애기
// 				document.getElementById('unfixedPrice').style.visibility='hidden';
				document.getElementById('unfixedPrice').style.display='none';
			}
	}
	
	
	/*선택한 충전 금액 전달*/
	$(document).ready(function() {
		$('.fixed').click(function() {
// 			document.getElementById('unfixedPrice').style.visibility='hidden';
			document.getElementById('unfixedPrice').style.display='none';
			var blance = Number($('#balance').val());
// 			alert(blance);
			var price = Number($(this).val());
// 			$('#selectedPrice').val(price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '원');// 콤마 넣어서 전달
// 			$('#totalPrice').val((blance+price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			
			$('#selectedPrice').val(price);// 콤마 넣어서 전달
			$('#totalPrice').val(blance+price);
			
		});
	});
	
	
	</script>
</head>

<body>
<!-- 충전 만 -->
	<div class="w3-container">
		
		<button	onclick="document.getElementById('recharge').style.display='block'"
			class="w3-button w3-black">충전하기
		</button>

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
					<form action="#" method="post">
					<%String price = "10000"; %>
						<div id="display">
							<p align="right"> 
							현재 잔액 : <span class="display"><input type="text" size="5" id="balance"  class="w3-border-0" value="<%=price %>" readonly>원</span><br/>
							충전 금액 : <span class="display"><input type="text" size="5" id="selectedPrice" class="w3-border-0" readonly>원</span><br/>
							충전 후 예상 잔액 : <span class="display"><input type="text" size="5" id="totalPrice"  class="w3-border-0" value="<%=price %>" readonly>원</span>
							</p>
						</div>
						<input type="submit" value="충전하기" class="w3-button w3-round w3-center" id="rechargeSubmit" >
					</form>	
				</footer>		
				
				
			</div><!-- modal content -->
		</div><!-- modal -->
	
	</div>


 
</body>
</html> 
