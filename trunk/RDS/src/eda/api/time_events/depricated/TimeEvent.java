package eda.api.time_events.depricated;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

import eda.api.time_events.Timer;
import java.util.Date;
import java.util.Scanner;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.sql.*;

	
public class TimeEvent {

	/**
	 * @param args
	 * @throws ParseException 
	 */
	public static void main(String[] args) throws ParseException {
		// TODO Auto-generated method stub
		
		//takes date and time from user in "yyyy/MM/dd HH:mm:ss" format
		Scanner time = new Scanner(System.in);
		String t = time.nextLine();
		
		//coverts it into sql date time object
		DateFormat formater = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		java.util.Date parsedUtilDate = formater.parse(t);
		
		//java.sql.Date convertedDate = new java.sql.Date(parsedUtilDate.getTime());
		java.sql.Timestamp convertedDate = new java.sql.Timestamp(parsedUtilDate.getTime());
		//takes function as input from user which are to be inserted
		Scanner function = new Scanner(System.in);
		String f = function.nextLine(); 
		
		RegisterEvent register = new RegisterEvent();
		try {
			register.registerEvent(convertedDate, f);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Thread tthread = new Thread(new Timer());
		tthread.start();
		
		
		
	}

	

}
