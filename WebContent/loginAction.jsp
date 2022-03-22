<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class = "user.User" scope = "page"/>
<jsp:setProperty name = "user" property = "userID" />
<jsp:setProperty name = "user" property = "userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
			String userID = null;
			String id = request.getParameter("userID"); // 수정한 부분  삭제해도 무관
			if (session.getAttribute("userID") != null) {
				userID = (String) session.getAttribute("userID");
			}
			if (userID != null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 로그인 중입니다.')");
				script.println("location.href = 'main.jsp' ");
				script.println("</script>");
			}
			UserDAO userDAO = new UserDAO();
			int result = userDAO.login(user.getUserID(), user.getUserPassword()); // -2 ~ 1까지 값들이 result에 담긴다
			if(result == 1) { 
				session.setAttribute("userID", id);   // 윗줄을 삭제했다면 매개값 두번째를 user.getUserID() 로 바꾸시오.
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}
			if(result == 0) { 
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('비밀번호가 틀립니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			if(result == -1) { 
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('아이디가 존재하지 않습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			if(result == -2) { 
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('데이터베이스 오류가 발생했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
	%>
</body>
</html>