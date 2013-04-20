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
						
			



<form action="db_institute_create_group.jsp">
<table  class="nomb table-style01">
<tr class="bg"><td colspan="2"><h1><b>Create Group:</b></h1></td></tr>
  <tr>
    <td>Title</td>
    <td><input type="text" name="title" id="title"/></td>
  </tr>
  <tr>
    <td>Start Date</td>
    <td><input type="date" name="startdate" id="startdate"/></td>
  </tr>
  <tr>
    <td>End Date</td>
    <td><input type="date" name="enddate" id="enddate"/></td>
  </tr>
  <tr>
    <td>Number Of Rounds</td>
    <td><input type="number" name="no_of_rounds" id="no_of_rounds"/></td>
  </tr>
  <tr>
    <td>Description</td>
    <td><textarea name="description" id="description" rows="4" cols="30">Description about the group</textarea></td>
  </tr>
  <tr>
    <td>Fees</td>
    <td><input type="number" name="fees" id="fees"/></td>
  </tr>
<tr>
    <td>Criteria</td>
    <td><select name="criteria" id="degree" >
<option value="10th">Tenth</option>
<option value="12th">Twelve</option>
<option value="B.Tech">B.Tech</option>
<option value="M.Tech">M.Tech</option>
<option value="M.Tech">Gate</option>
</select>
</td>
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

</form>





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
