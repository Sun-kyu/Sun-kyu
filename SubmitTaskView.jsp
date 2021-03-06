<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="bbs.TaskBbs" %>
<%@ page import="bbs.TaskBbsDAO" %>
<%@ page import="bbs.SubmitTask" %>
<%@ page import="bbs.SubmitTaskDAO" %>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>
<% 
    String userID = null;
    if(session.getAttribute("userID")!=null){
        userID = (String) session.getAttribute("userID");
    }
     
    User user = new UserDAO().getUser(userID);
    
	int SubmitTaskID=0;
	if(request.getParameter("SubmitTaskID") != null){
		SubmitTaskID = Integer.parseInt(request.getParameter("SubmitTaskID"));
	}
	
    SubmitTask task = new SubmitTaskDAO().getSubmitTask(SubmitTaskID);
    SubmitTaskDAO taskDAO = new SubmitTaskDAO();
%>
<jsp:include page="/navbar.jsp" />

<section class="container" style="min-height:420px;">
<div class="card bg-light mt-3">
	<div class="card-header bg-light">
		<div class="row">
			<div class="col-8 text-left"><%=task.getSubmitTaskUserName() %>&nbsp;|&nbsp;<small><%=task.getSubmitTaskDate().substring(0,11)%></small></div>
		</div>
	</div>
	<div class="card-body">
		<h4 class="Task-title"><%=task.getSubmitTaskTitle() %></h4>
		<p class="Task-content"><%=task.getSubmitTaskContent() %></p>
		<div class="row">
		<%
			if(user.getUserPower()==1 || user.getUserPower()==2){
				if(task.getConfirm()==0){
		%>
			<div class="col-12" style="text-align:right">
				<a onclick="return confirm('승인 하시겠습니까?')" href="SubmitTaskConfirm.jsp?SubmitTaskID=<%=SubmitTaskID%>" style="color:#000000"><strong>확인 완료&raquo;</strong></a>
			</div>
		<%
				}else{
		%>
			<div class="col-12" style="text-align:right">
				<p>승인이 완료된 게시물 입니다.
			</div>		
		<% 
				}
			}else{
		%>
			<div class="col-12" style="text-align:right">
				<p>승인 권한이 없습니다.
			</div>	
		<%
			}
		%>
		</div>
	</div>
</div>
<hr>
</section> 	
<jsp:include page="/footer.jsp" />
<!-- 제이쿼리 자바스크립트 추가하기 -->
<script src="./resources/js/jquery.min.js"></script>
<!-- Popper 자바스크립트 추가하기 -->
<script src="./resources/js/popper.min.js"></script>
<!-- 부트스트랩 자바스크립트 추가하기 -->
<script src="./resources/js/bootstrap.min.js"></script>
</body>
</html>