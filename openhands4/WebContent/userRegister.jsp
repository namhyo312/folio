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

.container mt-3 { position:absolute; top:50%; left:50%; width:300px; height:200px; overflow:hidden; background-color:#FC0; margin-top:-150px; margin-left:-100px;}
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
          <li class="nav-item ">
            <a class="nav-link" href="index.jsp">메인</a>
          </li>

           <li class="nav-item dropdown active">
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
        
        <form action="./index.jsp" method="get" class="form-inline my-2 my-lg-0">
          <input type="text" name="search" class="form-control mr-sm-2" placeholder="내용을 입력하세요.">
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
        </form>
      </div>
    </nav>

    <div class="container mt-3" style="max-width: 560px;">
      <form method="post" action="./userRegisterAction.jsp">
        <div class="form-group">
          <label>부서이름</label> <select name="teamName" class="form-control">
					<option value="선택">선택하세요</option>
					<option value="개발품질">개발품질</option>
					<option value="운영품질">운영품질</option>
					<option value="경영지원">경영지원</option>
					<option value="클라우드">클라우드</option>
				</select>
			</div>
        
        <div class="form-group">
          <label>사원이름</label>
          <input type="text" name="userName" class="form-control">
        </div>

			<div class="form-group">
				<label>사원번호</label> 
				<input type="number" name="employee" class="form-control" oninput="maxLengthCheck(this)" maxlength="7" placeholder="숫자 7자리 입력">
			</div>
			<div class="form-group">
          <label>이메일</label>
          <input type="email" name="userEmail" class="form-control" placeholder="홍길동@xxx.com">
        </div>

        <button type="submit" class="btn btn-primary">팀원등록</button>
        <button type="reset" class="btn btn-secondary" onclick="location.href='index.jsp';" class="btn btn-primary">취소</button>
      </form>
    </div>

    <footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
      Copyright ⓒ 2019 김남효 All Rights Reserved.
    </footer>

  <!-- 제이쿼리 자바스크립트 추가하기 -->
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    <!-- Popper 자바스크립트 추가하기 -->
    <script src="./js/popper.min.js"></script>
    <!-- 부트스트랩 자바스크립트 추가하기 -->
    <script src="./js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
  function maxLengthCheck(object){
    if (object.value.length > object.maxLength){
      object.value = object.value.slice(0, object.maxLength);
    }    
  }
  
</script>
  </body>
</html>
