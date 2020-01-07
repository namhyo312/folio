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
  <link href="./css/jquery.searchableSelect.css" rel="stylesheet" type="text/css">
  </head>
  <body>
 
  
  
 <select>
  <% ArrayList<TeamDTO> teamList=new ArrayList<TeamDTO>();
   teamList=new TeamDAO().getList();
   if(teamList!=null)
	   for(int i=0; i<teamList.size(); i++){
		   TeamDTO team = teamList.get(i);
  %>
   <option value="<%=team.getUserName()%> <%=team.getEmployee()%>"><%=team.getTeamName() %> <%=team.getUserName() %></option>
   <% 
   }
   %>
    </select>
    <button class="btn btn-primary" onclick="sendTo()">등록하기</button>
    <script src="./js/jquery-1.11.1.min.js"></script>
    <script src="./js/jquery.searchableSelect.js"></script>
    <script>$(function(){$('select').searchableSelect();});</script>
    <script>
    
    function sendTo(){
    	var text="";
    	var s=$("select option:selected").val();
    	text=s.split(" ");
    	var name=text[0];
    	
    	opener.document.getElementsByName("leaderName")[1].value=name;
    	window.close();
    }</script>
  </body>
</html>
