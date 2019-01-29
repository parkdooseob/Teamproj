/* 캐러셀 시작 */
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
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" w3-white", "");
  }
  x[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " w3-white";
}
/* 캐러셀 끝 */

function big(num){
	var id = "img"+num;
	
	var ss = document.getElementById(id).getAttribute('src');
	document.getElementById('modalImg').setAttribute('src', ss);
	document.getElementById('modal01').style.display='block';
}



function map(){
	var lat = document.getElementById("lat").value;
	var lng = document.getElementById("lng").value;
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	    center: new daum.maps.LatLng(lat, lng), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};

	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	//마커가 표시될 위치입니다 
	var markerPosition  = new daum.maps.LatLng(lat, lng); 

	//마커를 생성합니다
	var marker = new daum.maps.Marker({
	position: markerPosition
	});

	//마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

	//아래 코드는 지도 위의 마커를 제거하는 코드입니다
	//marker.setMap(null);
}

map();
    