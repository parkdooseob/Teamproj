<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="insertBoard.css">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55bb85418a60e0c25e4702007dc138fe&libraries=services"></script>



<!-- 날짜추가 script -->
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" /> 
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script> 
  <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script> 
  <link rel="stylesheet" href="/resources/demos/style.css"/>
<!-- 날짜 끝 --> 

<style type="text/css">


.Tbutton {
  background-color: white;
  color: black;
  border: 2px solid #555555;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  padding: 15px 32px;
}

</style>


<script>



$(function() {	
	
	
	var b1 , b2, b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13 ;
	
	b1 = 0; b2= 0; b3= 0; b4= 0; b5=0; b6=0; b7=0; b8=0; b9=0; b10=0; b11=0; b12=0; b13=0;
	
	
	
	$('.Tbutton').click(function(){
		
		
		if($(this).val() === '11:00'){
			if(b1 == 0){
				$(this).css('backgroundColor','#FFDCFF');
				b1++;
				document.getElementById('at11').value ='11:00';

			}else{
				$(this).css('backgroundColor','white');
				b1--;
				document.getElementById('at11').value ='';

			}	
			
		}else if($(this).val() === '12:00'){
			if(b2 == 0){
				$(this).css('backgroundColor','#FFDCFF');
				b2++;
				document.getElementById('at12').value ='12:00';

			}else{
				$(this).css('backgroundColor','white');
				b2--;
				document.getElementById('at12').value ='';

			}	
		}else if($(this).val() === '13:00'){
			if(b3 == 0){
				$(this).css('backgroundColor','#FFDCFF');
				b3++;
				document.getElementById('at13').value ='13:00';


			}else{
				$(this).css('backgroundColor','white');
				b3--;
				document.getElementById('at13').value ='';

			}	
		}else if($(this).val() === '14:00'){
			if(b4 == 0){
				$(this).css('backgroundColor','#FFDCFF');
				b4++;
				document.getElementById('at14').value ='14:00';

			}else{
				$(this).css('backgroundColor','white');
				b4--;
				document.getElementById('at14').value ='';

			}	
		}else if($(this).val() === '15:00'){
			if(b5 == 0){
				$(this).css('backgroundColor','#FFDCFF');
				b5++;
				document.getElementById('at15').value ='15:00';


			}else{
				$(this).css('backgroundColor','white');
				b5--;
				document.getElementById('at15').value ='';

			}	
		}else if($(this).val() === '16:00'){
			if(b6 == 0){
				$(this).css('backgroundColor','#FFDCFF');
				b6++;
				document.getElementById('at16').value ='16:00';


			}else{
				$(this).css('backgroundColor','white');
				b6--;
				document.getElementById('at16').value ='';

			}	
		}else if($(this).val() === '17:00'){
			if(b7 == 0){
				$(this).css('backgroundColor','#FFDCFF');
				b7++;
				document.getElementById('at17').value ='17:00';


			}else{
				$(this).css('backgroundColor','white');
				b7--;
				document.getElementById('at17').value ='';

			}	
		}else if($(this).val() === '18:00'){
			if(b8 == 0){
				$(this).css('backgroundColor','#FFDCFF');
				b8++;
				document.getElementById('at18').value ='18:00';


			}else{
				$(this).css('backgroundColor','white');
				b8--;
				document.getElementById('at18').value ='';

				
			}	
		}else if($(this).val() === '19:00'){
			if(b9 == 0){
				$(this).css('backgroundColor','#FFDCFF');
				b9++;
				document.getElementById('at19').value ='19:00';

			}else{
				$(this).css('backgroundColor','white');
				b9--;
				document.getElementById('at19').value ='';

			}	
		}else if($(this).val() === '20:00'){
			if(b10 == 0){
				$(this).css('backgroundColor','#FFDCFF');
				b10++;
				document.getElementById('at20').value ='20:00';


			}else{
				$(this).css('backgroundColor','white');
				b10--;
				document.getElementById('at20').value ='';

			}	
		}else if($(this).val() === '21:00'){
			if(b11 == 0){
				$(this).css('backgroundColor','#FFDCFF');
				b11++;
				document.getElementById('at21').value ='21:00';

			}else{
				$(this).css('backgroundColor','white');
				b11--;
				document.getElementById('at21').value ='';

			}	
		}else if($(this).val() === '22:00'){
			if(b12 == 0){
				$(this).css('backgroundColor','#FFDCFF');
				b12++;
				document.getElementById('at22').value ='22:00';

			}else{
				$(this).css('backgroundColor','white');
				b12--;
				document.getElementById('at22').value ='';

			}	
		}else if($(this).val() === '23:00'){
			if(b13 == 0){	
				$(this).css('backgroundColor','#FFDCFF');
				b13++;
				document.getElementById('at23').value ='23:00';


			}else{
				$(this).css('backgroundColor','white');
				b13--;
				document.getElementById('at23').value ='';

			}	
		}
		 
	
	});	
});
	
	
$( function() {
    var dateFormat = "mm/dd/yy",
      from = $( "#from" )
        .datepicker({
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 3
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = $( "#to" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 3
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
      });
 
    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
 
      return date;
    }
  } );


   
	var count =1;
    function fnElementCheck(f){
    	    	
    	
    	// 2번 form에 접근하여 form태그 내부에 있는 모든 input태그의 개수 구하기
    	// forms[] 배열 : <form>태그에 접근 방법
    	// elements : <form>태그 내부에 있는 모든 <input>태그들을 말함
    	var cnt = f.elements.length;
    	//var cnt = document.forms[1].elements.length;
    	
    	// 누락된 파일 업로드 위치를 나타낼 변수
    	var filecnt=1;
    	/* 
    		(보충)
    		2번 form에 저희는 업로드될 파일 개수를 사용자에 의해서 동적으로 입력 받기 때문에..
    		2번 form안의 for문을 이용하여<input type="file">태그가 동적으로 만들어진다.
    		동적으로 만들어진 <input type="file">태그중에서.. 업로드할 파일 경로를 지정하지 않은?
    		<input>태그가 있다면 "x번째 파일 정보가 누락 되었습니다."라고 경고 메시지창을 띄워줘야함.
    	
    	
    	*/
    	// for반복문을 이용하여..
    	// 2번 form 태그내부에 있는 <input>태그들의 갯수만큼 반복하는데..
    	for(i=0;i<cnt;i++){
    		// 조건 만약에 2번 form내부에 있는 <input>태그의 유형(type)이 file과 같고
    		if(f.elements[i].type == "file"){
    			// 조건 : 업로드할 파일을 선택하지 않은 경우?
    				if(f.elements[i].value == ""){
    					
    					//x번째 <input type="file">내용이 비었습니다 경고메세지!
    					var msg = filecnt + "번째 파일 정보가 누락 되었습니다. \n 올바른 선택을 해주세요";
    					alert(msg);
    					//포커스주기
    					f.elements[i].focus;
    					
    					return false; //for 반복문 끝내기
    				} //안쪽 if
    				// <input>태그의 type속성값이 file일때만 filecnt값을 1씩 증가
    				filecnt++;
    		}//바깥 if
    		
    	}//for

    f.submit();
    	
    }



    function add_row() {
    	// div 태그의 위치 가져오기
    	var mytbody = document.getElementById("mytbody");	
    	var row = mytbody.insertRow(mytbody.rows.length);
    	var cell1 = row.insertCell(0);
    	var cell2 = row.insertCell(1);
    	cell1.innerHTML = "파일 #"+count;
    	cell2.innerHTML = "<input type='file' name='upfile"+count+"'/>";
    		
    	count++;
    	
			if(mytbody.rows.length == 4){
    		
        	alert("4개 까지만 등록이 가능합니다.");
        	
        	 var input = document.getElementById("plus");
             // input엘리먼트에 disbled="disabled" 속성 추가한다.
             input.setAttribute("disabled", "disabled");        	        	
        	}
    	
    	
    }
    function delete_row() {
    	var mytbody = document.getElementById("mytbody");
        if (mytbody.rows.length < 1) return;
        // my_tbody.deleteRow(0); // 상단부터 삭제
        mytbody.deleteRow( mytbody.rows.length-1 ); // 하단부터 삭제
        count--;
        if(mytbody.rows.length < 4){
    		var input = document.getElementById("plus");
            // input엘리먼트에 disabled 제거
            input.removeAttribute("disabled");
    		
    	}
            
      }

    
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
            	
            	 var addr1 = data.address; // 최종 주소 변수

                 
                 // 주소로 상세 정보를 검색
                 geocoder.addressSearch(data.address, function(results, status) {
                     // 정상적으로 검색이 완료됐으면
                     if (status === daum.maps.services.Status.OK) {

                         var result = results[0]; //첫번째 결과의 값을 활용

                       	document.getElementById('wdo').value = result.x; //위도
                       	document.getElementById('kdo').value = result.y; //경도                                                                       
                        
                        
                     }
                 });
            	
            	
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
            
        }).open();
    }
</script>

</head>
<body>

<div class="container">

  <form action="insertBoardController.do" enctype="multipart/form-data" method="post" name="f">
  
  <input type="hidden" id="wdo" value="" name="Wdo">
  <input type="hidden" id="kdo" value="" name="Kdo">
   
  
  <div class="row">
    <div class="col-10">
      <label>제 목</label>
    </div>
    <div class="col-90">
      <input type="text" id="subject" name="subject" placeholder="Title">
    </div>
  </div>
  
  <div class="row">
    <div class="col-10">
      <label>공간 유형</label>
    </div>
    <div class="col-90">
      <select name="room">
      	<option value="카페">카페</option>
      	<option value="강의실">강의실</option>
      	<option value="룸">룸</option>
      </select>      
    </div>
  </div>
  
  <div class="row">
    <div class="col-10">
      <label for="peopleNum">수용 범위</label>
    </div>
    <div class="col-90">
      <select id="people" name="people">
        <option value="소">소(1~4명)</option>
        <option value="중">중(5~10명)</option>
        <option value="대">대(10명~20명)</option>
      </select>
    </div>
  </div>
  
  <div class="row">
    <div class="col-10"></div>
    <div class="col-20">
        <label>주차</label>
        <input type="radio" name="parking"  value=1>가능        
        <input type="radio" name="parking"  value=2>불가능
    </div>
    <div class="col-20">
        <label>WIFI</label>
        <input type="radio" name="wifi"  value=1>가능        
        <input type="radio" name="wifi"  value=2>불가능
    </div>
    <div class="col-20">
        <label>화장실</label>
        <input type="radio" name="toilet"  value=1>있음        
        <input type="radio" name="toilet"  value=2>없음
    </div>
    <div class="col-20">
        <label>음료기본제공</label>
        <input type="radio" name="drink"  value=1>가능        
        <input type="radio" name="drink"  value=2>불가능
    </div>    
       
	  </div> 
	  
	    <div class="row">
	    <div class="col-10"></div>
	    <div class="col-20">
	        <label>에어컨</label>
	        <input type="radio" name="airconditioner"  value=1>가능        
	        <input type="radio" name="airconditioner"  value=2>불가능
	    </div>
	    <div class="col-20">
	        <label>난방</label>
	        <input type="radio" name="heating"  value=1>가능        
	        <input type="radio" name="heating"  value=2>불가능
	    </div>
	    <div class="col-20">
	        <label>엘리베이터</label>
	        <input type="radio" name="elevator"  value=1>있음        
	        <input type="radio" name="elevator"  value=2>없음
	    </div>
	    <div class="col-20">
	        <label>콘센트</label>
	        <input type="radio" name="socket"  value=1>가능        
	        <input type="radio" name="socket"  value=2>불가능
	    </div>   
	       
	  </div> 
	  
	  <div class="row">
	    <div class="col-10"></div>
	    <div class="col-20">
	        <label>프로젝트 빔</label>
	        <input type="radio" name="projector"  value=1>가능        
	        <input type="radio" name="projector"  value=2>불가능
	    </div>
	    <div class="col-20">
	        <label>컴퓨터</label>
	        <input type="radio" name="laptop"  value=1>가능        
	        <input type="radio" name="laptop"  value=2>불가능
	    </div>
	    <div class="col-20">
	        <label>캐비넷</label>
	        <input type="radio" name="cabinet"  value=1>있음        
	        <input type="radio" name="cabinet"  value=2>없음
	    </div>
	    
	      <div class="col-20">
	       
	    	</div>
	   
	    <div class="col-10">
	    	<input type="text" placeholder="옵션 " name="etc">&nbsp;<span id="option">그 외 옵션을 적어주세요.</span>
	    </div>    
	       
	  </div> 
  
  
  <div class="row">
  	<div class="col-10">
  		<label for="address">주소</label>  		
  	</div>
  	<div class="col-20">
  			<input type="text" id="sample6_postcode" placeholder="우편번호" name="postNum">
  	</div>
  	<div class="col-20">
  			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="button button2">
  	</div>
  </div>
  
  <div class="row">
  	<div class="col-10"></div>
  	<div class="col-90"><input type="text" id="sample6_address" placeholder="주소" name="address"></div>  	    
  </div>
  
  <div class="row">
  	<div class="col-10"></div> 
  	
  	<!-- none으로 해둔 이유 : 상세주소 입력하면 위도 경도가 안뜸. 다음api 관련인듯 대안으로 밑에 input태그 하나 더 만듬 --> 	
  	<div class="col-45" style="display: none;">
  		<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="detailAddress">
  	</div>
  	<!-- 여기까지 -->
  	
  	<div class="col-45">
  		<input type="text"  placeholder="상세주소" name="detailAddress">
  	</div>
  	<div class="col-45">
  		<input type="text" id="sample6_extraAddress" placeholder="참고항목" name="etcAddress">
  	</div>  	      	    
  </div>
  
  <div class="row">
  	<div class="col-10">이미지 첨부</div>
  	<div class="col-90">
  		<input type="button"  value="+" onclick="add_row()" class="button button2" id="plus">
		<input type="button"  value="-" onclick="delete_row()" class="button button2">	
		<table>
			<tbody id="mytbody"></tbody>
		</table>
  	</div>  
  </div>
  
   <div class="row">
  	<div class="col-10">날짜 선택</div>
  	<div class="col-10">	  		
		<input type="text" id="from" name="from" placeholder="from" readonly="readonly">				  		  	
  	</div> 
  	<div class="col-10">
  		<input type="text" id="to" name="to" placeholder="to" readonly="readonly">
  	</div> 
   </div>
   
 <div class="row">
  	<div class="col-10">이용시간</div>
  	<div class="col-90">	 
  		<input type="hidden" name="at11" id="at11" value="">
  		<input type="hidden" name="at12" id="at12" value="">
  		<input type="hidden" name="at13" id="at13" value="">
  		<input type="hidden" name="at14" id="at14" value="">
  		<input type="hidden" name="at15" id="at15" value="">
  		<input type="hidden" name="at16" id="at16" value="">
  		<input type="hidden" name="at17" id="at17" value="">
  		<input type="hidden" name="at18" id="at18" value="">
  		<input type="hidden" name="at19" id="at19" value="">
  		<input type="hidden" name="at20" id="at20" value="">
  		<input type="hidden" name="at21" id="at21" value="">
  		<input type="hidden" name="at22" id="at22" value="">
  		<input type="hidden" name="at23" id="at23" value="">
  	 		
		
		<input type="button" class="Tbutton" value="11:00" >
		<input type="button" class="Tbutton" value="12:00" >
		<input type="button" class="Tbutton" value="13:00" >
		<input type="button" class="Tbutton" value="14:00" >
		<input type="button" class="Tbutton" value="15:00" >
		<input type="button" class="Tbutton" value="16:00" >
		<input type="button" class="Tbutton" value="17:00" >
		<input type="button" class="Tbutton" value="18:00" >
		<input type="button" class="Tbutton" value="19:00" >
		<input type="button" class="Tbutton" value="20:00" >
		<input type="button" class="Tbutton" value="21:00" >
		<input type="button" class="Tbutton" value="22:00" >
		<input type="button" class="Tbutton" value="23:00" >
		
			
  	</div> 
  	
 </div>
  
  
  <div class="row">
  	<div class="col-10">요금</div>
  
  	<div class="col-80">
  		<input type="text" name="weekday" maxlength="10" placeholder="평일 요금">
  		<input type="text" name="holiday" maxlength="10" placeholder="주말 요금">
  	 </div>
  </div>
  
  
  
  <div class="row">
    <div class="col-10">
      <label for="content">내용</label>
    </div>
    <div class="col-90">
      <textarea id="content" name="content" placeholder="내용" style="height:200px"></textarea>
    </div>
  </div>
  <div class="row">
	<input type="button" id="button1" class="btn btn-outline-success btn-sm" value="등록" onclick="fnElementCheck(this.form)">	
	
  </div>
  
  </form>
</div>

</body>
</html>