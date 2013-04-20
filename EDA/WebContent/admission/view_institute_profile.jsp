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
<%@page import="java.io.*" %>
<%@page import="app.admission.*"%>
<% 
Connection con=DB_access.getConnection();
ResultSet rs=null,r=null;
try{
	
	//System.out.println(session.getAttribute("id"));
	String query="select * from institute_profile where institute_id='"+session.getAttribute("id")+"'";
	rs=DB_access.readFromDB(query, con);
 
	if(rs.next()){
		//System.out.println(rs.getString("institute_name"));
%>
<table class="nomb table-style01">
<tr class="bg"><td colspan="2"><h1><b>Institution Details:</b></h1></td></tr>
<tr>
<td>Institute Name:</td>
<td><%=rs.getString("institute_name")%></td>
</tr>
 <tr>
<td>Contact Number:</td>
<td><%=rs.getString("contact_no")%></td>
</tr>
<tr>
<td>Address :</td>
<td><%=rs.getString("address")%></td>
</tr>
<tr>
<td>State :</td>
<td><%=rs.getString("state")%></td>
</tr>
<tr>
<td>City:</td>
<td><%=rs.getString("city")%></td>
</tr>
<%
	}
}
catch(Exception e){
	System.out.println("Error occured:"+e);
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
