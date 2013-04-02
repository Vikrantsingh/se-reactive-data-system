<?php
	//header ("Expires: Mon, 26 Jul 1997 05:00:00 GMT"); // Date in the past
	//header ("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT"); // always modified
	//header ("Cache-Control: no-cache, must-revalidate"); // HTTP/1.1
	//header ("Pragma: no-cache"); // HTTP/1.0
	
	
	

		header("Content-Type: text/xml");

		echo "<?xml version=\"1.0\" encoding=\"utf-8\" ?><results>";
		echo "<rs id='1' info='bisen'>Vikrant bisen</rs>";
		echo "<rs id='2' info='bisen'>Vikrant</rs>";
		echo "<rs id='3' info='bisen'>Vikrant</rs>";
		echo "<rs id='4' info='bisen'>Vikrant</rs>";
		echo "<rs id='5' info='singh'>vaibhav</rs>";
		echo "<rs id='6' info='bisen'>Pridvi</rs>";				
		echo "</results>";

?>