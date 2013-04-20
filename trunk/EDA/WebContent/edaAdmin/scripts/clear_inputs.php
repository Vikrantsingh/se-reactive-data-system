<?php
//create array to temporarily grab variables
$input_arr = array();
//grabs the $_POST variables and adds slashes
foreach ($_POST as $key => $input_arr) {
    $_POST[$key] = addslashes($input_arr);
}
//create array to temporarily grab variables
$input_arr = array();
//grabs the $_POST variables and adds slashes
foreach ($_GET as $key => $input_arr) {
    $_GET[$key] = addslashes($input_arr);
}
//create array to temporarily grab variables
$input_arr = array();
//grabs the $_POST variables and adds slashes
foreach ($_REQUEST as $key => $input_arr) {
    $_REQUEST[$key] = addslashes($input_arr);
}

?>
