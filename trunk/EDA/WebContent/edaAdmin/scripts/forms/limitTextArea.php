<?php
function limitTextArea($name,$maxsize,$rows,$cols) 
{

echo '<script type="text/javascript">
////////////textarea max length///////////
var maxLength='.$maxsize.';
function charLimit(el) {
    if (el.value.length > maxLength) return false;
    return true;
}
function characterCount(el) {
    var charCount = document.getElementById(\'charCount\');
    if (el.value.length > maxLength) el.value = el.value.substring(0,maxLength);
    if (charCount) charCount.innerHTML = maxLength - el.value.length;
    return true;
}
</script>
<textarea name="'.$name.'" cols="'.$cols.'" rows="'.$rows.'"  onKeyPress="return charLimit(this)" onKeyUp="return characterCount(this)"  ></textarea>
<div style="clear:both" ></div> ;
<lable><b><span id="charCount">'.$maxsize.'</span></b> more characters available.</lable>
';
}
?>