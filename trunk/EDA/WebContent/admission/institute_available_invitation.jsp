<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
						
				<table  class="nomb table-style01">
<tr class="bg"><td colspan="4"><h1><b>Available Invitations:</b></h1></td></tr>
<tr><th>ID</th><th>Title</th><th>Acceptance</th><th>Rejection</th></tr>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page import="app.admission.*"%>
<% 
Connection con=DB_access.getConnection();
ResultSet rs=null,r=null;
try{
	
	//System.out.println(session.getAttribute("id"));

	String sql="select * from group_participants where participant_id='"+session.getAttribute("id")+"'";
	r=DB_access.readFromDB(sql, con);
	while( r.next()){
		String sql1="select * from group_admission  where group_id='"+r.getInt("group_id")+"'";
		//System.out.println(rs.getString("institute_name"));
		rs=DB_access.readFromDB(sql1, con);
		
%>



<%while(rs.next()){ %>
<tr>
<td><%=rs.getInt("owner_id")%></td><td><%=rs.getString("title")%></td><td>
<%
	if(r.getString("status").equals("pending"))
{
%>
<a href="db_institute_accept_invitation.jsp?group_id=<%=r.getInt("group_id")%>"><button type="button" class="btn btn-primary">
					Accept <i class="icon-ok icon-white"></i>
				</button></a>
				
				
<%
}
%>				</td><td><button type="submit" class="btn btn-primary">
					Reject <i class="icon-ok icon-white"></i>
				</button></td></tr>
<%
		}
	}
}
catch(Exception e){
	System.out.println("Error occured available_invitations.jsp:"+e);
}
finally{
	DB_access.close(r);
	DB_access.close(rs);
	DB_access.close(con);
}
%>
</table>
				



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
