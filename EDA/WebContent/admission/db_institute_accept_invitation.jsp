<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page import="app.admission.*" %>


<%

      
        try
        {
        int gid = Integer.parseInt(request.getParameter("group_id"));
        Connection con;
        con =  DB_access.getConnection();
  		PreparedStatement ps;
		ps = con.prepareStatement("update group_participants set status='accepted' where group_id=? and participant_id=?");
 		ps.setInt(1,gid);
 		ps.setString(2,session.getAttribute("id").toString());
		ps.executeUpdate();
		DB_access.close(con);
		//response.sendRedirect("view_institute_profile.jsp");
    	session.setAttribute("message", "Changes Saved");
    	response.sendRedirect("institute_available_invitation.jsp");

			}
        
        catch(Exception e)
		{
			session.setAttribute("error_message", "Error in saving changes");
  			//  	response.sendRedirect("index.jsp");
			out.println("<b>Enter the fields properly.There is an "+e+" </b>");
			//response.sendRedirect("Institute_profile.jsp");
        }
%>
    