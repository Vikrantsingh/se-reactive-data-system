package app.admission;

import eda.api.dbevents.DB_Events;
import eda.api.reaction.DB_reaction;
import eda.api.reaction.FunctionReaction;

public class SampleRegisterEvent {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		/*
		 * 
		 *	REGISTER EVENT
		 * 
		 */
		
		DB_Events dbe = new DB_Events(); 
		
		//specify name of event, database Id and on which table it will happen
		dbe.register_Event("loginAction",1,"login");
		
		//specify a set of rules for triggering event
		String cons = " status = 'new' ";
		//set constrainst
		dbe.setConstraints(cons);
						
		//Commit all the changes
		dbe.save();
				
		/*
		 * 
		 *	REGISTER External Function call
		 * 
		 */
		
		FunctionReaction fr = new FunctionReaction();
		
		fr.registerReaction(dbe.getEvent_id(), "sendmail", "app.admission.SignUp.mailConformation");
		
		fr.save();
								
	}

}
