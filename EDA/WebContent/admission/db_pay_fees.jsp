<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page import="app.admission.*" %>


<%

      
        try
        {
        int group_payment_id = Integer.parseInt(request.getParameter("group_payment_id"));
        Connection con;
        con =  DB_access.getConnection();
  		PreparedStatement ps;
                Statement st = con.createStatement();
                String query ="update  group_payment set payment_status='paid' where group_payment_id="+group_payment_id;
                st.executeUpdate(query);
                /*
		ps = con.prepareStatement("insert into group_payment (group_app_id,payment_type) values(?,?)");
 		ps.setInt(1,group_app_id);               
 		ps.setString(2,request.getParameter("payment_type"));
		ps.executeUpdate();
 * */
		DB_access.close(con);
		//response.sendRedirect("view_institute_profile.jsp");
    	session.setAttribute("message", "Feed Paid");
    	response.sendRedirect("student_my_applications.jsp");

			}
        
        catch(Exception e)
		{
			session.setAttribute("error_message", "Error in saving changes");
  			//  	response.sendRedirect("index.jsp");
			out.println("<b>Enter the fields properly.There is an "+e+" </b>");
			//response.sendRedirect("Institute_profile.jsp");
        }
%>
    
