/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package app.admission;

import java.sql.Connection;

/**
 *
 * @author user
 */
public class TimeEvent {
    public void setGroupVisible(int group_id)
    {
        
        Connection con=DB_access.getConnection();
        String query="update group_admission  set visibility='1' where group_id="+group_id;
        DB_access.update(con, query);
        System.out.println("Changed Visibility of group:"+group_id);
        DB_access.close(con);
    }
    
    public void setDisableGroupApply(int group_id)
    {
        Connection con=DB_access.getConnection();
        String query="update group_admission set group_apply='0' where group_id="+group_id;
        DB_access.update(con, query);
        System.out.println("Disabled the group_apply for group :"+group_id);
        DB_access.close(con);
        
    }
    
    public void setDisablePreferencesFilling(int group_id){
        
        Connection con=DB_access.getConnection();
        String query="update group_admission set fill_preferences='0' where group_id="+group_id;
        DB_access.update(con, query);
        System.out.println("Disabling preferences filling for group:"+group_id);
        DB_access.close(con);
    }
}
