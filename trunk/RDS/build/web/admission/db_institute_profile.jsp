<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page import="app.admission.*" %>


<%

      
        try
        {
        String inst_name=request.getParameter("inst_name");
        String contact_no = request.getParameter("contactno");
        String address = request.getParameter("address");
        String state = request.getParameter("state");
        String city = request.getParameter("city");
        
        Connection con;
        con =  DB_access.getConnection();
        int i=0;
  		PreparedStatement ps = con.prepareStatement("update institute_profile set institute_name=?, contact_no =?, address=?,city=?, state=?,event_detected=? where institute_id=?");
		ps.setString(1,inst_name);
		ps.setString(2,contact_no);
 		ps.setString(3, address);
 		ps.setString(4,city);
 		ps.setString(5,state);
 		ps.setInt(6,i);
 		ps.setInt(7,(Integer.parseInt(session.getAttribute("id").toString())));
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
