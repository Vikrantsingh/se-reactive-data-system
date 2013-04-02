<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page import="app.admission.*" %>


<%

      
        try
        {
        String title = request.getParameter("title");
        String startdate=request.getParameter("startdate");
        String enddate = request.getParameter("enddate");
        String criteria = request.getParameter("criteria");
        int no_of_rounds = Integer.parseInt(request.getParameter("no_of_rounds"));
        String description = request.getParameter("description");
        int fees = Integer.parseInt(request.getParameter("fees"));
        
        
        Connection con;
        con =  DB_access.getConnection();
  		PreparedStatement ps;
		ps = con.prepareStatement("insert into group_admission(owner_id,start_date,end_date,no_of_rounds,title,description,fees,criteria) values(?,?,?,?,?,?,?,?)");
 		ps.setInt(1,Integer.parseInt(session.getAttribute("id").toString()));
 		ps.setString(2,startdate);
 		ps.setString(3,enddate);
		ps.setInt(4,no_of_rounds);
		ps.setString(5,title);
 		ps.setString(6, description);
 		ps.setInt(7, fees);
                ps.setString(8, criteria);
		ps.executeUpdate();
		DB_access.close(con);
		//response.sendRedirect("view_institute_profile.jsp");
    	session.setAttribute("message", "Changes Saved");
    	response.sendRedirect("institute_create_group.jsp");

			}
        
        catch(Exception e)
		{
			session.setAttribute("error_message", "Error in saving changes");
  			//  	response.sendRedirect("index.jsp");
			out.println("<b>Enter the fields properly.There is an "+e+" </b>");
			//response.sendRedirect("Institute_profile.jsp");
        }
%>
    