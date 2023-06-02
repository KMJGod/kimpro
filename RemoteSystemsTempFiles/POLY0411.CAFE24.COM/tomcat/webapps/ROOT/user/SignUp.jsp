
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="../assets/css/mainn.css" />
	<noscript><link rel="stylesheet" href="../assets/css/noscriptt.css" /></noscript>
	<title>회원가입 페이지</title>
</head>
<style type="text/css"> /* 게시판 위쪽 메인 게시판 부분 글씨 색 처리 */
	a.over{
		color: #000000;
		text-decoration: none;
	}	
	#links2, #links3 {
		        display: none;
		    }
		    
		    .show {
		        display: block;
		    }
	/* 선택된 라디오 버튼 스타일 */
	  input[type="radio"]:checked + span {
	    font-weight: bold;
	    color: purple;
	  }
	  #container {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100%;
  }	     		 
</style>
<body class="is-preload">
	  <div id="wrapper">
  			<!-- Header -->
					<header id="header" class="alt">
						<!-- Logo -->
						<a href="../index.jsp" class="logo"><strong>Forty</strong> <span>by HTML5 UP</span></a>
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
							<li><a href="./Login.jsp" class="button primary fit">로그인</a></li>
							<li><a href="./SignUp.jsp" class="button fit">회원가입</a></li>
						<% } %>	
						</ul>
					</nav>
	<div id="container">
	  <div style="text-align: center; width: 850px;">
	    <form method="post" action="SignUpAction.jsp">
			<h3 style="text-align: center;">회원가입 화면</h3>
				<div style="padding:15px">
					<input type="text" class="user_id" placeholder="아이디" name="user_id" maxlength="20" value="">
				</div>
				<div style="padding:15px">
					<input type="password" class="user_passwd" placeholder="비밀번호" name="user_passwd" maxlength="20" value="">
				</div>
				<div style="padding:15px">
					<input type="text" class="user_name" placeholder="이름" name="user_name" maxlength="20" value="">
				</div>
				<div style="padding:15px">
					<input type="text" class="user_nickname" placeholder="닉네임" name="user_nickname" maxlength="20" value="">
				</div>
				<div id="birthday" style="display: flex; align-items: center; justify-content: center; padding:15px;">
				  <label style="flex-shrink: 0;">생일 : </label>
				  <input type="date" class="user_birth" name="user_birth" maxlength="20" value="">
				</div>
				<div style="padding:15px">
					<input type="text" class="user_phoneNum" placeholder="전화번호" name="user_phoneNum" maxlength="20" value="">
				</div>
				<div id="email" style="display: flex; flex-direction: column; padding:15px;">
				  <div style="display: flex; align-items: center; justify-content: center;">
				    <label style="flex-shrink: 0; text-align: center;">이메일 : </label>
				  </div>
				  <div style="display: flex; align-items: center;">
				  	<input type="text" class="user_email1" name="user_email1" maxlength="20" value="">
				    <span style="flex-shrink: 0;">@</span>
				    <input type="text" class="user_email2" name="user_email2" maxlength="20" value="">
				  </div>
				</div>
				<div id="label" style="padding: 15px;">
				  <label style="display: inline-block; cursor: pointer;">
				    <input type="radio" name="user_gender" autocomplete="off" value="남자">
				    <span style="border: 1px solid white; padding:5px 0px 5px 5px;">남자</span>
				  </label>
				  <label style="display: inline-block; cursor: pointer;">
				    <input type="radio" name="user_gender" autocomplete="off" value="여자">
				    <span style="border: 1px solid white; padding:5px 0px 5px 5px;">여자</span>
				  </label>
				</div>
				<div style="padding:15px">
					<label>페이스북 : </label><input type="text" class="user_sns_facebook"  name="user_sns_facebook" maxlength="20" value="">
				</div>
				<div style="padding:15px">
					<label>트위터 : </label><input type="text" class="user_sns_twitter"  name="user_sns_twitter" maxlength="20" value="">
				</div>
				<div style="padding:15px">
					<label>인스타그램 : </label><input type="text" class="user_sns_instargram"  name="user_sns_instargram" maxlength="20" value="">
				</div>
					<input type="submit" class="login" value="회원가입">
		    </form>
		  </div>
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

