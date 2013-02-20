package eda.api.event;


public class Events extends DB_Config{
	
	int event_id =-1;


	private String event_type;
	private String event_name;

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
	 * @return the event_name
	 */
	public String getEvent_name() {
		return event_name;
	}

	/**
	 * @param event_name the event_name to set
	 */
	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}

	/**
	 * @return the event_type
	 */
	public String getEvent_type() {
		return event_type;
	}

	/**
	 * @param event_type the event_type to set
	 */
	public void setEvent_type(String event_type) {
		this.event_type = event_type;
	}
	
}
