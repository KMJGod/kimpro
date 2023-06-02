<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/mainn.css" />
<noscript><link rel="stylesheet" href="../assets/css/noscriptt.css" /></noscript>
<title>WebSocket Basic</title>
</head>

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
						                <li><a href="../friends/FriendsList.jsp">친구</a></li>
						                <li><a href="../friends/Friend.jsp">친구추가</a></li>
						                <li><a href="../friends/FriendCheck.jsp">받은친구신청</a></li>
						                <li><a href="../message/MsgSend.jsp">메시지 보내기</a></li>
						                <li><a href="../message/MsgCheck.jsp">메시지 확인</a></li>
						                <li><a href="chat.jsp">채팅방</a></li>
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
	<h1 id = "state"></h1>
	<!-- 버튼이 눌리면 웹 소켓을 통해서 전송하는데  sendmessage함수를 이용한다. -->
	<input id=send type=text><input type="button" value="전송" id="button" onclick=sendmessage()>
	<script>
		//	소켓 연결을 위해 websocket 객체를 만든다.	 서블릿의 형태로 접속을 한다.
		var websocket = new WebSocket("ws://poly0411.cafe24.com/wsocket");
		
		//	아래는 웹 소켓에서 사용하는 4가지 이벤트들이다.
		websocket.onopen = function(message){
			document.getElementById("state").innerHTML = "소켓 시작"; 
		}
		websocket.onclose = function(message){}
		websocket.onerror = function(message){}
		//	onmessage는 외부에서 들어온 데이터를 받아서 처리를 하는 이벤트이다.
		websocket.onmessage = function(message){
			document.getElementById("state").innerHTML = message.data; 
		}
		
		function sendmessage()
		{
			//	메시지 박스에 있는 데이터를 전송한다.
			msg = document.getElementById("send").value;
			websocket.send(msg);
		}
	</script>
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