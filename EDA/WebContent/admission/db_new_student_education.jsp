<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page import="app.admission.*,java.security.*" %>

<%
      
        try
        {

        String instname=request.getParameter("institute_name");
        String degree = request.getParameter("degree");
        String start = request.getParameter("start");
        String end = request.getParameter("end");
        String specialization = request.getParameter("specialization");
        String percent = request.getParameter("percentage");
        Connection con;
        con =  DB_access.getConnection();
  		PreparedStatement ps ;
  		ps = con.prepareStatement("insert into student_education(id_login,institute_name,degree,start_year,end_year,specialization,percentage)values(?,?,?,?,?,?,?)");
 		ps.setInt(1,(Integer.parseInt(session.getAttribute("id").toString())));
		ps.setString(2,instname);
		ps.setString(3,degree);
 		ps.setString(4, start);
 		ps.setString(5,end);
 		ps.setString(6,specialization);
 		ps.setString(7,percent);
		ps.executeUpdate();
		DB_access.close(con);
		session.setAttribute("message", "Changes Saved");
    	response.sendRedirect("index.jsp");
			}
        
        catch(Exception e)
		{
			//out.println("<b>Enter the fields properly.There is an "+e+" </b>");
			//response.sendRedirect("profile.jsp");
			session.setAttribute("error_message", "Error in Saving changes");
        	response.sendRedirect("index.jsp");
        }
%>
