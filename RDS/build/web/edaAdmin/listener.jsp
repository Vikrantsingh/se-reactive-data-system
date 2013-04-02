

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="eda.listener.Listener"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta charset="utf-8"/>
<meta name="Author" content="vikrantsingh.it@gmail.com" />
<%@ include file="include/headtag.jsp" %>
</head>
<body>
<%@ include file="include/header.jsp" %>

  
<%@ include file="include/sidebar.jsp" %>
	
    <div id="main" >
    
    <div class="module">
    
	<h2><span>
    <!--
    <?php if(isset($_REQUEST['t'])&&(validate_url()==true) ) echo get_decrypt_url($_REQUEST['t']); else echo "Home";?> : 
    -->
    Listener
    </span></h2>
	
    <div class="module-body">
    
<%@ include file="include/alert.jsp" %>

		
<%@ include file="include/page.jsp" %>
		  
		
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
        
        
      <table>
      <tr>
      <td><strong>Current Listener Status</strong>
      </td>
      <td><div id="myDiv"  style="float:left">
      <%
      
      Listener l = new Listener();
      if(l.getCount_status()==0)
    	  out.print("Stop");
      else
    	  out.print("Runing");
	  
	  		
	  %>
      
      
      </div>
      </td>
      </tr> 
      <tr>
      <td>
      </td>
      <td><input type="button" name="start" value="start"  onclick="Startthread('on')" class="submit-green"/>
      	<input type="button" name="stop" value="stop" onclick="Startthread('off')"  class="submit-red"/>    
      </td>
</tr>
</table>
 	</div>
                
	</div>
        
	</div>
       <%@ include file="include/footer.jsp" %>

</body>
</html>
