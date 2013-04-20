package eda.api.time_events.depricated;

import java.sql.Date;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import java.util.*;
import com.*;
import java.sql.Clob;

public class RegisterEvent {
	public void registerEvent(Timestamp d1, String functionName) throws SQLException {
		
			
		boolean flag = false;	
		DriverManager.registerDriver(new com.mysql.jdbc.Driver());
		//connet to db
		Connection con =(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/eda?user=root&password=admin"); 

		
		//String query =  "INSERT INTO test VALUES ('" + d1 + "','" + functionName + "')";
		String query = " insert into edafun (TIME, function, occured)"
	        + " values (?, ?, ?)";
		
		PreparedStatement stmt = (PreparedStatement) con.prepareStatement(query);
		stmt.setTimestamp(1, d1);
		stmt.setString(2,functionName);
		stmt.setBoolean(3, false);
		stmt.execute();
		
		//st.setString(1,time);
		//st.setString(2,functionName);
		//int i = st.executeUpdate(query);	
			
	}

}
