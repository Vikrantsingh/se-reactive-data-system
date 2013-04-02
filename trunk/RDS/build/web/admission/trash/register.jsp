<?xml version="1.0"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
 
<%@ include file="include/headtag.jsp" %>
</head>

<body>

<div id="main">

    <!-- Header -->
    <div id="header">
<%@ include file="include/header.jsp" %>

    </div> <!-- /header -->

    <!-- Navigation -->
    <div id="nav">
    <%@ include file="include/navigation.jsp" %>
    </div> <!-- /nav -->

    <!-- 2 columns (content + sidebar) -->
    <div id="cols" class="box">

        <!-- Content -->
        <div id="content">
        
            <h2 id="content-title">Important Notiications </h2>
            
        

            <hr class="noscreen" />
            
            <div id="content-in">
                
                                 <!-- Table -->
<form class="form-horizontal">
  <div class="control-group">
    <label class="control-label" for="inputEmail">Email</label>
    <div class="controls">
      <input type="text" id="inputEmail" placeholder="Email">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="inputPassword">Password</label>
    <div class="controls">
      <input type="password" id="inputPassword" placeholder="Password">
    </div>
  </div>
  <div class="control-group">
    <div class="controls">
      <label class="checkbox">
        <input type="checkbox"> Remember me
      </label>
      <button type="submit" class="btn">Register</button>
    </div>
  </div>
</form>
            </div> <!-- /content-in -->
               
        </div> <!-- /content -->

        <hr class="noscreen" />

        <!-- Sidebar -->
        <div id="aside">
<%@ include file="include/sidebar.jsp" %>
        </div> <!-- /aside -->
    
    </div> <!-- /cols -->
    
    <div id="cols-bottom"></div>

    <hr class="noscreen" />
    
    <!-- Footer -->
    <div id="footer">

<%@ include file="include/footer.jsp" %>   

    </div> <!-- /footer -->

</div> <!-- /main -->

</body>
</html>
