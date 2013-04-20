
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="eda.connection.DB_Config"%>
<%@page import="java.sql.*"%>


<%


try {
	
	
    
	DB_Config db = new DB_Config();
	Connection con = db.registerDB();
	String query = "insert into database_info (database_name,hostname,port,username,password) values (?,?,?,?,?)";



	PreparedStatement pst = con.prepareStatement(query);
	pst.setString(1, request.getParameter("db_name"));
	pst.setString(2, request.getParameter("host"));
	pst.setInt(3, Integer.parseInt(request.getParameter("port")));
	pst.setString(4, request.getParameter("username"));
	pst.setString(5, request.getParameter("password"));
    
     pst.executeUpdate();
	con.close();
	
	session.setAttribute("message", "Check your email for activation link..");		
	response.sendRedirect("event_manager.jsp");

	
	
	
	
}
catch(Exception ex)
{
	System.out.print(ex.toString());
	session.setAttribute("message", "Err in saving info");		
	response.sendRedirect("event_manager.jsp");


}

%>

