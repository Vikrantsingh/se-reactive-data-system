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
						

<form action="db_institute_new_prerequisites.jsp" method="post">
<table class="nomb table-style01">
<tr  class="bg"><td colspan="2"><h3><b>Add New Prerequisites:</b></h3></td></tr>

<tr><td>Branch:</td><td>


<select name="branch" id="branch" >

<% 
Connection con=DB_access.getConnection();
ResultSet rs=null,r=null;
try{
	
	//System.out.println(session.getAttribute("id"));

	String sql="select * from institute_branch where id_login='"+session.getAttribute("id")+"'";
//	System.out.println(sql);
	r=DB_access.readFromDB(sql, con);
	while( r.next()){
	//	System.out.println("deg:"+r.getString("degree"));
%>
<option value='<% out.print(r.getInt("branch_id")); %>' ><% out.print(r.getString("degree")+":"+r.getString("specialization")); %></option>
<% 
}

	con.close();
}

catch(Exception ex)
{
}
%>

</select>
</td></tr>
<tr><td>Req. Degree:<td>
<select name="list_degree_id" id="list_degree_id" >
<% 
 con=DB_access.getConnection();
 r=null;
try{
	
	//System.out.println(session.getAttribute("id"));

	String sql="select * from list_of_degree_specialisation order by degree, specialization ";
//	System.out.println(sql);
	r=DB_access.readFromDB(sql, con);
	while( r.next()){
	//	System.out.println("deg:"+r.getString("degree"));
%>
<option value='<% out.print(r.getInt("list_degree_id")); %>' ><% out.print(r.getString("degree")+":"+r.getString("specialization")); %></option>
<% 
}

	con.close();
}

catch(Exception ex)
{
}
%>
</select>
<tr><td>Percentage:<td><input type="number" name="percentage" id="percentage" value=""/>
<tr><td colspan="2"  align="center">
		<button type="submit" class="btn btn-primary">
					Save <i class="icon-ok icon-white"></i>
				</button>
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



</body>
</html>
