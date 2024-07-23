<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, ch09.*" %>
<jsp:useBean id="vDao" class="ch09.VoteDao" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	* {margin: 0 auto;}
	div {width:800px;}
	h2, h5{text-align:center; }
	.m50 {margin-top:50px;}
	.m30 {margin-top:30px;}
	table {margin-top: 30px; width:800px;}
	table th {text-align:center;}
	a {text-decoration:none; color:black; cursor:pointer;}
</style>
</head>
<body>
	<div>
		<h2 class="m50">투표 프로그램</h2>
		<hr>
		<jsp:include page="voteForm.jsp" />
		<hr>
		
		<h5 class="m30">설문리스트</h5>
		<table class="table">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>시작일~종료일</th>
			</tr>
		<%
			ArrayList<VoteList> aList = vDao.getList();
		
			for(int i = 0; i < aList.size(); i++){
				VoteList vl = aList.get(i);
				String sdate = vl.getSdate().substring(0,10);
				String edate = vl.getEdate().substring(0,10);
		%>
			<tr>
				<td><%=vl.getNum() %></td>
				<td><a href="voteList.jsp?num=<%=vl.getNum()%>"><%=vl.getQuestion() %></a></td>
				<td><%=sdate %> ~ <%=edate %></td>
			</tr>
		<%
			}
		%>
			<tr>
				<td colspan="3" align="right"><a href="voteInsert.jsp">설문 작성하기</a><td>
			</tr>
		</table>
	</div>
</body>
</html>