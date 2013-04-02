<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" >
function Startthread(str)
{
var xmlhttp;
  xmlhttp=new XMLHttpRequest(); 
  xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
    }
  }
 
xmlhttp.open("GET","Start.jsp?st="+str,true);
xmlhttp.send();
}
</script>
</head>
<body>
hii

Status:&nbsp; <div id="myDiv" style="float:left">Stop</div>
<input type="button" name="start" value="start"  onclick="Startthread('on')"/>
<input type="button" name="stop" value="stop" onclick="Startthread('off')"/>

<a href="admission"> Web App</a>
<a href="edaAdmin">EDA Admin</a>

</body>
</html>