<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="../assets/css/mainn.css" />
	<noscript><link rel="stylesheet" href="../assets/css/noscriptt.css" /></noscript>
<title>Insert title here</title>
</head>
<style>
  form {
    display: flex;
    flex-direction: column;
    align-items: center;
    max-width: 600px;
    margin: 20px auto;
  }


  form input {
    width: 100%;
    padding: 5px;
    margin-bottom: 15px;
    box-sizing: border-box;
  }


</style>
<body class="is-preload">
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
						        <li><a href="../user/LogoutAction.jsp">로그아웃</a></li>
						        <li><a href="#">내정보</a></li>
						        <li><a href="#">메인기능</a></li>
						        <li id="community" onmouseover="showLinks2()" onmouseout="hideLinks2()"><a href="#">커뮤니티</a>
						            <ul class="links2" id="links2">
						                <li><a href="../board/boardmain.jsp">게시판</a></li>
						            </ul>
						        </li>    
						        <li id="friendinfo" onmouseover="showLinks3()" onmouseout="hideLinks3()"><a href="#">친구관리</a>
						            <ul class="links3" id="links3">
						                <li><a href="FriendsList.jsp">친구</a></li>
						                <li><a href="Friend.jsp">친구추가</a></li>
						                <li><a href="FriendCheck.jsp">받은친구신청</a></li>
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
							<li><a href="Login.jsp" class="button primary fit" style="width: 75%;">로그인</a></li>
							<li><a href="SignUp.jsp" class="button fit" style="width: 75%;">회원가입</a></li>
						<% } %>	
						</ul>
					</nav>
<form action="FriendReqAction.jsp" method="post">
	<h3>친구코드를 입력해주세요</h3>
	<input type="text" maxlength="10" name = "friend_code">
	<button style="margin-top:15px">친구추가</button>
</form>
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