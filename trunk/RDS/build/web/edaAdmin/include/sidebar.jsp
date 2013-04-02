    <tr  height="500" bgcolor="#F8F8F8">
    <td align="left" valign="top" style="min-width:250px;">

	<link rel="stylesheet" type="text/css" href="js/sdmenu/sdmenu.css" />
	<script type="text/javascript" src="js/sdmenu/sdmenu.js">
		/***********************************************
		* Slashdot Menu script- By DimX
		* Submitted to Dynamic Drive DHTML code library: http://www.dynamicdrive.com
		* Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
		***********************************************/
	</script>

<!-- 
		<form class="quick_search">
			<input type="text" value="Quick Search" onFocus="if(!this._haschanged){this.value=''};this._haschanged=true;">
		</form>
		<hr/>

 -->
   <div style="float: left" id="my_menu" class="sdmenu">
<!--

<?php
if(isset($_SESSION['username']))
{

?>
-->
      <div>
        <span>Task</span>
        <a href="index.jsp">Home</a>
        <a href="listener.jsp">Listener</a>
        <a href="events.jsp">Events</a>
        <a href="event_manager.jsp">Event Manager</a>
  
      </div>

      <div>
        <span>Scripts</span>
        <a href="form.jsp">Forms</a>
        <a href="datatable.jsp">Tables</a>
        <a href="dashboard.jsp">Dashboard</a>
  
      </div>

<!--

<?php

}
?>
-->
      <div>
        <span>General </span>
        <a href="#">Help</a>
        <a href="#">F.A.Q.'s</a>
        <a href="#">Support</a>
      </div>
    </div>








<!-- end of sidebar -->
	
	
	
	
	<script type="text/javascript">
	// <![CDATA[
	/*var myMenu;
	window.onload = function() {
		myMenu = new SDMenu("my_menu");
		myMenu.init();
	};*/
	// ]]>
	
	var myMenu;

		myMenu = new SDMenu("my_menu");
		myMenu.init();
//		myMenu.collapseAll();
	</script>

</td>
    <td align="left" valign="top"    style="background: #F8F8F8 url(images/sidebar_shadow.png) repeat-y left top;"  ></td>
    <td align="left" valign="top">