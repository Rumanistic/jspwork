<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, board.*" %>
<jsp:useBean id="bDao" class="board.BoardDAO" />
<%
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String curPage = request.getParameter("curPage");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");

	Board b = bDao.getBoardInfo(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=b.getSubject() %></title>
<style>
	* {margin: 0 auto; background-color: beige;}
	div {width:800px;}
	h2, .cen{text-align:center; }
	.m50 {margin-top:50px;}
	table {margin-top: 30px; width:800px;}
	table th {text-align:center; background-color: lightblue}
	a {text-decoration:none; color:black; cursor:pointer; margin-left: 5px; margin-right: 5px;}
	.gray {background-color: lightgray;}
	.white {background-color: white}
	input {border: none}
	.textArea {height: 300px; vertical-align: center;}
	.textinfo {width: 330px; outline: none !important; box-shadow: none !important;}
	.footer {text-align: right;}
</style>
<script type="text/javascript">
	goList = () => {
		document.listFrm.num.value = <%=num %>;
		document.listFrm.curPage.value = "<%=curPage %>";
		document.listFrm.keyField.value = "<%=keyField %>";
		document.listFrm.keyWord.value = "<%=keyWord %>";
		document.listFrm.action = "list.jsp";
		document.listFrm.submit();
	}
</script>
</head>
<body>
	<table>
		<tr>
			<th colspan=4>글읽기</th>
		</tr>
		<tr>
			<th width="10%" class="gray">이름</th>
			<td width="20%" class="white"><%=b.getName() %></td>
			<th width="10%" class="gray">등록날짜</th>
			<td width="55%" class="white"><%=b.getRegdate() %></td>
		</tr>
		<tr>
			<th width="10%" class="gray">제목</th>
			<td width="auto" colspan=3 class="white"><%=b.getSubject() %></td>
		</tr>
		<tr>
			<td colspan=4 class="textArea"><%=b.getContent() %></td>
		</tr>
		<tr>
			<td colspan=4 class="footer">
			<input class="textinfo" type="text" value="<%=b.getIp() %>로 부터 글을 남기셨습니다. / 조회수 <%=b.getCount() %>" readonly>
			</td>
		</tr>
	</table>
	<hr>
	<div style="display: flex; justify-content: center">
		[&ensp;<a href="javascript:goList()">리스트</a>&ensp;|&ensp;
		<a href="javascript:edit()">수 정</a>&ensp;|&ensp;
		<a href="javascript:reply()">답 변</a>&ensp;|&ensp;
		<a href="javascript:deleteBoard()">삭 제</a>&ensp;]
	</div>
	
	<form name="listFrm">
		<input type="hidden" name="num">
		<input type="hidden" name="curPage" value="<%=curPage %>">
		<input type="hidden" name="keyField" value="<%=keyField %>">
		<input type="hidden" name="keyWord" value="<%=keyWord %>">
	</form>
</body>
</html>