<%@page import="team.TeamDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ page import="java.io.PrintWriter"%>

<%
	/* 
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.');");
		script.println("location.href = 'userLogin.jsp'");
		script.println("</script>");
		script.close();
		return;
	} */
	request.setCharacterEncoding("UTF-8");
	String teamID = null;
	if(request.getParameter("teamID") != null) {
		teamID = (String) request.getParameter("teamID");
	}

	TeamDAO teamDAO = new TeamDAO();
	/* if(userID.equals(evaluationDAO.getUserID(evaluationID))) { */
		int result = new TeamDAO().delete(teamID);
		if (result == 1) {
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('삭제가 완료되었습니다.');");
	script.println("location.href='userList.jsp'");
	script.println("</script>");
	script.close();

		} else {

	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('데이터베이스 오류가 발생했습니다.');");
	script.println("history.back();");
	script.println("</script>");
	script.close();
		}
%>