package example;
 

import eda.api.dbevents.*;
import eda.api.reaction.DB_reaction;
import eda.api.reaction.FunctionReaction;

public class example1RegisterEvent {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		//Enter Event repo (not Event type!!)  config info
		//DB_Config dba = new DB_Config("eda_event_repo",null,3306,"localhost","admin","root");
		
		/*
		 * 
		 *	REGISTER EVENT
		 * 
		 */
		
		DB_Events dbe = new DB_Events(); 
		
		//specify name of event, database Id , on which table it will happen and last one is surrogate key of table
		dbe.register_Event("loginAction",1,"login","id");
		
		//specify a set of rules for triggering event
		String cons = " status = 'verified' ";
		//set constrainst
		dbe.setConstraints(cons);
						
		//Commit all the changes
		dbe.save();
		
		/*
		 * 
		 *	REGISTER DB - Reaction
		 * 
		 */
		
		DB_reaction dbr = new DB_reaction(); 
		
		//specify query
		String query = "update login set active='true' ";
		//register reaction
		dbr.registerReaction(dbe.getEvent_id(), "activate",query );
								
		//Commit all the changes
		dbr.save();
		
		/*
		 * 
		 *	REGISTER External Function call
		 * 
		 */
		
		FunctionReaction fr = new FunctionReaction();
		
		fr.registerReaction(dbe.getEvent_id(), "sendmail", "sendmail()");
		
		fr.save();
								
	}

}
