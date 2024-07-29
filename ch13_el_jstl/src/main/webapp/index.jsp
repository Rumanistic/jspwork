<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>* EL(Expression Language)</h1>
	<p>
		기존에 사용했던 표현식(출력문) &lt;%=변수명 %><br>
		jsp상에서 표현하고자 하는 값을 \${변수명}의 형식으로 표현하여 작성하는 것
	</p>
	
	<h3><a href="el.do">01_EL 구문</a></h3>
	<!-- 
		1. src package: com.tjoeun.controller
						com.tjoeun.vo
		2. vo > Person.java
		3. com.tjoeun.controller / ElServlet 생성: /el.do, doGet();
		4. views/01_EL/01_el.jsp 생성
	 -->
	 
	 <h3><a href="operation.do">02_EL의 연산자</a></h3>
	 <!-- 
	 	1. com.tjoeun.controller / OperationServlet 생성: /operation.do, doGet();
		2. views/01_EL/02_operation.jsp 생성
	  -->
	  
	 <hr>
	 <h1>JSTL</h1>
	 <h3><a href="02_customAction/jstl.jsp">02_EL의 연산자</a></h3>
</body>
</html>