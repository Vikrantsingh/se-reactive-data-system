<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

<%@ include file="include/headtag.jsp"%>
</head>

<body>

	<div id="main">

		<!-- Header -->
		<div id="header">
			<%@ include file="include/header.jsp"%>

		</div>
		<!-- /header -->



		<!-- 2 columns (content + sidebar) -->
		<div id="cols" class="box">
			<div id="nav11">
				<%@ include file="include/navigation.jsp"%>

			</div>
			<!-- Content -->
			<div id="content">




				<hr class="noscreen" />

				<%
 				if(session.getAttribute("message") != null && !session.getAttribute("message").equals(""))
				{
 				%>
				<div class="alert alert-success" style="margin: 10px">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4>Message</h4>
					<% out.print(session.getAttribute("message"));
						session.setAttribute("message","");
 					%>
				</div>
				<% }%>
				<%
 				if(session.getAttribute("error_message") != null && !session.getAttribute("error_message").equals(""))
				{
 				%>
				<div class="alert alert-error" style="margin: 10px">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4>Message</h4>
					<% out.print(session.getAttribute("error_message"));
						session.setAttribute("error_message","");
 					%>
				</div>
				<% }%>
				<%
 				if(session.getAttribute("warning_message") != null && !session.getAttribute("warning_message").equals(""))
				{
 				%>
				<div class="alert alert-block" style="margin: 10px">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4>Message</h4>
					<% out.print(session.getAttribute("warning_message"));
						session.setAttribute("warning_message","");
 					%>
				</div>
				<% }%>

				<div id="content-in">


					<%@page import="java.sql.*"%>
					<%@page import="java.io.*"%>
					<%@page import="app.admission.*"%>
					<% 
Connection con=DB_access.getConnection();
ResultSet rs=null,r=null;
try{
	
	//System.out.println(session.getAttribute("id"));

		//System.out.println(rs.getString("institute_name"));
		String sq="select * from institute_branch where id_login='"+session.getAttribute("id")+"'";
		rs=DB_access.readFromDB(sq, con);
		//String sql="select * from institute_profile";
		//r=DB_access.readFromDB(sql, con);
		//a need to send the group_id from the creating group one thing
%>
					<form action="db_institute_group_course_register.jsp">

						<table class="nomb table-style01">
							<thead>
								<th colspan="2" align="left">
									<h1 align="left">Enroll Courses</h1>
								</th>
							</thead>

							<tr>
								<td>Group</td>
								<td><select name="group_id" id="group_id">
										<%

								Connection cong=DB_access.getConnection();
ResultSet rsg=null;
try{
	
	//System.out.println(session.getAttribute("id"));

		//System.out.println(rs.getString("institute_name"));
		String sqlg="select * from group_participants natural join group_admission where participant_id='"+session.getAttribute("id")+"' and status='accepted'";
		rsg=DB_access.readFromDB(sqlg, cong);

		 while(rsg.next()){ %>
										<option value="<%=rsg.getString("group_id")%>"><%=rsg.getString("title")%></option>
										<%
		}
		}
	catch(Exception ex){
	}

	

 %>
								</select></td>
							</tr>

							<tr>
								<td>Branches</td>
								<td><select name="branch_id" id="branch_id">
										<% while(rs.next()){ %>
										<option value='<% out.print(rs.getInt("branch_id")); %>'>
											<% out.print(rs.getString("degree")+":"+rs.getString("specialization")); %>
										</option>
										<%} %>
								</select></td>
							</tr>

							<tr>
								<td>&nbsp;</td>
								<td>

									<button type="submit" class="btn btn-primary">
										Save <i class="icon-ok icon-white"></i>
									</button>
								</td>
							</tr>
						</table>
						,
					</form>

					<%
}
catch(Exception e){
	System.out.println("Error occured:"+e);
}
finally{
	//DB_access.close(r);
	DB_access.close(rs);
	DB_access.close(con);
}
%>

				</div>
				<!-- /content-in -->

			</div>
			<!-- /content -->

			<hr class="noscreen" />

			<!-- Sidebar -->
			<div id="aside">
				<%@ include file="include/sidebar.jsp"%>
			</div>
			<!-- /aside -->




		</div>
		<!-- /cols -->



		<hr class="noscreen" />

		<!-- Footer -->
		<div id="footer">

			<%@ include file="include/footer.jsp"%>

		</div>
		<!-- /footer -->

	</div>
	<!-- /main -->
</body>
</html>
