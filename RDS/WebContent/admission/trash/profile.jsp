<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Profile Page</title>
</head>
<body>
<form name="profile" action="db_profile.jsp">
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page import="app.admission.*"%>
<% 
try{
	Connection con=DB_access.getConnection();
	ResultSet rs;
	System.out.println(session.getAttribute("id"));
	String query="select * from student_profile where student_id='"+session.getAttribute("id")+"'";
	rs=DB_access.readFromDB(query, con);
	if(rs.next()){
		System.out.println(rs.getString("name"));
%>
Username: <input type="text" name="name" id="name" value="<%=rs.getString("name")%>"/><br>
Mobile Number:<input type="text" name="mobileno" id="mobileno" value="<%=rs.getString("mobileno")%>"/><br>
Date Of Birth:<input type="date"name="dob" id="dob" value="<%=rs.getString("dob")%>"/><br>
Address:<br><textarea rows="10" cols="30" name="address" id="address" ><%=rs.getString("address")%></textarea><br>
State:<select name="state" id="state" >
<option value="<%=rs.getString("state")%>" selected><%=rs.getString("state")%></option>
<option value="Karnataka">Karnataka</option>
<option value="Andhra Pradesh">Andhra Pradesh</option>
</select><br>
City:<select name="city" id="city" >
<option value="<%=rs.getString("city")%>" selected><%=rs.getString("city")%></option>
<option value="Bangalore">Bangalore</option>
<option value="Hyderabad">Hyderabad</option>
</select><br>
Summary:<br><textarea rows="20" cols="50" name="summary" id="summary"><%=rs.getString("summary")%></textarea><br>

<%
	}
}
catch(Exception e){
	System.out.println("Error occured:"+e);
}
finally{
	//DB_access.close(rs);
	//DB_access.close(con);
}
%>
<input type="submit" name="Submit"/> 
<input type="reset" name="Reset"/>
</form>
</body>
</html>