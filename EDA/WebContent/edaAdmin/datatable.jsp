

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
    Datatables
    </span></h2>
	
    <div class="module-body">
  
  
    
<%@ include file="include/alert.jsp" %>

		
<%@ include file="include/page.jsp" %>
		  
          
     <!----Data Table 1 starts here -------->
     
     


	<ul class="tabs">
   			<li><a href="#tab1">Posts</a></li>
    		<li><a href="#tab2">Comments</a></li> 
    		<li><a href="#tab3">Likes</a></li>
    		<li><a href="#tab4">No Table</a></li>


		</ul>


		<div class="tab_container">
			<div id="tab1" class="tab_content" >
			<table class="tablesorter" cellspacing="0"> 
			<thead> 
				<tr> 
   					<th>Check All</th> 
    				<th>Entry Name</th> 
    				<th>Category</th> 
    				<th>Created On</th> 
    				<th>Actions</th> 
				</tr> 
			</thead> 
			<tbody> 
				<tr> 
   					<td><input type="checkbox"></td> 
    				<td>Lorem Ipsum Dolor Sit Amet</td> 
    				<td>Articles</td> 
    				<td>5th April 2011</td> 
    				<td><input type="image" src="images/icn_edit.png" title="Edit"><input type="image" src="images/icn_trash.png" title="Trash"></td> 
				</tr> 
			</tbody> 
			</table>
			</div><!-- end of #tab1 -->
			
			<div id="tab2" class="tab_content">
			<table class="tablesorter" cellspacing="0"> 
			<thead> 
				<tr> 
   					<th></th> 
    				<th>Comment</th> 
    				<th>Posted by</th> 
    				<th>Posted On</th> 
    				<th>Actions</th> 
				</tr> 
			</thead> 
			<tbody> 
				<tr> 
   					<td><input type="checkbox"></td> 
    				<td>Lorem Ipsum Dolor Sit Amet</td> 
    				<td>Mark Corrigan</td> 
    				<td>5th April 2011</td> 
    				<td><input type="image" src="images/icn_edit.png" title="Edit"><input type="image" src="images/icn_trash.png" title="Trash"></td> 
				</tr> 
			</tbody> 
			</table>

			</div><!-- end of #tab2 -->
			
	<div id="tab3" class="tab_content" >
			<table class="tablesorter" cellspacing="0"> 
			<thead  > 
				<tr> 
   					<th></th> 
    				<th>Comment</th> 
    				<th>Posted by</th> 
    				<th>Posted On</th> 
    				<th>Actions</th> 
				</tr> 
			</thead> 
			<tbody> 
				<tr> 
   					<td><input type="checkbox"></td> 
    				<td>1Lorem Ipsum Dolor Sit Amet</td> 
    				<td>Mark Corrigan</td> 
    				<td>5th April 2011</td> 
    				<td><input type="image" src="images/icn_edit.png" title="Edit"><input type="image" src="images/icn_trash.png" title="Trash"></td> 
				</tr> 
			</tbody> 
			</table>

			</div><!-- end of #tab3 -->
			

			<div id="tab4" class="tab_content" >
			 kjhglkju gkljg lkjg lkjg lkjg lkjg lkjg l			 kjhglkju gkljg lkjg lkjg lkjg lkjg lkjg l			 kjhglkju gkljg lkjg lkjg lkjg lkjg lkjg l			 kjhglkju gkljg lkjg lkjg lkjg lkjg lkjg l			 kjhglkju gkljg lkjg lkjg lkjg lkjg lkjg l			 kjhglkju gkljg lkjg lkjg lkjg lkjg lkjg l			 kjhglkju gkljg lkjg lkjg lkjg lkjg lkjg l			 kjhglkju gkljg lkjg lkjg lkjg lkjg lkjg l			 kjhglkju gkljg lkjg lkjg lkjg lkjg lkjg l			 kjhglkju gkljg lkjg lkjg lkjg lkjg lkjg l			 kjhglkju gkljg lkjg lkjg lkjg lkjg lkjg l			 kjhglkju gkljg lkjg lkjg lkjg lkjg lkjg l			 kjhglkju gkljg lkjg lkjg lkjg lkjg lkjg l			 kjhglkju gkljg lkjg lkjg lkjg lkjg lkjg l			 kjhglkju gkljg lkjg lkjg lkjg lkjg lkjg l			 kjhglkju gkljg lkjg lkjg lkjg lkjg lkjg l			 kjhglkju gkljg lkjg lkjg lkjg lkjg lkjg l			 kjhglkju gkljg lkjg lkjg lkjg lkjg lkjg l
			</div><!-- end of #tab4 -->


		</div><!-- end of .tab_container -->

		<!-- data tables ends here     -------------->
          
          
          

<br />
<h1>Another Table Types</h1>
<table width="100%" border="1">
  <tr class="odd">
    <td width="25%"><strong>Title</strong></td>
    <td width="75%"><strong>&nbsp;jdsgf kasedgf kjsad gf</strong></td>
  </tr>
  <tr>
    <td> Description </td>
    <td>&nbsp;dskjf laksdjgflkasd flkjgdf lkjwe gflkjwhe lkfjqh wkf</td>
  </tr>
  <tr class="odd">
    <td>Total Questions</td>
    <td>&nbsp;,asdkj fglaskjlfkad sgflkjasgd flkjasgdf lkjashf lkjasd</td>
  </tr>
  <tr>
    <td>Durations</td>
    <td>&nbsp;lxkh vlkdfh vlkajhfd gkljahf lkjhfkljadslkfjhalksdhf</td>
  </tr>
  <tr class="odd">
    <td>Author</td>
    <td>&nbsp;ladfi halk dhflkadhf lkewjhflkjqhelfkjf hqlkrfhql</td>
  </tr>
  <tr>
    <td>Created On</td>
    <td>&nbsp;aklf ;eljf;qreojg;lerhgkhwlgfkherkigqjekrbgglkqergl</td>
  </tr>
</table>
          
          
          
          
          
          
          
 	</div>
                
	</div>
        
	</div>
       <%@ include file="include/footer.jsp" %>

</body>
</html>
