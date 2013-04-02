<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page import="app.admission.*,java.security.*" %>


<%
      
        try
        {
        String user=request.getParameter("email");
        String password=request.getParameter("password");
        String check=DB_access.checkAccountActivated(user);
        if(check.equals("valid")){
        	session.setAttribute("email", user);
        	session.setAttribute("message", "Login Success");
        	response.sendRedirect("index.jsp");
        }
        else{
        	session.setAttribute("error_message", "Account Not yet Activated");
        	response.sendRedirect("index.jsp");
        }
        }
        catch(Exception e)
		{
        	session.setAttribute("error_message","<b>Authentication Failed!</b>");
        	response.sendRedirect("index.jsp");
//			out.println("<b>Enter the fields properly.There is an "+e+" </b>");
        }
%>