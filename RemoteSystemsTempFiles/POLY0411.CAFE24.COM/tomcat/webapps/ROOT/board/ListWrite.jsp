<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
<style type="text/css">
	a, a:hover { 
		text-decoration: none;
	}
</style>
</head>
<body>
    <nav class ="navbar navbar-default">
        <div class="navbar-header">
            <a class ="navbar-brand" href="../index.jsp">Home</a>
            <a class ="navbar-brand" href="ListView.jsp">게시판</a>
        </div>
    </nav>
    <div class="container">
        <div class="row">
        	<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
                <thead>
                    <tr>
                        <th colspan="2" style="background-color:#eeeeee; text-align:center;">게시판 글쓰기</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                    	<td><input type="text" class="form-contorl" placeholder="글 제목" name="title" maxlength="50"></td>
                    </tr>
                    <tr>
                    	<td><textarea class="form-contorl" placeholder="글 내용" name="content" maxlength="5000" style="height: 350px"></textarea></td>
                    </tr>
                </tbody>
            </table>
            <div style="text-align: right;">
            <input type="submit" class="btn btn-primary pull-right" onClick="location.href='ListView.jsp'" value="글쓰기">
            </div>
        </div>
    </div>
                <!-- 첨부파일 -->
            <form method="post" action="${contextPath}/board/writeSave" enctype="multipart/form-data">
				<div class="form-group" style="height: 150px; width: 200px;">
					<label>이미지 파일 첨부</label> 
		            <input type="file" name="imgFile" onchange="readURL(this);"/>
				</div>
			</form>
</body>
</html>