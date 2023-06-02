<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../db/Connection.jsp" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE HTML>
<!--
	Verti by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Forty by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/mainn.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscriptt.css" /></noscript>
		<style>
		    #links2, #links3 {
		        display: none;
		    }
		    
		    .show {
		        display: block;
		    }
		</style>
	</head>
	<body class="is-preload">
			<br><br><br>
			<%-- 세션값 정상적으로 출력되는지 체크 --%>
<%--
			<h4>&nbsp;(user_idx)&nbsp;<%= session.getAttribute("user_idx")  %></h4>
			<h4>&nbsp;(user_id)&nbsp;<%= session.getAttribute("user_id")  %></h4>
			<h4>&nbsp;(user_name)&nbsp;<%= session.getAttribute("user_name")  %></h4>
			<h4>&nbsp;(user_nickname)&nbsp;<%= session.getAttribute("user_nickname")  %></h4>
			<h4>&nbsp;(family_idx)&nbsp;<%= session.getAttribute("family_idx")  %></h4>
<%-- 			<h4>&nbsp;(user_birth)&nbsp;<%= session.getAttribute("user_birth")  %></h4>
			<h4>&nbsp;(user_phoneNum)&nbsp;<%= session.getAttribute("user_phoneNum")  %></h4>
			<h4>&nbsp;(user_email)&nbsp;<%= session.getAttribute("user_email")  %></h4>
			<h4>&nbsp;(user_gender)&nbsp;<%= session.getAttribute("user_gender")  %></h4>
			<h4>&nbsp;(user_friend_code)&nbsp;<%= session.getAttribute("user_friend_code")  %></h4>
			<h4>&nbsp;(user_sns_facebook)&nbsp;<%= session.getAttribute("user_sns_facebook")  %></h4>
			<h4>&nbsp;(user_sns_twitter)&nbsp;<%= session.getAttribute("user_sns_twitter")  %></h4>
			<h4>&nbsp;(user_sns_instargram)&nbsp;<%= session.getAttribute("user_sns_instargram")  %></h4>
			
 --%>
			
			<%-- <%= session.setAttribute("user_id", user_id); %>
			<%= session.setAttribute("user_passwd", user_passwd); %> --%>
		<div id="wrapper">
			<!-- Header -->
					<header id="header" class="alt">
						<!-- Logo -->
						<a href="index.jsp" class="logo"><strong>자랑스러운</strong> <span>1조</span></a>
						<!-- <a href="game/index.jsp"><img src="images/redBtn.png" width="50px" height="50px"></a> -->
						<nav>
							<a href="#menu">Menu</a>
						</nav>
					</header>
						
				<!-- Menu -->
					<nav id="menu">
					
					<!--  사용자가 로그인한 경우에만 버튼이 표시  -->
										
						<ul class="links">
						    <% if (session.getAttribute("user_id") != null) { %>
						        <li><a href="user/LogoutAction.jsp">로그아웃</a></li>
						        <li><a href="#">내정보</a></li>
						        <li><a href="#">메인기능</a></li>
						        <li id="community" onmouseover="showLinks2()" onmouseout="hideLinks2()"><a href="#">커뮤니티</a>
						            <ul class="links2" id="links2">
						                <li><a href="board/boardmain.jsp">게시판</a></li>
						            </ul>
						        </li>    
						        <li id="friendinfo" onmouseover="showLinks3()" onmouseout="hideLinks3()"><a href="#">친구관리</a>
						            <ul class="links3" id="links3">
						                <li><a href="friends/FriendsList.jsp">친구</a></li>
						                <li><a href="friends/Friend.jsp">친구추가</a></li>
						                <li><a href="friends/FriendCheck.jsp">받은친구신청</a></li>
						                <li><a href="message/MsgSend.jsp">메시지 보내기</a></li>
						                <li><a href="message/MsgCheck.jsp">메시지 확인</a></li>
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
							<li><a href="user/Login.jsp" class="button primary fit">로그인</a></li>
							<li><a href="user/SignUp.jsp" class="button fit">회원가입</a></li>
						<% } %>	
						</ul>
					</nav>
<!-- 					<nav id="menu"> -->
						
<!-- 						사용자가 로그인하지 않은 경우에만 로그인 및 회원가입 버튼이 표시  -->
<!-- 								<ul class="actions stacked">  -->
<%-- 									<% if (session.getAttribute("user_id") == null) { %> --%>
<!-- 										<li><a href="user/Login.jsp"  class="button fit">로그인</a></li> -->
<!-- 										<li><a href="user/SignUp.jsp" class="button primary fit">회원가입</a></li> -->
<%-- 									<% } %> --%>
<!-- 								</ul> -->
								
<!-- 						사용자가 로그인한 경우에만 버튼이 표시  -->
<!-- 								<ul class="links"> -->
<%-- 									<% if (session.getAttribute("user_id") != null) { %> --%>
<!-- 										<li><a href="user/LogoutAction.jsp">로그아웃</a></li> -->
<!-- 										<li> -->
<!-- 											<a href="#">내정보</a> -->
<!-- 											<ul> -->
<!-- 												<li><a href="user/UserEdit.jsp">회원정보수정</a></li> -->
<!-- 												<li><a href="user/DeleteAccount.jsp">회원탈퇴</a></li> -->
<!-- 												<li> -->
<!-- 													<a href="#">커뮤니티</a> -->
<!-- 													<ul> -->
<!-- 														<li><a href="friends/FriendsList.jsp">친구</a></li> -->
<!-- 														<li><a href="friends/Friend.jsp">친구추가</a></li> -->
<!-- 														<li><a href="friends/FriendCheck.jsp">받은친구신청</a></li> -->
<!-- 														<li><a href="family/FamilyCheck.jsp">받은가족신청</a></li> -->
<!-- 														<li><a href="message/MsgSend.jsp">메시지 보내기</a></li> -->
<!-- 														<li><a href="message/MsgCheck.jsp">메시지 확인</a></li> -->
<!-- 														<li><a href="chat/chat.jsp">채팅방</a></li> -->
<!-- 													</ul> -->
<!-- 												</li> -->
<!-- 											</ul> -->
<!-- 										</li> -->
<!-- 										<li><a href="board/boardmain.jsp">게시판</a></li> -->
<!-- 										<li><a href="family/FamilySearch.jsp">가족</a></li> -->
<!-- 										<li><a href="family/family.jsp">가족생성</a></li> -->
<!-- 										<li><a href="family/familyJoin.jsp">가족초대</a></li> -->
<!-- 										<li><a href="calendar/calendar.jsp">캘린더</a></li> -->
<!-- 								</ul> -->
							
<%-- 								<% } %>	 --%>
<!-- 					</nav> -->
				<!-- Banner -->
					<section id="banner" class="major">
						<div class="inner">
							<header class="major">
								<h1>Hi, my name is Forty</h1>
							</header>
							<div class="content">
								<p>A responsive site template designed by HTML5 UP<br />
								and released under the Creative Commons.</p>
								<ul class="actions">
									<li><a href="#one" class="button next scrolly">Get Started</a></li>
								</ul>
							</div>
						</div>
					</section>

				<!-- Main -->
					<div id="main">

						<!-- One -->
							<section id="one" class="tiles">
								<article>
									<span class="image">
										<img src="images/pic01.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="landing.html" class="link">game 1</a></h3>
										<p>Ipsum dolor sit amet</p>
									</header>
								</article>
								<article>
									<span class="image">
										<img src="images/pic02.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="landing.html" class="link">game 2</a></h3>
										<p>feugiat amet tempus</p>
									</header>
								</article>
								<article>
									<span class="image">
										<img src="images/pic03.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="landing.html" class="link">game 3</a></h3>
										<p>Lorem etiam nullam</p>
									</header>
								</article>
								<article>
									<span class="image">
										<img src="images/pic04.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="landing.html" class="link">game 4</a></h3>
										<p>Nisl sed aliquam</p>
									</header>
								</article>
								<article>
									<span class="image">
										<img src="images/pic05.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="landing.html" class="link">game 5</a></h3>
										<p>Ipsum dolor sit amet</p>
									</header>
								</article>
								<article>
									<span class="image">
										<img src="images/pic06.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="landing.html" class="link">game 6</a></h3>
										<p>Feugiat amet tempus</p>
									</header>
								</article>
							</section>

						<!-- Two -->
							<section id="two">
								<div class="inner">
									<header class="major">
										<h2>Massa libero</h2>
									</header>
									<p>Nullam et orci eu lorem consequat tincidunt vivamus et sagittis libero. Mauris aliquet magna magna sed nunc rhoncus pharetra. Pellentesque condimentum sem. In efficitur ligula tate urna. Maecenas laoreet massa vel lacinia pellentesque lorem ipsum dolor. Nullam et orci eu lorem consequat tincidunt. Vivamus et sagittis libero. Mauris aliquet magna magna sed nunc rhoncus amet pharetra et feugiat tempus.</p>
									<ul class="actions">
										<li><a href="landing.html" class="button next">Get Started</a></li>
									</ul>
								</div>
							</section>

					</div>

				<!-- Contact -->
					<section id="contact">
						<div class="inner">
							<section>
								<form method="post" action="#">
									<div class="fields">
										<div class="field half">
											<label for="name">Name</label>
											<input type="text" name="name" id="name" />
										</div>
										<div class="field half">
											<label for="email">Email</label>
											<input type="text" name="email" id="email" />
										</div>
										<div class="field">
											<label for="message">Message</label>
											<textarea name="message" id="message" rows="6"></textarea>
										</div>
									</div>
									<ul class="actions">
										<li><input type="submit" value="Send Message" class="primary" /></li>
										<li><input type="reset" value="Clear" /></li>
									</ul>
								</form>
							</section>
							<section class="split">
								<section>
									<div class="contact-method">
										<span class="icon solid alt fa-envelope"></span>
										<h3>Email</h3>
										<a href="#">information@untitled.tld</a>
									</div>
								</section>
								<section>
									<div class="contact-method">
										<span class="icon solid alt fa-phone"></span>
										<h3>Phone</h3>
										<span>(000) 000-0000 x12387</span>
									</div>
								</section>
								<section>
									<div class="contact-method">
										<span class="icon solid alt fa-home"></span>
										<h3>Address</h3>
										<span>1234 Somewhere Road #5432<br />
										Nashville, TN 00000<br />
										United States of America</span>
									</div>
								</section>
							</section>
						</div>
					</section>

				<!-- Footer -->
					<footer id="footer">
						<div class="inner">
							<ul class="icons">
								<li><a href="#" class="icon brands alt fa-twitter"><span class="label">Twitter</span></a></li>
								<li><a href="#" class="icon brands alt fa-facebook-f"><span class="label">Facebook</span></a></li>
								<li><a href="#" class="icon brands alt fa-instagram"><span class="label">Instagram</span></a></li>
								<li><a href="#" class="icon brands alt fa-github"><span class="label">GitHub</span></a></li>
								<li><a href="#" class="icon brands alt fa-linkedin-in"><span class="label">LinkedIn</span></a></li>
							</ul>
							<ul class="copyright">
								<li>&copy; Untitled</li><li>Design: <a href="https://html5up.net">HTML5 UP</a></li>
							</ul>
						</div>
					</footer>

			</div>



		<!-- Scripts -->

			<script src="assets/js/jquery.minn.js"></script>
			<script src="assets/js/jquery.scrolly.minn.js"></script>
			<script src="assets/js/jquery.scrollex.minn.js"></script>
			<script src="assets/js/browser.minn.js"></script>
			<script src="assets/js/breakpoints.minn.js"></script>
			<script src="assets/js/utiln.js"></script>
			<script src="assets/js/mainn.js"></script>

	</body>
</html>