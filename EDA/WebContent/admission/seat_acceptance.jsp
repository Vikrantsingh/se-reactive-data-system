<%-- 
    Document   : seat_acceptance.jsp
    Created on : 3 Apr, 2013, 8:29:27 PM
    Author     : user
--%>

<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page import="app.admission.*"%>
<% 
Connection con=DB_access.getConnection();
ResultSet rs=null;
try{
	
	//System.out.println(session.getAttribute("id"));

	String sql="update group_seat_allocation set acceptance_status='accepted'";
        DB_access.update(con, sql);
        DB_access.close(con);
        response.sendRedirect("view_status.jsp");
               }
catch(Exception e){
    e.printStackTrace();
}
        
        %>
