<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="padding-left: 60px;">
  ip : <input id="your-ip-addr" type="text" />
  Geo : <input id="your-geo" type="text" />
  <script type="text/javascript">
    function loadScript(url, callback){
      var script = document.createElement("script")
      script.type = "text/javascript";
 
      if (script.readyState){  //IE
        script.onreadystatechange = function(){
          if (script.readyState == "loaded" ||
                script.readyState == "complete"){
               script.onreadystatechange = null;  
               callback();
          }
        };
      }else {  //Others
         script.onload = function(){
            callback();
         };
      }
      script.src = url;
      document.getElementsByTagName("head")[0].appendChild(script);
    }
    loadScript("https://ip.fatc.club", function(){
      var geoData, ipData = ip();
      document.getElementById("your-ip-addr").value=ipData;
      document.getElementById("your-geo").value="Wait..";
     
      var xhttp = new XMLHttpRequest();
      xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
          geoData = JSON.parse(this.responseText);
          printDataOnThePage();
        }
       };
      xhttp.open("GET", 
                 "http://ip-api.com/json/"+ipData,
                 true);
      xhttp.send();
      function printDataOnThePage(){
        document.getElementById("your-geo").value=
          geoData.lat+' '+geoData.lon+' '+geoData.city;
      }    
    });
 
  </script>
</div>
</body>
</html>