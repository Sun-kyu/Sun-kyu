<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!doctype html>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>

<jsp:include page="/navbar.jsp" />
   <%
      String userID = null;
      if(session.getAttribute("userID")!=null){
         userID = (String)session.getAttribute("userID");
      }
   %>
   <nav class="navbar navbar-default">
      <div class="navbar-header">
         <button type="button" class="navbar-toggle collapsed"
         data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
         aria-expanded="false">
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
         </button>
         <a class="navbar-brand" href="main.jsp">강의 평가</a>
      </div>
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
         <ul class="nav navbar-nav">
            <li><a href="main.jsp">메인</a></li>
            <li class="active"><a href="bbs.jsp">게시판</a></li>
         </ul>
         <%
            if(userID == null){
         %>
         <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
               <a href="#" class="dropeown-toggle"
                  data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">접속하기<span class="caret"></span></a>
               <ul class="dropdown-menu">
                  <li><a href="login.jsp">로그인</a></li>
                  <li><a href="join.jsp">회원가입</a></li>
               </ul>
            </li>
         </ul>
         <%
            } else {
         %>
         <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
               <a href="#" class="dropeown-toggle"
                  data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">회원관리<span class="caret"></span></a>
               <ul class="dropdown-menu">
                  <li><a href="logoutAction.jsp">로그아웃</a></li>
               </ul>
            </li>
         </ul>
         <%
            }
         %>
      </div> 
   </nav>
   <div class = "container">
      <div class="row">
      <form method="post" action="writeAction.jsp">
         <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
            <thead>
               <tr>
                  <th colspan="2" style="background-color: #eeeeee; text-align: center;">강의 평가</th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td><input type="text" class="form-control" placeholder="강의명" name="bbsTitle" maxlength="50"></td>
               </tr>
               <tr>
                  <td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048px" style="height: 350px;"></textarea></td>
               </tr>
            </tbody>
         </table>
         <input type="submit" class="btn btn-primary pull-right" value="글쓰기">
      </form>
      </div>
   </div>
<jsp:include page="/footer.jsp" />
<!-- 제이쿼리 자바스크립트 추가하기 -->
<script src="./resources/js/jquery.min.js"></script>
<!-- Popper 자바스크립트 추가하기 -->
<script src="./resources/js/popper.min.js"></script>
<!-- 부트스트랩 자바스크립트 추가하기 -->
<script src="./resources/js/bootstrap.min.js"></script>
</body>
</html>