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
						

<% 
Connection con=DB_access.getConnection();
ResultSet rs=null,r=null;
try{
	
	//System.out.println(session.getAttribute("id"));
	String query="select * from institute_profile where institute_id='"+session.getAttribute("id")+"'";
	rs=DB_access.readFromDB(query, con);
	//String sql="select * from institute_branch where id_login='"+session.getAttribute("id")+"'";
//	r=DB_access.readFromDB(sql, con);
	if(rs.next()){
		//System.out.println(rs.getString("institute_name"));
%>
<form name="inst_profile" action="db_institute_profile.jsp">

 
<table class="nomb table-style01">
<tr class="bg"><td colspan="2"><h1><b>Institution Details:</b></h1></td></tr>
<tr><td>
Institute Name: <td><input type="text" name="inst_name" id="inst_name" value="<%=rs.getString("institute_name")%>"/><br>
<tr><td>Contact Number:<td><input type="text" name="contactno" id="contactno" value="<%=rs.getString("contact_no")%>"/><br>
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
</select>
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



</body>
</html>
