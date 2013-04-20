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
<table  class="nomb table-style01">

<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page import="app.admission.*"%>
<% 
Connection con=DB_access.getConnection();
ResultSet rs=null,r=null;
try{
	
	//System.out.println(session.getAttribute("id"));

	String sql="select * from institute_branch where id_login='"+session.getAttribute("id")+"'";
	r=DB_access.readFromDB(sql, con);
	while( r.next()){
		//System.out.println(rs.getString("institute_name"));
%>

<tr  class="bg"><td colspan="2"><h3><b>Branch Details:</b></h3></td></tr>
<tr>
<td>Degree :</td>
<td><%=r.getString("degree")%></td>
</tr>
<tr>
<td>Specialization :</td>
<td><%=r.getString("specialization")%></td>
</tr>
<tr>
<td>Description :</td>
<td><%=r.getString("branch_description")%></td>
</tr>
<tr>
<td>Seats Available :</td>
<td><%=r.getString("seats")%></td>
</tr>
<tr>
<td>Prerequisites:</td>
<td>

<%
	sql="select * from view_prerequisites where branch_id='"+r.getString("branch_id")+"'";
	System.out.print(sql);
	ResultSet rt=DB_access.readFromDB(sql, con);
	while( rt.next()){

    %>
		<table width="100%">
		    <tr><td>Degree </td><td><%=rt.getString("degree")%></td></tr>
		    <tr><td>Specialization </td><td><%=rt.getString("specialization")%></td></tr>
		    <tr><td>Percentage </td><td><%=rt.getString("percentage")%></td></tr>
		</table>
    <%
	
	}
  %>
  </td></tr>
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
