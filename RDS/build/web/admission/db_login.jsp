<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Redirect</title>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page import="app.admission.*,java.security.*" %>


<%
      
        try
        {
        String user=request.getParameter("email");
        String password=request.getParameter("password");
        String check=DB_access.checkAccountActivated(user);
        if(check.equals("valid")){
       	 HttpSession s = request.getSession();
     	String query = "select * from login where username='"+user+"'";
     	Connection connection=null;
     	connection=DB_access.getConnection();
     	ResultSet r=DB_access.readFromDB(query, connection);
     	System.out.println("retrieved");
     	if(r.next()){
     	s.setAttribute("id", r.getInt("id"));
     	s.setAttribute("email", r.getString("username"));
     	s.setAttribute("type", r.getString("type"));
     //	System.out.println("id:"+s.getAttribute("id")+" email:"+s.getAttribute("email")+" type:"+s.getAttribute("type"));
         DB_access.close(connection);
         }
     	//System.out.println(session.getAttribute("id"));
     	//String sql="insert into student_profile(student_id,name,mobileno,address,city,state,dob,summary) values("+session.getAttribute("id")+",'','','','','','','')";
     	//String sql1="insert into student_education(id,institute_name,degree,start_year,end_year,specialization,percentage) values("+session.getAttribute("id")+",'','','','','','')";
     	//int rows=DB_access.update(sql);
     	//DB_access.update(sql1);
    	session.setAttribute("message", "Login Success");
    	response.sendRedirect("index.jsp");
    }
    else{
    	session.setAttribute("error_message", "Account Not yet Activated");
    	response.sendRedirect("index.jsp");
    }
    }
    catch(Exception e)
	{
    	session.setAttribute("error_message","<b>Authentication Failed!</b>");
    	response.sendRedirect("index.jsp");
//			out.println("<b>Enter the fields properly.There is an "+e+" </b>");
        }
%>
</head>
<body>

</body>
</html>