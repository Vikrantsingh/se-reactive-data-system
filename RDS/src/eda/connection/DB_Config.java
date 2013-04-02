package eda.connection;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;


public class DB_Config {
	/* for accessing database and producing results */
	private String db_name;
	private String prefix;
	private int port_no;
	private  String host_name;
	private String user_name;
	private String password;
	protected Connection conn;
	protected DatabaseMetaData dmd;
	protected ResultSetMetaData rsmd = null;
	protected ResultSet rs;
	protected Statement stmt;
	protected static int activeConnections;
	
	
	public DB_Config() {
		super();
		
		/*
		 *  	Write a code to fetch all this fields from config.xml
		 */
		db_name = "EDA";
		prefix = "";
		port_no = 3306;
		host_name = "localhost";
		user_name = "root";
		password ="admin";
	}


	public DB_Config(String db_name, String prefix, int port_no,
			String host_name, String user_name, String password) {
		super();
		this.db_name = db_name;
		this.prefix = prefix;
		this.port_no = port_no;
		this.host_name = host_name;
		this.user_name = user_name;
		this.password = password;
	}
	/**
	 * @return the db_name
	 */
	public String getDb_name() {
		return db_name;
	}
	/**
	 * @param db_name the db_name to set
	 */
	public void setDb_name(String db_name) {
		this.db_name = db_name;
	}
	/**
	 * @return the host_name
	 */
	public String getHost_name() {
		return host_name;
	}
	/**
	 * @param host_name the host_name to set
	 */
	public void setHost_name(String host_name) {
		this.host_name = host_name;
	}
	/**
	 * @return the user_name
	 */
	public String getUser_name() {
		return user_name;
	}
	/**
	 * @param user_name the user_name to set
	 */
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * @return the port_no
	 */
	public int getPort_no() {
		return port_no;
	}
	/**
	 * @param port_no the port_no to set
	 */
	public void setPort_no(int port_no) {
		this.port_no = port_no;
	}


	/**
	 * @return the prefix
	 */
	public String getPrefix() {
		return prefix;
	}
	/**
	 * @param prefix the prefix to set
	 */
	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}

	//function used for establishing the connection and defining the database name and table prefix
	public Connection registerDB() {
		Connection con = null;
		//DB_Config db=new DB_Config();
		try{
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException ex) {
				System.out.println("Class Not found exception"+ex);
			}
			String connectionUrl = "jdbc:mysql://" +getHost_name()
					+ ":" + getPort_no() + "/"
					+ getDb_name()
					+ "?zeroDateTimeBehavior=convertToNull";
			System.out.println(connectionUrl);
			con = DriverManager.getConnection(connectionUrl,
					getUser_name() ,getPassword());
		} catch (SQLException ex) {
			System.out.println("Cannot connect to database"+ex);
		}
		activeConnections++;
	//	System.out.println("Connection Successfully Established");
		//System.out.println("Total active connections are:"+activeConnections);
/*		create_Event_Table(con,prefix);
		create_DB_Event_Table(con,prefix);
		create_DB_rowfilter(con,prefix);
		create_DB_Col_access_Table(con,prefix);
		create_DB_Col_Val(con,prefix);
		create_TIME_Event_Table(con,prefix);*/


		return con;
	}

	//function used for establishing the connection and defining the database name and table prefix
	public Connection registerDB(String Db_name,int port_no,String Host_name,String User_name ,String password,String prefix) {
		Connection con = null;
		//DB_Config db=new DB_Config();
		try{
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException ex) {
				System.out.println("Class Not found exception"+ex);
			}
			String connectionUrl = "jdbc:mysql://" +Host_name
					+ ":" + port_no + "/"
					+ Db_name
					+ "?zeroDateTimeBehavior=convertToNull";
			con = DriverManager.getConnection(connectionUrl,
					User_name,password);
		} catch (SQLException ex) {
			System.out.println("Cannot connect to database"+ex);
		}
		activeConnections++;
		System.out.println("Connection Successfully Established");
		System.out.println("Total active connections are:"+activeConnections);
/*		create_Event_Table(con,prefix);
		create_DB_Event_Table(con,prefix);
		create_DB_rowfilter(con,prefix);
		create_DB_Col_access_Table(con,prefix);
		create_DB_Col_Val(con,prefix);
		create_TIME_Event_Table(con,prefix);*/


		return con;
	}

//	//function to store the name of the values and expressions of the column
//	private static void create_DB_Col_Val(Connection con, String prefix) {
//		// TODO Auto-generated method stub
//		Statement statement = null;
//		@SuppressWarnings("unused")
//		int done;
//		try {
//			statement = con.createStatement();
//			done = statement.executeUpdate("CREATE TABLE "+prefix+"_column_val("
//					+"col_id int(5) unsigned NOT NULL,"
//					+"col_val varchar(30) NOT NULL,"
//					+"col_exp varchar(50) NOT NULL,"
//					+"FOREIGN KEY (col_id) REFERENCES col_access(col_id))"
//					+"ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;");
//			System.out.println("Successfully Col_Val table created!!");
//
//		} catch (SQLException ex) {
//			System.out.println("DB_Col_val_Table () while running sql:"+ ex);
//		} finally {
//			close(statement);
//		}
//	}
//	//function to create the col_access table for storing the columns details
//	/**
//	 * @param con Connection Object OF Database
//	 * @param prefix User Defined Prefix
//	 * @category				It is defined by the user
//	 */
//	private static void create_DB_Col_access_Table(Connection con, String prefix) {
//		// TODO Auto-generated method stub
//		Statement statement = null;
//		@SuppressWarnings("unused")
//		int done;
//		try {
//			statement = con.createStatement();
//			done = statement.executeUpdate("CREATE TABLE "+prefix+"_col_access("+
//					"db_event_id int(10) unsigned NOT NULL,"+
//					"col_id int(5) unsigned NOT NULL,"+
//					"col_name varchar(30) NOT NULL,"+
//					"PRIMARY KEY (col_id),"+
//					"FOREIGN KEY (db_event_id) REFERENCES db_event(db_event_id))"+
//					"ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;");
//			System.out.println("Successfully Col_access table created!!");
//
//		} catch (SQLException ex) {
//			System.out.println("Col_access_Table () while running sql:"+ ex);
//		} finally {
//			close(statement);
//		}
//	}
//
//	//function  to create the rowfilter database
//	private static void create_DB_rowfilter(Connection con,String prefix) {
//		// TODO Auto-generated method stub
//		Statement statement = null;
//		@SuppressWarnings("unused")
//		int done;
//		try {
//			statement = con.createStatement();
//			done = statement.executeUpdate("CREATE TABLE "+prefix+"_rowfilter("+
//					"db_event_id int(10) unsigned NOT NULL,"+
//					"row_filter varchar(300)  NOT NULL,"+
//					"FOREIGN KEY (db_event_id) REFERENCES db_event(db_event_id))"+
//					"ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;");
//			System.out.println("Successfully rowfilter() created!!");
//
//		} catch (SQLException ex) {
//			System.out.println("rowfilter_table() while running sql:"+ ex);
//		} finally {
//			close(statement);
//		}
//
//	}
//	// function to create the time event information table
//	private static void create_TIME_Event_Table(Connection con,String prefix) {
//		// TODO Auto-generated method stub
//		Statement statement = null;
//		@SuppressWarnings("unused")
//		int done;
//		try {
//			statement = con.createStatement();
//			done = statement.executeUpdate("CREATE TABLE "+prefix+"_time_event("+
//					"event_id int(10) unsigned NOT NULL,"+
//					"time_event_id int(10) unsigned NOT NULL,"+
//					"periodic varchar(20) NOT NULL,"+
//					"time_assigned time NOT NULL,"+
//					"date_check date NOT NULL,"+
//					"PRIMARY KEY (time_event_id),"+
//					" FOREIGN KEY (event_id) REFERENCES events(event_id))"+
//					"ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;");
//			System.out.println("Successfully TIME_Event_Table created!!");
//
//		} catch (SQLException ex) {
//			System.out.println("TIME_Event_Table() while running sql:"+ ex);
//		} finally {
//			close(statement);
//		}		
//	}
//
//
//	// function to create database event information table
//	/**
//	 * @param con Connection object
//	 * @param prefix used defined prefix
//	 * @author Simham
//	 * used to create the Database Event table with the prefix specified by user and is run only once
//	 */
//	private static void create_DB_Event_Table(Connection con,String prefix) {
//		// TODO Auto-generated method stub
//		Statement statement = null;
//		@SuppressWarnings("unused")
//		int done;
//		try {
//			statement = con.createStatement();
//			done = statement.executeUpdate("CREATE TABLE "+prefix+"_db_event("+
//					"event_id int(10) unsigned NOT NULL,"+
//					"db_event_id int(10) unsigned NOT NULL,"+
//					"event_type varchar(20) NOT NULL,"+
//					"status int(1) unsigned NOT NULL,"+
//					"table_name varchar(50) NOT NULL,"+
//					"PRIMARY KEY (db_event_id),"+
//					"FOREIGN KEY (event_id) REFERENCES events(event_id))"+
//					"ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;");
//			System.out.println("Successfully DB_Event_Table table created!!");
//
//		} catch (SQLException ex) {
//			System.out.println("DB_Event_Table() while running sql:"+ ex);
//		} finally {
//			close(statement);
//		}		
//	}
//
//	// function to create master table for storing event
//	private static void create_Event_Table(Connection con,String prefix) {
//		// TODO Auto-generated method stub
//		Statement statement = null;
//		@SuppressWarnings("unused")
//		int done;
//		try {
//			statement = con.createStatement();
//			done = statement.executeUpdate("CREATE TABLE "+prefix+"_events(" +
//					"event_id int(10) unsigned NOT NULL,"
//					+"event_name varchar(100) NOT NULL,"
//					+"event_type varchar(10) unsigned NOT NULL,"
//					+"PRIMARY KEY (event_id))ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;");
//			System.out.println("Successfully Event table created!!");
//
//		} catch (SQLException ex) {
//			System.out.println("Event_table() while running sql:"+ ex);
//		} finally {
//			close(statement);
//		}		
//	}
//
//
//	// function to close the connection of database
//	public static void close(Connection connection) {
//		if (connection == null) {
//			return;
//		}
//		try {
//			if (connection.isClosed()) {
//				connection = null;
//			} else {
//				try {
//					connection.close();
//					System.out.println("Connection is closed");
//					connection = null;
//				} catch (SQLException ex) {
//					System.out.println("Connection Cannot be closed:"+ex);
//				}
//			}
//		} catch (SQLException ex) {
//			System.out.println("Connection Cannot be closed:"+ex);
//		}
//	}
//
//	//function to make the statement null
//	public static void close(Statement statement) {
//		if (statement != null) {
//			try {
//				statement.close();
//				statement = null;
//			} catch (SQLException ex) {
//				System.out.println("In close statement Function:"+ex);
//			}
//		}
//	}
//
//
//	//function to make the result set null
//	public static void close(ResultSet rs) {
//		// return;
//		if (rs != null) {
//			try {
//				rs.close();
//				rs = null;
//			} catch (SQLException ex) {
//				System.out.println("In close Result set Function:"+ex);
//			}
//		}
//	}
//	
}
