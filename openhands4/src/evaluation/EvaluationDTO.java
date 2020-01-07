package evaluation;

public class EvaluationDTO {

	int evaluationID;
	String userID;
	String taskName;
	String teamName;
	String leaderName;
	String userName;
	String employee;
	String startDate;
	String endDate;
	int operationRatio;
	int holiday;
	String evaluationContent;
	
	
	
	public int getEvaluationID() {
		return evaluationID;
	}
	public void setEvaluationID(int evaluationID) {
		this.evaluationID = evaluationID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getTaskName() {
		return taskName;
	}
	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getLeaderName() {
		return leaderName;
	}
	public void setLeaderName(String leaderName) {
		this.leaderName = leaderName;
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
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getOperationRatio() {
		return operationRatio;
	}
	public void setOperationRatio(int operationRatio) {
		this.operationRatio = operationRatio;
	}
	public int getHoliday() {
		return holiday;
	}
	public void setHoliday(int holiday) {
		this.holiday = holiday;
	}
	public String getEvaluationContent() {
		return evaluationContent;
	}
	public void setEvaluationContent(String evaluationContent) {
		this.evaluationContent = evaluationContent;
	}
	public EvaluationDTO() {
		
	}
	public EvaluationDTO(int evaluationID, String userID, String taskName, String teamName, String leaderName,
			String userName, String employee, String startDate, String endDate, int operationRatio, int holiday,
			String evaluationContent) {
		super();
		this.evaluationID = evaluationID;
		this.userID = userID;
		this.taskName = taskName;
		this.teamName = teamName;
		this.leaderName = leaderName;
		this.userName = userName;
		this.employee = employee;
		this.startDate = startDate;
		this.endDate = endDate;
		this.operationRatio = operationRatio;
		this.holiday = holiday;
		this.evaluationContent = evaluationContent;
	}
	
	
	
}