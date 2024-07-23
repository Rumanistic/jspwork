<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="ex02.toBloodType.jsp">
	name: <input name="name"><br>
	blood type: 
		<input type="radio" name="type" value="a" id="a">
		<label for="a">type A</label>
		<input type="radio" name="type" value="b" id="b">
		<label for="b">type B</label>
		<input type="radio" name="type" value="o" id="o">
		<label for="o">type O</label>
		<input type="radio" name="type" value="ab" id="ab">
		<label for="ab">type AB</label>
	<input type="submit">
</form>
</body>
</html>