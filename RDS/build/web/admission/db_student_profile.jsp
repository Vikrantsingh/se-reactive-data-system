<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page import="app.admission.*,java.security.*" %>

<%
      
        try
        {
        String username=request.getParameter("name");
        String mobileno = request.getParameter("mobileno");
        String address = request.getParameter("address");
        String state = request.getParameter("state");
        String city = request.getParameter("city");
        String dob = request.getParameter("dob");
        String summary = request.getParameter("summary");
        Connection con;
        con =  DB_access.getConnection();

  		PreparedStatement ps = con.prepareStatement("update student_profile set name=?, mobileno =?, address=?, state=?,city=?, dob=?,summary=?,event_detected=? where student_id=?");
		ps.setString(1,username);
		ps.setString(2,mobileno);
 		ps.setString(3, address);
 		ps.setString(4,state);
 		ps.setString(5,city);
 		ps.setString(6,dob);
 		ps.setString(7,summary);
 		ps.setInt(8,0);
 		ps.setInt(9,(Integer.parseInt(session.getAttribute("id").toString())));
		ps.executeUpdate();
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
