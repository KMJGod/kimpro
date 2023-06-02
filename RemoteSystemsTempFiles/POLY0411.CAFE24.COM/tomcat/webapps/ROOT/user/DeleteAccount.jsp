<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>회원 탈퇴 페이지</title>
</head>
<body>
	<!-- 네비게이션  -->
	<nav>
		<ul>
			<li><a href="../index.jsp">메인</a></li>
		</ul>
	</nav>
	<h1>회원 탈퇴 페이지입니다.</h1>
	<div>
		<form method="post" action="DeleteAccountAction.jsp" style="text-align: center">
			<h3 style="text-align: center;">회원 탈퇴 화면</h3>
				<div class="loginform-group">
					<input type="text" class="user_id" placeholder="아이디" name="user_id" maxlength="20" value="">
				</div>
				<div class="loginform-group">
					<input type="password" class="user_passwd" placeholder="비밀번호" name="user_passwd" maxlength="20" value="">
				</div><br>
					<input type="submit" class="login" value="회원 탈퇴">
		</form>
	</div>
</body>
</html>
