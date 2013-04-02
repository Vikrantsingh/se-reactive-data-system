package eda.listener;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.lang.reflect.*;

import eda.caller.CallerUnitForDBReaction;
import eda.connection.DBModel;

public class EventChecker {

	private static Connection conn = null;
	private static int db_id = -1;

	/**
	 * @return the conn
	 */
	public static Connection getConn() {
		return conn;
	}

	/**
	 * @param conn
	 *            the conn to set
	 */
	public static void setConn(Connection conn) {
		EventChecker.conn = conn;
	}

	public Connection FetchConn(int dbid, String dbname, String host,
			String username, String password) {
		try {

			String dbURL2 = "jdbc:mysql://localhost:3306/" + dbname;
			if (getConn() != null)
				if (getConn().isValid(0)) {
					if (EventChecker.db_id == dbid) {
						return getConn();
					} else {
						getConn().close();
					}
				}
			EventChecker.db_id = dbid;
			String dbDriver = "com.mysql.jdbc.Driver";
			Class.forName(dbDriver);
			setConn(DriverManager.getConnection(dbURL2, username, password));
			return getConn();
		} catch (Exception ex) {
			System.out.println("Err 2 event checker");
		}
		return null;
	}

	/**
	 * @param args
	 */
	private static long no_of_childs = 0;

	private static long no_of_listner = 0;

	/**
	 * @return the no_of_childs
	 */
	public static long getNo_of_childs() {
		return no_of_childs;
	}

	/**
	 * @param no_of_childs
	 *            the no_of_childs to set
	 */
	public static void setNo_of_childs(long no_of_childs) {
		EventChecker.no_of_childs = no_of_childs;
	}

	/**
	 * @return the no_of_listner
	 */
	public static long getNo_of_listner() {
		return no_of_listner;
	}

	/**
	 * @param no_of_listner
	 *            the no_of_listner to set
	 */
	public static void setNo_of_listner(long no_of_listner) {
		EventChecker.no_of_listner = no_of_listner;
	}

 
	public void DBeventScanner(Connection con) {
		// TODO Auto-generated method stub
		/*
		 * scan event type and event repo for to check any event occurred or not
		 * if occurred and create thread of caller unit and pass respective
		 * action parameter
		 */

		String query = "select * from db_event_view_summary where status = 0";

		PreparedStatement pstmt;

		try {
			pstmt = con.prepareStatement(query,
					PreparedStatement.RETURN_GENERATED_KEYS);

			ResultSet rs = pstmt.executeQuery();

			long db_id = -1; // set default

			Connection econ = null;

			while (rs.next()) {
				// avoid performing reconnection to event repo
				// System.out.println("Checking... event id :"+rs.getString("event_id"));
				if (econ == null || econ.isClosed()
						|| db_id != Long.parseLong(rs.getString("database_id"))) {
					db_id = Long.parseLong(rs.getString("database_id"));
					econ = FetchConn(
							Integer.parseInt(rs.getString("database_id")),
							rs.getString("database_name"),
							rs.getString("hostname") + ":"
									+ rs.getString("port"),
							rs.getString("username"), rs.getString("password"));
				}
                                
                                String createQuery ="";
                                if(rs.getString("constraints").length()!=0)
                                { 
                                    createQuery = "select * from `"
						+ rs.getString("table_name") + "` where "
						+ rs.getString("constraints")
						+ " and " +rs.getString("table_name") + "_event_detected=0";
                                }
                                else
                                {
                                createQuery = "select * from `"
						+ rs.getString("table_name") + "` where "						
						+ rs.getString("table_name") + "_event_detected=0";
                                }
                                
                                
				PreparedStatement ps = econ.prepareStatement(createQuery);
				// System.out.println("query="+ps.toString());
				ResultSet res = ps.executeQuery();
				if (res.next()) { /*
								 * It means event occurred now performs
								 * respective reaction
								 */
					//change status
					createQuery = "update "+ rs.getString("table_name") +" set "+rs.getString("table_name") + "_event_detected=1 where "+rs.getString("surrogate_key")+"="+res.getInt(rs.getString("surrogate_key"));
					PreparedStatement ps1 = econ.prepareStatement(createQuery);
					int s = ps1.executeUpdate(createQuery);
					
					// check reaction type

					// if db reaction then,

					
					if (rs.getString("reaction_type").equals("DB")) {
						DBModel db = new DBModel(rs.getString("database_name"),
								"", Integer.parseInt(rs.getString("port")),
								rs.getString("hostname"),
								rs.getString("username"),
								rs.getString("password"));
						
						String rquery = rs.getString("sql_query");
						System.out.println("Calley Unit Thread created");
						CallerUnitForDBReaction cuDB = new CallerUnitForDBReaction(
								Integer.parseInt(rs.getString("event_id")), db,
								rquery);
						
						//Thread t = new Thread(cuDB);
						cuDB.run(econ);
						
						
					}
					// if external function call then,
					else {
						
						//app.admission.Hello.sendmail(row_id);
						String fname = rs.getString("function_name");
						String className = fname.substring(0, fname.lastIndexOf("."));
						String functionName=fname.substring(fname.lastIndexOf(".")+1, fname.length());
						int rowID = res.getInt(rs.getString("surrogate_key"));
						Class cc = Class.forName(className);
						Method m = cc.getMethod(functionName,int.class);
						m.invoke(cc.newInstance(),rowID);												
					}
					System.out.println("Event Occurred"
							+ rs.getString("event_id"));
//					String querySetEventOccurred = "update db_event set status=1 where event_id="
//							+ rs.getString("event_id");
//					//System.out.println(querySetEventOccurred);
//					pstmt = con.prepareStatement(querySetEventOccurred);
//					pstmt.executeUpdate();

				}
				res.close();
				ps.close();

			}

			// System.out.println("done");
			// if(econ !=null && !econ.isClosed())
			// econ.close();
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Err in Event Checker");
		}

	}

}
