package app.admission.seatallocation;

import app.admission.DB_access;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

public class PreferencesAction {

    ArrayList<MeritListModel> meritlist = null;

    public void allocateSeat(int group_id) {
        System.out.println("Seat Allocation started");
        MeritListAction me = new MeritListAction();
        meritlist = me.getMeritList(group_id);
        PreferencesAction pa = new PreferencesAction();


        //load available seats
        BranchInfoModel bim = new BranchInfoModel();
        HashMap<Integer, BranchInfoModel> AvailableSeats = bim.loadBranchToSeats(group_id);

        ///load merit list
        MeritListAction ma = new MeritListAction();
        ArrayList<MeritListModel> MeritList = ma.getMeritList(group_id);

        for (int i = 0; i < MeritList.size(); i++) {

            ///load preferences
            int applicant_id = MeritList.get(i).getApplicant_id();            
            ArrayList<PreferencesModel> preflist = pa.getPreferenceList(group_id, applicant_id);

            ///logic to allocate seats
            
            for(int j=0;j< preflist.size();j++)
            {
                int branch_id = preflist.get(j).getBranch_id();
                if(AvailableSeats.get(branch_id).getSeats()>0)
                {
                    BranchInfoModel bi = AvailableSeats.get(branch_id);
                    bi.setSeats(bi.getSeats()-1);
                    AvailableSeats.put(branch_id,bi);
                    System.out.println("Allocated"+branch_id+" to "+applicant_id);                    
                    saveSeatAllocationToDB(applicant_id,group_id,branch_id);
                    break;
                }               
                 
            }


        }

        ///save back to db
        bim.storeBranchToSeats(AvailableSeats);
        System.out.println("Seat Allocation done");

    }
    public void saveSeatAllocationToDB(int applicant_id,int group_id,int branch_id)
    {
        Connection con = DB_access.getConnection();
        ArrayList<PreferencesModel> prefList = new ArrayList<PreferencesModel>();
        ResultSet rs = null;
        String query = "insert into group_seat_allocation ( group_seat_allocation.stud_inst_prefer_id) "
                + "select stud_inst_prefer_id from group_student_institute_preferences "
                + "where group_app_id in (select group_app_id from group_application where group_id="+group_id+" and applicant_id="+applicant_id+")  and branch_id="+branch_id;
        DB_access.update( con,query);  
        DB_access.close(con);
    }
    public ArrayList<PreferencesModel> getPreferenceList(int group_id, int applicant_id) {
        Connection con = DB_access.getConnection();
        ArrayList<PreferencesModel> prefList = new ArrayList<PreferencesModel>();
        ResultSet rs = null;
        String query = "select branch_id from group_application natural join group_student_institute_preferences where group_id=" + group_id + " and applicant_id =" + applicant_id;
        rs = DB_access.readFromDB(query, con);
        try {
            PreferencesModel p = new PreferencesModel();
            while (rs.next()) {
                p.setApplicant_id(applicant_id);
                p.setBranch_id(Integer.parseInt(rs.getString("branch_id")));
                prefList.add(p);
            }
        } catch (Exception e) {
            System.out.println("errorin  meritlistaction:" + e);
        }
        DB_access.close(con);
        return prefList;
    }

    public static void main(String[] args) {
        PreferencesAction pa = new PreferencesAction();
        pa.allocateSeat(6);                                       
    }
    
}

        