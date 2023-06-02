<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>회원 정보 수정 페이지</title>
</head>
<body>
	<!-- 네비게이션  -->
	<nav>
		<ul>
			<li><a href="../index.jsp">메인</a></li>
		</ul>
	</nav>
	<h1>회원 정보 수정 페이지입니다.</h1>
	<div>
		<form method="post" action="UserEditAction.jsp" style="text-align: center">
			<h3 style="text-align: center;">회원 정보 수정 화면</h3>
				<div class="loginform-group">
					<input type="password" class="user_passwd" placeholder="비밀번호" name="user_passwd" maxlength="20" value="">
				</div>
				<div class="loginform-group">
					<input type="text" class="user_name" placeholder="이름" name="user_name" maxlength="20" value="">
				</div>
				<div class="loginform-group">
					<label>생일 : </label><input type="date" class="user_birth" name="user_birth" maxlength="20" value="">
				</div>
				<div class="loginform-group">
					<label>
						<input type="radio" name="user_gender" autocomplete="off" value="남자" checked>남자
					</label>
					<label>
						<input type="radio" name="user_gender" autocomplete="off" value="여자" checked>여자
					</label>
				</div>
				<div class="loginform-group">
					<label>페이스북 : </label><input type="text" class="user_sns_facebook"  name="user_sns_facebook" maxlength="20" value="">
				</div>
				<div class="loginform-group">
					<label>트위터 : </label><input type="text" class="user_sns_twitter"  name="user_sns_twitter" maxlength="20" value="">
				</div>
				<div class="loginform-group">
					<label>인스타그램 : </label><input type="text" class="user_sns_instargram"  name="user_sns_instargram" maxlength="20" value="">
				</div><br>
					<input type="submit" class="login" value="정보 수정">
		</form>	
	</div>
</body>
</html>