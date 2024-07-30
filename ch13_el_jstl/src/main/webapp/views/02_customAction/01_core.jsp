<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, com.tjoeun.vo.*" %>
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
	
	
	<hr>
	
	<pre>
		* 변수(데이터) 출력: 
			(c:out value="wantToPrintValue" [default="defaultValue"] [escapeXml="true|false"])
	</pre>
	<c:out value="${num1 }" /><br>
	<c:out value="${abcd }" default="없음" /><br>
	
	<c:set var="outTest" value="<b>출력테스트</b>" />
	<c:out value="${outTest }"></c:out><br>
	<c:out value="${outTest }" escapeXml="false"></c:out><br>
	
	
	<hr>
	
	<h3>2. 조건문 - if</h3>
	<pre>
		자바의 if문과 비슷한 역할
			- 조건식은 test 속성에 작성(단, EL구문으로 기술해야 함)
	</pre>
	
	<c:if test="${num1 < num2}">
		<b>num1이 num2보다 작다</b>
	</c:if>
	<c:if test="${num1 >= num2}">
		<b>num1이 num2보다 크거나 같다</b><br>
	</c:if>
	
	<c:set var="str" value="안녕하세요" />
	<c:if test="${str == '안녕하세요'}"><br>
		<b>Hello</b>
	</c:if>
	
	<hr>
	
	<h3>3. choose</h3>
	<pre>
		* (c:choose, c:when, c:otherwise)
			- choose: 조건들의 리스트
			- when: 조건의 if절 or else-if절
			- otherwise: 조건의 else절
	</pre>
	
	<c:choose>
		<c:when test="${num1 < num2}">
			<b>num1이 num2보다 작다</b>
		</c:when>
		<c:when test="${num1 < num2}">
			<b>num1이 num2보다 작다</b>
		</c:when>
		<c:otherwise>
			<b>num1은 num2와 같다</b>
		</c:otherwise>
	</c:choose>
	
	<hr>
	
	<h3>4. 반복문</h3>
	<pre>
		* for-loop: (c:forEach var="varName" begin="beginValue" end="endValue" [step="[in/de]crease value; default 1"])
		* 향상된 for-loop: (c:forEach var="varName" items="itemList or Objects" [varStatus="현재 접근한 요소의 상태값을 저장할 변수"])
	</pre>
	
	<c:forEach var="i" begin="1" end="10" step="2">
		<br>반복확인: ${i}<br>
	</c:forEach>
	
	<c:forEach var="i" begin="1" end="6">
		<h${i}>태그도 적용가능: h${i}</h${i}>
	</c:forEach>
	
	
	<c:set var="colors">
		red,yellow,green,pink
	</c:set>
	
	<ul>
		<c:forEach var="c" items="${colors}">
			<li style="background-color: ${c}">${c}</li>
		</c:forEach>
	</ul>
	
	<%
		ArrayList<Person> list = new ArrayList<>();
 		list.add(new Person("이고잉", 30, "여자"));
		list.add(new Person("박대기", 40, "남자"));
		list.add(new Person("이따금", 46, "남자")); 
	%>
	
	<c:set var="pList" value="<%=list %>" scope="request" />
	
	<table border="1">
		<tr>
			<th>index</th>
			<th>No.</th>
			<th>이름</th>
			<th>나이</th>
			<th>성별</th>
		</tr>
		<c:choose>
			<c:when test="${pList.size() > 0}">
				<%-- <c:forEach var="p" items="${pList}">
				<tr>
					<td>${p.getName()}</td>
					<td>${p.getAge()}</td>
					<td>${p.getGender()}</td>
				</tr>
				</c:forEach> --%>
				<c:forEach var="p" items="${pList}" varStatus="pStatus">
				<tr>
					<td>${pStatus.index}</td>	<!-- 0부터 시작 -->
					<td>${pStatus.count}</td>	<!-- 1부터 시작 -->
					<td>${p.getName()}</td>
					<td>${p.getAge()}</td>
					<td>${p.getGender()}</td>
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan='3'>
						<b>저장된 사용자가 없습니다.</b>
					</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	
	
	<hr>
	
	<h3>5. 반복문 : forTokens</h3>
	<pre>
		* (c:forTokens var="varName" items="wantToSplitString" delims="delimeterToken")
			- 구분자(delims)를 통해서 분리된 각각의 문자열을 순차적으로 접근하면서 반복 수행
			- split 혹은 StringTokenizer와 비슷한 기능
	</pre>
	
	<c:set var="device" value="컴퓨터,핸드폰,TV,에어컨/냉장고.세탁기" />
	<ol>
		<c:forTokens var="d" items="${device}" delims=",./">
			<li>${d}</li>
		</c:forTokens>
	</ol>
	
	<hr>
	
	<h3>6. url, queryString</h3>
	<pre>
		* url 경로를 생성하고, queryString 정의할 수 있는 태그
			&lt;c:url var="varName" value="requestUrl">
				&lt;c:param name="key" value="value" />
				&lt;c:param name="key" value="value" />
			&lt;/c:url>
	</pre>
	
	
	
	
	
</body>
</html>