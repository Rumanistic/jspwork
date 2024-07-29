<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL Core Library</h1>
	
	<h3>1. 변수(속성==attribute)</h3>
	<pre>
		* 변수 선언과 동시에 초기화 (c:set var="" value="" [scope=""])
			- 변수를 선언하고, 초기값을 대입해주는 기능을 제공
			- 해당 변수를 어떤 scope에 담아둘건지 지정 가능(생략 시 pageScope 디폴트)
				=> 해당 scope에 setAttribute를 통해 key-value 형태로 데이터를 담아 놓는것
				=> c:set으로 선언된 변수는 EL로만 접근 가능
			- 변수 타입을 별도로 지정하지 않음
			- 초기값은 반드시 지정해야 함
	</pre>
	
	<c:set var="num1" value="10" />
	<c:set var="num2" value="20" scope="request" />
	
	num1 변수값 = ${num1}<br>
	num2 변수값 = ${num2}<br>
	
	<c:set var="result" value="${num1+num2}" />
	
	result 변수값 = ${result}<br><br>
	
	<c:set var="result" scope="request">
		77777
	</c:set>
	
	requestScope.result: ${requestScope.result}<br><br>
	
	<hr>
	
	<h3>2. 변수 삭제</h3>
	<pre>
		* 변수 삭제: (c:remove var="varname" [scope=""])
			- 해당 scope영역에서 지정한 변수를 찾아서 제거하는 태그
			- scope 지정하지 않을 경우 모든 scope 범위에서 지정 변수를 전부 제거
	</pre>
	
	<c:remove var="result" />
	
	result = ${result}
</body>
</html>