package app.admission.seatallocation;

import app.admission.DB_access;
import java.sql.*;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;

import com.mysql.jdbc.IterateBlock;

public class BranchInfoModel {

    int branch_id, seats, part_stream_id;

    public int getPart_stream_id() {
        return part_stream_id;
    }

    public void setPart_stream_id(int part_stream_id) {
        this.part_stream_id = part_stream_id;
    }

    /**
     * @return the branch_id
     */
    public int getBranch_id() {
        return branch_id;
    }

    /**
     * @param branch_id the branch_id to set
     */
    public void setBranch_id(int branch_id) {
        this.branch_id = branch_id;
    }

    /**
     * @return the seats
     */
    public int getSeats() {
        return seats;
    }

    /**
     * @param seats the seats to set
     */
    public void setSeats(int seats) {
        this.seats = seats;
    }

    public HashMap<Integer, BranchInfoModel> loadBranchToSeats(int group_id) {
        HashMap<Integer, BranchInfoModel> seatDetails = new HashMap<Integer, BranchInfoModel>();
        Connection con = DB_access.getConnection();
        ResultSet rs = null;
        String query = "select DISTINCT branch_id,group_seats_available,part_stream_id from group_participants_enroll_courses where group_id=" + group_id;
        rs = DB_access.readFromDB(query, con);
        try {
            while (rs.next()) {
                BranchInfoModel bim = new BranchInfoModel();
                bim.setBranch_id(rs.getInt("branch_id"));
                bim.setPart_stream_id(rs.getInt("branch_id"));
                bim.setSeats(Integer.parseInt(rs.getString("group_seats_available")));
                System.out.print(Integer.parseInt(rs.getString("group_seats_available")));
                       
                seatDetails.put(rs.getInt("branch_id"), bim);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return seatDetails;

    }

    public void storeBranchToSeats(HashMap<Integer, BranchInfoModel> seat) {
        Iterator<Entry<Integer, BranchInfoModel>> it = seat.entrySet().iterator();
        Connection con = DB_access.getConnection();
        
        while (it.hasNext()) {
            Entry<Integer, BranchInfoModel> seats = it.next();
            System.out.println(seats.getKey() + " = " + seats.getValue().getSeats());
            String query = "update group_participants_enroll_courses set group_seats_available =" + seats.getValue().getSeats() + "  where part_stream_id=" + seats.getValue().getPart_stream_id();
            try {

                DB_access.update(con, query);
                

            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }
    public static void main(String z[])
    {
        BranchInfoModel bim = new BranchInfoModel();
        bim.storeBranchToSeats(bim.loadBranchToSeats(6));
    }
}