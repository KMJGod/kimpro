	<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	
	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/mainn.css" />
		<noscript><link rel="stylesheet" href="../assets/css/noscriptt.css" /></noscript>
	    <title>로그인 페이지</title>
	</head>
	<body class="is-preload">
	    <!-- 네비게이션  -->
	<div id="wrapper">
			<!-- Header -->
					<header id="header" class="alt">
						<!-- Logo -->
						<a href="../index.jsp" class="logo"><strong>자랑스러운</strong> <span>1조</span></a>
						<nav>
							<a href="#menu">Menu</a>
						</nav>
					</header>
					
				<!-- Menu -->
					<nav id="menu">
					
					<!--  사용자가 로그인한 경우에만 버튼이 표시  -->
										
						<ul class="links">
						    <% if (session.getAttribute("user_id") != null) { %>
						        <li><a href="LogoutAction.jsp">로그아웃</a></li>
						        <li><a href="#">내정보</a></li>
						        <li><a href="#">메인기능</a></li>
						        <li id="community" onmouseover="showLinks2()" onmouseout="hideLinks2()"><a href="#">커뮤니티</a>
						            <ul class="links2" id="links2">
						                <li><a href="../board/boardmain.jsp">게시판</a></li>
						            </ul>
						        </li>    
						        <li id="friendinfo" onmouseover="showLinks3()" onmouseout="hideLinks3()"><a href="#">친구관리</a>
						            <ul class="links3" id="links3">
						                <li><a href="../friends/FriendsList.jsp">친구</a></li>
						                <li><a href="../friends/Friend.jsp">친구추가</a></li>
						                <li><a href="../friends/FriendCheck.jsp">받은친구신청</a></li>
						                <li><a href="../message/MsgSend.jsp">메시지 보내기</a></li>
						                <li><a href="../message/MsgCheck.jsp">메시지 확인</a></li>
						            </ul>						        
						        </li>
						    <% } %>    
						</ul>
						
						<script>
						    function showLinks2() {
						        var links2 = document.getElementById("links2");
						        links2.style.display = "block";
						    }
						    
						    function hideLinks2() {
						        var links2 = document.getElementById("links2");
						        links2.style.display = "none";
						    }
						
						    function showLinks3() {
						        var links3 = document.getElementById("links3");
						        links3.style.display = "block";
						    }
						    
						    function hideLinks3() {
						        var links3 = document.getElementById("links3");
						        links3.style.display = "none";
						    }
						</script>					
						
					<!--  사용자가 로그인하지 않은 경우에만 로그인 및 회원가입 버튼이 표시  -->
						
						<ul class="actions stacked">
						<% if (session.getAttribute("user_id") == null) { %>
							<li><a href="../user/Login.jsp" class="button primary fit" style="width: 75%;">로그인</a></li>
							<li><a href="../user/SignUp.jsp" class="button fit" style="width: 75%;">회원가입</a></li>
						<% } %>	
						</ul>
					</nav>
				
				<div style="width: 55%; margin: 0 auto;">
				  <form method="post" action="LoginAction.jsp" style="text-align: center">
				    <div style="text-align: center; margin-top: 35px">
				      <img src="../images/logo.png" style="width: 20%;">
				    </div><br><br>
				    <div class="loginform-group" style="display: flex; flex-direction: column; align-items: center; margin-top: -40px">
				      <label for="user_id" style="height: 20px;">아이디</label>
				      <input style="width: 44%; height: 50px;" type="text" class="user_id" id="user_id" name="user_id" value="" maxlength="20">
				    </div>
				    <div class="loginform-group" style="display: flex; flex-direction: column; align-items: center; margin-top: 15px">
				      <label for="user_passwd" style="height: 20px;">비밀번호</label>
				      <input style="width: 44%; height: 50px;" type="password" class="user_passwd" id="user_passwd" name="user_passwd" value="" maxlength="20">
				    </div><br>
				    <input type="submit" class="login" value="로그인">
				  </form>    
				</div>


	    
						
	</div>
	<!-- Scripts -->

			<script src="../assets/js/jquery.minn.js"></script>
			<script src="../assets/js/jquery.scrolly.minn.js"></script>
			<script src="../assets/js/jquery.scrollex.minn.js"></script>
			<script src="../assets/js/browser.minn.js"></script>
			<script src="../assets/js/breakpoints.minn.js"></script>
			<script src="../assets/js/utiln.js"></script>
			<script src="../assets/js/mainn.js"></script>
	</body>
	</html>