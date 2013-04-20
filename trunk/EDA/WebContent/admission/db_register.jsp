
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page import="app.admission.*,java.security.*" %>


<%
      
        try
        {
        String user=request.getParameter("email");
        String password = request.getParameter("password");
        String type = request.getParameter("type");
        System.out.println(type);
        Connection con;
        con =  DB_access.getConnection();
		PreparedStatement ps = con.prepareStatement("INSERT INTO login(username,password,type) VALUES(?,?,?)");
		ps.setString(1,user);
		ps.setString(2,password);
		ps.setString(3, type);
		ps.executeUpdate();
		DB_access.close(con);
		int verfCode=DB_access.insertUser(user);
		System.out.println("user_id:"+verfCode);
			if(verfCode!=0)
			{//calling mail confirmation
				String verf = verfCode+"";
				byte[] bytesOfMessage = verf.getBytes("UTF-8");
				MessageDigest md = null;
				try {
					md = MessageDigest.getInstance("MD5");
				} catch (NoSuchAlgorithmException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				byte[] thedigest = md.digest(bytesOfMessage);
				//System.out.println(thedigest);
			//	SignUp.mailConformation(verfCode, user);
//				out.println("Check your email for activation link..");
				session.setAttribute("message", "Check your email for activation link..");		
				response.sendRedirect("index.jsp");
						
						
						
			}
        }
        catch(Exception e)
		{
			out.println("<b>Enter the fields properly.There is an "+e+" </b>");
        }
%>
</head>
<body>

</body>
</html>