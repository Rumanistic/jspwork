<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, board.*" %>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String curPage = request.getParameter("curPage");
	Board b = (Board)session.getAttribute("bean");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title><style>
	* {margin: 0 auto; background-color: beige;}
	div {width:800px;}
	h2, .cen{text-align:center; }
	.m50 {margin-top:50px;}
	table {margin-top: 30px; width:800px;}
	table th {text-align:center; background-color: lightblue}
	a {text-decoration:none; color:black; cursor:pointer; margin-left: 5px; margin-right: 5px;}
	.gray {background-color: lightgray;}
	.white {background-color: white}
	input {background-color: white}
	button {background-color: lightgray; border: 1px solid black; border-radius: 2px; margin: 3px}
	.textArea {width: 80%; height: 300px; vertical-align: center; background-color: white;}
	.textinfo {width: 330px; outline: none !important; box-shadow: none !important;}
	.footer {text-align: right;}
</style>
<script type="text/javascript">

</script>
</head>
<body>
	<form action="boardUpdate" method="post">
		<table>
			<tr>
				<th colspan=2>게시글 수정</th>
			</tr>
			<tr>
				<th width="10%">성 명</th>
				<td width="auto"><input name="name" value="<%=b.getName() %>"></td>
			</tr>
			<tr>
				<th width="10%">제 목</th>
				<td width="auto"><input style="width: 60%" name="subject" value="<%=b.getSubject() %>"></td>
			</tr>
			<tr>
				<th width="10%">내 용</th>
				<td width="auto"><textarea class="textArea" name="content"><%=b.getContent() %></textarea></td>
			</tr>
			<tr>
				<th width="10%">비밀번호</th>
				<td width="auto"><input type="password" name="pass" required></td>
			</tr>
		</table>
		<hr>
		<div style="display: flex; justify-content: center">
			<button type="submit">수정완료</button>
			<button type="reset">다시수정</button>
			<button type="button" onclick="history.go(-1)">뒤로</button>
		</div>
		<input type="hidden" name="num" value="<%=num %>">
	</form>
</body>

</html>