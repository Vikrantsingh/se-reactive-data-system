package eda.caller;

import eda.connection.DBModel;
import java.lang.reflect.Method;

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
        
        public void callFunction(String FunctionName ,int parameter)  
        {
         //app.admission.Hello.sendmail(row_id);
            try{
                        String fname = FunctionName;
                        String className = fname.substring(0, fname.lastIndexOf("."));
                        String functionName = fname.substring(fname.lastIndexOf(".") + 1, fname.length());                        
                        Class cc = Class.forName(className);
                        Method m = cc.getMethod(functionName, int.class);
                        m.invoke(cc.newInstance(), parameter);
            }
            catch(Exception e){
                e.printStackTrace();
                
            }
        }

}
