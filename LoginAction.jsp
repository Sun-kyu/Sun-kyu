<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" /> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
   <%
       //로그인된 사람이 또 로그인 하는 것을 방지
      String userID = null;
      if(session.getAttribute("userID")!=null){
         userID = (String) session.getAttribute("userID");
      }
      if(userID != null){
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('이미 로그인이 되어있습니다.')");
         script.println("location.href = 'Index.jsp'");
         script.println("</script>");
      }
      
      UserDAO userDAO = new UserDAO(); //인스턴스생성
      int result = userDAO.login(user.getUserID(), user.getUserPassword());
      
      //로그인 성공
      if(result == 1){
         session.setAttribute("userID",user.getUserID());
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("location.href = 'Index.jsp'");
         script.println("</script>");
      }
      //로그인 실패
      else if(result == 0){
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('비밀번호가 틀립니다.')");
         script.println("location.href = 'Login.jsp'"); //이전 페이지 login.jsp로 돌려보냄.
         script.println("</script>");
      }
      //아이디 없음
      else if(result == -1){
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('존재하지 않는 아이디 입니다.')");
      script.println("location.href = 'Join.jsp'");
      script.println("</script>");
      }
      //DB오류
      else if(result == -2){
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('데이터베이스 오류가 발생했습니다.')");
      script.println("location.href = 'Login.jsp'");
      script.println("</script>");
      }         
   %>
</body>
</html>