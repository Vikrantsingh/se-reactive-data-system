package eda.api.reaction;

public class Reaction {
	int event_id;
	int reaction_id;
	private String reaction_name;
	private String reaction_type;
	private String sql_query;
	private String function_name;
	
	/**
	 * @return the reaction_id
	 */
	public int getReaction_id() {
		return reaction_id;
	}
	/**
	 * @return the event_id
	 */
	public int getEvent_id() {
		return event_id;
	}
	/**
	 * @param event_id the event_id to set
	 */
	public void setEvent_id(int event_id) {
		this.event_id = event_id;
	}
	/**
	 * @return the sql_query
	 */
	public String getSql_query() {
		return sql_query;
	}
	/**
	 * @param sql_query the sql_query to set
	 */
	public void setSql_query(String sql_query) {
		this.sql_query = sql_query;
	}
	/**
	 * @return the function_name
	 */
	public String getFunction_name() {
		return function_name;
	}
	/**
	 * @param function_name the function_name to set
	 */
	public void setFunction_name(String function_name) {
		this.function_name = function_name;
	}
	/**
	 * @param reaction_id the reaction_id to set
	 */
	public void setReaction_id(int reaction_id) {
		this.reaction_id = reaction_id;
	}
	/**
	 * @return the reaction_name
	 */
	public String getReaction_name() {
		return reaction_name;
	}
	/**
	 * @param reaction_name the reaction_name to set
	 */
	public void setReaction_name(String reaction_name) {
		this.reaction_name = reaction_name;
	}
	/**
	 * @return the reaction_type
	 */
	public String getReaction_type() {
		return reaction_type;
	}
	/**
	 * @param reaction_type the reaction_type to set
	 */
	public void setReaction_type(String reaction_type) {
		this.reaction_type = reaction_type;
	}
	
	
	
	

	
}
