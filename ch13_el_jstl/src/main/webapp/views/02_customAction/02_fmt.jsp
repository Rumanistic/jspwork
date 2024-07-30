<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, com.tjoeun.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL Format Library</h1>
	
	<h2>1. formatNumber</h2>
	<p>
		숫자 데이터의 포맷(형식) 지정<br>
		- 표현하고자 하는 숫자 데이터의 형식을 통화기호, % 등 원하는 쓰임에 맞게 형식을 지정하는 태그
		(fmt:formatNumber value="printValue" [groupingUsed="true|false" type="percent|currency" currencySymbol="currencySymbol"])
	</p>
	
	<c:set var="num1" value="123456789" />
	<c:set var="num2" value="0.75" />
	<c:set var="num3" value="50000" />
	
	출력: ${num1}<br>
	세자리마다 구분해서 출력: <fmt:formatNumber value="${num1}" groupingUsed="true"/><br>
	percent: <fmt:formatNumber value="${num2}" type="percent"/><br>
	currency: <fmt:formatNumber value="${num3}"  type="currency" groupingUsed="false"/><br>
	currency: <fmt:formatNumber value="${num3}"  type="currency" currencySymbol="$" groupingUsed="false"/><br>
	
	<hr>
	
	<h2>2. formatDate</h2>
	<p>날짜와 시간 데이터의 포맷 지정(java.util.Date 객체 사용)</p>
	
	<c:set var="curDate" value="<%=new java.util.Date() %>" />
	그냥 출력: ${curDate}<br>
	
	<ul>
		<li>현재 날짜: <fmt:formatDate value="${curDate}" /></li>
		<li>현재 시간: <fmt:formatDate value="${curDate}" type="time"/></li>
		<li>날짜와 시간: <fmt:formatDate value="${curDate}" type="both"/></li>
		<li>Short: <fmt:formatDate value="${curDate}" type="both" dateStyle="short" timeStyle="short"/></li>
		<li>Medium: <fmt:formatDate value="${curDate}" type="both" dateStyle="medium" timeStyle="medium"/></li>
		<li>Long: <fmt:formatDate value="${curDate}" type="both" dateStyle="long" timeStyle="long"/></li>
		<li>Full: <fmt:formatDate value="${curDate}" type="both" dateStyle="full" timeStyle="full"/></li>
		<li>myPattern: <fmt:formatDate value="${curDate}" type="both" pattern="yyyy-MM-dd(E) HH:mm:ss(a)"/></li>
	</ul>
</body>
</html>