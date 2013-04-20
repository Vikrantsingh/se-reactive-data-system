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
<h1><b>Seat Allocation Details:</b></h1>
<table border="1"  class="nomb table-style01">
    
			<thead >
							<th align='center'>Institute Name</th>
						<th align='center'>Group</th>
							<th align='center'>Applied Degree</th>
     <th align='center'>Specialization</th>
      <th  align='center'>Acceptance</th></thead>
<%
        
 Connection con=DB_access.getConnection();
ResultSet rs=null;
try{
	
	//System.out.println(session.getAttribute("id"));

	String sql="select * from (group_seat_allocation natural join group_student_institute_preferences natural join group_admission  natural join group_application join institute_profile on owner_id=institute_id natural join institute_branch)where applicant_id="+session.getAttribute("id");
	rs=DB_access.readFromDB(sql, con);
        System.out.print("kkkkkkk="+sql);
	while( rs.next()){
		//System.out.println(rs.getString("institute_name"));
		 
	
%>

<tr>
<td><%=rs.getString("institute_name")%></td>
<td><%=rs.getString("title")%></td>
<td><%=rs.getString("degree")%></td>
<td><%=rs.getString("specialization")%></td>
<td align="center">
    <%
if(rs.getString("acceptance_status").equalsIgnoreCase("pending")){    
%>
    <a href="seat_acceptance.jsp?seat_allocation_id=<%=rs.getString("seat_allocation_id")%>" class="btn btn-primary ">
		<i class=" icon-briefcase icon-white"></i></a></td>
</tr>
<%
	}
else
       {
    if(rs.getString("acceptance_status").equalsIgnoreCase("accepted")){
        out.print("Approved");
        
    }
    else
        out.print("Rejected");
}
        }
}
catch(Exception e){
	System.out.println("Error occured:"+e);
}
finally{
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
