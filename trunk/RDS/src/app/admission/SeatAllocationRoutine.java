package app.admission;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;

public class SeatAllocationRoutine {
	int application_id;
	int course;
	String perc;
	String seats;
	ArrayList<Integer> app_id=new ArrayList<Integer>();
	ArrayList<Integer> branch_id=new ArrayList<Integer>();
	ArrayList<String> percentage=new ArrayList<String>();
	ArrayList<String> seat_available=new ArrayList<String>();
	String criteria;
	
	
	public void groupSeatAllocation(int groupId) {
		int i=0;
		Connection con=DB_access.getConnection();
		Connection con1=DB_access.getConnection();
		ResultSet rs=null,r=null;
		String query="select  DISTINCT(branch_id),seats,criteria,applicant_id from view_group_details where group_id="+groupId;
		rs=DB_access.readFromDB(query,con);
		try {
			while(rs.next()){
				application_id = rs.getInt("applicant_id");
				course = rs.getInt("branch_id");
				branch_id.add(course);
				app_id.add(application_id);
				//System.out.println(login_id);
				criteria=rs.getString("criteria");
				System.out.println(criteria);
				seats=rs.getString("seats");
				seat_available.add(seats);
				query="select * from student_education where id_login="+application_id;
				r=DB_access.readFromDB(query, con1);
				if(r.next()){
					if(r.getString("degree").equalsIgnoreCase(criteria)){
						perc=r.getString("percentage");
						percentage.add(perc);
					}
				}
			}
			for(i=0;i<app_id.size();i++){
				System.out.println("Branch id:"+branch_id.get(i)+"   applicant id:"+app_id.get(i)+"   with percentage"+percentage.get(i)+"  Seats available:"+seat_available.get(i));
				
				
			}
			
			Collections.sort(percentage);
			for (String str : percentage) {
				  System.out.println(str.toString());
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		/*for(i=0;i<percentage.length;i++){
			System.out.println("Login _id"+login_id);
			System.out.println("percentage"+percentage[i]);
		}*/
	}
	
	/*public  static void main() throws SQLException{
		SeatAllocationRoutine sa = new SeatAllocationRoutine();
		sa.groupSeatAllocation(6);
	}*/

}
