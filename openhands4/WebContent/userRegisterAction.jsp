<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="team.TeamDTO"%>
<%@ page import="team.TeamDAO"%>
<%@ page import="util.SHA256"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
	String userName = null;
	String teamName = null;
	String userEmail = null;
	String employee=null;

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
		System.out.println(teamName+ userName+employee+userEmail);
		TeamDAO teamDAO = new TeamDAO();
		int result = teamDAO.write(new TeamDTO(0, teamName, userName,employee,userEmail));
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();

		} else {
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('성공');");
			script.println("location.href = 'index.jsp';");
			script.println("</script>");
			script.close();
		}

	}

%>
