<?php
function get_encrypt_url($url,$title)
{
//	$url=crypt($url,"lwkjerhwglkwjehrlkth8e7rywhru");
	$url=base64_encode($url);
	$title=base64_encode($title);
    $eurl="&d=".md5($url)."&g=".md5($title)."&p=".$url."&t=".$title;
//     $eurl="&d=".md5($url)."&g=".md5($title)."&p=".$url."&t=".$title;
	return $eurl;
}
function get_decrypt_url($url)
{
	//$url=crypt($url,"lwkjerhwe5r1w65er15werglkwjehrlkth8e7rywhru");
	$url=base64_decode($url);
    $eurl=$url;
	return $eurl;
}
function validate_url()
{
  if(($_REQUEST['d']==md5($_REQUEST['p'])) && ($_REQUEST['g']==md5($_REQUEST['t'])) )
   return true;
  else
   return false;

}



?>
