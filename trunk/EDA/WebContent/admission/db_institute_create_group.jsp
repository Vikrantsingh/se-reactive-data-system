<%@page import="eda.api.reaction.FunctionReaction"%>
<%@page import="eda.api.time_events.TimeEventsRegister"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page import="app.admission.*" %>


<%
    int group_id = -1;
    String title = request.getParameter("title");
    String startdate = request.getParameter("startdate");
    String enddate = request.getParameter("enddate");
    String criteria = request.getParameter("criteria");
    int no_of_rounds = Integer.parseInt(request.getParameter("no_of_rounds"));
    String description = request.getParameter("description");
    int fees = Integer.parseInt(request.getParameter("fees"));
    try {



        Connection con;
        con = DB_access.getConnection();
        PreparedStatement ps;
        ps = con.prepareStatement("insert into group_admission(owner_id,start_date,end_date,no_of_rounds,title,description,fees,criteria) values(?,?,?,?,?,?,?,?)", PreparedStatement.RETURN_GENERATED_KEYS);
        ps.setInt(1, Integer.parseInt(session.getAttribute("id").toString()));
        ps.setString(2, startdate);
        ps.setString(3, enddate);
        ps.setInt(4, no_of_rounds);
        ps.setString(5, title);
        ps.setString(6, description);
        ps.setInt(7, fees);
        ps.setString(8, criteria);

        ps.executeUpdate();
        ResultSet rs = ps.getGeneratedKeys();
        if (rs.next()) {
            group_id = rs.getInt(1);
        }
        DB_access.close(con);
        //response.sendRedirect("view_institute_profile.jsp");
        session.setAttribute("message", "Changes Saved");
        response.sendRedirect("institute_create_group.jsp");

    } catch (Exception e) {
        session.setAttribute("error_message", "Error in saving changes");
        //  	response.sendRedirect("index.jsp");
        out.println("<b>Enter the fields properly.There is an " + e + " </b>");
        //response.sendRedirect("Institute_profile.jsp");
    }






    /*
     *              Register Event for SeatAllocation and Visiblity of group
     * 
     */


    //////////////////Register Seat Allocation Timebased Event
    TimeEventsRegister time = new TimeEventsRegister();

    String date = enddate;
    date.replaceAll("-", "/");


    time.register_Event("RegistrationClosed" + group_id, date + " 00:01:00", group_id);//yyyy/MM/dd HH:mm:ss
    time.save();

    FunctionReaction fr = new FunctionReaction();

    
    // 1 Disable group Apply Action
    fr.registerReaction(time.getEvent_id(), "DisableGroupApply" + group_id, "app.admission.TimeEvent.setDisableGroupApply");

    fr.save();

    // 2 Disable preference filling
    fr.registerReaction(time.getEvent_id(), "DisablePreferenceFilling" + group_id, "app.admission.TimeEvent.setDisablePreferencesFilling");

    fr.save();

    // 3 Seat Allocation    
    fr.registerReaction(time.getEvent_id(), "seatAllocate" + group_id, "app.admission.seatallocation.PreferencesAction.allocateSeat");

    fr.save();

    
    /////////////////Register GroupVisiblity Event 
    TimeEventsRegister time2 = new TimeEventsRegister();
    String date2 = startdate;
    date.replaceAll("-", "/");

    time2.register_Event("StartGroupRegistration" + group_id, date2 + " 00:01:00", group_id);//yyyy/MM/dd HH:mm:ss
    time2.save();

    FunctionReaction fr2 = new FunctionReaction();

    fr2.registerReaction(time2.getEvent_id(), "setGroupVisiblity" + group_id, "app.admission.TimeEvent.setGroupVisible");

    fr2.save();


    
          

%>
