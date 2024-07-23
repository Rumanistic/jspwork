<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch09.*, java.util.*" %>
<jsp:useBean id="vDao" class="ch09.VoteDao" />
<% 
	int num = 0;
/* 	VoteList vl = null;
	ArrayList<String> vItem = null; */
	System.out.println(request.getParameter("num"));
	if(!(request.getParameter("num") == null || request.getParameter("num").equals("")))
		num = Integer.parseInt(request.getParameter("num"));
	/* System.out.println(num); */
	VoteList vl = vDao.getOneVote(num);
	ArrayList<String> vItem = vDao.getVoteItem(num);
	/* System.out.println(vl.getQuestion()); */
	String question = vl.getQuestion();
	
	int type = vl.getType();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	* {margin: 0 auto;}
	.voteFrom {width:400px;}
	h2, h5{text-align:center; }
	.m50 {margin-top:50px;}
	table {margin-top: 30px;}
</style>
</head>
<body>
	<div class="voteFrom">
		<h5 class="m50">설문폼</h5>
		
		<form action="voteFormProc.jsp" method="post">
			<table class="table">
				<tr>
					<td>Q : <%=vl.getQuestion() %></td>
				</tr>
				<tr>
					<td style="padding-left:30px;">
					<%
					for(int i=0; i<vItem.size(); i++) {
						String itemList = vItem.get(i);
						if(type == 1) {
							out.print("<p><input type='checkbox' name='itemnum' value='" + i + "'>");
						} else {
							out.print("<p><input type='radio' name='itemnum' value='" + i + "'>");
						}
						out.print(itemList + "<p/>");
					}
					%>
					</td>
				</tr>
				<tr>
					<td align="center">
						<input type="submit" value=" 투 표 ">&emsp;&emsp;
						<input type="button" value=" 결 과 " onclick="window.open('voteView.jsp?num=<%=num %>', 'voteView', 'width=700, height=400')">
					</td>
				</tr>
			</table>
			<input type="hidden" name="num" value="<%=num %>">
		</form>
	</div>
</body>
</html>