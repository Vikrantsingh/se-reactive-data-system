package eda.caller;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.mysql.jdbc.Connection;

import eda.connection.DBModel;

public class CallerUnitForDBReaction {// implements Runnable {

	/**
	 * @param args
	 */
	int eventID;
	DBModel db;
	String query;
	static Connection con = null;
	static Statement st = null;

	public CallerUnitForDBReaction() {
		// TODO Auto-generated constructor stub
		eventID = 0;
	}

	public CallerUnitForDBReaction(int eventID, DBModel db, String query) {
		this.eventID = eventID;
		this.db = db;
		this.query = query;
	}

	public void run(java.sql.Connection con2) {
		// TODO Auto-generated method stub
		try {
			System.out.println("Query" + query + "executed");

			// make db connection

			String dbURL = db.getMYSQLurl();
			String dbDriver = db.getMYSQLDriverName();
			System.out.println(dbURL);
			System.out.println(dbDriver);
			// Class.forName(dbDriver);
//			if (con == null || con.isClosed()) {
//				Connection con = (Connection) DriverManager.getConnection(
//						dbURL, db.getUser_name(), db.getPassword());
//				// fire query
//				st = con.createStatement();
//			}
			st = con2.createStatement();
			if (st.executeUpdate(query) != 0) {
				System.out.println("DBReaction Performed");
			}
			// close connection
			st.close();
			//con.close();
		}

		catch (Exception ex) {
			System.out.println("err1 in caller unit db" + ex.toString());
		} 
//		finally {
//			try {
//				if (!con.isClosed())
//					con.close();
//			} catch (Exception ex) {
//				System.out.println("err2 in caller unit db");
//			}
//		}
	}

}
