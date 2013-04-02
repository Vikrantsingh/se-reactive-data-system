<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page import="app.admission.*" %>


<%

      
        try
        {
        	int list_degree_id = Integer.parseInt(request.getParameter("list_degree_id"));
        	
        float percentage = Float.parseFloat(request.getParameter("percentage"));
        int branch = Integer.parseInt(request.getParameter("branch"));
        Connection con;
        con =  DB_access.getConnection();
  		PreparedStatement ps;
		ps = con.prepareStatement("insert into prerequisites(branch_id,list_degree_id,percentage)values(?,?,?)");
 		ps.setInt(1,branch);
 		ps.setInt(2,list_degree_id);
		
		ps.setFloat(3,percentage);
 		

		
		ps.executeUpdate();
		DB_access.close(con);
		//response.sendRedirect("view_institute_profile.jsp");
    	session.setAttribute("message", "Prerequisites Added");
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
