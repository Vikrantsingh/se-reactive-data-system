/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package app.admission;
import app.admission.DB_access;
import java.sql.*;

/**
 *
 * @author user
 */
public class PaymentAction {
    
    public void insertGroupPaymentStatusPending(int groupAppId) throws SQLException{
        
        Connection con=DB_access.getConnection();
            String query="insert into group_payment(group_app_id) values("+groupAppId+")";
            DB_access.update(con, query);
           
        
    }
    
    public void setApplicationStatusApproved(int groupPaymentId){
        
        Connection con=DB_access.getConnection();
        String query="update group_application set application_status='approved' where group_app_id in (select distinct(group_app_id) "
                + "from group_payment where group_payment_id="+groupPaymentId+" )";
        
        
        DB_access.update(con, query);
    }
    
}
