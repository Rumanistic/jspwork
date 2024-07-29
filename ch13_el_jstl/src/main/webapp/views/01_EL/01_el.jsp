<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tjoeun.vo.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>1. 기존 방식대로 스크립트릿과 표현식을 이용하여 각 scope에 담겨있는 값을 화면에 출력</h3>
	<%
		String classRoom = (String)request.getAttribute("classRoom");
		Person student = (Person)request.getAttribute("student");
		
		String academy = (String)session.getAttribute("academy");
		Person teacher = (Person)session.getAttribute("teacher");
	%>
	<p>
		학원명: <%=academy %><br>
		강의실: <%=classRoom %><br>
		강사: <%=teacher.getName() %>, <%=teacher.getAge() %>, <%=teacher.getGender() %>
		
		수강생 정보:<br>
		<ul>
			<li>이름: <%=student.getName() %></li>
			<li>나이: <%=student.getAge() %></li>
			<li>성별: <%=student.getGender() %></li>
		</ul>
	</p>
	
	<h3>2. EL 방식을 이용하여 각 scope에 담겨있는 값을 화면에 출력</h3>
	<p>
		학원명: ${academy}<br>
		강의실: ${classRoom}<br>
		강사: ${teacher.name}, ${teacher.age}, ${teacher.gender}
		
		수강생 정보:<br>
		<ul>
			<li>이름: ${student.name}</li>
			<li>나이: ${student.age}</li>
			<li>성별: ${student.gender}</li>
		</ul>
	</p>
	
	<h3>3. EL 사용 시 내장 객체들의 저장된 키 값이 동일한 경우</h3>
	SCOPE.Value: ${scope}<br>
	SESSION.Value: ${session.scope}<br>
	 *** 데이터가 안들어왔다면 모든 영역에서 키를 찾지 못한 것 ***<br>
	 
	<h3>4. 직접 scope를 지정하여 접근하기</h3>
	<%
		pageContext.setAttribute("scope", "page");
	%>
	page SCOPE.Value: ${scope} or ${pageScope.scope}<br>
	request SCOPE.Value: ${requestScope.scope}<br>
	session SCOPE.Value: ${sessionScope.scope}<br>
	application SCOPE.Value: ${applicationScope.scope}<br>
</body>
</html>