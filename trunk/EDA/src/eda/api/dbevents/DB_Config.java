package eda.api.dbevents;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;;

public class DB_Config {
	/* for accessing database and producing results */
	private String db_name;
	private int port_no;
	private  String host_name;
	private String user_name;
	private String password;
	protected static Connection conn;
	protected DatabaseMetaData dmd;
	protected ResultSetMetaData rsmd = null;
	protected ResultSet rs;
	protected Statement stmt;
	protected static int activeConnections;
	
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
	
	
	public static Connection registerDB(DB_Config db) {
		Connection con = null;
		//DB_Config db=new DB_Config();
		try{
				try {
					Class.forName("com.mysql.jdbc.Driver");
				} catch (ClassNotFoundException ex) {
					System.out.println("Class Not found exception"+ex);
				}
			String connectionUrl = "jdbc:mysql://" +db.getHost_name()
					+ ":" + db.getPort_no() + "/"
					+ db.getDb_name()
					+ "?zeroDateTimeBehavior=convertToNull";
			con = DriverManager.getConnection(connectionUrl,
					db.getUser_name(),db.getPassword());
		} catch (SQLException ex) {
			System.out.println("Cannot connect to database"+ex);
		}
		activeConnections++;
		System.out.println("Connection Successfully Established");
		System.out.println("Total active connections are:"+activeConnections);
		return con;
	}

	public static void close(Connection connection) {
		if (connection == null) {
			return;
		}
		try {
			if (connection.isClosed()) {
				connection = null;
			} else {
				try {
					connection.close();
					System.out.println("Connection is closed");
					connection = null;
				} catch (SQLException ex) {
					System.out.println("Connection Cannot be closed"+ex);
				}
			}
		} catch (SQLException ex) {
			System.out.println("Connection Cannot be closed"+ex);
		}
	}

}
