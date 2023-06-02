<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../db/Connection.jsp" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
		<title>자유 게시판</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/mainn.css" />
		<noscript><link rel="stylesheet" href="../assets/css/noscriptt.css" /></noscript>
</head>
  <style type="text/css">
 body {
  -ms-overflow-style: none;
}
::-webkit-scrollbar {
  display: none;
}
    /* 게시판 위쪽 메인 게시판 부분 글씨 색 처리 */
    a.over {
      color: #FFFFFF;
      text-decoration: none;
    }
    
    tbody td {
    font-size: 15px; /* 원하는 폰트 크기로 설정 */
  	}
    
    .List {
      width: 100%; /* 테이블의 전체 너비를 100%로 설정합니다. */
    }
    
    .List-container {
      margin: 15px;
      padding: 15px;
      margin-bottom: 5px;
      overflow-x: auto; /* 가로 스크롤바 표시를 위해 컨테이너의 너비를 초과하는 경우 스크롤바를 표시합니다. */
    }
    
    .Menu {
      width: 100%;
      letter-spacing: 1px; /* 글자 사이의 간격을 2px로 설정합니다. */
      margin-bottom: 20px;
      text-decoration: none;
      font-weight: bold;
      text-align: center;
    }
    
    .Menu a {
      margin: 0 20px; /* 링크 사이의 간격을 20px로 설정 */
      border-bottom: 1px; /* 텍스트 아래에 흰색 선을 추가합니다. */
      padding-bottom: 2px; /* 텍스트와 선 사이의 간격을 설정합니다. */
      text-shadow: 2px 2px 2px gray; /*글씨 그림자*/
    }
    
    .Main {
      margin: 15px;
      padding: 15px;
    }
    
    #links2,
    #links3 {
      display: none;
    }
    
    .show {
      display: block;
    }
    
    .List td {
      padding: 10px 15px; /* 위, 아래 패딩 10px, 좌우 패딩 15px로 설정합니다. */
  	  font-size: 15px;
 	  width: 150px; /* 너비를 고정값으로 설정합니다. */
  }
    
    .Write {
      border-bottom: 1px; /* 흰색 선을 아래쪽 테두리로 설정합니다. */
      padding-bottom: 15px;
      margin-bottom: 15px;
    }
    
    .Write-container {
	  position: absolute;
	  padding-bottom: 15px;
	  right: 15px;
	}
/*     
    .logo span {
      display: block;
    } */
  </style>
<% 
	// 게시물 목록 조회 쿼리문
	String sql = "SELECT *, (SELECT COUNT(likey_idx) FROM likey_tb WHERE board_idx = board_tb.board_idx) AS like_count FROM board_tb ORDER BY board_idx DESC";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
%>
<body class="is-preload">
	  <div id="wrapper" class="Main">
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
							<li><a href="user/Login.jsp" class="button primary fit">로그인</a></li>
							<li><a href="user/SignUp.jsp" class="button fit">회원가입</a></li>
						<% } %>	
						</ul>
					</nav>
	  <div class="Menu">
<!-- 	  <a href="infoboard/Infoboard.jsp" class="over"><span>정보 게시판</span></a> -->
	  <a href="boardmain.jsp" class="over"><span>자유 게시판</span></a>
<!-- 	  <a href="BestLikeList.jsp" class="over"><span>Best 좋아요 게시판</span></a>
	  <a href="BestViewsList.jsp" class="over"><span>Best 조회수 게시판</span></a> -->
	  </div>
<div class="List-container">
  <table border="1">
    <thead>
      <tr>
        <th>글번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>등록일</th>
        <th>조회수</th>
        <th>좋아요</th>
      </tr>
    </thead>
    <tbody> <!-- 게시판 목록 보이는 부분  -->
      <% while (rs.next()) { %>
      <tr>
        <td><%= rs.getInt("board_idx") %></td>
        <td><a href="view.jsp?idx=<%= rs.getInt("board_idx") %>"><%= rs.getString("board_title") %></a></td>
        <td><%= rs.getString("user_nickname") %></td>
        <td><%= rs.getTimestamp("board_reg_date") %></td><!-- 작성글 작성 시간 가져오기 -->
        <td><%= rs.getInt("board_view_count") %></td><!--  조회수 갯수 가져오기 -->
        <td><%= rs.getInt("like_count") %></td><!-- 좋아요 갯수 가져오기 -->
      </tr>
      <% } %>
    </tbody>
  </table>
  </div>
<div class="Write-container">
 <button style="margin-right:45px;">
  <a href="write.jsp" class="Write">글쓰기</a>
 </button>
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