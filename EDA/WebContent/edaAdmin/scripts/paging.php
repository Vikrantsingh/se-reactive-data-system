<?php 
///////database connection here
include("../include/database.php");
?>
<?php
$currentPage = $_SERVER["PHP_SELF"];
////////////no. of pages to display
$maxRows_profile = 5;////////////////////////edit here
$pageNum_profile = 0;
if (isset($_GET['pageNum_profile'])) {
  $pageNum_profile = $_GET['pageNum_profile'];
}
$startRow_profile = $pageNum_profile * $maxRows_profile;
$colname_profile = "-1";
if (isset($_GET['Id'])) {
  $colname_profile = (get_magic_quotes_gpc()) ? $_GET['Id'] : addslashes($_GET['Id']);
}
/////////////////////your query goes here
$query_profile ="SELECT * FROM student where STUDENT_NAME like '%".$_GET['Id']."%'"; /////////////edit here
$query_limit_profile = sprintf("%s LIMIT %d, %d", $query_profile, $startRow_profile, $maxRows_profile);
$profile = mysql_query($query_limit_profile) or die(mysql_error());
$row_profile = mysql_fetch_assoc($profile);
/////////////////////////////////////////////PAGING LOGIC STARTS HERE ///////////////////////////////
///////////!!!!!!!!!!DO NOT EDIT BELOW THIS!!!!!!!!!!!/////////////
if (isset($_GET['totalRows_profile'])) {
  $totalRows_profile = $_GET['totalRows_profile'];
} else {
  $all_profile = mysql_query($query_profile);
  $totalRows_profile = mysql_num_rows($all_profile);
}
$totalPages_profile = ceil($totalRows_profile/$maxRows_profile)-1;
//////////////////////////////////////////////////////////Paging
$queryString_profile = "";
if (!empty($_SERVER['QUERY_STRING'])) {
  $params = explode("&", $_SERVER['QUERY_STRING']);
  $newParams = array();
  foreach ($params as $param) {
    if (stristr($param, "pageNum_profile") == false && 
        stristr($param, "totalRows_profile") == false) {
      array_push($newParams, $param);
    }
  }
  if (count($newParams) != 0) {
    $queryString_profile = "&" . htmlentities(implode("&", $newParams));
  }
}
$queryString_profile = sprintf("&totalRows_profile=%d%s", $totalRows_profile, $queryString_profile);
///////////////////////////////////////////////////////////////////PAGING END LOGIC////////////////////////////////////
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>

<body>
<!--------------Paging Status starts here-------------->
<p>&nbsp;
Records <?php echo ($startRow_profile + 1) ?> to <?php echo min($startRow_profile + $maxRows_profile, $totalRows_profile) ?> of <?php echo $totalRows_profile ?> </p>

<!--------------Paging Status ends here-------------->
<table border="1">
  <tr>
    <td>Id</td>
    <td>Child_Name</td>
    <td>Gender</td>
  </tr>
  <?php do { ?>
    <tr>
      <td><?php echo $row_profile['MD5']; ?></td>
      <td><?php echo $row_profile['STUDENT_NAME']; ?></td>
      <td><?php echo $row_profile['SURNAME']; ?></td>
    </tr>
    <?php } while ($row_profile = mysql_fetch_assoc($profile)); ?>
</table>
<!--------------Paging Links starts here-------------->
<table border="0" width="42%" >
  <tr>
    <td width="23%" align="center"><?php if ($pageNum_profile > 0) { // Show if first page ?>
          <a href="<?php printf("%s?pageNum_profile=%d%s", $currentPage, 0, $queryString_profile); ?>">&lt;&lt;First</a>
          <?php } else  { echo '&lt;&lt;First';  }   ?>
    </td>
    <td width="31%" align="center"><?php if ($pageNum_profile > 0) { // Show if not first page ?>
          <a href="<?php printf("%s?pageNum_profile=%d%s", $currentPage, max(0, $pageNum_profile - 1), $queryString_profile); ?>">&lt;Previous</a>
          <?php }else   { echo '&lt;Previous';  }   ?>
    </td>
    <td width="23%" align="center"><?php if ($pageNum_profile < $totalPages_profile) { // Show if not last page ?>
          <a href="<?php printf("%s?pageNum_profile=%d%s", $currentPage, min($totalPages_profile, $pageNum_profile + 1), $queryString_profile); ?>">Next&gt;</a>
          <?php }  else  { echo 'Next&gt;';  } 	  ?>
    </td>
    <td width="23%" align="center"><?php if ($pageNum_profile < $totalPages_profile) { // Show if last page ?>
          <a href="<?php printf("%s?pageNum_profile=%d%s", $currentPage, $totalPages_profile, $queryString_profile); ?>">Last&gt;&gt;</a>
          <?php } else  { echo 'Last&gt;&gt;';  }   ?>

    </td>
  </tr>
</table>
<!--------------Paging Links ends here-------------->
</body>
</html>
<?php
mysql_free_result($profile);
?>
