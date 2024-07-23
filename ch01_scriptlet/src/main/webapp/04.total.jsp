<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		float f = 5.34f;
		int num = Math.round(f);
		java.util.Date date = new java.util.Date();
		int hour = date.getHours();
	%>
	<%!
		public int op(int i, int j){
			return i > j ? i : j;
		}
	%>
	실수 출력 : <%=f %><br>
	실수 반올림 출력 : <%=num %><br>
	날짜와 시간 출력 : <%=date %><br>
	시간 출력 : <%=hour %><br>
	오전 오후 ? : <%=hour < 12 ? "오전" : "오후" %><br>
	두 수중 큰 수는 : <%=op(37, 56) %>
</body>
</html>