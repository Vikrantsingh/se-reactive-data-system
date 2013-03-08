package eda.exception;



/**
 * @author user
 *
 */
public class GenericException extends Exception{
		
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String msg;
	private int ExceptionNo;
	 
	 /**
	 * @param msg
	 */
	public GenericException (String msg)
	 {
		 this.msg = msg;		 
	 }
	 /**
	 * @param ExceptionNo
	 * @param msg
	 */
	public GenericException (int ExceptionNo, String msg)
	 {
		 this.ExceptionNo = ExceptionNo;
		 this.msg = msg;
		 
	 }
	 
	 /* (non-Javadoc)
	 * @see java.lang.Throwable#toString()
	 */
	public String toString(){
	     return ("Exception Number =  "+ExceptionNo +" \n Message :"+ msg) ;
	  }

	 	
}
