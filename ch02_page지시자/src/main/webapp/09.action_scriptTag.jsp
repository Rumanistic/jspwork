<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scriptTag</title>
</head>
<body>
	<%-- <%! 선언문 (멤버변수, 메서드) %> --%>
	<jsp:declaration>
		public int min(int x, int y){
			return x > y ? y : x;
		}
	</jsp:declaration>
	
	<%-- <% 스크립트릿 (지역변수, for, if...) %> --%>
	<jsp:scriptlet>
		int numA = 1;
		int numB = 3;
	</jsp:scriptlet>
	
	<%-- <%= 표현식 (변수나 메서드 호출하여 출력) %> --%>
	<jsp:expression>
		min(numA, numB)	
	</jsp:expression>
</body>
</html>