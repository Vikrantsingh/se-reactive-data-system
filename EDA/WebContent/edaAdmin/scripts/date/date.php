<?php 
function datepopup($id)
{
echo'
<link rel="stylesheet" type="text/css" href="scripts/date/epoch_styles.css" />
<script type="text/javascript" src="scripts/date/epoch_classes.js"></script>
<script type="text/javascript">
/*You can also place this code in a separate file and link to it like epoch_classes.js*/
	var bas_cal,dp_cal,ms_cal;      
window.onload = function () {

	dp_cal  = new Epoch(\'epoch_popup\',\'popup\',document.getElementById("'.$id.'"));

};
</script>
  <input id="'.$id.'" name="'.$id.'" type="text"   readonly="1" />

';
}

?>