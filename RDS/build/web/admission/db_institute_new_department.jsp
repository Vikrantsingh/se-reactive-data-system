<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page import="app.admission.*" %>


<%

      
        try
        {
        	String degree = request.getParameter("degree");
        	String specialization=request.getParameter("specialization");
        String description = request.getParameter("description");
        String seats = request.getParameter("seats");
        Connection con;
        con =  DB_access.getConnection();
  		PreparedStatement ps;
		ps = con.prepareStatement("insert into institute_branch(id_login,degree,specialization,branch_description,seats)values(?,?,?,?,?)");
 		ps.setInt(1,(Integer.parseInt(session.getAttribute("id").toString())));
 		ps.setString(2,degree);
		ps.setString(3,specialization);
		ps.setString(4,description);
 		ps.setString(5, seats);
		ps.executeUpdate();
		DB_access.close(con);
		//response.sendRedirect("view_institute_profile.jsp");
    	session.setAttribute("message", "Changes Saved");
    	response.sendRedirect("index.jsp");

			}
        
        catch(Exception e)
		{
			   	session.setAttribute("error_message", "Error in saving changes");
  			//  	response.sendRedirect("index.jsp");
out.println("<b>Enter the fields properly.There is an "+e+" </b>");
			//response.sendRedirect("Institute_profile.jsp");
        }
%>
