package app.admission;

public class User {
	private int user_Id;
	private String email;
	private String pwd;
	private int status;
	
	public void setUser_Id(int user_Id) {
		this.user_Id = user_Id;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public int getUser_Id() {
		return user_Id;
	}
	public int getStatus() {
		return status;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	

}
