
<!-- Your logo -->
<h1 id="logo">
	<img src="img/logo.jpg" /><a href="#"><span><i>Universal</i></span>
		Admission Counseling </a>
</h1>
<hr class="noscreen" />

<!-- Your slogan -->
<div id="slogan">

	<%
		if (session.getAttribute("email") != null
				&& !session.getAttribute("email").equals("")) {
	%>

	   <div class="btn-group"  >
		<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
			<%=session.getAttribute("email") %> <span class="caret"></span>
		</a>
		<ul class="dropdown-menu"  >
			<!-- dropdown menu links -->
			    <li  ><a href="#" >Dashboard</a></li>
                          <li><a href="#">Account Setting</a></li>
                          <li><a href="#">Privacy Setting</a></li>
                          <li class="divider"></li>                   
                          <li><a href="logout.jsp">Logout</a></li>     		
		</ul>
	</div>

	<%
		}

		else {
	%>
	<form class="form-inline" action="db_login.jsp" method="post">
		<input type="text" class="input-small" placeholder="Email"
			name="email"> <input type="password" class="input-small"
			placeholder="Password" name="password">
		<button type="submit" class="btn">Login</button>
	</form>
	<%
		}
	%>

</div>
<hr class="noscreen" />

<!-- Hidden navigation -->
<p class="noscreen noprint">
	<em>Quick links: <a href="#content">content</a>, <a href="#nav">navigation</a>.
	</em>
</p>
<hr class="noscreen" />
