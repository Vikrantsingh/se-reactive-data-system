<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page import="app.admission.*,java.security.*" %>


<%
       	    session.setAttribute("message", "Logout successfully");        	
      	    session.setAttribute("email", "");
        	response.sendRedirect("index.jsp");
       
%>