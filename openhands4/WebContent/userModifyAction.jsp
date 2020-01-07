<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="team.TeamDTO"%>
<%@ page import="team.TeamDAO"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
	String userName = null;
	String teamName = null;
	String userEmail = null;
	String employee=null;
	String teamID=null;
	
	
	if(request.getParameter("teamID") != null) {
		teamID = (String) request.getParameter("teamID");
	}
	if(request.getParameter("teamName") != null) {
		teamName = (String) request.getParameter("teamName");
	}
	if(request.getParameter("userName") != null) {
		userName = (String) request.getParameter("userName");
	}
	if(request.getParameter("employee") != null) {
		employee = (String) request.getParameter("employee");
	}
	if(request.getParameter("userEmail") != null) {
		userEmail = (String) request.getParameter("userEmail");
	}

	if (teamName=="선택" || userName == null || userEmail == null || employee.length()!=7) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();

	} else {
		System.out.println(teamID+teamName+ userName+employee+userEmail);
		TeamDAO teamDAO = new TeamDAO();
		int result = teamDAO.update(teamName, userName, employee, userEmail, teamID);
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('수정 실패했습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('수정 성공했습니다.');");
			script.println("location.href = 'userList.jsp';");
			script.println("</script>");
			script.close();
		}

	}

%>
