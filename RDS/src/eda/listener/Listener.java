package eda.listener;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import eda.api.event.*;
import eda.connection.DBModel;

public class Listener extends Events implements Runnable {

	static Thread t;
	static long thread_id;
	static int count_status = 0; // 0 if not running and 1 if running
	/**
	 * @return the count_status
	 */
	public static int getCount_status() {
		return count_status;
	}

	/**
	 * @param count_status the count_status to set
	 */
	public static void setCount_status(int count_status) {
		Listener.count_status = count_status;
	}

	static Connection con = null;
	DBModel dbInfo;;

	public Listener() {
		// TODO Auto-generated constructor stub
		dbInfo = new DBModel();
	}

	@Override
	public void run() {
		// TODO Auto-generated method stub
		int i = 1;
		System.out.println("Listener called for Starting.");
		// String thread_name=Thread.currentThread().getName();
		thread_id = Thread.currentThread().getId();

		String dbURL = dbInfo.getMYSQLurl();
		
		String dbDriver = dbInfo.getMYSQLDriverName();
		

		try {
			Class.forName(dbDriver);

			if (con == null || !con.isValid(0))
				con = DriverManager.getConnection(dbURL, dbInfo.getUser_name(),
						dbInfo.getPassword());

			EventChecker ev = new EventChecker();
			while (i > 0) {

				// System.out.println("run...");
				if (con.isClosed())
					con = DriverManager.getConnection(dbURL, dbInfo.getUser_name(),
							dbInfo.getPassword());
				// try {

				// if(!con.isValid(0));
				// {
				// con.close();
				// con = DriverManager.getConnection(dbURL,"root","admin");
				// }
				ev.DBeventScanner(con);
				// } catch (Exception e) {
				// // TODO Auto-generated catch block
				// //e.printStackTrace();
				// System.out.println("Err 1 in listner");
				//
				// }

			}
			con.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Err 2 in listner");

		}

	}

	public String startListener() {
		if (count_status == 1) {
			return "alreadyrunning";
		} else {
			t = new Thread(this);
			count_status++;
			System.out.println("Count value" + count_status);
			System.out.println("Starting the thread");
			// t.setDaemon(true);
			t.start();
			return "running";
		}
	}

	public String stopListener() throws Exception {
		if (count_status == 1) {
			count_status = 0;
			System.out.println("Thread status:" + t.isAlive());
			// t.stop();
			return "stopped";
		} else {

			return "Not running";

		}
	}

	public void check_event() {

	}

}
