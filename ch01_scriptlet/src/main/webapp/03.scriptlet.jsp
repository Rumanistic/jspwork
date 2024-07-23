<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 스크립트릿 : 지역변수 선언, 반복문, 조건문 등
		[사용법]
		<%
			프로그램
		%> 
	--%>
	<%
		String name = "이고잉";
		int num = 1;
		boolean bool = true;
		double dNum = 3.14;
	%>
	나의 이름은 <%=name %>이고,<br>
	<%=num %>회차 수업중입니다.<br>
	지금 수업에 참여중입니까? <%=bool %><br>
	원주율은 <%=dNum %>입니다.<br>
	
	<% 
		/* for(int i = 1; i <= 10; i++){
			out.print(i);
		} */
		if(true)
			num = 10;
	%>
	<%=num%>으로 변경됨
</body>
</html>