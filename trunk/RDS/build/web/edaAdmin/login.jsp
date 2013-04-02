 
<?php 	require_once "include/config.php";	?>
<?php 	require_once "include/url.php";	?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<meta name="Author" content="vikrantsingh.it@gmail.com" />
<%@ include file="include/headtag.jsp" %>
</head>
<body>
<%@ include file="include/header.jsp" %>

  
<%@ include file="include/sidebar.jsp" %>
	<div id="main" >
	<div class="module">
			<h2><span>
            Login Here:
            
            </span>
            
            </h2>
				<div class="module-body">
		
      <!--   <?php 	include "include/alert.php";	?>
      -->

		
		
	<link href="css/layout.css" type="text/css"  rel="stylesheet"  />
<script type="text/JavaScript">
<!--
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_validateForm() { //v4.0
  var i,p,q,nm,test,num,min,max,errors='',args=MM_validateForm.arguments;
  for (i=0; i<(args.length-2); i+=3) { test=args[i+2]; val=MM_findObj(args[i]);
    if (val) { nm=val.name; if ((val=val.value)!="") {
      if (test.indexOf('isEmail')!=-1) { p=val.indexOf('@');
        if (p<1 || p==(val.length-1)) errors+='- '+nm+' must contain an e-mail address.\n';
      } else if (test!='R') { num = parseFloat(val);
        if (isNaN(val)) errors+='- '+nm+' must contain a number.\n';
        if (test.indexOf('inRange') != -1) { p=test.indexOf(':');
          min=test.substring(8,p); max=test.substring(p+1);
          if (num<min || max<num) errors+='- '+nm+' must contain a number between '+min+' and '+max+'.\n';
    } } } else if (test.charAt(0) == 'R') errors += '- '+nm+' is required.\n'; }
  } if (errors) alert('The following error(s) occurred:\n'+errors);
  document.MM_returnValue = (errors == '');
}
//-->
</script>





<form action="validate.php" method="post"  >

<h3>&nbsp;&nbsp;&nbsp;Please Enter your Username and Password </h3>
				<div class="module_content">



			  
			  <label>Username</label>
                <input name="Username" type="text" id="Username" maxlength="30" />
			  <label>Password</label>

              <input name="Password" type="password" id="Password" maxlength="30" />
           
			     <div class="clear"></div>
           
           <!--
             <?php if(isset($_SESSION['login_err'])) {echo "<h4 class='alert_error'>".$_SESSION['login_err']."</h4>"; unset($_SESSION['login_err']);};?>
            
            -->
            <div class="clear"></div>
			            <div class="spacer"></div>

				
                <input name="Submit" type="submit"   class="alt_btn" onClick="MM_validateForm('Username','','R','Password','','R');return document.MM_returnValue" value="Sign In"/>

		</form>


</div></div>
	</div>

	
	</td>
  </tr>
        <%@ include file="include/footer.jsp" %>
  
</table>
</body>
</html>
