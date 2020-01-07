<%@page import="team.TeamDAO"%>
<%@page import="team.TeamDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!doctype html>
<html>
  <head>
    <title>강의평가 웹 사이트</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="./css/fSelect.css" rel="stylesheet" type="text/css">
  </head>
  <body>
 
  
  
<div class="container">
<select class="demo" multiple="multiple">
<optgroup label="개발품질">
  <% ArrayList<TeamDTO> teamList=new ArrayList<TeamDTO>();
   teamList=new TeamDAO().getList();
   if(teamList!=null)
	   for(int i=0; i<teamList.size(); i++){
		   TeamDTO team = teamList.get(i);
  %>
  <c:set var="team" value="<%=team.getTeamName() %>"/>
  <c:forEach var="task" items="<%=team.getTeamName()%>">
  <c:if test="${team=='개발품질'}">
   <option value="<%=team.getUserName()%> <%=team.getEmployee()%><%=team.getTeamName()%>"><%=team.getTeamName() %> <%=team.getUserName() %></option>
   </c:if>
   </c:forEach>
   <% 
   }
   %>
   </optgroup>
  <optgroup label="운영품질">
   <% 
   for(int i=0; i<teamList.size(); i++){
		   TeamDTO team = teamList.get(i);
  %>
  <c:set var="team" value="<%=team.getTeamName() %>"/>
  <c:forEach var="task" items="<%=team.getTeamName()%>">
  <c:if test="${team=='운영품질'}">
   <option value="<%=team.getUserName()%> <%=team.getEmployee()%><%=team.getTeamName()%>"><%=team.getTeamName() %> <%=team.getUserName() %></option>
   </c:if>
   </c:forEach>
  
  <%
  }
  %>
  </optgroup>
   <optgroup label="경영지원">
   <% 
   for(int i=0; i<teamList.size(); i++){
		   TeamDTO team = teamList.get(i);
  %>
  <c:set var="team" value="<%=team.getTeamName() %>"/>
  <c:forEach var="task" items="<%=team.getTeamName()%>">
  <c:if test="${team=='경영지원'}">
   <option value="<%=team.getUserName()%> <%=team.getEmployee()%><%=team.getTeamName()%>"><%=team.getTeamName() %> <%=team.getUserName() %></option>
   </c:if>
   </c:forEach>
  
  <%
  }
  %>
  </optgroup>
   <optgroup label="클라우드">
   <% 
   for(int i=0; i<teamList.size(); i++){
		   TeamDTO team = teamList.get(i);
  %>
  <c:set var="team" value="<%=team.getTeamName() %>"/>
  <c:forEach var="task" items="<%=team.getTeamName()%>">
  <c:if test="${team=='클라우드'}">
   <option value="<%=team.getUserName()%> <%=team.getEmployee()%><%=team.getTeamName()%>"><%=team.getTeamName() %> <%=team.getUserName() %></option>
   </c:if>
   </c:forEach>
  
  <%
  }
  %>
  </optgroup>
    </select>
    <button class="" onclick="sendTo()">등록하기</button>
    </div>
    
    <script src="./js/jquery-1.11.1.min.js"></script>
    <script src="./js/fSelect.js"></script>

<script>
$(function() {
        $('.demo').fSelect();
    });
</script>
    <script>
    
    function sendTo(){
    	var text="";
    	var num="";
    	var name="";
    	var result = $("option:selected").map(function(){ return this.value }).get().join("  ");
    	text=result.split("  ");
    	
    	for(var i in text){
    		num=num+text[i].substring(text[i].lastIndexOf(" ")+1)+" ";
    	    name=name+text[i].substring(0,text[i].indexOf(" ")+1);
    	    
    	}
    	window.opener.document.getElementById("aa").value=name;
    	window.opener.document.getElementById("bb").value=num;
    	window.close();
    }</script>
  </body>
</html>
