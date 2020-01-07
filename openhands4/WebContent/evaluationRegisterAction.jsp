<%@page import="evaluation.EvaluationDAO"%>
<%@page import="java.sql.Date"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page import="evaluation.BB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="evaluation.EvaluationDTO"%>
<%@ page import="evaluation.EvaluationDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	/* String userID = null;
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
	} */
	  
// workday == 업무일
    
     int holiday = 0 ;
     int  workday =0;
	String userID="aa";
	String taskName = null;
	String teamName=null;
	String leaderName = null;
	String userName=null;
	String employee=null;
	String startDate = null;
	String endDate = null;
	
	String evaluationContent = null;
	int operationRatio=0;
   
	 if(request.getParameter("holiday") !=null ) {
	
		holiday = (int)Integer.parseInt(request.getParameter("holiday"));
		}
    if(request.getParameter("taskName") != null) {
		taskName = (String) request.getParameter("taskName");
	}
    if(request.getParameter("teamName") != null) {
		teamName = (String) request.getParameter("teamName");
	}
    if(request.getParameter("leaderName") != null) {
		leaderName = (String) request.getParameter("leaderName");
	}
    if(request.getParameter("userName") != null) {
		userName = (String) request.getParameter("userName");
	}
    if(request.getParameter("employee") != null) {
		employee = (String) request.getParameter("employee");
	}
    if(request.getParameter("startDate") != null) {
	startDate = (String) request.getParameter("startDate");	
	}
 
 if(request.getParameter("endDate") != null) {
		endDate = (String) request.getParameter("endDate");
	}
    if(startDate ==""||endDate==""){
    	PrintWriter script =response.getWriter();
    	script.println("<script>");
    	script.println("alert('날짜입력하세요.');");
    	script.println("history.back();");
    	script.println("</script>");
    }
    
    
    if(request.getParameter("operationRatio")==null){
    	java.sql.Date a=java.sql.Date.valueOf(startDate);
    	java.sql.Date b=java.sql.Date.valueOf(endDate);
     
       workday=(BB.getWorkingDaysBetweenTwoDates(a, b)+1);
       operationRatio=(int)workday;
    }
    String[] start = startDate.split("-");
    String[] end=endDate.split("-");
    String s="";
    String e="";
    for(int i=0; i<start.length; i++){
    	s+=start[i];
    	e+=end[i];
    }
    int s1=Integer.parseInt(s);
    int e1=Integer.parseInt(e);
    
   
	if(request.getParameter("evaluationContent") != null) {
		evaluationContent = (String) request.getParameter("evaluationContent");
	}


	if (taskName == null || leaderName == null || userName==null || startDate == "" || endDate == ""|| evaluationContent.equals("")) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();

	}else if(s1>e1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('시작일을 확인하세요.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	} else {
		EvaluationDAO evaluationDAO = new EvaluationDAO();
		System.out.println("홀리데이"+holiday+holiday);
		int result = evaluationDAO.write(new EvaluationDTO(0,userID,taskName,teamName,leaderName,userName,employee,startDate,endDate,operationRatio,holiday,evaluationContent));
		if (result == -1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('업무 등록에 성공');");
	script.println("location.href = './index.jsp';");
	script.println("</script>");
	script.close();
		} else {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('업무 등록 실패');");
	script.println("history.back();");
	script.println("location.href = './index.jsp';");
	script.println("</script>");
	script.close();
		}
	}
%>

