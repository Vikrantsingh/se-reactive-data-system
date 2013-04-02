

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
    forms
    </span></h2>
	
    <div class="module-body">
    
<%@ include file="include/alert.jsp" %>

		
<%@ include file="include/page.jsp" %>
		
    <!--------Sample forms here-------------->
    
    
    		
		<h4 class="alert_info">Some Informative message goes here.</h4>
		
		<div class="clear"></div>
		

			<h3>Post New Article</h3>
			<form>

							<label>Post Title</label>
							<input type="text"    >
							<label>Content</label>
                         <script type="text/javascript">
////////////textarea max length///////////
var maxLength=160;
function charLimit(el) {
    if (el.value.length > maxLength) return false;
    return true;
}
function characterCount(el) {
    var charCount = document.getElementById('charCount');
    if (el.value.length > maxLength) el.value = el.value.substring(0,maxLength);
    if (charCount) charCount.innerHTML = maxLength - el.value.length;
    return true;
}
</script>
<textarea   name="xyz" cols="50" rows="5"  onKeyPress="return charLimit(this)" onKeyUp="return characterCount(this)"  >
</textarea>
<div style="clear:both" ></div> 
<lable><b><span id="charCount">160</span></b> more characters available.</lable>

                             <label>Date</label>
							  <link rel="stylesheet" type="text/css" href="css/epoch_styles.css" />
							<script type="text/javascript" src="js/epoch_classes.js"></script>
                            <script type="text/javascript">
                            /*You can also place this code in a separate file and link to it like epoch_classes.js*/
                                var bas_cal,dp_cal,ms_cal;      
                            window.onload = function () {
                            
                                dp_cal  = new Epoch('epoch_popup','popup',document.getElementById("datepopup"));
                            };
                            </script>
                              <input id="datepopup" type="text" />
							<label>Category</label>
							<select style="width:92%;">
								<option>Articles</option>
								<option>Tutorials</option>
								<option>Freebies</option>
							</select>
							<label>Tags</label>
							<input type="text"  >
							<label>file</label>
							<input type="file"  >
<label>Tags</label>
					<select>
						<option>Draft</option>
						<option>Published</option>
					</select>
                                <input class="submit-green" type="submit" value="Submit" /> 
                                <input class="submit-gray" type="reset" value="Clear Form" />
</form>
		<div class="spacer"></div>
    
          
 	</div>
                
	</div>
        
	</div>
       <%@ include file="include/footer.jsp" %>

</body>
</html>
