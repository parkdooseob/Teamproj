<%@page import="home.homeDTO"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<title>나눔 공간</title>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
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


<!-- bxslider -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script type="text/javascript">

/**bxSlier*/
$(document).ready(function(){
 $('#bxslider').bxSlider();
});

  
  $(document).ready(function() {
	    $("#datepicker").datepicker({
	     onSelect: function(date) {
// 	        alert(date);
	        myFunction("date_select");
	     },
	     altField : '#date',
	    dateFormat : 'yy년 mm월 dd일',
	    maxDate:6,
	    minDate:0
	  });
	});




 


/*선택 창 열기*/

function getLocation() {
	  if (navigator.geolocation) { // GPS를 지원하면
	    navigator.geolocation.getCurrentPosition(function(position) {
	      var latitude = position.coords.latitude;
	      var longitude = position.coords.longitude;
	      var geocode = "https://maps.googleapis.com/maps/api/geocode/json?latlng="+latitude+","+longitude+"&sensor=false&key=AIzaSyD_0NjxlJgulWcZxrKIbqEtYQYTSYbZnX0";

	      jQuery.ajax({
	        url: geocode,
	        type: 'POST',
	           success: function(myJSONResult){
	                    if(myJSONResult.status == 'OK') {
	                        var tag = myJSONResult.results[0].formatted_address;
// 	                        alert(tag);
							
							/*나라 이름 빼기*/
							var index = tag.indexOf(" ");
                       		tag = tag.substr(index);
	                        document.getElementById("my_location").innerHTML = tag;
	                    }
	            }
	    });
	      
	    }, function(error) {
	      console.error(error);
	    }, {
	      enableHighAccuracy: false,
	      maximumAge: 0,
	      timeout: Infinity
	    });
	  } 
	}
	
	
	getLocation();

	

function myFunction(id) {
	  var x = document.getElementById(id);
	  var a = document.getElementById("type_select");
	  var b = document.getElementById("location_select");
	  var c = document.getElementById("date_select");
	  var d = document.getElementById("number_select");
	
	  
	  
	  if (x.className.indexOf("w3-show") == -1) {//처음 클릭했다.
		  
		  //우선 전부 안보이게 지우고
		  a.className = a.className.replace(" w3-show", "");
		  b.className = b.className.replace(" w3-show", "");
		  c.className = c.className.replace(" w3-show", "");
		  d.className = d.className.replace(" w3-show", "");
	
		  //내꺼만 다시 보이게
		  x.className += " w3-show";
	  } else { // 열려있는 상태에서 클릭했다.
	    x.className = x.className.replace(" w3-show", "");
	  }
	}


//값 셋팅

function setValue(obj, target){
// 	var x = obj.innerHTM;
	var x = obj.value;
// 	alert(x);
	document.getElementById(target).value = x;
	var a = document.getElementById("type_select");
	var b = document.getElementById("location_select");
	var c = document.getElementById("date_select");
	var d = document.getElementById("number_select");
	
	a.className = a.className.replace(" w3-show", "");
	b.className = b.className.replace(" w3-show", "");
	c.className = c.className.replace(" w3-show", "");
	d.className = d.className.replace(" w3-show", "");

}


	
</script>

<style>
body{

font-family: "Nanum Barun Gothic"; 
letter-spacing: 1px;
 
}

</style>



<body>
<!-- Navbar 복사4-->
<jsp:include page="Top.jsp" flush="false"/>
<!-- 복사4종료  -->

<!-- Header시작 -->

<header class="w3-display-container w3-content w3-wide" style="max-width:100%;" id="home">
  <img class="w3-image" src="img/main_pic2.jpg" width="100%">
  <form action="search.do" method="post">
 	 <div class="w3-display-middle w3-margin-top w3-center w3-container" style="min-height: 500px; top:80%">
     <!-- 첫 row -->
      <div class="w3-row w3-round-large w3-white w3-hide-small" style="margin:10px -70px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
       display: inline-block; vertical-align: top;">
      <div id="new" style="position:relative;">
        
        <div class="w3-col l2 m2 w3-padding">
          <label>공간</label>
           <button type="button" onclick="myFunction('type_select')" style="border: none; padding:0px; background-color: white;">
          	<input type="text" id="type" name="type" value="카페" class="w3-input w3-border-0"   style = "text-align:center; font-size:1.5em; font-weight:bold; color:rgb(118,118,118);" >
            <i class="material-icons">keyboard_arrow_down</i>
          </button>
        </div>
        
        <div class="w3-col l4 m4 w3-border-left w3-padding">
          <label >지역</label>
           <button type="button" onclick="myFunction('location_select')" style="border: none; padding:0px; background-color: white;">
          	<input type="text" id="location" name="location" value="해운대구" class="w3-input w3-border-0" style = "text-align:center; font-size:1.5em; font-weight:bold; color:rgb(118,118,118)" >
            <i class="material-icons">keyboard_arrow_down</i>
          </button>
        </div>
          
        <div class="w3-col l4 m4 w3-border-left w3-padding">
          <label>날짜</label><br/>
          <button type="button" onclick="myFunction('date_select')" style="border: none; padding:0px; background-color: white;">
          	<input type="text" id="date" name="date" class="w3-input w3-border-0"  style = "text-align:center; font-size:1.5em; font-weight:bold; color:rgb(118,118,118)">
            <i class="material-icons">keyboard_arrow_down</i>
          </button>
        </div>
        
        <div class="w3-col l2 m2 w3-border-left w3-padding">
          <label>인원</label>
          <button type="button" onclick="myFunction('number_select')" style="border: none; padding:0px; background-color: white;">
          	<input type="text" id="number" name="number" class="w3-input w3-border-0"  value="소" style = "text-align:center; font-size:1.5em; font-weight:bold; color:rgb(118,118,118)">
            <i class="material-icons">keyboard_arrow_down</i>
          </button>
        </div>
        	
      </div><!--row -->
       
   	  <button class="w3-btn w3-round" onclick="submit()" style="background-color:rgb(252,247,52); color:rgb(11,11,11); width:31%;position:absolute;top:140px;left:35%;z-index:-1;">
   		<b>검색</b>
   	  </button>
     
   </div>   
   
   <!-- 선택 row -->   
		<div class="w3-row w3-hide " style="margin:2px -70px;" id="type_select">
	        <div class="w3-col l2 m2 w3-padding w3-white w3-round" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
	  			<input type="button" value="카페" onclick="setValue(this, 'type')" style="border: none; padding:0px; background-color: white;"><br/>
	  			<input type="button" value="스터디룸" onclick="setValue(this, 'type')" style="border: none; padding:0px; background-color: white;"><br/> 
	  			<input type="button" value="강의실" onclick="setValue(this, 'type')" style="border: none; padding:0px; background-color: white;"><br/>
	  			<input type="button" value="야외" onclick="setValue(this, 'type')" style="border: none; padding:0px; background-color: white;"><br/>  
	        </div>
	        <div class="w3-col l10 m10 w3-padding"></div>
        </div>
        
       	<div class="w3-row w3-hide" style="margin:2px -70px;" id="location_select">
	        <div class="w3-col l2 w3-padding"></div>
	        <div class="w3-col l5 w3-padding w3-white w3-round" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
	  			<table width="100%">
	  				<tr height="1.5em">
	  					<td><input type="button" value="강서구" onclick="setValue(this, 'location')" style="border: none; padding:0px; background-color: white;"><br/></td>
	  					<td><input type="button" value="금정구" onclick="setValue(this, 'location')" style="border: none; padding:0px; background-color: white;"><br/></td>
	  					<td><input type="button" value="기장구" onclick="setValue(this, 'location')" style="border: none; padding:0px; background-color: white;"><br/></td>
	  					<td><input type="button" value="남구" onclick="setValue(this, 'location')" style="border: none; padding:0px; background-color: white;"><br/></td>
	  				</tr>
	  				<tr>
	  					<td><input type="button" value="동구" onclick="setValue(this, 'location')" style="border: none; padding:0px; background-color: white;"><br/></td>
	  					<td><input type="button" value="동래구" onclick="setValue(this, 'location')" style="border: none; padding:0px; background-color: white;"><br/></td>
	  					<td><input type="button" value="부산진구" onclick="setValue(this, 'location')" style="border: none; padding:0px; background-color: white;"><br/></td>
	  					<td><input type="button" value="북구" onclick="setValue(this, 'location')" style="border: none; padding:0px; background-color: white;"><br/></td>
	  				</tr>
	  				<tr>
	  					<td><input type="button" value="사상구" onclick="setValue(this, 'location')" style="border: none; padding:0px; background-color: white;"><br/></td>
	  					<td><input type="button" value="사하구" onclick="setValue(this, 'location')" style="border: none; padding:0px; background-color: white;"><br/></td>
	  					<td><input type="button" value="서구" onclick="setValue(this, 'location')" style="border: none; padding:0px; background-color: white;"><br/></td>
	  					<td><input type="button" value="수영구" onclick="setValue(this, 'location')" style="border: none; padding:0px; background-color: white;"><br/></td>
	  					
	  				</tr>
	  				<tr>
	  					<td><input type="button" value="연제구" onclick="setValue(this, 'location')" style="border: none; padding:0px; background-color: white;"><br/></td>
	  					<td><input type="button" value="영도구" onclick="setValue(this, 'location')" style="border: none; padding:0px; background-color: white;"><br/></td>
	  					<td><input type="button" value="중구" onclick="setValue(this, 'location')" style="border: none; padding:0px; background-color: white;"><br/></td>
	  					<td><input type="button" value="해운대구" onclick="setValue(this, 'location')" style="border: none; padding:0px; background-color: white;"><br/></td>
	  				</tr>
	  			</table>
	        </div>
	        <div class="w3-col l5 w3-padding"></div>
        </div>
        
        
        <div class="w3-row w3-hide w3-center" style="margin:2px -70px;" id="date_select">
	        <div class="w3-col l6 w3-padding"></div>
	        <div class="w3-col l4 w3-padding-small w3-white w3-round" id="datepicker" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);"></div>
	        <div class="w3-col l2 w3-padding"></div>
        </div>
        
        
        <div class="w3-row w3-hide" style="margin:2px -70px;" id="number_select">
	        <div class="w3-col l10 w3-padding"></div>
	        <div class="w3-col l2 w3-padding w3-white w3-round" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
	  			<input type="button" value="소" onclick="setValue(this, 'number')" style="border: none; padding:0px; background-color: white;"><br/>
	  			<input type="button" value="중" onclick="setValue(this, 'number')" style="border: none; padding:0px; background-color: white;"><br/> 
	  			<input type="button" value="대" onclick="setValue(this, 'number')" style="border: none; padding:0px; background-color: white;"><br/>	  			 
	        </div>        
        </div>
        
		
      
   	 </div> <!-- 검색창  -->
   	   	   
	</form>


</header>


<!-- 페이지 center-->
<div class="w3-content w3-padding" style="max-width:1564px">
<!--  <div class="w3-content w3-padding" style="max-width:85%">  -->
  
  <!--내 위치-->
  <div class="w3-container w3-padding-16 w3-margin-bottom"  align="center">
    <i class="material-icons" style="color:rgb(255,52,120);">near_me</i>
    <span id="my_location" style="font-size:20px;">내 위치</span>
  </div>
  
<!-- JSTL 로그인  시작 -->
<c:set var="host_id" value="${sessionScope.hdto.host_id }"/>
   <c:choose>
      	<c:when test="${host_id eq null }">
<!-- JSTL 로그인  종료 -->
     
  <!-- 버튼(일반회원) -->
  <div class="w3-container w3-padding-16 w3-content" style="max-width:45%">
  	
  	<div class="w3-quarter w3-center">
  	<a href="event/event.jsp" style="text-decoration: none;">
  	<i class="material-icons" style="font-size:80px;color:#333;">loyalty</i>
  	<p style="margin:2px;">쿠폰/이벤트</p>
  	</a>
  	</div>

  	<div class="w3-quarter w3-center">
  	<a href="Jong/detail.jsp" style="text-decoration: none;">
  	<i class="material-icons" style="font-size:80px;color:#333;">search</i>  	
  	<p style="margin:2px;">공간찾기</p>
  	</a>
  	</div>
  	
  	<div class="w3-quarter w3-center">
  	<a href="#" style="text-decoration: none;">
  	<i class="material-icons" style="font-size:80px;color:#333;">event</i>
  	<p style="margin:2px;">예약내역</p>
  	</a>
  	</div>
  	
  	<div class="w3-quarter w3-center">
  	<a href="#" style="text-decoration: none;">
  	<i class="material-icons" style="font-size:80px;color:#333;">stars</i>
  	<p style="margin:2px;">호스트되기</p>
  	</a>
  	</div>    
  </div>
  
<!-- JSTL 로그인  시작 -->  
</c:when>
<c:otherwise>  
<!-- JSTL 로그인  종료 -->
    
    <!-- 버튼(호스트회원) -->
    <div class="w3-container w3-padding-16 w3-content" style="max-width:45%">
  	
  	<div class="w3-col w3-center" style="width:20%;">
  	<a href="event.jsp" style="text-decoration: none;">
  	<i class="material-icons" style="font-size:80px;color:#333;">loyalty</i>
  	<p style="margin:2px;">쿠폰/이벤트</p>
  	</a>
  	</div>
  	
  	<div class="w3-col w3-center" style="width:20%;">
  	<a href="#" style="text-decoration: none;">
  	<i class="material-icons" style="font-size:80px;color:#333;">search</i>  	
  	<p style="margin:2px;">공간찾기</p>
  	</a>
  	</div>
  	
  	<div class="w3-col w3-center" style="width:20%;">
  	<a href="#" style="text-decoration: none;">
  	<i class="material-icons" style="font-size:80px;color:#333;">weekend</i>
  	<p style="margin:2px;">공간등록</p>
  	</a>
  	</div>
  	
  	<div class="w3-col w3-center" style="width:20%;">
  	<a href="#" style="text-decoration: none;">
  	<i class="material-icons" style="font-size:80px;color:#333;">event_note</i>
  	<p style="margin:2px;">공간관리</p>
  	</a>
  	</div>   
  	
  	<div class="w3-col w3-center" style="width:20%;">
  	<a href="#" style="text-decoration: none;">
  	<i class="material-icons" style="font-size:80px;color:#333;">event</i>
  	<p style="margin:2px;">예약내역</p>
  	</a>
  	</div>  	 
  </div>
  
<!-- JSTL 로그인  시작 -->  
</c:otherwise>
</c:choose>  
<!-- JSTL 로그인  종료 -->

  <!-- Project Section 추천공간: 호스트 유저-->
  <div class="w3-container w3-padding-32" id="projects">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">추천 공간</h3>
  </div>

<% 
Vector<homeDTO> recV = (Vector<homeDTO>)request.getAttribute("recommendV");
%>


  <div class="w3-row-padding" id="bxslider">
	<%if(recV.size()==0){ %>
    <div class="w3-col l4 w3-margin-bottom">
      <a href="#" class="w3-btn" style="padding: 0px">
	      <div class="w3-display-container">
		    <div class="w3-display-topleft w3-white w3-padding" style="opacity:0.8">
		   		<small style="color: rgb(28,123,127); font-weight: bold;">공간 유형 평점:</small>
      			<p style="font-weight:bold;">공간이름</p>
		    </div>
		    <img src="img/room01.jpg" alt="House" style="width:100%">
	      </div>
      </a>
    </div>
    <div class="w3-col l4 w3-margin-bottom">
      <a href="#" class="w3-btn" style="padding: 0px">
	      <div class="w3-display-container">
		    <div class="w3-display-topleft w3-white w3-padding" style="opacity:0.8">
		   		<small style="color: rgb(28,123,127); font-weight: bold;">공간 유형 평점:</small>
      			<p style="font-weight:bold;">공간이름</p>
		    </div>
		    <img src="img/room02.jpg" alt="House" style="width:100%">
	      </div>
      </a>
    </div>
    <div class="w3-col l4 w3-margin-bottom">
      <a href="#" class="w3-btn" style="padding: 0px">
	      <div class="w3-display-container">
		    <div class="w3-display-topleft w3-white w3-padding" style="opacity:0.8">
		   		<small style="color: rgb(28,123,127); font-weight: bold;">공간 유형 평점:</small>
      			<p style="font-weight:bold;">공간이름</p>
		    </div>
		    <img src="img/room03.jpg" alt="House" style="width:100%">
	      </div>
      </a>
    </div>
	<%}else{ 
			int j = recV.size()<3? recV.size():3;
			for(int i=0; i<j; i++){
				homeDTO recDTO = recV.get(i);
	%>
	
	 <div class="w3-col l4 w3-margin-bottom">
      <a href="m_detail.jsp?<%=recDTO.getRoom_no()%>" class="w3-btn" style="padding: 0px">
	      <div class="w3-display-container">
		    <div class="w3-display-topleft w3-white w3-padding" style="opacity:0.8">
		   		<small style="color: rgb(28,123,127); font-weight: bold;"><%=recDTO.getRoom_type()%> 평점:<%=(Math.round(recDTO.getStar()*10)/10.0)%></small>
      			<p style="font-weight:bold;"><%=recDTO.getSubject()%></p>
		    </div>
		    <img src="<%=recDTO.getPic1()%>" alt="House" style="width:100%">
	      </div>
      </a>
      </div>
   
  	<%
  			}
		}	
  	%>
  
  </div>
  
  
  <!-- Project Section 인기공간 : 추천 수 -->
  <div class="w3-container w3-padding-32" id="projects">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">인기 공간</h3>
  </div>
<% 
Vector<homeDTO> popV = (Vector<homeDTO>)request.getAttribute("popularV");
%>
  <div class="w3-row-padding">
    <%if(popV.size()==0){ %>
     <div class="w3-col l4 w3-margin-bottom">
      <a href="#" class="w3-btn" style="padding: 0px">
	      <div class="w3-display-container">
		    <div class="w3-display-topleft w3-white w3-padding" style="opacity:0.8">
		   		<small style="color: rgb(28,123,127); font-weight: bold;">공간 유형 예약수: 평점:</small>
      			<p style="font-weight:bold;">공간이름</p>
		    </div>
		    <img src="img/room01.jpg" alt="House" style="width:100%">
	      </div>
      </a>
    </div>
    
    <div class="w3-col l4 w3-margin-bottom">
      <a href="#" class="w3-btn" style="padding: 0px">
	      <div class="w3-display-container">
		    <div class="w3-display-topleft w3-white w3-padding" style="opacity:0.8">
		   		<small style="color: rgb(28,123,127); font-weight: bold;">공간 유형 예약수: 평점:</small>
      			<p style="font-weight:bold;">공간이름</p>
		    </div>
		    <img src="img/room02.jpg" alt="House" style="width:100%">
	      </div>
      </a>
    </div>
    
    <div class="w3-col l4 w3-margin-bottom">
      <a href="#" class="w3-btn" style="padding: 0px">
	      <div class="w3-display-container">
		    <div class="w3-display-topleft w3-white w3-padding" style="opacity:0.8">
		   		<small style="color: rgb(28,123,127); font-weight: bold;">공간 유형 예약수: 평점:</small>
      			<p style="font-weight:bold;">공간이름</p>
		    </div>
		    <img src="img/room03.jpg" alt="House" style="width:100%">
	      </div>
      </a>
    </div>
      <%}else{ 
			int j = popV.size()<3? popV.size():3;
			for(int i=0; i<j; i++){
				homeDTO popDTO = popV.get(i);
	%>
	  <div class="w3-col l4 w3-margin-bottom">
      <a href="m_detail.jsp?<%=popDTO.getRoom_no()%>" class="w3-btn" style="padding: 0px">
	      <div class="w3-display-container">
		    <div class="w3-display-topleft w3-white w3-padding" style="opacity:0.8">
		   		<small style="color: rgb(28,123,127); font-weight: bold;"><%=popDTO.getRoom_type()%> 예약수:<%=popDTO.getCount()%> 평점:<%=(Math.round(popDTO.getStar()*10)/10.0)%></small>
      			<p style="font-weight:bold;"><%=popDTO.getSubject()%></p>
		    </div>
		    <img src="<%=popDTO.getPic1()%>" alt="House" style="width:100%">
	      </div>
      </a>
      </div>
   
  	<%
  			}
		}	
  	%>
  </div>




 <!-- Slideshow -->
 <div class="w3-container w3-padding-32" id="projects">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">이벤트<a href="event/event.jsp" class="w3-right w3-medium">더보기</a></h3>
  </div>
  
  <div class="w3-container">
    <div class="w3-display-container mySlides">
      <img src="img/event02.jpg" style="width:100%; height:30%;">
      <div class="w3-display-topleft w3-container w3-padding-32">
        <span class="w3-white w3-padding-large w3-animate-bottom" style="opacity:0.8">Lorem ipsum</span>
      </div>
    </div>
    <div class="w3-display-container mySlides">
      <img src="img/event02.jpg" style="width:100%; height:30%;">
      <div class="w3-display-middle w3-container w3-padding-32" >
        <span class="w3-white w3-padding-large w3-animate-bottom" style="opacity:0.8">Klorim tipsum</span>
      </div>
    </div>
    <div class="w3-display-container mySlides">
      <img src="img/event02.jpg" style="width:100%; height:30%;">
      <div class="w3-display-topright w3-container w3-padding-32" style="opacity:0.8">
        <span class="w3-white w3-padding-large w3-animate-bottom">Blorum pipsum</span>
      </div>
    </div>

    <!-- Slideshow next/previous buttons -->
    <div class="w3-container w3-dark-grey w3-padding w3-xlarge">
      <div class="w3-left" onclick="plusDivs(-1)"><i class="fa fa-arrow-circle-left w3-hover-text-teal"></i></div>
      <div class="w3-right" onclick="plusDivs(1)"><i class="fa fa-arrow-circle-right w3-hover-text-teal"></i></div>
    
      <div class="w3-center">
        <span class="w3-tag demodots w3-border w3-transparent w3-hover-white" onclick="currentDiv(1)"></span>
        <span class="w3-tag demodots w3-border w3-transparent w3-hover-white" onclick="currentDiv(2)"></span>
        <span class="w3-tag demodots w3-border w3-transparent w3-hover-white" onclick="currentDiv(3)"></span>
      </div>
    </div>
  </div>
  <hr/>
  


<!-- End page content -->
</div>

<!-- Footer -->
	<jsp:include page="Footer.jsp" flush="false"/>
<!-- Footer 끝 -->
<!-- Footer
<footer class="w3-center w3-white w3-padding-50">
  <p><a href="#" title="W3.CSS" target="_blank" class="w3-hover-text-green">Share Space</a></p>
</footer> -->


<script>
// Slideshow
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demodots");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length} ;
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" w3-white", "");
  }
  x[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " w3-white";
}




</script>
</body>

</html>
