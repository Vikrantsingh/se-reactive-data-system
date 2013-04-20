package app.admission.suggestions;

import java.sql.*;
import java.util.ArrayList;

import app.admission.DB_access;

public class SuggestionListGenerator {

	ArrayList<SuggestionList> suggestInstitute = new ArrayList<SuggestionList>();
	ArrayList<SuggestionList> suggestGroup = new ArrayList<SuggestionList>();
	

	public ArrayList<SuggestionList> generateSugggestionListOfGroup(
			int student_id) {
		Connection con = DB_access.getConnection();
		ResultSet rs = null;
		String sql = "select owner_id,title from group_admission where criteria in (select degree from student_education where id_login="
				+ student_id
				+ ") and group_id not in (select group_id from group_application where applicant_id="
				+ student_id + ")";
		rs = DB_access.readFromDB(sql, con);
		try {
			int i=0;
			while (rs.next()) {
				SuggestionList s = new SuggestionList();
				s.setCollegeName(rs.getString("title"));
				s.setInstitute_id(rs.getInt("owner_id"));
				// suggestInstitute=generateSuggestionListOfInstitution(suggestGroup.get(i).getInstitute_id());
				System.out.println(s.getInstitute_id());
				System.out.println(s.getCollegeName());
				//i++;
				suggestGroup.add(s);
			}
			

			// System.out.println("size"+suggestGroup.size());
			PreparedStatement ps = con
					.prepareStatement("insert into suggestion(institute_id,student_id) values(?,?)");
			for (i = 0; i < suggestGroup.size(); i++) {
				ps.setInt(1, suggestGroup.get(i).getInstitute_id());
				ps.setInt(2, student_id);
				ps.executeUpdate();
			}

			DB_access.close(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return suggestGroup;
	}

	public ArrayList<SuggestionList> generateSuggestionListOfInstitution(
			int group_id) {
		Connection con = DB_access.getConnection();
		ResultSet rs = null;
		String sql = "select distinct institute_id,institute_name from institute_profile where institute_id="
				+ group_id;
		rs = DB_access.readFromDB(sql, con);
		try {
			while (rs.next()) {
				SuggestionList s1 = new SuggestionList();
				s1.setInstitute_id(rs.getInt("institute_id"));
				s1.setCollegeName(rs.getString("institute_name"));
				suggestInstitute.add(s1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return suggestInstitute;

	}
}
