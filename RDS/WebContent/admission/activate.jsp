<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page import="app.admission.*"%>


<% 
Connection connection=null;
try{
	int i=Integer.parseInt(request.getParameter("user_id"));
	String user_type;
	DB_access.accountActivation(i);
	String query = "select * from login where id='"+i+"'";
 	connection=DB_access.getConnection();
 	ResultSet r=DB_access.readFromDB(query, connection);
 	if(r.next()){
 	System.out.println("retrieved");
 	user_type=r.getString("type");
 	System.out.println(user_type);
 	if(user_type.equalsIgnoreCase("student")){
		String sql="insert into student_profile(student_id,name,mobileno,address,city,state,dob,summary) values("+i+",'','','','','','','')";
	 	String sql1="insert into student_education(id,institute_name,degree,start_year,end_year,specialization,percentage) values("+i+",'','','','','','')";
	 	int rows=DB_access.update(sql);
	 	DB_access.update(sql1);
 	}
 	else{
 		String sql="insert into institute_profile(institute_id,institute_name,contact_no,address,city,state) values("+i+",'','','','','')";
 	 	String sql1="insert into institute_branch(id,branch_name,description,seats) values("+i+",'','','')";
 	 	int rows=DB_access.update(sql);
 	 	DB_access.update(sql1);
 	}
	session.setAttribute("message", "Account Activated");		
	response.sendRedirect("index.jsp");

 	}
}
catch(Exception e){
//	out.println("Exception caught:"+e);
	session.setAttribute("error_message", "Error Occurred. Try Again.");		
	response.sendRedirect("index.jsp");
}
finally{
	DB_access.close(connection);
}


%>

