package app.admission.seatAllocation;

public class PreferencesModel {

	int branch_id,applicant_id;
	
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
	 * @return the applicant_id
	 */
	public int getApplicant_id() {
		return applicant_id;
	}
	/**
	 * @param applicant_id the applicant_id to set
	 */
	public void setApplicant_id(int applicant_id) {
		this.applicant_id = applicant_id;
	}
	
}
