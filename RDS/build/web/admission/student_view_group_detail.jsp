<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>

        <%@ include file="include/headtag.jsp"%>
    </head>

    <body>

        <div id="main">

            <!-- Header -->
            <div id="header">
                <%@ include file="include/header.jsp"%>

            </div>
            <!-- /header -->



            <!-- 2 columns (content + sidebar) -->
            <div id="cols" class="box">
                <div id="nav11">
                    <%@ include file="include/navigation.jsp"%>

                </div>
                <!-- Content -->
                <div id="content">




                    <hr class="noscreen" />

                    <%
                        if (session.getAttribute("message") != null && !session.getAttribute("message").equals("")) {
                    %>
                    <div class="alert alert-success" style="margin: 10px">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <h4>Message</h4>
                        <% out.print(session.getAttribute("message"));
                            session.setAttribute("message", "");
                        %>
                    </div>
                    <% }%>
                    <%
                        if (session.getAttribute("error_message") != null && !session.getAttribute("error_message").equals("")) {
                    %>
                    <div class="alert alert-error" style="margin: 10px">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <h4>Message</h4>
                        <% out.print(session.getAttribute("error_message"));
                            session.setAttribute("error_message", "");
                        %>
                    </div>
                    <% }%>
                    <%
                        if (session.getAttribute("warning_message") != null && !session.getAttribute("warning_message").equals("")) {
                    %>
                    <div class="alert alert-block" style="margin: 10px">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <h4>Message</h4>
                        <% out.print(session.getAttribute("warning_message"));
                            session.setAttribute("warning_message", "");
                        %>
                    </div>
                    <% }%>

                    <div id="content-in">
                        <form >
                              <table class="nomb table-style01">

                                <thead>
                                    <th colspan="2" align="left">
                                        <h1 align="left">Group Details</h1>
                                    </th>
                                </thead>

                                <%@page import="java.sql.*"%>
                                <%@page import="java.io.*"%>
                                <%@page import="app.admission.*"%>
                                <%
                                    Connection con = DB_access.getConnection();
                                    ResultSet rs = null, r = null;
                                    try {

                                        //System.out.println(session.getAttribute("id"));

                                        String sql = "select * from view_group_details_without_applicants where group_id=" + request.getParameter("group_id");
                                        r = DB_access.readFromDB(sql, con);
                                        while (r.next()) {
                                            //System.out.println(rs.getString("institute_name"));
                                            int id1 = r.getInt("group_id");
                                %>
                                <tr class="bg">
                                    <td width="40%">Institute Name :</td>
                                    <td><%=r.getString("institute_name")%></td>
                                </tr>
                                <tr>
                                    <td width="40%">Degree :</td>
                                    <td><%=r.getString("degree")%></td>
                                </tr>
                                <tr>
                                    <td>Specialization :</td>
                                    <td><%=r.getString("specialization")%></td>
                                </tr>
                                <tr>
                                    <td>Seats :</td>
                                    <td><%=r.getString("seats")%></td>
                                </tr>
                                <tr>
                                    <td>branch_description :</td>
                                    <td><%=r.getString("branch_description")%></td>
                                </tr>

                                <tr>
                                    <td>Number Of Rounds :</td>
                                    <td><%=r.getString("no_of_rounds")%></td>
                                </tr>
                                <tr>
                                    <td>Fees :</td>
                                    <td><%=r.getString("fees")%></td>
                                </tr>

                                <%

                                        }
                                        con.close();
                                    } catch (Exception e) {


                                        System.out.println("exception:" + e);
                                    }
                                %>


                                <tr>
                                    <td colspan='2' align='center'>
                                       
                                        <%
                                          con = DB_access.getConnection();
                                        String sql = "select * from view_group_details where group_id=" + request.getParameter("group_id")+" and applicant_id="+session.getAttribute("id");
                                        r = DB_access.readFromDB(sql, con);
                                        if(r.next()) {
                                            %>
                                            <button type="button" class="btn btn-primary" disabled="true">
                                                Applied <i class="icon-ok icon-white"></i>
                                            </button>
                                            <%
                                        }
                                       else
                                            {
                                        %>
                                        
                                        
                                        <a
                                            href="db_student_apply.jsp?group_id=<%=request.getParameter("group_id")%>">
                                            <button type="button" class="btn btn-primary">
                                                Apply Now1 <i class="icon-ok icon-white"></i>
                                            </button>
                                        </a>
                                            <%}
                                        %>
                                    
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    <!-- /content-in -->

                </div>
                <!-- /content -->

                <hr class="noscreen" />

                <!-- Sidebar -->
                <div id="aside">
                    <%@ include file="include/sidebar.jsp"%>
                </div>
                <!-- /aside -->




            </div>
            <!-- /cols -->



            <hr class="noscreen" />

            <!-- Footer -->
            <div id="footer">

                <%@ include file="include/footer.jsp"%>

            </div>
            <!-- /footer -->

        </div>
        <!-- /main -->
    </body>
</html>
