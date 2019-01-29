<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://apis.google.com/js/platform.js" async defer></script>
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

<script type="text/javascript">

$(document).ready(function(){
    //최상단 체크박스 클릭
    $("#chk-all").click(function(){
        //클릭되었으면
        if($("#chk-all").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=chk]").prop("checked",true);
            //클릭이 안되있으면
            $("#btn-next").prop("disabled", false);
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=chk]").prop("checked",false);
            $("#btn-next").prop("disabled", true);
        }
    });
   
   $("#chk-nec1").click(function(){
	   if($("#chk-nec1").prop("checked") && $("#chk-nec2").prop("checked")){
		   $("#btn-next").prop("disabled", false);
	   }else{
		   $("#btn-next").prop("disabled", true);
	   }
   });
   
   $("#chk-nec2").click(function(){
	   if($("#chk-nec1").prop("checked") && $("#chk-nec2").prop("checked")){
		   $("#btn-next").prop("disabled", false);
	   }else{
		   $("#btn-next").prop("disabled", true);
	   }
   });
   
	$( "#target1" ).load( "agreetext_service.txt" );
	$( "#target2" ).load( "agreetext_privacy.txt" );
	$( "#target3" ).load( "agreetext_location.txt" );  
    
});
</script>


<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../Top.jsp" flush="false"/>
	<div class="w3-container w3-margin-top">
		<div class="w3-row w3-margin-top"></div>
		<div class="w3-row w3-margin-top"></div>
		<div class="w3-row w3-margin-top"></div>	
		<div class="w3-row w3-margin-top"></div>
		<h1 class="w3-center  w3-margin-top">이용 약관 동의</h1>
		<div class="w3-row w3-margin-top"></div>
		<div class="w3-row w3-margin-top">
			<div class="w3-col m3 "><p> </p></div>		
			<div class="w3-col m6 w3-dark-grey w3-left">
				<p>&nbsp;&nbsp;<input type="checkbox" class="w3-check" name="chk" id="chk-nec1"> 서비스 이용 약관 동의(필수)</p> 
			</div>
			<div class="w3-col m3"><p> </p></div>
		</div>
		<div class="w3-row">
			<div class="w3-col m3"><p> </p></div>		
			<div class="w3-col m6 ">
				<textarea id="target1" rows="10" cols="20" style="width: 100%; overflow: scroll;" wrap="off" readonly="readonly"></textarea> 
			</div>
			<div class="w3-col m3"><p> </p></div>
		</div>
		<div class="w3-row w3-margin-top"></div>
		<div class="w3-row w3-margin-top">
			<div class="w3-col m3 "><p> </p></div>		
			<div class="w3-col m6 w3-dark-grey w3-left">
				<p>&nbsp;&nbsp;<input type="checkbox" class="w3-check" name="chk" id="chk-nec2"> 개인정보 수집/이용 약관 동의 (필수)</p> 
			</div>
			<div class="w3-col m3"><p> </p></div>
		</div>
		<div class="w3-row">
			<div class="w3-col m3"><p> </p></div>		
			<div class="w3-col m6 ">
				<textarea id="target2" rows="10" cols="20" style="width: 100%; overflow: scroll;" wrap="off" readonly="readonly"></textarea> 
			</div>
			<div class="w3-col m3"><p> </p></div>
		</div>
		<div class="w3-row w3-margin-top"></div>
		<div class="w3-row w3-margin-top">
			<div class="w3-col m3 "><p> </p></div>		
			<div class="w3-col m6 w3-dark-grey w3-left">
				<p>&nbsp;&nbsp;<input type="checkbox" class="w3-check" name="chk"> 위치 정보 이용 약관 동의 (선택)</p> 
			</div>
			<div class="w3-col m3"><p> </p></div>
		</div>
		<div class="w3-row">
			<div class="w3-col m3"><p> </p></div>		
			<div class="w3-col m6 ">
				<textarea id="target3" rows="10" cols="20" style="width: 100%; overflow: scroll;" wrap="off" readonly="readonly"></textarea> 
			</div>
			<div class="w3-col m3"><p> </p></div>
		</div>
		<div class="w3-row w3-margin-top"></div>
		<div class="w3-row w3-margin-top">
			<div class="w3-col m3 "><p> </p></div>		
			<div class="w3-col m6">
				<p>&nbsp;&nbsp;<input type="checkbox" class="w3-check" name="chk"> 마케팅 정보 수신 동의 (선택)</p>
				<p>&nbsp;&nbsp;<input type="checkbox" class="w3-check" id="chk-all"> 전체 선택 </p>  
			</div>
			<div class="w3-col m3"><p> </p></div>
		</div>		
		<div class="w3-row w3-margin-bottom">
			<div class="w3-col m3"><p> </p></div>		
			<div class="w3-col m6 ">
				<button class="w3-btn w3-block w3-teal" disabled="disabled" 
						id="btn-next" onclick="location.href='userSignUp.jsp'">다 음</button>
			</div>
			<div class="w3-col m3"><p> </p></div>
		</div>
		<div class="w3-row w3-margin-bottom"></div>
		<div class="w3-row w3-margin-bottom"></div>
		<div class="w3-row w3-margin-bottom"></div>
	</div>
	
</body>
</html>