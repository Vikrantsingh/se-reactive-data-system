<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page import="app.admission.*" %>


<%

      
        try
        {
        String branch_name=request.getParameter("branch_name");
        String description = request.getParameter("description");
        String seats = request.getParameter("seats");
        Connection con;
        con =  DB_access.getConnection();
  		PreparedStatement ps;
		ps = con.prepareStatement("insert into institute_branch(id_login,branch_name,description,seats)values(?,?,?,?)");
 		ps.setInt(1,(Integer.parseInt(session.getAttribute("id").toString())));
		ps.setString(2,branch_name);
		ps.setString(3,description);
 		ps.setString(4, seats);
		ps.executeUpdate();
		DB_access.close(con);
		//response.sendRedirect("view_institute_profile.jsp");
    	session.setAttribute("message", "Changes Saved");
    	response.sendRedirect("index.jsp");

			}
        
        catch(Exception e)
		{
			   	session.setAttribute("error_message", "Error in saving changes");
  			  	response.sendRedirect("index.jsp");
//out.println("<b>Enter the fields properly.There is an "+e+" </b>");
			//response.sendRedirect("Institute_profile.jsp");
        }
%>
