<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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
    
    
	<h4 class="alert_info">
 Wel-Come Message here................

	</h4>
		
		
		   <!-- Dashboard icons -->
            <div class="grid_7" style="margin:30px">
                <a href="listener.jsp" class="dashboard-module">
                	<img src="images/Crystal_Clear_settings.gif" width="64" height="64" alt="edit" />
                	<span>Listener</span>
                </a>
            	<a href="event_manager.jsp" class="dashboard-module">
                	<img src="images/Crystal_Clear_write.gif" width="64" height="64" alt="edit" />
                	<span>Event Manager</span>
                </a>
                
                <a href="" class="dashboard-module">
                	<img src="images/Crystal_Clear_file.gif" width="64" height="64" alt="edit" />
                	<span>Event List</span>
                </a>
                
                <a href="" class="dashboard-module">
                	<img src="images/Crystal_Clear_files.gif"  width="64" height="64" alt="edit" />
                	<span>Articles</span>
                </a>
                
                <a href="" class="dashboard-module">
                	<img src="images/Crystal_Clear_calendar.gif" width="64" height="64" alt="edit" />
                	<span>Logs</span>
                </a>
                
                <a href="" class="dashboard-module">
                	<img src="images/Crystal_Clear_user.gif" width="64" height="64" alt="edit" />
                	<span>My profile</span>
                </a>
                
                <a href="" class="dashboard-module">
                	<img src="images/Crystal_Clear_stats.gif"  width="64" height="64" alt="edit" />
                	<span>Stats</span>
                </a>
                

                <a href="" class="dashboard-module">
                	<img src="images/Crystal_Project_mail_open.gif" width="64" height="64" alt="edit" />
                	<span>Settings</span>
                </a>
                <a href="logout.php" class="dashboard-module">
                	<img src="images/Crystal_Clear_locked.gif" width="64" height="64" alt="edit" />
                	<span>Logout</span>
                </a>
              

                <div style="clear: both"></div>
            </div> <!-- End .grid_7 -->
		
		
			<div class="module">
			<h2><span>Account Overview :</span></h2>
				<div class="module-body">
					<h3>welcome <?php echo $_SESSION['username']; ?></h3>
					<h4>Last Login :</h4> 12/04/2012
					<h4>I.P. :</h4>192.168.1.1
					<h4>User Loged In :</h4> sbc, xyz.
					<h4>SMS Balance :</h4>508
					<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras mattis consectetur purus sit amet fermentum. Maecenas faucibus mollis interdum. Maecenas faucibus mollis interdum. Cras justo odio, dapibus ac facilisis in, egestas eget quam.</p>


				</div>
		</div><!-- end of styles article -->
				
			<div class="module">
			<h2><span>Notice Board :</span></h2>
				<div class="module-body">
					<h1>Header 1</h1>
 
					<h3>Header 3</h3>
					<h4>Header 4</h4>
					<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras mattis consectetur purus sit amet fermentum. Maecenas faucibus mollis interdum. Maecenas faucibus mollis interdum. Cras justo odio, dapibus ac facilisis in, egestas eget quam.</p>

<p>Donec id elit non mi porta <a href="#">link text</a> gravida at eget metus. Donec ullamcorper nulla non metus auctor fringilla. Cras mattis consectetur purus sit amet fermentum. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum.</p>

					<ul>
						<li>Donec ullamcorper nulla non metus auctor fringilla. </li>
						<li>Cras mattis consectetur purus sit amet fermentum.</li>
						<li>Donec ullamcorper nulla non metus auctor fringilla. </li>
						<li>Cras mattis consectetur purus sit amet fermentum.</li>
					</ul>
				</div>
		</div><!-- end of styles article -->
		<div class="spacer"></div>
		<div class="spacer"></div>
	
			<div class="spacer"></div>
    
          
 	</div>
                
	</div>
        
	</div>
       <%@ include file="include/footer.jsp" %>

</body>
</html>
