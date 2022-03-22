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
<meta name="viewport" content="width=device-width"  initial-scale = "1"> <!-- 어느 디바이스에서나 적용되는 부트스트랩 반응형 웹 메타 태그 -->
<link rel = "stylesheet" href = "css/bootstrap.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		System.out.println("(main) session.getAttribute(userID) = " + userID);
		
	%>
	<nav class = "navbar navbar-default">
		<div class = "navbar-header">
			<button type = "button"  class = "navbar-toggle collapsed" 
			data-toggle = "collapse" data-target = "#bs-example-navbar-collapse-1"
			aria-expanded = "false">
				<span class = "icon-bar"></span>
				<span class = "icon-bar"></span>
				<span class = "icon-bar"></span>
			</button>
			<a class = "navbar-brand" href = "main.jsp">JSP 홈쇼핑 웹 사이트</a>
		</div>
		<div class = "collapse navbar-collapse" id = "bs-example-navbar-collapse-1">
			<ul class = "nav navbar-nav">
				<li class = "active"><a href = "main.jsp">메인</a></li>
				<li><a href = "bbs.jsp">게시판</a></li>
			</ul>
		<%
		if(userID == null) {
		%>
			<a href="login.jsp">아직 로그인 하지 않았다면 로그인을 해주세요</a><br/>
			<br/><a  style = "text-align:center">스마트 소프트웨어   이세영</a>
			<ul class = "nav navbar-nav navbar-right">
				<li class = "dropdown">
					<a href = "#" class = "dropdown-toggle"
						data-toggle = "dropdown" role = "button" aria-haspopup = "true"
						aria-expanded = "false">접속하기<span class = "caret"></span></a>
					<ul class = "dropdown-menu">
						<li><a href = "login.jsp">로그인</a></li>
						<li><a href = "join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
			<%
				} else {
			%>
			<p style = "text-align : right"><%= userID %> 님이 로그인 하셨습니다.</p>
			<a>어서오세요 <%= userID %>님</a><br/>
			<a>- 회원가입 비밀번호 자릿수</a>
			<a>- 성별 기능 추가 (성별제한 기능 제작)</a><br/>
			<a>- 생년월일로 하지말고 주민등록번호를 입력하고 그것을 암호화 저장한다면 아주 높은 가산점</a><br/>
			<a>- 회원들만의 구매 사이트 구현</a><br/>
			<a>- 홈페이지 관리자만의 사이트 구현(세션으로 내 아이디와 일치할때 스크립트릿 조건문 이용)</a><br/>
			<a>- 로그인창에 회원가입 버튼까지 같이 구현</a><br/>
			<a>- 비밀번호 변경창 구현</a><br/>
			<a>- 회원탈퇴 기능 구현</a><br/>
			<a>- 회원들의 구매 내역들 조회 구현</a>
			<a>- 전체 물품 페이지 추가</a>
			<a>- 자주 사용되는 시나리오로 VIEW 제작</a><br/>
			
			<ul class = "nav navbar-nav navbar-right">
				<li class = "dropdown">
					<a href = "#" class = "dropdown-toggle"
						data-toggle = "dropdown" role = "button" aria-haspopup = "true"
						aria-expanded = "false">접속하기<span class = "caret"></span></a>
					<ul class = "dropdown-menu">
						<li><a href = "logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
	<%
		if(userID == null) {
	%>
		<h2 style = "text-align : center">이곳은 저의 개인 데이터베이스 홈쇼핑 실험실입니다.</h2><br/>
		<h3 style = "text-align : center">어서오세요 <a href="login.jsp">로그인</a>후 서비스를 이용하실 수 있습니다.</h3>
	<% } else { %>
		<h2 style = "text-align : center">이곳은 저의 개인 데이터베이스 홈쇼핑 실험실입니다.</h2>
		<br/><h3 style = "text-align : center">어서오세요 <%= userID %>님</h3>
	<%
	}
	%>
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>