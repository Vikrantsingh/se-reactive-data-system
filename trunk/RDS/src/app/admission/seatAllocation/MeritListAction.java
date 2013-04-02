package app.admission.seatAllocation;
import app.admission.DB_access;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.*;
public class MeritListAction {
	ArrayList<MeritListModel> data=new ArrayList<MeritListModel>();
	
	public ArrayList<MeritListModel> getMeritList(int group_id){
	
		Connection con=DB_access.getConnection();
		ResultSet rs=null,r=null;
		String query="select applicant_id from group_application where group_id="+group_id;
		rs=DB_access.readFromDB(query,con);
		try {
			while(rs.next()){
				MeritListModel m=new MeritListModel();
				m.setApplicant_id(rs.getInt("applicant_id"));
				query="select percentage from student_education where id_login="+m.applicant_id;
				r=DB_access.readFromDB(query, con);
				if(r.next()){
					 m.setPercentage(Float.parseFloat(r.getString("percentage")));
					 
					}
				data.add(m);
				}
		}catch(Exception e){
		 System.out.println("errorin  meritlistaction:"+e);
		}

		
		return sortMeritList(data);
		
	}
	
	/*public void printArrayList(ArrayList<MeritListModel> data){
		for(int i=0;i<data.size();i++){
			System.out.println(data.get(i).getApplicant_id());
			System.out.println(data.get(i).getPercentage());
		}
		
	}
	*/
	
	public ArrayList<MeritListModel> sortMeritList(ArrayList<MeritListModel> data){
		Collections.sort(data, new Comparator<MeritListModel>(){
		    
			public int compare(MeritListModel arg0, MeritListModel arg1) {
				// TODO Auto-generated method stub
				if(arg0.getPercentage() == arg1.getPercentage())			
				return 0;
				return arg0.getPercentage() > arg1.getPercentage() ? -1 : 1;
			}
		});
		for(int i=0;i<data.size();i++){
			System.out.println(data.get(i).getApplicant_id());
			System.out.println(data.get(i).getPercentage());
		}
		return data;
		
	}
	/*public static void main(){
	
		MeritListAction a= new MeritListAction();
		a.printArrayList(a.getMeritList(6));
	}*/

}
