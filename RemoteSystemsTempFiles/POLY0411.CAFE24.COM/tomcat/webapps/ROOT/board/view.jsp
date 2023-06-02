<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../db/Connection.jsp" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
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

    int boardIdx = Integer.parseInt(request.getParameter("idx"));
	// board_Idx값 세션으로 저장하여 ListDeleteAction.jsp에  board_Idx값을 넘길 수 있다.
	session.setAttribute("board_Idx", boardIdx);
	
	// 현재 로그인한 사용자 정보 조회
    String userNickname = (String) session.getAttribute("user_nickname");
    int userIdx = (int) session.getAttribute("user_idx");
    
    boolean LikeButton = true;
	
 	// 조회수 증가
    PreparedStatement pstmt0 = null;
    ResultSet rs0 = null;
    int viewCount = 0;
    
 	// 게시글 정보 조회
    PreparedStatement pstmt1 = null;
    ResultSet rs1 = null;
    
    // 좋아요 갯수 확인
    PreparedStatement pstmt2 = null;
    ResultSet rs2 = null;
    
 	// 좋아요 누르기
    PreparedStatement pstmt3 = null;
    ResultSet rs3 = null;
    
    /* 세션을 활용하여 중복 조회수 증가 방지 */
    String sessionKey = "board_" + boardIdx;
    if (session.getAttribute(sessionKey) == null) {
    	String sql0 = "UPDATE board_tb SET board_view_count = board_view_count + 1 WHERE board_idx = ?";
        pstmt0 = conn.prepareStatement(sql0);
        pstmt0.setInt(1, boardIdx);
        pstmt0.executeUpdate();
        session.setAttribute(sessionKey, true);
    }
        try {
            String sql1 = "SELECT board_title, board_content, board_view_count FROM board_tb WHERE board_idx = ?";
            pstmt1 = conn.prepareStatement(sql1);
            pstmt1.setInt(1, boardIdx);
            rs1 = pstmt1.executeQuery();
            // rs1에서 게시글 정보 가져와서 화면에 출력

            //게시글 좋아요 총 갯수를 가져온다.
            String sql2 = "SELECT COUNT(board_idx) FROM likey_tb WHERE board_idx = ?";
            pstmt2 = conn.prepareStatement(sql2);
            pstmt2.setInt(1, boardIdx);
            rs2 = pstmt2.executeQuery();

            // 좋아요를 눌렀는지 값을 확인한다.
            String sql3 = "SELECT COUNT(user_idx) FROM likey_tb WHERE board_idx = ? and user_idx = ?";
            pstmt3 = conn.prepareStatement(sql3);
            pstmt3.setInt(1, boardIdx);
            pstmt3.setInt(2, userIdx);
            rs3 = pstmt3.executeQuery();
            
            int count = 0;
            
             // 좋아요 버튼 보이기 여부
            	if(rs3.next()){
            		count = rs3.getInt(1);
            		if(count==0){
            			LikeButton = true;
            		}else if(count!=0){
            			LikeButton = false;
            		}
            	}

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	
        }
        // Close the database resources
%>
</head>
<body class="is-preload">
	<div id="wrapper">
  			<!-- Header -->
					<header id="header" class="alt">
						<!-- Logo -->
						<a href="../index.html" class="logo"><strong>Forty</strong> <span>by HTML5 UP</span></a>
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
  <% if(rs1.next()){ %>
  <table border="1">
  	<thead>
  	<tr>
  		<th>글번호</th>
  		<th>제목</th>
  		<th>내용</th>
  		<th>조회수</th>
  		<th>좋아요</th>
  	</tr>
  </thead>
  <tbody>
  	<tr>
  		<td><%=boardIdx%></td>
  		<td><%=rs1.getString("board_title") %></td>
  		<td><%=rs1.getString("board_content") %></td>
  		<td><%=rs1.getInt("board_view_count") %></td>  <%} %>
  		<% if(rs2.next()){ %>
  		<td><%=rs2.getInt("COUNT(board_idx)") %></td>
  		<%} %>
  	</tr>
  </tbody>
<!-- Like 버튼 -->
<tfoot id="likeButtonContainer">
<form method="post" action="like/likeAction.jsp" style="text-align: center">
    <input type="hidden" value="<%=boardIdx %>" name="board_idx">
    <% 
    if (LikeButton == true) {  	
    %>
    <button id="likeButton">👍</button>
    <% }else if(LikeButton == false) { %>
    <button id="likeButton" style="display: none;">👍</button>
    <% } %>
</form>
</tfoot>
</table>

<!-- 게시글 삭제 버튼 -->
<table>
    <form method="post" action="ListDeleteAction.jsp" style="text-align: center">
        <input type="hidden" name="boardIdx" value="<%=boardIdx%>">
        <button>게시글 삭제</button>
    </form>
</table>

<!-- 댓글 등록 -->
<div class="container">
    <div class="row">
        <form method="post" action="CommentAction.jsp">
        <input type="hidden" name="boardIdx" value="<%=boardIdx%>">
        <input type="hidden" name="parentCommentIdx" value="0"> <!-- 대댓글이 아닌 원댓글의 경우 parent_comment_idx는 0 -->
        <table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd">
               <tbody>
                  <tr>
                     <td align="left"><%=userNickname %></td>
                  </tr>
                  <tr>
                     <td><input type="text" class="form-control" placeholder="댓글 쓰기" name="comment_message" maxlength="300"></td>
                  </tr>
               </tbody>
            </table>
            <input type="submit" class="btn btn-success pull-right" value="등록">
            </form>
      </div>
   </div>
   
<!-- 댓글 출력 -->
<div class="comments">
  <%
    PreparedStatement pstmt4 = null;
    ResultSet rs4 = null;
    try {
      String sql4 = "SELECT comment_idx, user_nickname, comment_reg_date, comment_message, comment_level, parent_comment_idx FROM comment_tb WHERE board_idx = ? ORDER BY (CASE WHEN parent_comment_idx = 0 THEN comment_idx ELSE parent_comment_idx END) ASC, comment_idx ASC";
      pstmt4 = conn.prepareStatement(sql4);
      pstmt4.setInt(1, boardIdx);
      rs4 = pstmt4.executeQuery();
      while (rs4.next()) {
%>
  <div class="comment" style="margin-left: <%=rs4.getInt("comment_level")*50 %>px"> <!-- comment_level을 이용하여 들여쓰기 -->
      <p><h4><%=rs4.getString("user_nickname")%> (<%=rs4.getString("comment_reg_date")%>)</h4></p>
      <p><%=rs4.getString("comment_message")%></p>
      
      <% if (userNickname.equals(rs4.getString("user_nickname"))) { %>
        
        <!-- 수정 form -->
        <form method="post" action="CommentEditAction.jsp" style="display: none;" id="updateForm_<%=rs4.getInt("comment_idx")%>">
          <input type="hidden" name="comment_idx" value="<%=rs4.getInt("comment_idx")%>">
          <input type="hidden" name="boardIdx" value="<%=boardIdx%>">
          <input type="text" class="form-control" name="comment_message" value="<%=rs4.getString("comment_message")%>" maxlength="300">
          <input type="submit" class="btn btn-success pull-right" value="수정 완료">
        </form>

        <!-- 수정, 삭제 버튼 -->
        <button onclick="document.getElementById('updateForm_<%=rs4.getInt("comment_idx")%>').style.display = ''; ">
        	<img src="./image/icon_edit.png" alt="수정" style="width: 20px; height: 20px;">
        </button>
        <form method="post" action="CommentDeleteAction.jsp" style="display: inline;" onsubmit="return confirm('댓글을 삭제하시겠습니까?');">
          <input type="hidden" name="comment_idx" value="<%=rs4.getInt("comment_idx")%>">
          <input type="hidden" name="boardIdx" value="<%=boardIdx%>">
            <button type="submit" >
			    <img src="./image/icon_delete.png" alt="삭제" style="width: 20px; height: 20px;">
			</button>
        </form>
      <% } %>
      
      <!-- 대댓글 작성 form -->
      <% if (rs4.getInt("comment_level") < 2) { %> <!-- comment_level이 2 미만인 경우에만 대댓글 작성 form을 표시 -->
      <form method="post" action="CommentAction.jsp"> 
        <input type="hidden" name="boardIdx" value="<%=boardIdx%>">
        <input type="hidden" name="parentCommentIdx" value="<%=rs4.getInt("comment_idx")%>"> <!-- 원 댓글의 idx를 parent_comment_idx로 전달 -->
        <input type="text" class="form-control" placeholder="댓글 쓰기" name="comment_message" maxlength="300">
        <!-- <input type="submit" class="btn btn-success pull-right" value="등록"> -->
        <button type="submit">
			    <img src="./image/icon_register.png" alt="등록" style="width: 20px; height: 20px;">
		</button>
      </form>
      <% } %>
  </div>
  <hr/>
<% 
    }
  } catch (SQLException e) {
    e.printStackTrace();
  } finally {
    if (rs4 != null) try { rs4.close(); } catch (SQLException e) { e.printStackTrace(); }
    if (pstmt4 != null) try { pstmt4.close(); } catch (SQLException e) { e.printStackTrace(); }
  }
%>



<%
		    try {
		        if (rs1 != null) rs1.close();
		        if (pstmt1 != null) pstmt1.close();
		        if (rs2 != null) rs2.close();
		        if (pstmt2 != null) pstmt2.close();
		        if (rs3 != null) rs3.close();
		        if (pstmt3 != null) pstmt3.close();
		        if (conn != null) conn.close();
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }     
%>
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