<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page import="app.admission.*" %>


<%

      
        try
        {
        int group_id=Integer.parseInt(request.getParameter("group_id"));
       // System.out.println(group_id);
       	String inst_id[]=new String[]{(request.getParameter("inst[]"))};
       	//System.out.println("Inst_id length:"+inst_id.length);
       	//System.out.println("Inst_id:"+inst_id[0]);
        Connection con;
        con =  DB_access.getConnection();
        int i;
        for(i=0;i<inst_id.length;i++){
  		PreparedStatement ps = con.prepareStatement("insert into group_participants(group_id,participant_id) values(?,?)");
		ps.setInt(1,group_id);
		ps.setInt(2, Integer.parseInt(inst_id[i]));
		ps.executeUpdate();	 
        }
		DB_access.close(con);
		//response.sendRedirect("view_institute_profile.jsp");
    	session.setAttribute("message", "Changes Saved");
    	response.sendRedirect("index.jsp");

			}
        
        catch(Exception e)
		{
			   	session.setAttribute("error_message", "Error in saving changes");
			   System.out.println("Exception in db_invite_institution:"+e);
  			  	response.sendRedirect("index.jsp");
//out.println("<b>Enter the fields properly.There is an "+e+" </b>");
			//response.sendRedirect("Institute_profile.jsp");
        }
%>
