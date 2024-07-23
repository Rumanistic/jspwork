<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="test" class="ch05.BeanTest1" />							<!-- 클래스의 별칭을 id로 지정 -->
<jsp:setProperty name="test" property="name" value="자바빈 사용: 홍길동" />		<!-- 지정한 별칭을 사용, setName("자바빈 사용: 홍길동") 메서드를 호출한것과 같음 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	자바빈의 name 값 : <jsp:getProperty property="name" name="test" />			<!-- getName() 메서드를 호출한것과 같음 -->
</body>
</html>