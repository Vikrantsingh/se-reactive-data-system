/******************************  DATABASE  BASED   EVENTS *********************************************/ 
/* Event table the master table of all the remaining tables
 * 
*/

CREATE DATABASE eda;

SELECT eda;

DROP TABLE IF EXISTS events;
CREATE TABLE events{
	event_id int(10) unsigned NOT NULL,
	event_name varchar(100) NOT NULL,
	event_type varchar(10)  NOT NULL,
	PRIMARY KEY (event_id) 
}ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;




DROP TABLE IF EXISTS db_event;
CREATE TABLE db_event(
  event_id int(10) unsigned NOT NULL,
  db_event_id int(10) unsigned NOT NULL,
  event_type varchar(20) NOT NULL,
  status int(10) unsigned NOT NULL,
  table_name varchar(20) NOT NULL,
  PRIMARY KEY (db_event_id),
  FOREIGN KEY (event_id) REFERENCES events(event_id)
)ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS rowfilter;
CREATE TABLE rowfilter(
  db_event_id int(10) unsigned NOT NULL,
  row_filter varchar(300)  NOT NULL,
   FOREIGN KEY (db_event_id) REFERENCES db_event(db_event_id)
)ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS col_access;
CREATE TABLE col_access(
  db_event_id int(10) unsigned NOT NULL,
  col_id int(5) unsigned NOT NULL,
  col_name varchar(30) NOT NULL,
  PRIMARY KEY (col_id),
  FOREIGN KEY (db_event_id) REFERENCES db_event(db_event_id)
)ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS column_val;
CREATE TABLE column_val(
  col_id int(5) unsigned NOT NULL,
  col_val varchar(30) NOT NULL,
  col_exp varchar(50) NOT NULL,
   FOREIGN KEY (col_id) REFERENCES col_access(col_id)
)ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;



/******************************  TIME  BASED   EVENTS *********************************************/ 

/*table for the time based events */

DROP TABLE IF EXISTS time_event;
CREATE TABLE time_event(
  event_id int(10) unsigned NOT NULL,
  time_event_id int(10) unsigned NOT NULL,
  periodic varchar(20) NOT NULL,
  time_assigned time NOT NULL,
  date_check date NOT NULL,
  PRIMARY KEY (time_event_id),
  FOREIGN KEY (event_id) REFERENCES events(event_id)
)ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;




/******************************  RESPONSE BASED TABLE  *********************************************/ 

DROP TABLE IF EXISTS response_reaction;

CREATE TABLE response_reaction {
	event_id int(10) unsigned NOT NULL,
	reaction_id int(10) unsigned NOT NULL,
	react_type varchar(10) NOT NULL,
	sql_stmt varchar(200) NOT NULL,
	fucntion_name varchar(100) NOT NULL,
	PRIMARY KEY (reaction_id),
	FOREIGN KEY (event_id) REFERENCES events(event_id)
}ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
