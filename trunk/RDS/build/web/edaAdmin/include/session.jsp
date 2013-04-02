<%
if(session.getAttribute("flag")!="on")
{
         response.setStatus(301);
         response.setHeader( "Location", "/" );
         response.setHeader( "Connection", "close" );
         pageContext.forward("login.jsp");
		 
		 
}
%>
<!--
<jsp:forward page="login.jsp" />
-->