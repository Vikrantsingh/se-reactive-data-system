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

	String sql="select DISTINCT(group_id),title,description,group_payment_id,payment_status,application_status from view_group_details where applicant_id="+Integer.parseInt(session.getAttribute("id").toString());
	r=DB_access.readFromDB(sql, con);
        %>
        <form action="">
<table class="nomb table-style01">

			<thead >
							<th width="40%">Title</th>
						<th width="40%">Description</th>
							<th colspan='2' align='center'>Payment</th>
     <th colspan='2' align='center'>Preferences</th>
      <th colspan='2' align='center'>View Status</th></thead>
    <%
	while( r.next()){
		//System.out.println(rs.getString("institute_name"));
		int id1=r.getInt("group_id");
%>
<tr>

    <td><a href="student_view_group_detail.jsp?group_id=<%=id1%>" ><%=r.getString("title")%></a></td>

    <td><a href="student_view_group_detail.jsp?group_id=<%=id1%>" ><%=r.getString("description")%></a></td>


<td colspan='2' align='center'>
    <%
        if(!r.getString("payment_status").equals("paid"))
                  {
    %>
	<a href="student_pay_fees.jsp?group_payment_id=<%=r.getString("group_payment_id")%>" class="btn btn-primary ">
		<i class=" icon-briefcase icon-white"></i>
</a>
      <%
             }
                else
                                       {
                    out.print("Paid");
                }

%>                   
                
</td>
<td colspan='2' align='center'>
    
    <%
        if(r.getString("application_status").equals("approved"))
                  {
    %>
		<a href="student_preferences.jsp?group_id=<%=r.getInt("group_id")%>"><button type="button" class="btn btn-primary">
					<i class="icon-align-justify icon-white"></i>
				</button></a>
      <%
             }
                else
                                       {
                    out.print("Not-Approved");
                }

%>  
    
    

</td>
<td colspan='2' align='center'>
    
    
    <%
        if(r.getString("application_status").equals("approved"))
                  {
    %>
		
	<a href="#"><button type="button" class="btn btn-primary">
					<i class="icon-share-alt icon-white"></i>
				</button></a>
      <%
             }
                else
                                       {
                    out.print("Not-Approved");
                }

%>  
    
</td>
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
