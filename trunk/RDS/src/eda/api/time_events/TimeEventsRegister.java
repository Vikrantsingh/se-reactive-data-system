package eda.api.time_events;

import java.util.Date;
import eda.api.event.Events;
import eda.api.reaction.FunctionReaction;
import eda.connection.DB_Config;
import eda.exception.GenericException;
import java.sql.*;

public class TimeEventsRegister extends Events {

    String time;
            
    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
    
    public void register_Event(String event_name,String time) {

		setEvent_name(event_name);
		setEvent_type("TIME");
                setTime(time);
		System.out.println("Stored the event name, event type, timestamp ");
	}
    public void save()  {
		
		Connection con =null;
		try {

			DB_Config tempSave = new DB_Config();

			con = tempSave.registerDB(tempSave.getDb_name(),
					tempSave.getPort_no(), tempSave.getHost_name(),
					tempSave.getUser_name(), tempSave.getPassword(),
					tempSave.getPrefix());

			//disable auto commit
			con.setAutoCommit(false);
			
			PreparedStatement pstmt = null;
			
			String query;

			/*
			 * Store in events
			 */

			query = "insert into events (event_name,event_type) values (?, ?)";

			pstmt = con.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);					
			
			pstmt.setString(1, getEvent_name());
			
			pstmt.setString(2, getEvent_type());
			
			
								
			pstmt.executeUpdate();
			//stat.executeUpdate(query, stat.RETURN_GENERATED_KEYS);

			ResultSet rs = pstmt.getGeneratedKeys();

			

			if (rs.next()) {
				setEvent_id(rs.getInt(1));
				System.out.println("inserted in event" + getEvent_id());
			} else {
				throw new GenericException(0,
						"Unable to fetch auto increment id");

			}

			/*
			 * Store in db_event
			 */
			query = "insert into time_event (event_id,time) values (?,?)";

			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, getEvent_id());
			
			pstmt.setString(2, getTime());						
			
			pstmt.executeUpdate();
			
			System.out.println("inserted in time_event");		     									
			
			//Commit all operations
			con.commit();
		
		}

		catch (Exception ex) {
			try {
				//rollback all operations
				con.rollback();
			}
			catch(Exception ex2)
			{
				System.out.println("#Exception occurred in DB_Events.java : \n"
						+ ex2.toString());
				
			}
			System.out.println("#Exception occurred in DB_Events.java : \n"
					+ ex.toString());
		}
		
		return;

	}

    public static void main(String[] args) {
        TimeEventsRegister time =new TimeEventsRegister();
        time.register_Event("hellotime", "2013/04/03 01:50:00");//yyyy/MM/dd HH:mm:ss
        time.save();
        
        FunctionReaction fr = new FunctionReaction();
		
		fr.registerReaction(time.getEvent_id(), "seatAllocate", "app.admission.seatAllocation.PreferencesModel.allocateSeat()");
		
		fr.save();
    }
}
