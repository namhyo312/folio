<%@page import="java.io.PrintWriter"%>
<%@page import="util.SHA256"%>
<%@page import="team.TeamDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String code = request.getParameter("code");
	TeamDAO teamDAO = new TeamDAO();
	String userName = null;
	if(session.getAttribute("userName") != null) {
		userName = (String) session.getAttribute("userID");
	}
	
	String userEmail = teamDAO.getUserEmail(userName);
	boolean rightCode = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false;
	if(rightCode == true) {
		teamDAO.setUserEmailChecked(userName);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('인증에 성공했습니다.');");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
		script.close();		
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 코드입니다.');");
		script.println("location.href = 'userRegister.jsp'");
		script.println("</script>");
		script.close();		
	}

%>


