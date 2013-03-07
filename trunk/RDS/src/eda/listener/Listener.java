package eda.listener;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;

import eda.api.dbevents.DB_Events;
import eda.api.event.*;

public class Listener extends Events implements Runnable{
	
	static Thread t;
	static long thread_id;
	static int count_status=0; //0 if not running and 1 if running
	@Override
	public void run() {
		// TODO Auto-generated method stub
		int i=1;
		System.out.println("Listener called for Starting.");
		String thread_name=Thread.currentThread().getName();
	    thread_id=Thread.currentThread().getId();
		
	    
		String dbURL = "jdbc:mysql://localhost:3306/eda";
		String dbDriver = "com.mysql.jdbc.Driver"; 										
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();			
		} 
        Connection con=null;
		try {
			con = DriverManager.getConnection(dbURL,"root","admin");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        
		while(i > 0){
			
			//System.out.println("run...");
			EventChecker ev = new EventChecker();
			try {
				ev.DBeventScanner(con);				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
									
		}
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.gc();
		
	}
		
	public String startListener(){
		if(count_status==1){
		return "alreadyrunning";
		}
		else{
		t=new Thread (this);
		count_status++;
		System.out.println("Count value"+count_status);
		System.out.println("Starting the thread");
		//t.setDaemon(true);
        t. start();
        return "running";
		}
	}
	

	public String stopListener() throws Exception{
		if(count_status==1){
			count_status--;
			System.out.println("Thread status:"+t.isAlive());
			t.stop();
			return "stopped";
		}	
		else{
		
			return "Not running";
		
		}
	}
	
	 
	public void check_event(){
		
		
	}

}
