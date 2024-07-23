<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문 작성</title>
<style>
body {
	background-color: beige;
}

h*{
	text-align: center; 
	line-height: 200%;
}

h1{
	font-size: xxx-large;
}

h2{
	font-size: xx-large;
}

h3{
	font-size: x-large;
}

hr {
	border: 0; 
	height: 5px; 
	background-color: gray
}

form {
	display: flex;
	justify-content: space-around;
}

table {
	width: 70%;
	border: 1px solid black;
}

th,td {
	border: 1px solid black;
}

.btn {
	margin-left: 10px;
	margin-right: 10px;
}
</style>
</head>
<body style="width: auto; padding-left: 5%; padding-right: 5%;">
	<h1>투표프로그램</h1>
	<hr>
	<h2>설문 작성</h2>
	<hr>
	<form action="voteInsertProc.jsp" name="frm" method="post">
		<table>
			<tr>
				<th>질문</th>
			 	<td colspan=2>Q. <input name="question"></td>
			</tr>
			<tr>
				<th rowspan=8>항목</th>
			<%
				for(int i = 1; i <= 4; i++){
					out.print("<td>" + (i*2 - 1) + ": <input name='item'></td>");
					out.print("<td>" + (i*2) + ": <input name='item'></td>");
					out.print("</tr>");
					if(i != 4)
						out.print("<tr>");
				}
			%>
			<tr>
				<td>시작일</td>
				<td>
					<label>
						<select name="syear">
							<%
								for(int i = 2024; i <= 2099; i++){
							%>
    						<option value='<%=i %>'><%=i %></option>
							<%
								}
							%>
						</select>
						년&emsp;
					</label>
					<label>
						<select name="smonth">
							<%
								for(int i = 1; i <= 12; i++){
									if(i < 10) {
							%>
    						<option value='0<%=i %>'>0<%=i %></option>
							<%
									}
									else {
							%>
							<option value='<%=i %>'><%=i %></option>
							<%
									}
								}
							%>						
						</select>
						월&emsp;
					</label>
					<label>
						<select name="sday">
							<%
								for(int i = 1; i <= 31; i++){
									if(i < 10) {
							%>
    						<option value='0<%=i %>'>0<%=i %></option>
							<%
									}
									else {
							%>
							<option value='<%=i %>'><%=i %></option>
							<%
									}
								}
							%>						
						</select>
						일
					</label>
				</td>
			</tr>
			<tr>
				<td>종료일</td>
				<td>
					<label>
						<select name="eyear">
							<%
								for(int i = 2024; i <= 2099; i++){
							%>
    						<option value='<%=i %>'><%=i %></option>
							<%
								}
							%>
						</select>
						년&emsp;
					</label>
					<label>
						<select name="emonth">
							<%
								for(int i = 1; i <= 12; i++){
									if(i < 10) {
							%>
    						<option value='0<%=i %>'>0<%=i %></option>
							<%
									}
									else {
							%>
							<option value='<%=i %>'><%=i %></option>
							<%
									}
								}
							%>						
						</select>
						월&emsp;
					</label>
					<label>
						<select name="eday">
							<%
								for(int i = 1; i <= 31; i++){
									if(i < 10) {
							%>
    						<option value='0<%=i %>'>0<%=i %></option>
							<%
									}
									else {
							%>
							<option value='<%=i %>'><%=i %></option>
							<%
									}
								}
							%>						
						</select>
						일
					</label>
				</td>
			</tr>
			<tr>
				<td>이중답변</td>
				<td>
					<input type="radio" name="type" value="1" checked>yes&emsp;
					<input type="radio" name="type" value="0">no
				</td>
			</tr>
			<tr>
				<td colspan=2>
					<span style="display: flex; justify-content: center;">
						<input class="btn" type="submit" value="작성하기" onclick="console.log(document.frm)">
						<input class="btn" type="reset" value="초기화">
						<input class="btn" type="button" value="리스트보기">
					</span>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>