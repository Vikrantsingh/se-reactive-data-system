package eda.api.reaction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import eda.connection.DB_Config;
import eda.exception.GenericException;

public class DB_reaction extends Reaction {

	public void registerReaction(int event_id, String reaction_name,
			String sql_query) {
		setEvent_id(event_id);
		setFunction_name("");
		setReaction_name(reaction_name);
		setReaction_type("DB");
		setSql_query(sql_query);
	}

	public void save() {

		Connection con = null;
		DB_Config tempSave = new DB_Config();
		try {
			con = tempSave.registerDB(tempSave.getDb_name(),
					tempSave.getPort_no(), tempSave.getHost_name(),
					tempSave.getUser_name(), tempSave.getPassword(),
					tempSave.getPrefix());

			// disable auto commit
			con.setAutoCommit(false);

			PreparedStatement pstmt = null;

			String query = "insert into reaction (event_id,reaction_name,reaction_type,sql_query,function_name) values (?,?,?,?,?)";
			
			pstmt = con.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);					
			
			pstmt.setInt(1, getEvent_id());
			
			pstmt.setString(2,getReaction_name());
			
			pstmt.setString(3,getReaction_type());
			
			pstmt.setString(4,getSql_query());
			
			pstmt.setString(5,getFunction_name());
						
			pstmt.executeUpdate();
			//stat.executeUpdate(query, stat.RETURN_GENERATED_KEYS);

			ResultSet rs = pstmt.getGeneratedKeys();		

			if (rs.next()) {
				setReaction_id(rs.getInt(1));
				System.out.println("inserted in reaction" + getReaction_id());
			} else {
				throw new GenericException(0,
						"Unable to fetch auto increment id");

			}
			

			con.commit();
		}

		catch (Exception ex) {
			try {
				con.rollback();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(ex.toString());

		}

	}

}
