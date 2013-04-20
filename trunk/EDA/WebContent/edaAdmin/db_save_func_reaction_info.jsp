
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="eda.api.reaction.FunctionReaction"%>
<%@page import="eda.api.reaction.DB_reaction"%>
<%@page import="eda.connection.DB_Config"%>
<%@page import="java.sql.*"%>


<%


try {
	
	
	FunctionReaction fr = new FunctionReaction();
	
	fr.registerReaction(Integer.parseInt(request.getParameter("event_id")),request.getParameter("reaction_name"),request.getParameter("function_name"));
		
	fr.save();
  

	session.setAttribute("message", "Saved");		
	response.sendRedirect("event_manager.jsp");	
	
	
	
}
catch(Exception ex)
{
	System.out.print(ex.toString());
	session.setAttribute("message", "Err in saving info");		
	response.sendRedirect("event_manager.jsp");


}

%>

