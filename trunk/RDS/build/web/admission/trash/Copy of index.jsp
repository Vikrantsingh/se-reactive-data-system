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
        
            <h2 id="content-title">Lorem ipsum dolor sit amet</h2>
            
            <!-- Perex -->
            <div id="perex" class="box">
            
                <p><img src="tmp/image-02.gif" width="150" height="113" alt="" class="f-left" />
                Donec commodo. Pellentesque nunc. Ut blandit nisl nunc. <a href="#">Donec sapien</a> estem imperdiet ultrices, cursus elementum ac, neque. Cum sociis 
                natoque penatibus et magnis dis parturient montes, nascetur ridiculuses mus. Sed in odio. Sedate ornare aliquam tortor. Aliquam aliquam blandit ante. 
                Fusce elit. Donec blanditili. Sed nisi. Proin eros lectus, fermentum at, tristique quis, molestie quis, lectus. Nulla facilisi. Lorem ipsum dolor sit amet.</p>
            
            </div> <!-- /perex -->

            <hr class="noscreen" />
            
            <div id="content-in">
                
                <!-- 3 sections -->
                <div id="sections" class="box">

                    <!-- Section -->                
                    <div class="section">
                        <h3><a href="#">Section I.</a></h3>
                        <p><a href="#"><img src="tmp/image.gif" width="200" height="150" alt="" /></a></p>    
                        <div class="section-in">
                            <p>Lorem ipsum dolor sita ametes ensectetue adipiscing elit. Sed suscipit e lobortis. Semi ornare aliquam tortor. Aliquame bit.</p>
                        </div> <!-- /section-in -->
                        <p class="t-center"><a href="#"><img src="design/btn-more.gif" width="40" height="22" alt="" /></a></p>
                    </div> <!-- /section -->
                    
                    <!-- Section -->
                    <div class="section margin">
                        <h3><a href="#">Section II.</a></h3>
                        <p><a href="#"><img src="tmp/image.gif" width="200" height="150" alt="" /></a></p>
                        <div class="section-in">
                            <p>Lorem ipsum dolor sita ametes ensectetue adipiscing elit. Sed suscipit e lobortis. Semi ornare aliquam tortor. Aliquame bit.</p>
                        </div> <!-- /section-in -->
                        <p class="t-center"><a href="#"><img src="design/btn-more.gif" width="40" height="22" alt="" /></a></p>
                    </div> <!-- /section -->
                    
                    <!-- Section -->
                    <div class="section fix">
                        <h3><a href="#">Section III.</a></h3>
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
    
    <div id="cols-bottom"></div>

    <hr class="noscreen" />
    
    <!-- Footer -->
    <div id="footer">

<%@ include file="include/footer.jsp" %>   

    </div> <!-- /footer -->

</div> <!-- /main -->

</body>
</html>
