<%@ page  language="java" import="java.util.*" errorPage="" %>
<%@ page import="eda.listener.*" %>
<% String st= request.getParameter("st");
Listener l=new Listener();
if (st.equals("on")) {%>
<%=l.startListener()%>
<% } else {%>
	<%=l.stopListener()%>
	<%} %>
