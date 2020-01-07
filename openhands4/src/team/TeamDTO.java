package team;

public class TeamDTO {

	int teamID;
	String teamName;
	String userName;
	String employee;
	String userEmail;
	
	public int getTeamID() {
		return teamID;
	}
	public void setTeamID(int teamID) {
		this.teamID = teamID;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmployee() {
		return employee;
	}
	public void setEmployee(String employee) {
		this.employee = employee;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public TeamDTO() {
		
	}
	public TeamDTO(int teamID, String teamName, String userName, String employee, String userEmail) {
		super();
		this.teamID = teamID;
		this.teamName = teamName;
		this.userName = userName;
		this.employee = employee;
		this.userEmail = userEmail;
	}

	
	
	
}
