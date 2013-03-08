package eda.caller;

import eda.connection.DBModel;

public class CallerUnit implements Runnable {

	/**
	 * @param args
	 */ 
	DBModel dbInfo;
	String query;
	
	
	/**
	 * @return the dbInfo
	 */
	public DBModel getDbInfo() {
		return dbInfo;
	}


	/**
	 * @param dbInfo the dbInfo to set
	 */
	public void setDbInfo(DBModel dbInfo) {
		this.dbInfo = dbInfo;
	}


	/**
	 * @return the query
	 */
	public String getQuery() {
		return query;
	}


	/**
	 * @param query the query to set
	 */
	public void setQuery(String query) {
		this.query = query;
	}


	@Override
	
	public void run() {
		// TODO Auto-generated method stub
		System.out.println("Query Fired!!");
		
	}

}
