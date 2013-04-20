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
int group_app_id=0;
try{
	
	//System.out.println(session.getAttribute("id"));

	String sql="select distinct(title),group_app_id from view_group_details where group_id="+request.getParameter("group_id")+" and applicant_id="+session.getAttribute("id");
        System.out.print(sql);
	r=DB_access.readFromDB(sql, con);
%>
<form action="db_student_preferences.jsp" method="post">
    <input type="hidden" value="<%=request.getParameter("group_id")%>" name="group_id" />
<table class="nomb table-style01">

			<thead >
								<th colspan="2" align="left">
									<h1 align="left">Branch Selection</h1>	
									</th>
							</thead>
<tr>
<td width="40%">For Group :</td>
<td>
<select name="group_app_id">
<%
	if( r.next()){
		//System.out.println(rs.getString("institute_name"));
		 
	group_app_id=r.getInt("group_app_id");
%>
	<option value="<%=r.getInt("group_app_id")%>"><%=r.getString("title")%></option>
<%
	}
            
%>

</select>

</td>
</tr>
<tr>
<td>Select branches:</td>
<td>
<select name="branch_id">
<%
        
 con=DB_access.getConnection();
 rs=null;
try{
	
	//System.out.println(session.getAttribute("id"));

	 sql="select distinct(branch_id),degree,specialization,institute_name,group_id from view_group_details_without_applicants where group_id="+request.getParameter("group_id")+" and branch_id NOT IN (select branch_id from group_student_institute_preferences where group_app_id="+group_app_id+" )";
	r=DB_access.readFromDB(sql, con);
        System.out.print("kkkkkkk="+sql);
	while( r.next()){
		//System.out.println(rs.getString("institute_name"));
		 
	
%>
	<option value="<%=r.getString("branch_id")%>"><%=r.getString("institute_name")%>:<%=r.getString("degree")%>:<%=r.getString("specialization")%></option>
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

</select>
</td>
</tr>
<tr>
<td colspan='2' align='center'>

	<button type="submit" class="btn btn-primary">
					Select Branch<i class="icon-ok icon-white"></i>
				</button>
</td>
</tr>
</table>
</form>
<%
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

<hr></hr>
<%
        
 con=DB_access.getConnection();
 rs=null;
try{
	
	//System.out.println(session.getAttribute("id"));

	 String sql="select * from institute_branch natural join group_student_institute_preferences natural join group_application join institute_profile on institute_profile.institute_id = id_login where applicant_id="+Integer.parseInt(session.getAttribute("id").toString());
	r=DB_access.readFromDB(sql, con);
	//while( r.next()){
		//System.out.println(rs.getString("institute_name"));
		 
	
%>

    <form action="">
<table class="nomb table-style01">

			<thead >
							<th width="40%">S.No</th>
						<th width="40%">Institute Name</th>
							<th align='center'>Degree</th>
     <th  align='center'>Specialization</th>
      <th  align='center'>Remarks</th></thead>
    <%
        int i=0;
	while( r.next()){
		//System.out.println(rs.getString("institute_name"));
		int id1=r.getInt("group_id");
%>
<tr>
    <td><%=++i%></td>

    <td><%=r.getString("institute_name")%></td>

    <td><%=r.getString("degree")%></td>
      <td><%=r.getString("specialization")%></td>
      <td>D</td>

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
<tr>
<td colspan='5' align='center'>
 
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
