package eda.api.time_events;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import eda.connection.DB_Config;
import java.util.Iterator;

public class Timer implements Runnable {

    public void run() {
        // TODO Auto-generated method stub
        while (true) {


            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            //get current date time with Date()
            Date date = new Date();

            Calendar cal = Calendar.getInstance();
            //System.out.println(dateFormat.format(cal.getTime()));

            try {
                DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            //connet to db
            try {
              
                DB_Config tempSave = new DB_Config();

                Connection connec = (Connection) tempSave.registerDB(tempSave.getDb_name(),
                        tempSave.getPort_no(), tempSave.getHost_name(),
                        tempSave.getUser_name(), tempSave.getPassword(),
                        tempSave.getPrefix());
                String query = "SELECT * FROM time_event_view_summary WHERE  TIME <= NOW() and occurred = 0";


                PreparedStatement st = (PreparedStatement) connec.prepareStatement(query);
                //st.setBoolean(1,false);
                ResultSet rs = st.executeQuery(query);
                while (rs.next()) {
                    
                    
                    
                    //Execute Function
                    
                    System.out.println(rs.getString("function_name"));
                    
                    //////Disable event
                    String function_query = "UPDATE time_event set occurred = ? WHERE time_event_id = ? ";
                    st = (PreparedStatement) connec.prepareStatement(function_query);
                    st.setInt(1, 1);
                    st.setInt(2, rs.getInt("time_event_id"));                    
                    st.executeUpdate();

                    
                }
                connec.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }


        }
    }

    public static void main(String[] args) {
        Thread tthread = new Thread(new Timer());
        tthread.start();
    }
}
