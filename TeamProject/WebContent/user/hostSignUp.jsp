<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {	
		$("#btn_submit").attr("disabled",true);		
		
		$("input[name='host_id']").keyup(function(){
			$("#btn_submit").attr("disabled",true);
			$("#host_id_check").attr("disabled",false);
			$("#p_alert").text("");
		});		
		
		$("#host_id_check").click(function(){
			
			var flag = -1;		
			var host_id = $("input[name='host_id']").val();
			var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);			
			
			if(!getCheck.test(host_id) || host_id ==""){
				alert("형식에 맞게 입력해주세요!");
				$("input[name='host_id']").focus();
				 return false;
			}	
			
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
		
		
		
	});
	
	function host_signup() {
		//action="../HostSignUpController.do"
		alert("클릭");
		
		var pass = $("input[name='host_pass']").val();
		var pass_ck = $("input[name='host_pass_ck']").val(); 
		var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);		
		var getCheckphone= RegExp(/^[0-9]{10,11}$/);
		
		if(!getCheck.test(pass) || pass ==""){
			alert("비밀번호 형식에 맞게 입력해주세요!");
			 $("input[name='host_pass']").focus();
			 return false;
		}
		
		if($("input[name='host_name']").val()==""){
			alert("닉네임을 입력해주세요");
			$("input[name='host_name']").focus();
			return false;			
		}
		
		if(!getCheckphone.test($("input[name='host_phone']").val()) || $("input[name='host_phone']").val()==""){
			alert("전화번호를 형식에 맞게 입력해주세요");
			$("input[name='host_phone']").focus();
			return false;
		}
		if(pass != pass_ck){
			alert("비밀번호가 다릅니다.");
			$("input[name='host_pass']").focus();
			return false;			
		}
		
		if(!$("input[name='point_ck']").is(":checked")){
			alert("포인트 통합을 체크 해주세요");
			$("input[name='point_ck']").focus();
			return false;
		}		
		
		
		document.host_form.action = "../HostSignUpController.do";
		document.host_form.submit();	
		
	}
	
</script>
</head>
<body>
<!-- 최상단 네비 바 시작 -->
<jsp:include page="../Top.jsp" flush="false"/>
<!-- 최상단 네비 바 종료 -->
<!-- 본문 시작 -->
 <form  method="post" name="host_form">
	<div class="w3-container w3-margin-top">
		<div class="w3-row w3-margin-top"></div>
		<div class="w3-row w3-margin-top"></div>
		<div class="w3-row w3-margin-top"></div>	
		<div class="w3-row w3-margin-top"></div>
		<h1 class="w3-center  w3-margin-top"><b>SS</b> share space 호스트 회원 가입</h1>
		
		<div class="w3-row w3-margin-top"></div>
		<div class="w3-row w3-margin-top">
			<div class="w3-col m4 "><p> </p></div>		
			<div class="w3-col m4 w3-orange w3-left">
				<p>&nbsp;&nbsp;&nbsp;<i class="w3-xxlarge fa fa-star"></i></p> 
			</div>
			<div class="w3-col m4"><p> </p></div>
		</div>
		<div class="w3-row w3-margin-top">
			<div class="w3-col m4"><p> </p></div>		
			<div class="w3-col m3 ">
				 <input type="text" class="w3-input" placeholder="호스트 아이디" name="host_id">
			</div>
			<div class="w3-col m1">
				<button type="button" class="w3-button w3-white w3-border w3-border-red w3-round-large" id="host_id_check">중복확인</button>
			</div>
			<div class="w3-col m4"><p> </p></div>
		</div>		
		<div class="w3-row">
			<div class="w3-col m4"><p> </p></div>
			<div class="w3-col m4"><small>● 호스트는 로그인 아이디가 필요합니다.</small></div>
			<div class="w3-col m4"><p> </p></div>
		</div>
		<div class="w3-row" >
			<div class="w3-col m4"><p> </p></div>	
			<div class="w3-col m4" id="p_alert"></div>
			<div class="w3-col m4"><p> </p></div>	
		</div>
		
		<div class="w3-row w3-margin-top"></div>
		<div class="w3-row w3-margin-top">
			<div class="w3-col m4 "><p> </p></div>		
			<div class="w3-col m4 w3-orange w3-left">
				<p>&nbsp;&nbsp;&nbsp;<i class="w3-xxlarge fa fa-envelope"></i></p> 
			</div>
			<div class="w3-col m4"><p> </p></div>
		</div>
		<div class="w3-row w3-margin-top">
			<div class="w3-col m4"><p> </p></div>		
			<div class="w3-col m4 ">
				 <input type="text" class="w3-input" placeholder="이메일" name="email" disabled="disabled" value="${sessionScope.udto.email }">
			</div>
			<div class="w3-col m4"><p> </p></div>
		</div>
		
		<div class="w3-row w3-margin-top"></div>
		<div class="w3-row w3-margin-top">
			<div class="w3-col m4 "><p> </p></div>		
			<div class="w3-col m4 w3-orange w3-left">
				<p>&nbsp;&nbsp;&nbsp;<i class="w3-xxlarge fa fa-user"></i></p> 
			</div>
			<div class="w3-col m4"><p> </p></div>
		</div>
		<div class="w3-row w3-margin-top">
			<div class="w3-col m4"><p> </p></div>		
			<div class="w3-col m4 ">
				 <input type="text" class="w3-input" placeholder="닉네임" name="host_name">
			</div>
			<div class="w3-col m4"><p> </p></div>
		</div>
		<div class="w3-row">
			<div class="w3-col m4"><p> </p></div>
			<div class="w3-col m4"><small>● 호스트는 닉네임이 필요합니다(의미있는 이름으로 정해주세요)</small></div>
			<div class="w3-col m4"><p> </p></div>
		</div>
		
		<div class="w3-row w3-margin-top"></div>
		<div class="w3-row w3-margin-top">
			<div class="w3-col m4 "><p> </p></div>		
			<div class="w3-col m4 w3-orange w3-left">
				<p>&nbsp;&nbsp;&nbsp;<i class="w3-xxlarge fa fa-phone"></i></p> 
			</div>
			<div class="w3-col m4"><p> </p></div>
		</div>
		<div class="w3-row w3-margin-top">
			<div class="w3-col m4"><p> </p></div>		
			<div class="w3-col m4">
				 <input type="text" class="w3-input" placeholder="핸드폰" name="host_phone" maxlength="11" >
			</div>
			<div class="w3-col m4"><p> </p></div>
		</div>
		<div class="w3-row">
			<div class="w3-col m4"><p> </p></div>
			<div class="w3-col m4"><small>● 호스트는 예약회원과의 연락하기위한 전화번호가 필요합니다.</small></div>
			<div class="w3-col m4"><p> </p></div>
		</div>
		
				
		<div class="w3-row w3-margin-top"></div>
		<div class="w3-row w3-margin-top">
			<div class="w3-col m4 "><p> </p></div>		
			<div class="w3-col m4 w3-orange w3-left">
				<p>&nbsp;&nbsp;&nbsp;<i class="w3-xxlarge fa fa-unlock-alt"></i></p> 
			</div>
			<div class="w3-col m4"><p> </p></div>
		</div>
		<div class="w3-row w3-margin-top">
			<div class="w3-col m4"><p> </p></div>		
			<div class="w3-col m4">
				 <input type="password" class="w3-input" placeholder="비밀번호" name="host_pass">
			</div>
			<div class="w3-col m4"><p> </p></div>
		</div>
		<div class="w3-row">
			<div class="w3-col m4"><p> </p></div>
			<div class="w3-col m4">
				<small>● 호스트 로그인시 필요한 비밀번호 입니다.(4자이상 영문숫자 조합으로 입력해 주세요)</small>
			</div>
			<div class="w3-col m4"><p> </p></div>
		</div>
		
		<div class="w3-row w3-margin-top"></div>
		<div class="w3-row w3-margin-top">
			<div class="w3-col m4 "><p> </p></div>		
			<div class="w3-col m4 w3-orange w3-left">
				<p>&nbsp;&nbsp;&nbsp;<i class="w3-xxlarge fa fa-unlock"></i></p> 
			</div>
			<div class="w3-col m4"><p> </p></div>
		</div>
		<div class="w3-row w3-margin-top">
			<div class="w3-col m4"><p> </p></div>		
			<div class="w3-col m4">
				 <input type="password" class="w3-input" placeholder="비밀번호 확인" name="host_pass_ck">
			</div>
			<div class="w3-col m4"><p> </p></div>
		</div>
		
		<div class="w3-row w3-margin-top"></div>
		<div class="w3-row w3-margin-top">
			<div class="w3-col m4 "><p> </p></div>		
			<div class="w3-col m4 w3-orange w3-left">
				<p>&nbsp;&nbsp;&nbsp;<i class="w3-xxlarge far fa-credit-card"></i></p> 
			</div>
			<div class="w3-col m4"><p> </p></div>
		</div>
		<div class="w3-row w3-margin-top">
			<div class="w3-col m4"><p> </p></div>		
			<div class="w3-col m4">
				 <input type="text" class="w3-input" placeholder="포인트" name="point" disabled="disabled" value="${sessionScope.udto.point }">
			</div>
			<div class="w3-col m4"><p> </p></div>
		</div>
		<div class="w3-row w3-margin-top">
			<div class="w3-col m4"><p> </p></div>		
			<div class="w3-col m4">
				 <input type="checkbox" class="w3-check" name="point_ck"> 포인트 통합하기(필수)
			</div>
			<div class="w3-col m4"><p> </p></div>
		</div>
		<div class="w3-row">
			<div class="w3-col m4"><p> </p></div>
			<div class="w3-col m4">
				<small>● 호스트 회원은 회원 포인트와 호스트 포인트를 통합해야 합니다.</small>
			</div>
			<div class="w3-col m4"><p> </p></div>
		</div>
		
		<div class="w3-row w3-margin-top"></div>
		<div class="w3-row w3-margin-top">
			<div class="w3-col m4"><p> </p></div>		
			<div class="w3-col m4">
				 <input type="button" id="btn_submit" class="w3-button w3-block w3-red" value="호스트 가입하기" onclick="host_signup()">
			</div>
			<div class="w3-col m4"><p> </p></div>
		</div>	
		
		<div class="w3-row w3-margin-bottom"></div>
		<div class="w3-row w3-margin-bottom"></div>
		<div class="w3-row w3-margin-bottom"></div>
		<div class="w3-row w3-margin-bottom"></div>
		<div class="w3-row w3-margin-bottom"></div>
		<hr>			
	</div>
 </form>
<!-- 본문 종료 -->
</body>
</html>