package eda.api.time_events;

import java.util.Date;
import eda.api.dbevents.*;

public class Time_Events extends Events {
	
	private String type; // either  periodic,monthly,yearly,daily..etc
	private Date d;
	private int day;
	private int month;
	private int year;
	private int hour;
	private int mins;
	

	/**
	 * @return the d
	 */
	public Date getD() {
		return d;
	}

	/**
	 * @param d the d to set
	 */
	public void setD(Date d) {
		this.d = d;
	}

	/**
	 * @return the day
	 */
	public int getDay() {
		return day;
	}

	/**
	 * @param day the day to set
	 */
	public void setDay(int day) {
		this.day = day;
	}

	/**
	 * @return the month
	 */
	public int getMonth() {
		return month;
	}

	/**
	 * @param month the month to set
	 */
	public void setMonth(int month) {
		this.month = month;
	}

	/**
	 * @return the year
	 */
	public int getYear() {
		return year;
	}

	/**
	 * @param year the year to set
	 */
	public void setYear(int year) {
		this.year = year;
	}

	/**
	 * @return the hour
	 */
	public int getHour() {
		return hour;
	}

	/**
	 * @param hour the hour to set
	 */
	public void setHour(int hour) {
		this.hour = hour;
	}

	/**
	 * @return the mins
	 */
	public int getMins() {
		return mins;
	}

	/**
	 * @param mins the mins to set
	 */
	public void setMins(int mins) {
		this.mins = mins;
	}

	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}

	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}
	

}
