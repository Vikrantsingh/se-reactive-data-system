<!--<?php 
		     ////////////////this should be only on index page///////////////////////
	        if(isset($_GET['p']))
		        { 
		
		                   
		                if(validate_url()==false)   
						{
							  echo "<h4 class='alert_error'>Invalid Page </h4>";
						}
		
				        elseif (@include(get_decrypt_url($_GET['p'])))
						     {
							
							 } 
						else 
						     {
							  echo "<h4 class='alert_error'>Page Not Found </h4>";
							 }
				}
		        
			else {   

	                        include "pages/dashboard.php";
                 }  

				   ?>
-->