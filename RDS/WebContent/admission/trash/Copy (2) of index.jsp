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

   

    <!-- 2 columns (content + sidebar) -->
    <div id="cols" class="box">
    <div id="nav11">
<%@ include file="include/navigation.jsp" %>

    </div>
        <!-- Content -->
        <div id="content">
     
    
            
        
               <hr class="noscreen" />

<div class="alert alert-block" style="margin:10px">
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  <h4>Warning!</h4>
  Best check yo self, you're not...
</div>


            
            <div id="content-in">
                
                <!-- 3 sections -->
                <div id="sections" class="box">

                    <!-- Section -->                
                    <div class="section">
                        <h3><a href="#">For Students</a></h3>
                        <p><a href="#myModal" data-toggle="modal"><img src="tmp/register_here.png" width="200" height="150" alt="" /></a></p>    
                        <div class="section-in">
                            <p>Lorem ipsum dolor sita ametes ensectetue adipiscing elit. Sed suscipit e lobortis. Semi ornare aliquam tortor. Aliquame bit.</p>
                        </div> <!-- /section-in -->
                        <p class="t-center"><a href="#"><img src="design/btn-more.gif" width="40" height="22" alt="" /></a></p>
                    </div> <!-- /section -->
                    
                    <!-- Section -->
                    <div class="section margin">
                        <h3><a href="#">For Institutes</a></h3>
                        <p><a href="#"><img src="tmp/image.gif" width="200" height="150" alt="" /></a></p>
                        <div class="section-in">
                        <a href="#myModal" role="button" class="btn" data-toggle="modal">Launch demo modal</a>
                            <p>Lorem ipsum dolor sita ametes ensectetue adipiscing elit. Sed suscipit e lobortis. Semi ornare aliquam tortor. Aliquame bit.</p>
                        </div> <!-- /section-in -->
                        <p class="t-center"><a href="#"><img src="design/btn-more.gif" width="40" height="22" alt="" /></a></p>
                    </div> <!-- /section -->
                    
                    <!-- Section -->
                    <div class="section fix">
                        <h3><a href="#">For Mediators</a></h3>
                        <p><a href="#"><img src="tmp/image.gif" width="200" height="150" alt="" /></a></p>
                        <div class="section-in">
                            <p>Lorem ipsum dolor sita ametes ensectetue adipiscing elit. Sed suscipit e lobortis. Semi ornare aliquam tortor. Aliquame bit.</p>
                        </div> <!-- /section-in -->
                        <p class="t-center"><a href="#"><img src="design/btn-more.gif" width="40" height="22" alt="" /></a></p>
                    </div> <!-- /section -->
                
                </div> <!-- /sections -->
                
                <div id="sections-bottom"></div>
                <!-- Table -->
                <table class="nomb table-style01">
                    <tr>
                        <th>Lorem ipsum</th>
                        <th>Lorem ipsum</th>
                        <th>Lorem ipsum</th>
                        <th>Lorem ipsum</th>
                        <th>Lorem ipsum</th>
                        <th>Lorem ipsum</th>
                    </tr>
                    <tr>
                        <td>Lorem ipsum</td>
                        <td>Lorem ipsum</td>
                        <td>Lorem ipsum</td>
                        <td>Lorem ipsum</td>
                        <td>Lorem ipsum</td>
                        <td>Lorem ipsum</td>
                    </tr>
                    <tr class="bg">
                        <td>Lorem ipsum</td>
                        <td>Lorem ipsum</td>
                        <td>Lorem ipsum</td>
                        <td>Lorem ipsum</td>
                        <td>Lorem ipsum</td>
                        <td>Lorem ipsum</td>
                    </tr>
                    <tr>
                        <td>Lorem ipsum</td>
                        <td>Lorem ipsum</td>
                        <td>Lorem ipsum</td>
                        <td>Lorem ipsum</td>
                        <td>Lorem ipsum</td>
                        <td>Lorem ipsum</td>
                    </tr>
                    <tr class="bg">
                        <td>Lorem ipsum</td>
                        <td>Lorem ipsum</td>
                        <td>Lorem ipsum</td>
                        <td>Lorem ipsum</td>
                        <td>Lorem ipsum</td>
                        <td>Lorem ipsum</td>
                    </tr>
                    <tr>
                        <td>Lorem ipsum</td>
                        <td>Lorem ipsum</td>
                        <td>Lorem ipsum</td>
                        <td>Lorem ipsum</td>
                        <td>Lorem ipsum</td>
                        <td>Lorem ipsum</td>
                    </tr>
                </table>
                
                <!-- Unorder list -->
                <ul class="ul-style01">
                    <li>Lorem ipsum sit dolor amet</li>
                    <li>Lorem ipsum sit dolor amet</li>
                    <li>Lorem ipsum sit dolor amet
                        <ul>
                            <li>Lorem ipsum sit dolor amet</li>
                            <li>Lorem ipsum sit dolor amet
                                <ul>
                                    <li>Lorem ipsum sit dolor amet</li>
                                    <li>Lorem ipsum sit dolor amet</li>
                                    <li>Lorem ipsum sit dolor amet</li>
                                </ul>
                            </li>
                            <li>Lorem ipsum sit dolor amet</li>
                        </ul>
                    </li>
                    <li>Lorem ipsum sit dolor amet</li>
                    <li>Lorem ipsum sit dolor amet</li>
                </ul>

            </div> <!-- /content-in -->
               
        </div> <!-- /content -->

        <hr class="noscreen" />

        <!-- Sidebar -->
        <div id="aside">
<%@ include file="include/sidebar.jsp" %>
        </div> <!-- /aside -->
    
    </div> <!-- /cols -->
    
   

    <hr class="noscreen" />
    
    <!-- Footer -->
    <div id="footer">

<%@ include file="include/footer.jsp" %>   

    </div> <!-- /footer -->

</div> <!-- /main -->
<!-- regModal -->
<div id="regModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="regModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Modal header</h3>
  </div>
  <div class="modal-body">
    <p>One fine body</p>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
    <button class="btn btn-primary">Save changes</button>
  </div>
</div>





<!-- Modal -->
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Pre-Registration Form</h3>
  </div>
  <div class="modal-body">
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
  
</form>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
    <button class="btn btn-primary">Save changes</button>
  </div>
  
  
  
</div>
<!-- Modal -->
</body>
</html>
