<%@page import="team.TeamDAO"%>
<%@page import="team.TeamDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<!doctype html>
<html>
  <head>
    <title>강의평가 웹 사이트</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 부트스트랩 CSS 추가하기 -->
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <!-- 커스텀 CSS 추가하기 -->
    <link rel="stylesheet" href="./css/custom.css">

<style>

/* UI Object */
.tbl_type,.tbl_type th,.tbl_type td{border:0}
.tbl_type{ margin:auto;margin-top:50px; width:90%;border-bottom:2px solid #dcdcdc;font-family:'돋움',dotum;font-size:12px;text-align:center;border-collapse:collapse}
.tbl_type caption{display:none}
.tbl_type tfoot{background-color:#f5f7f9;font-weight:bold}
.tbl_type th{padding:7px 0 4px;border-top:2px solid #dcdcdc;border-right:1px solid #dcdcdc;border-left:1px solid #dcdcdc;background-color:#f5f7f9;color:#666;font-family:'돋움',dotum;font-size:12px;font-weight:bold}
.tbl_type td{padding:6px 0 4px;border:1px solid #e5e5e5;color:#4c4c4c}
.tbl_type td.ranking{font-weight:bold}
/* //UI Object */
</style>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="index.jsp">업무현황</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbar">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="index.jsp">메인</a>
          </li>

           <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">팀원 관리</a>
            <div class="dropdown-menu" aria-labelledby="dropdown">
            <a class="dropdown-item" href="userRegister.jsp">사원 등록</a>
             <a class="dropdown-item" href="userList.jsp">사원 관리 </a>
            </div>
          </li> 
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">업무 관리</a>
            <div class="dropdown-menu" aria-labelledby="dropdown">
            <a class="dropdown-item" href="index.jsp">업무 등록</a>
             <a class="dropdown-item" href="#">업무 현황 </a>
            </div>
          </li> 
        </ul>

       
      </div>
    </nav>
  
<!--ui object -->
<table class="tbl_type" border="1" cellspacing="0" summary="사원 관리">
<caption>사원 관리</caption>
<colgroup>
<col width="10%">
<col width="20%">
<col width="10%">
<col width="10%">
<col>
<col width="20%">
</colgroup>
<thead>
<tr>
<th abbr=순서 scope="col">번호</th>
<th abbr=부서 scope="col">부서</th>
<th scope="col">이름</th>
<th scope="col">사원번호</th>
<th scope="col">이메일</th>
<th scope="col">수정</th>
</tr>
</thead>

<tbody>
  
    <%
    
    ArrayList<TeamDTO> teamList=new ArrayList<TeamDTO>();
    teamList=new TeamDAO().getList();
    if(teamList != null)
    	for(int i = 0; i < teamList.size(); i++) {
    		if(i == 5) break;
    		TeamDTO team = teamList.get(i);

    %>
<tr>
<td class="ranking" scope="row"><%=team.getTeamID() %></td>
<td><%=team.getTeamName() %></td>
<td><%=team.getUserName() %></td>
<td><%=team.getEmployee() %></td>
<td><%=team.getUserEmail() %></td>
<td>
<a class="btn btn-warning btn-sm" style="font-weight:bold; color:#FFFAF0" href="./userModify.jsp?teamID=<%=team.getTeamID()%>">수정</a>&nbsp;
<a class="btn btn-danger btn-sm" style="font-weight:bold; color:#FFFAF0" onclick="return confirm('삭제하시겠습니까?')" href="./userDelete.jsp?teamID=<%=team.getTeamID()%>">삭제</a>
</td>
</tr>
<%
}
%>

</tbody>
</table>
 <footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
      Copyright ⓒ 2019 김남효 All Rights Reserved.
    </footer>
 <!-- 제이쿼리 자바스크립트 추가하기 -->
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    <!-- Popper 자바스크립트 추가하기 -->
    <script src="./js/popper.min.js"></script>
    <!-- 부트스트랩 자바스크립트 추가하기 -->
    <script src="./js/bootstrap.min.js"></script>
    

  </body>
</html>
