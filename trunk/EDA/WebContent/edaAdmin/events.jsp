

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="eda.connection.DB_Config"%>
<%@page import="eda.listener.Listener"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta charset="utf-8"/>
<meta name="Author" content="vikrantsingh.it@gmail.com" />
<%@ include file="include/headtag.jsp" %>
</head>
<body>
<%@ include file="include/header.jsp" %>

  
<%@ include file="include/sidebar.jsp" %>
	
    <div id="main" >
    
    <div class="module">
    
	<h2><span>
    <!--
    <?php if(isset($_REQUEST['t'])&&(validate_url()==true) ) echo get_decrypt_url($_REQUEST['t']); else echo "Home";?> : 
    -->
    Events
    </span></h2>
	
    <div class="module-body">
    
<%@ include file="include/alert.jsp" %>

		
<%@ include file="include/page.jsp" %>
<h3>List of Registered Events</h3>		  
<table>		
<tr class="odd">
<%
DB_Config db = new DB_Config();
Connection con = db.registerDB();
String query = "select * from db_event_view_summary where status = 0";

PreparedStatement pstmt;

try {
	
	
    Statement st = con.createStatement();
    
	ResultSet rs = st.executeQuery(query);
	System.out.print(query);
	ResultSetMetaData rsm = rs.getMetaData();
    int colCount = rsm.getColumnCount();
    for(int i=1;i<=colCount;i++)
    {
     %>
     <td> <%=rsm.getColumnName(i) %> </td>
     <%
 		   	
    }
	while(rs.next())
	{
		
		 %>
	     </tr><tr>
	     <%
	
		for(int i=1;i<=colCount;i++)
		{
			 %>
		     <td> <%=rs.getString(i) %> </td>
		     <%
		 			
		}
		
	}
	con.close();
	
}
catch(Exception ex)


{
	
	System.out.print(ex.toString());
	}

%>
</tr>
</table>


 	</div>
                
	</div>
        
	</div>
       <%@ include file="include/footer.jsp" %>

</body>
</html>
