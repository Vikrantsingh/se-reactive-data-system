<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page import="app.admission.*" %>


<%

      
        try
        {
       	int branch_id = Integer.parseInt(request.getParameter("branch_id"));
        int group_id=Integer.parseInt(request.getParameter("group_id"));
        int participant_id = Integer.parseInt(session.getAttribute("id").toString());
        Connection con;
        con =  DB_access.getConnection();
  		PreparedStatement ps;
		ps = con.prepareStatement("insert into group_participants_enroll_courses(participant_id,group_id,branch_id) values(?,?,?)");
 		ps.setInt(1,participant_id);
 		ps.setInt(2,group_id);
		ps.setInt(3,branch_id);
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
    