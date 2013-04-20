<div class="navbar">
	<div class="navbar-inner" style="height: 40px;">
		<div class="container">
			<a class="btn btn-navbar" data-toggle="collapse"
				data-target=".navbar-responsive-collapse"> <span
				class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
			</a>

			<div class="nav-collapse collapse navbar-responsive-collapse">
				<ul class="nav">
					<li class="active"><a href="index.jsp">Home</a></li>
					<li><a href="#">Link</a></li>
					<li><a href="#">Link</a></li>
					
				

				<%
					if (session.getAttribute("email") != null
							&& !session.getAttribute("email").equals("")) {
						
						if(session.getAttribute("type").equals("student"))
						{
				%>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Profile<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="view_student_profile.jsp">View</a></li>
							<li><a href="edit_student_profile.jsp">Edit</a></li>
							<li class="divider"></li>
							<li><a href="view_student_education.jsp">View Education</a></li>
							<li><a href="new_student_education.jsp">Add Education</a></li>
							
							
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Admission<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">Find Colleges</a></li>
							<li><a href="student_view_admisssion_groups.jsp">Admission Groups</a></li>
							
							<li class="divider"></li>
							<li class="nav-header">Status</li>
							<li><a href="student_my_applications.jsp">My Applications</a></li>
							<li><a href="#">Status</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Alerts <span class="badge badge-important"> 2</span><b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">Inbox <span class="badge badge-important">2</span></a></li>
							<li><a href="#">Invitations <span class="badge badge-important">0</span></a></li>
							<li><a href="#">Apply</a></li>
							<li class="divider"></li>
							<li class="nav-header">Nav header</li>
							<li><a href="#">Separated link</a></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>



				<%
						}
						if(session.getAttribute("type").equals("institute"))
						{
							
															
					%>
					
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Profile<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="view_institute_profile.jsp">View</a></li>
							<li><a href="edit_institute_profile.jsp">Edit</a></li>
							
							<li class="divider"></li>
							<li><a href="institute_view_department.jsp">View Department</a></li>
							<li><a href="institute_new_department.jsp">Add New Department</a></li>		
							<li><a href="institute_new_prerequisites.jsp">Add New Prerequisites</a></li>												
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Admission<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="institute_create_group.jsp">Create Group</a></li>
							<li><a href="institute_invite.jsp">Invite Institute</a></li>
							<li><a href="institute_enroll_courses.jsp">Enroll Courses</a></li>
							<li class="divider"></li>
							<li class="nav-header">Groups</li>
							<li><a href="view_all_admission_group.jsp">All Groups</a></li>
							<li><a href="#">Groups I'm in</a></li>
							<li><a href="#">Group I Own</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Alerts <span class="badge badge-important"> 4</span><b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">Inbox  <span class="badge badge-important"> 2</span></a></li>
							<li><a href="institute_available_invitation.jsp">Invitations  <span class="badge badge-important"> 2</span></a></li>
							<li><a href="#">Application</a></li>
							<li class="divider"></li>
							<li class="nav-header">Groups</li>
							<li><a href="#">All Groups</a></li>
							<li><a href="#">Groups I'm in</a></li>
							<li><a href="#">Groups I Own</a></li>
						</ul></li>
						
						
					<%}
					}
					else
					{
						 %>
						 <li><a href="#myModal" data-toggle="modal">
							Register Now</a></li>			 
						 <%
						
					}
				%>

				</ul>

				<%@ include file="auto_complete.jsp"%>


			</div>

		</div>
	</div>
</div>