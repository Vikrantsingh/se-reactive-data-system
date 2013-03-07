/**
 * 
 */
package eda.api.dbevents;

import java.util.ArrayList;

/**
 * @author Simham
 *
 */
public class DB_Events extends Events {
	/* Variables for storing the database related values */
	private String table_name;
	private int status;
	
   /* Arraylist for storing multivalued variables */
	
	private ArrayList<String> column_name;
	private ArrayList<String> column_value;
	private ArrayList<String> column_expr;
	private ArrayList<String> row_filter;
	private ArrayList<String> reaction;
		
	/**
	 * @return the table_name
	 */
	public String getTable_name() {
		return table_name;
	}
	/**
	 * @param table_name the table_name to set
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
	 * @param column_name the column_name to set
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
	 * @param column_value the column_value to set
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
	 * @param column_expr the column_expr to set
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
	 * @param row_filter the row_filter to set
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
	 * @param reaction the reaction to set
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
	 * @param status the status to set
	 */
	public void setStatus(int status) {
		this.status = status;
	}
	/**
	 * @param event_name the event_name to set, table_name the table_name to set
	 * These are just for transient stored of the event details 
	 */
	public void register_Event(String event_name,String table_name){
		
		setEvent_name(event_name);
		setEvent_type("DB");
		setTable_name(table_name);
		setStatus(0);
		System.out.println("Stored the event name, event type, table name ");
	}
	
	/**
	 * @param Column_name
	 * @param Column_value
	 * @param Column_expression
	 */
	public void  event_Parameters(ArrayList<String> Column_name,ArrayList<String> Column_value, ArrayList<String> Column_expression){
		
		setColumn_name(Column_name);
		setColumn_expr(Column_expression);
		setColumn_value(Column_value);
		System.out.println("Stored the column name,Column value,column expression ");
				
	}
	
	
}
