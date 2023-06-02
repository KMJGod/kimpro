<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../db/Connection.jsp" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/mainn.css" />
<noscript><link rel="stylesheet" href="../assets/css/noscriptt.css" /></noscript>  <!-- 반응형 웹에 사용하는 메타태그 -->
<title>게시판</title>
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
</style>
<% 
	// 게시물 목록 조회 쿼리문
	String sql = "SELECT *, (SELECT COUNT(likey_idx) FROM likey_tb WHERE info_board_idx = info_board_tb.info_board_idx) AS like_count FROM info_board_tb ORDER BY info_board_idx DESC";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
%>
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
						                <li><a href="../family/FamilyCheck.jsp">받은가족신청</a></li>
						                <li><a href="../message/MsgSend.jsp">메시지 보내기</a></li>
						                <li><a href="../message/MsgCheck.jsp">메시지 확인</a></li>
						                <li><a href="../chat/chat.jsp">채팅방</a></li>
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
	  <a href="Infoboard.jsp" class="over"><h4>정보 게시판</h4></a>
	  <a href="boardmain.jsp" class="over"><h4>자유 게시판</h4></a>
	  <a href="BestLikeList.jsp" class="over"><h4>Best 좋아요 게시판</h4></a>
	  <a href="BestViewsList.jsp" class="over"><h4>Best 조회수 게시판</h4></a>
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
        <td><%= rs.getInt("infoboard_idx") %></td>
        <td><a href="view.jsp?idx=<%= rs.getInt("infoboard_idx") %>"><%= rs.getString("board_title") %></a></td>
        <td><%= rs.getString("user_nickname") %></td>
        <td><%= rs.getTimestamp("board_reg_date") %></td><!-- 작성글 작성 시간 가져오기 -->
        <td><%= rs.getInt("board_view_count") %></td><!--  조회수 갯수 가져오기 -->
        <td><%= rs.getInt("like_count") %></td><!-- 좋아요 갯수 가져오기 -->
      </tr>
      <% } %>
    </tbody>
  </table>
  <button>
  	<a href="write.jsp" class="over">글쓰기</a>
  </button>
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