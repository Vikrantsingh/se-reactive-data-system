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
						


<form name="profile" action="db_new_student_education.jsp">
 
<table   class="nomb table-style01">
<tr  class="bg"><td colspan="2"><h1><b>Educational Details:</b></h1></td></tr>
<tr><td>Institute Name:<td> <input type="text" name="institute_name" id="institute_name" value=""/>
<tr><td>Degree:<td><select name="degree" id="degree" >
<option value="10th">Tenth</option>
<option value="12th">Twelve</option>
<option value="B.Tech">B.Tech</option>
<option value="M.Tech">M.Tech</option>
</select><br>
<tr><td>Start Year:<td><input type="date"name="start" id="start" value=""/><br>
<tr><td>End Year:<td><input type="date"name="end" id="end" value=""/><br>
<tr><td>Specialization:<td><select name="specialization" id="specialization" >
<option value="CSE">Computer Science Engineering</option>
<option value="ECE">Electronic and Communication Engineering</option>
<option value="IT">Information Technology</option>
<option value="MB">Micro Biology</option>
</select><br>
<tr><td>Percentage:<td><input type="text"  name="percentage" id="percentage" value="" />
<tr><td align="center"	 colspan="2">	<button type="submit" class="btn btn-primary">
					Save <i class="icon-ok icon-white"></i>
				</button>
</table></form>
					
					
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
