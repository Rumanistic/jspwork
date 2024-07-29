<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>1. 산술 연산</h3>
	기존 방식:<br>
	&emsp;<%=(int)request.getAttribute("big") + (int)request.getAttribute("small") %><br>
	&emsp;<%=(int)request.getAttribute("big") - (int)request.getAttribute("small") %><br>
	&emsp;<%=(int)request.getAttribute("big") * (int)request.getAttribute("small") %><br>
	&emsp;&#91;<%=(int)request.getAttribute("big") / (double)((int)request.getAttribute("small")) %>&#93;<br>
	&emsp;&#91;<%=(int)request.getAttribute("big") % (int)request.getAttribute("small") %>&#93;<br>
	
	EL 방식
	&emsp;10 + 3 = ${big + small}<br>
	&emsp;10 - 3 = ${big - small}<br>
	&emsp;10 * 3 = ${big * small}<br>
	&emsp;&#91;10 / 3 = ${big / small}&#93; or &#91;10 div 3 = ${big div small}&#93;<br>
	&emsp;&#91;10 % 3 = ${big % small}&#93; or &#91;10 mod 3 = ${big mod small}&#93;<br>
	
	<h3>2. 대소 비교</h3>
	&#91;10 > 3 == ${big > small}&#93; or &#91;10 > 3 == ${big gt small}&#93;<br>
	&#91;10 &lt; 3 == ${big < small}&#93; or &#91;10 &lt; 3 == ${big le small}&#93;<br>
	&#91;10 >= 3 == ${big > small}&#93; or &#91;10 >= 3 == ${big ge small}&#93;<br>
	&#91;10 &lt;= 3 == ${big > small}&#93; or &#91;10 &lt;= 3 == ${big le small}&#93;<br>
	
	<h3>3. 동등 비교 연산</h3>
	<!-- EL에서 == 비교는 자바에서 equals()와 같은 동작을 함 -->
	&#91;sOne == sTwo ? ${sOne == sTwo}&#93; or &#91;sOne == sTwo ? ${sOne eq sTwo}&#93;<br>
	&#91;sOne != sTwo ? ${sOne != sTwo}&#93; or &#91;sOne != sTwo ? ${sOne ne sTwo}&#93;<br>
	sOne == sThree ? ${sOne == sThree}<br>
	
	&#91;big == 10 ? ${big == 10}&#93;<br>
	&#91;sThree == "안녕" ? ${sThree == "안녕"}&#93;<br> 
	
	<h3>4. 객체가 null인지, 리스트가 비어있는지 비교</h3>
	&#91;pTwo == null ? ${pTwo == null}&#93;<br>
	&#91;pOne == null ? ${empty pOne}&#93;<br>
	&#91;pOne != null ? ${not empty pOne}&#93;<br>
	
	&#91;aOne == null ? ${aOne == null}&#93;<br>
	&#91;is aOne empty ? ${empty aOne}&#93;<br>
</body>
</html>