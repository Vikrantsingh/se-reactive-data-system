/**
 * 
 */
package eda.api.dbevents;

import eda.api.event.Events;
import eda.connection.DB_Config;
import eda.exception.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 * @author Simham
 * 
 */
public class DB_Events extends Events {
	/* Variables for storing the database related values */
	private String table_name;
	private int status;
	private String constraints;
	

	/* Arraylist for storing multivalued variables */

	/**
	 * @return the constraints
	 */
	public String getConstraints() {
		return constraints;
	}


	/**
	 * @param constraints the constraints to set
	 */
	public void setConstraints(String constraints) {
		this.constraints = constraints;
	}

	private ArrayList<String> column_name;
	private ArrayList<String> column_value;
	private ArrayList<String> column_expr;
	private ArrayList<String> row_filter;
	private ArrayList<String> reaction;
	
	private int database_id;

	/**
	 * @return the database_id
	 */
	public int getDatabase_id() {
		return database_id;
	}


	/**
	 * @param database_id the database_id to set
	 */
	public void setDatabase_id(int database_id) {
		this.database_id = database_id;
	}

 

	public DB_Events(){
		
	}
	
	
	public DB_Events(DB_Config dba) {
		// TODO Auto-generated constructor stub
		setDb_name(dba.getDb_name());
		setPrefix(dba.getPrefix());
		setPort_no(dba.getPort_no());
		setHost_name(dba.getHost_name());
		setUser_name(dba.getUser_name());
		setPassword(dba.getPassword());
	}

	/**
	 * @return the table_name
	 */
	public String getTable_name() {
		return table_name;
	}

	/**
	 * @param table_name
	 *            the table_name to set
	 */
	public void setTable_name(String table_name) {
		this.table_name = table_name;
	}

	/**
	 * @return the column_name
	 */
	public ArrayList<String> getColumn_name() {
		return column_name;
	}

	/**
	 * @param column_name
	 *            the column_name to set
	 */
	public void setColumn_name(ArrayList<String> column_name) {
		this.column_name = column_name;
	}

	/**
	 * @return the column_value
	 */
	public ArrayList<String> getColumn_value() {
		return column_value;
	}

	/**
	 * @param column_value
	 *            the column_value to set
	 */
	public void setColumn_value(ArrayList<String> column_value) {
		this.column_value = column_value;
	}

	/**
	 * @return the column_expr
	 */
	public ArrayList<String> getColumn_expr() {
		return column_expr;
	}

	/**
	 * @param column_expr
	 *            the column_expr to set
	 */
	public void setColumn_expr(ArrayList<String> column_expr) {
		this.column_expr = column_expr;
	}

	/**
	 * @return the row_filter
	 */
	public ArrayList<String> getRow_filter() {
		return row_filter;
	}

	/**
	 * @param row_filter
	 *            the row_filter to set
	 */
	public void setRow_filter(ArrayList<String> row_filter) {
		this.row_filter = row_filter;
	}

	/**
	 * @return the reaction
	 */
	public ArrayList<String> getReaction() {
		return reaction;
	}

	/**
	 * @param reaction
	 *            the reaction to set
	 */
	public void setReaction(ArrayList<String> reaction) {
		this.reaction = reaction;
	}

	/**
	 * @return the status
	 */
	public int getStatus() {
		return status;
	}

	/**
	 * @param status
	 *            the status to set
	 */
	public void setStatus(int status) {
		this.status = status;
	}
 
	/**
	 * @param event_name
	 *            the event_name to set, table_name the table_name to set These
	 *            are just for transient stored of the event details
	 */
	public void register_Event(String event_name,int database_id, String table_name) {

		
		setEvent_name(event_name);
		setEvent_type("DB");
		setDatabase_id(database_id);
		setTable_name(table_name);
		setStatus(0);
		System.out.println("Stored the event name, event type, table name ");
	}

	/**
	 * @param Column_name
	 * @param Column_value
	 * @param Column_expression
	 */
	public void event_Parameters(ArrayList<String> Column_name,
			ArrayList<String> Column_value, ArrayList<String> Column_expression) {

		setColumn_name(Column_name);
		setColumn_expr(Column_expression);
		setColumn_value(Column_value);
		System.out
				.println("Stored the column name,Column value,column expression ");

	}

	public boolean verify() {
		/*
		 * Write here code to verify all given inputs are valid or not
		 */
		return true;

	}

	public void save()  {
		if (!verify()) {
			/*
			 * throw exceptions
			 */
			return;
		}
		Connection con =null;
		try {

			DB_Config tempSave = new DB_Config();

			con = tempSave.registerDB(tempSave.getDb_name(),
					tempSave.getPort_no(), tempSave.getHost_name(),
					tempSave.getUser_name(), tempSave.getPassword(),
					tempSave.getPrefix());

			//disable auto commit
			con.setAutoCommit(false);
			
			PreparedStatement pstmt = null;
			
			String query;

			/*
			 * Store in events
			 */

			query = "insert into events (event_name,event_type) values (?, ?)";

			pstmt = con.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);					
			
			pstmt.setString(1, getEvent_name());
			
			pstmt.setString(2, getEvent_type());
			
			
								
			pstmt.executeUpdate();
			//stat.executeUpdate(query, stat.RETURN_GENERATED_KEYS);

			ResultSet rs = pstmt.getGeneratedKeys();

			

			if (rs.next()) {
				setEvent_id(rs.getInt(1));
				System.out.println("inserted in event" + getEvent_id());
			} else {
				throw new GenericException(0,
						"Unable to fetch auto increment id");

			}

			/*
			 * Store in db_event
			 */
			query = "insert into db_event (event_id,database_id,table_name) values (?,?,?)";

			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, getEvent_id());
			
			pstmt.setInt(2, getDatabase_id());
			
			pstmt.setString(3, getTable_name());
			
			pstmt.executeUpdate();
			
			System.out.println("inserted in db_event");
		     
			/*
			 * Store in row_filter
			 */
			
			query = "insert into row_filter (db_event_id,constraints) values (?,?)";
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, getEvent_id());
			
			pstmt.setString(2, getConstraints());
			
			//System.out.println(pstmt.toString());
			
			pstmt.executeUpdate();
			
			System.out.println("inserted in row_filter");
			
	
			/*
			 * Store in db_event
			 */
			
			
			//Commit all operations
			con.commit();
		
		}

		catch (Exception ex) {
			try {
				//rollback all operations
				con.rollback();
			}
			catch(Exception ex2)
			{
				System.out.println("#Exception occurred in DB_Events.java : \n"
						+ ex2.toString());
				
			}
			System.out.println("#Exception occurred in DB_Events.java : \n"
					+ ex.toString());
		}
		
		return;

	}

}
