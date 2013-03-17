package app.admission;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.Statement;


public class DB_access {
	// private static DataSource data;
	static int timeCounter = 0;
	static boolean isActiveConnectionsWatcherStarted = false;
	protected static Connection conn;
	protected DatabaseMetaData dmd;
	protected ResultSetMetaData rsmd = null;
	protected static ResultSet rs;
	protected Statement stmt;
	protected static boolean isSeekingConnectionFirstTime = true;
	protected static boolean isEnteredBMTCFirstTime = true;
	protected static boolean isEnteredCelcabsFirstTime = true;
	protected static int activeConnections;
	static String SPACES = "                           " + "                 ";
	private static DB_access DB_access = new DB_access();

	private DB_access() {
	}

	public static DB_access getInstance() {
		return DB_access;
	}
	

	public static int update(String sql) {

		int rowsUpdated = 0;
		Connection connection = null;
		try {
			connection = getConnection();
			connection.setAutoCommit(true);
			rowsUpdated = update(connection, sql);
		} catch (SQLException ex) {
			System.out.println(ex);
		} finally {
			close(connection);
		}
		return rowsUpdated;
	}

		

	public static ResultSet readFromDB(String query, Connection connection) {
		ResultSet result = null;
		Statement stmt = null;
		try {
			System.out.println(query);
			if ((query.indexOf(" where ") >= 0)
					|| (query.indexOf("count ") >= 0)) {
				// ok
			} else {
				System.out.println("@@@ please check as query without a where clause!");
			}
			stmt = connection.createStatement(
					ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			// System.out.println("in readFromDB inside result with query:\n" +
			// query);
			result = stmt.executeQuery(query);
			System.out.println(query);
		} catch (SQLException se) {
			System.out.println(se);
		}
		return result;
	}

	public static int update(Connection connection, String sql) {
		Statement statement = null;
		int rows = 0;
		try {
			statement = connection.createStatement();
			rows = statement.executeUpdate(sql);
			System.out.println(sql);
		} catch (SQLException ex) {
			System.out.println(ex);
		} finally {
			close(statement);
		}
		return rows;
	}

	public static void close(Connection connection) {
		// return;
		if (connection == null) {
			return;
		}
		try {
			if (connection.isClosed()) {
				connection = null;
			} else {
				try {
					connection.close();
					System.out.println(activeConnections);
					connection = null;
				} catch (SQLException ex) {
					System.out.println(ex);
				}
			}
		} catch (SQLException ex) {
			System.out.println(ex);
		}
	}

	public static int insertUser(String name) {
		Connection con=null;
		ResultSet r;
		String query;
		int user_id=0;
		query="select id from login where username='"+name+"'";
		System.out.println("hello2");
		try{
			con=getConnection();
			r=readFromDB(query, con);
			System.out.println("hello3");
				PreparedStatement ps1=con.prepareStatement(query);
					r=ps1.executeQuery();
					r.next();
					user_id=r.getInt("id");
						
						System.out.println("user id generated :" +user_id);
						System.out.println("Message From DB_access.insertUser : user entered");
				}
				catch(Exception e){
					System.out.println("Exception Caught in DB_access.insertUser1");
					e.printStackTrace();
					
				}
				finally{
					close(con);
				}
		return user_id;
	}
	public static Connection getConnection() {
		Connection con = null;
		try {

			if (isSeekingConnectionFirstTime) {
				isSeekingConnectionFirstTime = false;
				try {
					Class.forName("com.mysql.jdbc.Driver");
				} catch (ClassNotFoundException ex) {
					System.out.println(ex);
				}
			}
			String connectionUrl = "jdbc:mysql://" +"localhost"
					+ ":" + "3306" + "/"
					+ "universal_admission"
					+ "?zeroDateTimeBehavior=convertToNull";
			con = DriverManager.getConnection(connectionUrl,
					"root", "admin");
		} catch (SQLException ex) {
			System.out.println(ex);
		}
		activeConnections++;
		System.out.println("Active connections"+activeConnections);
		
		return con;
	}
	

	
	@SuppressWarnings("null")
	public static User getUser(int user_id) {
		User user=null;
		Connection con=null;
		try {
			con=getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM login WHERE id=?");
			ps.setInt(1, user_id);
			rs = ps.executeQuery();
			while(rs.next()){
				user = new User();
				 user.setUser_Id(rs.getInt("id"));
				 user.setPwd(rs.getString("password"));
				 user.setEmail(rs.getString("username"));
				 
				 System.out.println("Message From DB_access.getUser : user retrieved-->username is "+user.getEmail());
			}
		} catch (Exception e) {
			System.out.println("Message From DB_access.getUser :");
			e.printStackTrace();
		}finally{
			close(con);
		}
		return user;
	}

	public static void close(Statement statement) {
		if (statement != null) {
			try {
				statement.close();
				statement = null;
			} catch (SQLException ex) {
				System.out.println(ex);
			}
		}
	}

	public static void close(ResultSet rs) {
		// return;
		if (rs != null) {
			try {
				rs.close();
				rs = null;
			} catch (SQLException ex) {
				System.out.println(ex);			}
		}
	}

	public static void close(PreparedStatement preparedStmt) {
		if (preparedStmt != null) {
			try {
				preparedStmt.close();
				preparedStmt = null;
			} catch (SQLException ex) {
				System.out.println(ex);
			}
		}
	}

	public int runScript(String sqlStatement) {
		int rowsUpdated = update(sqlStatement);
		return rowsUpdated;
	}

	
	

	public ResultSet runQuery(String query) {
		ResultSet rs = null;
		try {
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(query);
		} catch (SQLException e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return rs;
	}

	protected ResultSet getFullResultSet(String tableName) {
		String query = "Select * from " + tableName;
		return runQuery(query);
	}

	
	
	public static void accountActivation(int i) {
		// TODO Auto-generated method stub
		Connection con=null;
		String str="verified";
		try{
			 con=getConnection();
			 String query = "update login set status='"+str+"' where id='"+i+"'";
			 update(con, query);
			 System.out.println("updated status successfully");
		}
		catch(Exception e)
		{
			System.out.println("Exception :" +e);
		}
		finally{
			close(con);
		}
	}
	public static String checkAccountActivated(String email) {
		// TODO Auto-generated method stub
		Connection con=null;
		ResultSet rs=null;
		String msg = null;
		try{
			 con=getConnection();
			 String query = "select status from login where username='"+email+"'";
			 rs=readFromDB(query, con);
			 rs.next();
			 if(rs.getString("status").equalsIgnoreCase("verified")){
				 System.out.println("is a valid use");
				 msg="valid";
			 }
			 else{
			 System.out.println("Not a valid use");
			 msg="NotValid";
			 }
		}
		catch(Exception e)
		{
			System.out.println("Exception :" +e);
		}
		finally{
			close(con);
		}
		return msg;
	}
}

