<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="evaluation.EvaluationDAO"%>
<%@ page import="evaluation.EvaluationDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLEncoder"%>

<!doctype html>
<html>
  <head>
    <title>업무현황</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 부트스트랩 CSS 추가하기 -->
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <!-- 커스텀 CSS 추가하기 -->
    <link rel="stylesheet" href="./css/custom.css">
     <link rel="stylesheet" href="./jquery-ui-1.12.1/jquery-ui.min.css">
  </head>
  <body>
<%
	request.setCharacterEncoding("UTF-8");
String teamName = "부서";
String searchType = "날짜";
String search = ""; 
int pageNumber=0;
//페이지넘버값이 있을때


	if(request.getParameter("teamName") != null) {
		teamName = request.getParameter("teamName");
	}
	if(request.getParameter("searchType") != null) {
		searchType = request.getParameter("searchType");
	}
	if(request.getParameter("search") != null) {
		search = request.getParameter("search");
	}
	if(request.getParameter("pageNumber") != null) {
		try {
	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		} catch (Exception e) {
	System.out.println("검색 페이지 번호 오류");
		}
	}
%>	
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

    <div class="container">
      <form method="get" action="./index.jsp" class="form-inline mt-3">
        <select name="teamName" class="form-control mx-1 mt-2">
          <option value="부서">부서</option>
          <option value="개발품질" <%if(teamName.equals("개발품질")) out.println("selected");%>>개발품질</option>
          <option value="운영품질" <%if(teamName.equals("운영품질")) out.println("selected");%>>운영품질</option>
          <option value="경영지원" <%if(teamName.equals("경영지원")) out.println("selected");%>>경영지원</option>
          <option value="클라우드" <%if(teamName.equals("클라우드")) out.println("selected");%>>클라우드</option>
        </select>

        <select name="searchType" class="form-control mx-1 mt-2">
          <option value="날짜">날짜</option>
          <option value="_____01" <%if(searchType.equals("_____01")) out.println("selected");%>>&nbsp;&nbsp;1월</option>
          <option value="_____02" <%if(searchType.equals("_____02")) out.println("selected");%>>&nbsp;&nbsp;2월</option>
          <option value="_____03" <%if(searchType.equals("_____03")) out.println("selected");%>>&nbsp;&nbsp;3월</option>
          <option value="_____04" <%if(searchType.equals("_____04")) out.println("selected");%>>&nbsp;&nbsp;4월</option>
          <option value="_____05" <%if(searchType.equals("_____05")) out.println("selected");%>>&nbsp;&nbsp;5월</option>
          <option value="_____06" <%if(searchType.equals("_____06")) out.println("selected");%>>&nbsp;&nbsp;6월</option>
          <option value="_____07" <%if(searchType.equals("_____07")) out.println("selected");%>>&nbsp;&nbsp;7월</option>
          <option value="_____08" <%if(searchType.equals("_____08")) out.println("selected");%>>&nbsp;&nbsp;8월</option>
          <option value="_____09" <%if(searchType.equals("_____09")) out.println("selected");%>>&nbsp;&nbsp;9월</option>
          <option value="_____10" <%if(searchType.equals("_____10")) out.println("selected");%>>10월</option>
          <option value="_____11" <%if(searchType.equals("_____11")) out.println("selected");%>>11월</option>
          <option value="_____12" <%if(searchType.equals("_____12")) out.println("selected");%>>12월</option>
        </select>

        <input type="text" name="search" class="form-control mx-1 mt-2" value="<%=search%>" placeholder="내용을 입력하세요.">
        <button type="submit" class="btn btn-info mx-1 mt-2">검색</button>
        <a class="btn btn-primary mx-1 mt-2" data-toggle="modal" href="#registerModal">등록하기</a>
        <!-- <a class="btn btn-danger ml-1 mt-2" data-toggle="modal" href="#reportModal">기타</a> -->
       
      </form>
      
      <%
            	ArrayList<EvaluationDTO> evaluationList = new ArrayList<EvaluationDTO>();
                  System.out.println("@@"+evaluationList.size());
            	evaluationList = new EvaluationDAO().getList(teamName, searchType, search, pageNumber);
            	if(evaluationList != null)
            	for(int i = 0; i < evaluationList.size(); i++) {
            		if(i == 5) break;
            		EvaluationDTO evaluation = evaluationList.get(i);
            %>

      <div class="card bg-light mt-3">
        <div class="card-header bg-light">
          <div class="row">
            <div class="col-8 text-left">업무 리더 : <%=evaluation.getLeaderName()%></div>
            <div class="col-2 text-right">공휴일 : <%=evaluation.getHoliday()%></div>
            <div class="col-2 text-right">평일 업무일 수 : <strong><span style="color: red;"><%=evaluation.getOperationRatio()%></span></strong></div>
          </div>
        </div>
 

        <div class="card-body">
          <h5 class="card-title">
            <%=evaluation.getTaskName()%>&nbsp;<small>(<%=evaluation.getStartDate()%>&nbsp;~&nbsp;<%=evaluation.getEndDate()%>)</small>
          </h5>

          <p class="card-text">&nbsp;&nbsp;&nbsp;팀원 :<%=evaluation.getUserName()%>&nbsp;<small>(<%=evaluation.getTeamName()%>)</small></p>
            <p class="card-text">&nbsp;&nbsp;&nbsp;내용 :<%=evaluation.getEvaluationContent() %></p>
            
          <div class="row">
            <div class="col-12 text-right">
            <a class="btn btn-warning mx-1 mt-2" data-toggle="modal" href="#updateModal" data-eval="<%=evaluation.getEvaluationID()%>"data-task="<%=evaluation.getTaskName()%>"
            data-leader="<%=evaluation.getLeaderName()%>"data-user="<%=evaluation.getUserName()%>"data-employee="<%=evaluation.getEmployee()%>"data-start="<%=evaluation.getStartDate()%>"
            data-end="<%=evaluation.getEndDate()%>"data-holi="<%=evaluation.getHoliday()%>"data-content="<%=evaluation.getEvaluationContent()%>">수정</a>
              <a class="btn btn-danger mx-1 mt-2" onclick="return confirm('삭제하시겠습니까?')" href="./deleteAction.jsp?evaluationID=<%=evaluation.getEvaluationID()%>">삭제</a>
          </div></div></div></div>

<%
	}
%>
    </div>
    <ul class="pagination justify-content-center mt-3">
      <li class="page-item">
<%
	if(pageNumber <= 0) {
%>     
       <a class="page-link disabled">이전</a> 
<%
	}else {
%>
		<a class="page-link" href="./index.jsp?teamName=<%=URLEncoder.encode(teamName, "UTF-8")%>&searchType=<%=URLEncoder.encode(searchType, "UTF-8")%>&search=<%=URLEncoder.encode(search, "UTF-8")%>&pageNumber=<%=pageNumber - 1%>">이전</a>
<%

	}

%>

     </li>
      <li class="page-item">
<%
	if(evaluationList.size() < 6) {
%>     
     <a class="page-link disabled">다음</a> 
<%
	}else {
%>
		<a class="page-link" href="./index.jsp?teamName=<%=URLEncoder.encode(teamName, "UTF-8")%>&searchType=<%=URLEncoder.encode(searchType, "UTF-8")%>&search=<%=URLEncoder.encode(search, "UTF-8")%>&pageNumber=<%=pageNumber + 1%>">다음</a>
<%
	}
%>

      </li>
    </ul>


    <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="modal">업무 등록</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form action="./evaluationRegisterAction.jsp" method="post">
              <div class="form-row">
                <div class="form-group col-sm-12">
                  <label>업무명</label>
                  <input type="text" name="taskName" class="form-control" maxlength="50">
                </div>
                </div>
                <div class="form-row">
                <div class="form-group col-sm-4">
                  <label>업무 리더</label>
                  <input type="text" name="leaderName" class="form-control" maxlength="20" readonly>
                  <button class="btn btn-info" type="button" onclick="javasript:openLeaderWindow();">리더 추가</button>
                </div>
              </div>
              
               <div class="form-row">
                <div class="form-group col-sm-12">
                  <label>팀원 이름</label>
                  <input type="text" id="aa" name="userName" class="form-control" maxlength="2048" readonly>
                  <input type="hidden" id="bb" name="employee" class="form-control" maxlength="2048" readonly>
                  <button class="btn btn-info" type="button" onclick="javasript:openTeamWindow();">팀원 추가</button>
                </div>
              </div>

              <div class="form-row">
                <div class="form-group col-sm-4">
                  <label>시작일</label>
                  <input type="text" name="startDate" class="form-control"  readonly>
                </div>

                <div class="form-group col-sm-4">
                  <label>종료일</label>
                   <input type="text" name="endDate" class="form-control"  readonly>
                </div>

                <div class="form-group col-sm-4">
                  <label>공휴일</label>
                  <select name="holiday" class="form-control">
									<option value="0" selected>0</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
								</select>
                </div>
              </div>

              <div class="form-group">
                <label>내용</label>
                <textarea name="evaluationContent" class="form-control" maxlength="2048" style="height: 180px;"></textarea>
              </div>

              <div class="modal-footer">
                <button type="submit" class="btn btn-primary">등록하기</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="window.location.reload()">취소</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    
    <!-- 수정  -->
     <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="modal">업무 수정</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form action="./updateAction.jsp" method="post">
              <div class="form-row">
                <div class="form-group col-sm-12">
                  <label>업무명</label>
                  <input type="text" id="task" name="taskName" class="form-control" maxlength="50">
                  <input type="hidden" name="eval"/>
                </div>
                </div>
                
                <div class="form-row">
                <div class="form-group col-sm-4">
                  <label>업무 리더</label>
                  <input type="text" id="leader" name="leaderName" class="form-control" maxlength="20" readonly>
                  <button class="btn btn-info" type="button" onclick="javasript:openLeader2Window();">리더 변경</button>
                </div>
              </div>
              
               <div class="form-row">
                <div class="form-group col-sm-12">
                  <label>팀원 이름</label>
                  <input type="text"  id="user" name="userName" class="form-control" maxlength="2048" readonly>
                  <input type="hidden" id="employee" name="employee" class="form-control" maxlength="2048" readonly>
                  <button class="btn btn-info" type="button" onclick="javasript:openTeam2Window();">팀원 변경</button>
                </div>
              </div>

              <div class="form-row">
                <div class="form-group col-sm-4">
                  <label>시작일</label>
                  <input type="text" name="startDate" class="form-control" id="date1" readonly>
                </div>

                <div class="form-group col-sm-4">
                  <label>종료일</label>
                   <input type="text" name="endDate" class="form-control" id="date2" readonly>
                </div>

                <div class="form-group col-sm-4">
                  <label>공휴일</label>
                  <select name="holiday" id="holi" class="form-control">
									<option value="0" selected>0</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
								</select>
                </div>
              </div>

              <div class="form-group">
                <label>내용</label>
                <textarea name="evaluationContent" id="content" class="form-control" maxlength="2048" style="height: 180px;"></textarea>
              </div>

              <div class="modal-footer">
                <button type="submit" class="btn btn-primary">수정하기</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="window.location.reload()">취소</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>

    <div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="modal">신고하기</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>

          </div>

          <div class="modal-body">
            <form method="post" action="./reportAction.jsp">
              <div class="form-group">
                <label>신고 제목</label>
                <input type="text" name="reportTitle" class="form-control" maxlength="20">
              </div>

              <div class="form-group">
                <label>신고 내용</label>
                <textarea name="reportContent" class="form-control" maxlength="2048" style="height: 180px;"></textarea>
              </div>

              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="submit" class="btn btn-danger">신고하기</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    
    <footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;"> 
      Copyright ⓒ 2019 김남효 All Rights Reserved.
    </footer>

    <!-- 제이쿼리 자바스크립트 추가하기 -->
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    
    <script src="./jquery-ui-1.12.1/jquery-ui.min.js"></script>

<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>


    <!-- Popper 자바스크립트 추가하기 -->
    <script src="./js/popper.min.js"></script>
    <!-- 부트스트랩 자바스크립트 추가하기 -->
    <script src="./js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
    $('input[name="startDate"]').datepicker({
		showOn: "button",
        buttonImage: "images/calendar.gif",
	    buttonImageOnly: false,
		buttonText: "시작일 선택"
	});
    
    $("#date1").datepicker({
		showOn: "button",
        buttonImage: "images/calendar.gif",
	    buttonImageOnly: false,
		buttonText: "시작일 선택"
	});
    
    $('input[name="endDate"]').datepicker({
		showOn: "button",
        buttonImage: "images/calendar.gif",
	    buttonImageOnly: false,
		buttonText: "종료일 선택"
	});
    $("#date2").datepicker({
		showOn: "button",
        buttonImage: "images/calendar.gif",
	    buttonImageOnly: false,
		buttonText: "종료일 선택"
	});
    
    var windowObj;
    function openLeaderWindow(){
    	var settings='toolbar=0, directories=0,status=no,menubar=0,scrollbars=auto,resizable=no,height=400,width=600,right=0,top=0';
    	windowObj=window.open("leaderSearch.jsp","자식창",settings);
    }
    function openLeader2Window(){
    	var settings='toolbar=0, directories=0,status=no,menubar=0,scrollbars=auto,resizable=no,height=400,width=600,right=0,top=0';
    	windowObj=window.open("leaderSearch2.jsp","자식창",settings);
    }
    function openTeamWindow(){
    	var settings='toolbar=0, directories=0,status=no,menubar=0,scrollbars=auto,resizable=no,height=400,width=600,right=0,top=0';
    	windowObj=window.open("teamSearch.jsp","자식창",settings);
    }  function openTeam2Window(){
    	var settings='toolbar=0, directories=0,status=no,menubar=0,scrollbars=auto,resizable=no,height=400,width=600,right=0,top=0';
    	windowObj=window.open("teamSearch2.jsp","자식창",settings);
    }
    $('#updateModal').on('show.bs.modal',function(e){
    	var eval=$(e.relatedTarget).data('eval');
    	var task=$(e.relatedTarget).data('task');
    	var leader=$(e.relatedTarget).data('leader');
    	var user=$(e.relatedTarget).data('user');
    	var employee=$(e.relatedTarget).data('employee');
    	var start=$(e.relatedTarget).data('start');
    	var end=$(e.relatedTarget).data('end');
    	var holi=$(e.relatedTarget).data('holi');
    	var content=$(e.relatedTarget).data('content');
    	
    	$(e.currentTarget).find('input[name="eval"]').val(eval);
    	$(e.currentTarget).find('input[id="task"]').val(task);
    	$(e.currentTarget).find('input[id="leader"]').val(leader);
    	$(e.currentTarget).find('input[id="user"]').val(user);
    	$(e.currentTarget).find('input[id="employee"]').val(employee);
    	$(e.currentTarget).find('input[name="startDate"]').val(start);
    	$(e.currentTarget).find('input[name="endDate"]').val(end);
    	$(e.currentTarget).find('input[id="holi"]').val(holi);
    	$(e.currentTarget).find('textarea[id="content"]').val(content);
   
    	
    	
    });
    </script>
  </body>
</html>
