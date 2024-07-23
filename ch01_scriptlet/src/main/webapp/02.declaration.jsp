<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	나의 이름은 <%=name %>이고 나이는 <%=age %>입니다.<br>
	<%!
		String name = "홍길동";		// 전역변수
		int age = 23;
	%>
	<% String name2 = "홍길동";%>		<!-- 지역변수 -->
	나의 이름은 <%=name2 %>입니다.
	<br><br>
	
	<!-- 메소드 선언은 반드시 선언문에서만 가능 -->
	
	<%!
		int one;
		int two = 1;
		
		public int plus(int one, int two){
			return one + two;
		}
	%>
	one 과 two 의 합은 ? <%=plus(3, 5) %>
</body>
</html>