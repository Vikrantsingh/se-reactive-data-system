
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="eda.api.dbevents.DB_Events"%>
<%@page import="eda.connection.DB_Config"%>
<%@page import="java.sql.*"%>


<%


try {
	
	
	
	DB_Events dbe = new DB_Events(); 
	
	//specify name of event, database Id , on which table it will happen and last one is surrogate key of table
	dbe.register_Event(request.getParameter("eventname"),Integer.parseInt(request.getParameter("database")),request.getParameter("table"),request.getParameter("surrogatekey"));
	
	//specify a set of rules for triggering event
	
	//set constrainst
	dbe.setConstraints(request.getParameter("constraints"));
					
	//Commit all the changes
	dbe.save();
	
    	
	session.setAttribute("message", "Event Registered");		
	response.sendRedirect("event_manager.jsp");
	
	
}
catch(Exception ex)
{
	System.out.print(ex.toString());
	session.setAttribute("message", "Err in saving info");		
	response.sendRedirect("event_manager.jsp");


}

%>

