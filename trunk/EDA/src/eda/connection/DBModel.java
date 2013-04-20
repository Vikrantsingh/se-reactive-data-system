package eda.connection;

public class DBModel {

	/**
	 * @param args
	 */
	private String db_name;
	private String prefix;
	private int port_no;
	private  String host_name;
	private String user_name;
	private String password;	
	
	public DBModel() {
		// TODO Auto-generated constructor stub
		setDb_name("eda");
		setPrefix("");
		setHost_name("localhost");
		setPort_no(3306);
		setUser_name("root");
		setPassword("admin");
	}
	public DBModel(String db_name, String prefix, int port_no,
			String host_name, String user_name, String password) {	
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


	public String getMYSQLurl()
	{
		return "jdbc:mysql://"+getHost_name()+":"+getPort_no()+"/"+getDb_name();
	}
	public String getMYSQLDriverName()
	{
		return "com.mysql.jdbc.Driver";
	}
}
