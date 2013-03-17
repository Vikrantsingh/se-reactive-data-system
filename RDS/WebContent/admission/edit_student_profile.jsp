<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page import="app.admission.*"%>
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
						
					<form name="profile" action="db_student_profile.jsp">

<% 
	Connection con=DB_access.getConnection();
	ResultSet rs=null,r=null;
	try{
		String sql="select * from student_profile where student_id='"+session.getAttribute("id")+"'";
		rs=DB_access.readFromDB(sql, con);
		//System.out.println(session.getAttribute("id"));
	
		if(rs.next() ){
%>

<table  class="nomb table-style01">
<tr class="bg"><td colspan="2"><h1><b>Student Details:</b></h1></tr>
<tr><td>
Name: <td><input type="text" name="name" id="name" value="<%=rs.getString("name")%>"/><br>
<tr><td>Mobile Number:<td><input type="text" name="mobileno" id="mobileno" value="<%=rs.getString("mobileno")%>"/><br>
<tr><td>Date Of Birth:<td><input type="date"name="dob" id="dob" value="<%=rs.getString("dob")%>"/><br>
<tr><td>Address:<td><textarea rows="3" cols="30" name="address" id="address" ><%=rs.getString("address")%></textarea><br>
<tr><td>State:<td><select name="state" id="state" >
<option value="<%=rs.getString("state")%>" selected><%=rs.getString("state")%></option>
<option value="Karnataka">Karnataka</option>
<option value="Andhra Pradesh">Andhra Pradesh</option>
</select><br>
<tr><td>City:<td><select name="city" id="city" >
<option value="<%=rs.getString("city")%>" selected><%=rs.getString("city")%></option>
<option value="Bangalore">Bangalore</option>
<option value="Hyderabad">Hyderabad</option>
</select><br>
<tr><td>Summary:<td><textarea rows="4" cols="50" name="summary" id="summary"><%=rs.getString("summary")%></textarea><br>
<tr><td colspan="2" align="center">
		<button type="submit" class="btn btn-primary">
					Save <i class="icon-ok icon-white"></i>
				</button>
</table>
</form>
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
