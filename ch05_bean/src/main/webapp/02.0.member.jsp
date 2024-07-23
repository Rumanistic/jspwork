<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="script.js" charset="utf-8" type="text/javascript"></script>
</head>
<body>
	<table border=1 align="center">
		<form method="post" name="regForm" action="02.1.memberProc.jsp">
			<tr>
				<th colspan=3>회원가입</th>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input name="id"></td>
				<td>5글자 이상 영문과 숫자로만</td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="pwd"></td>
				<td>영문, 숫자, 특수문자를 각 1개 이상 사용하여 3글자 이상</td>
			</tr>
			<tr>
				<td>패스워드 확인</td>
				<td><input type="password" name="repwd"></td>
				<td>패스워드 확인을 위해 재입력</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input name="name"></td>
				<td>한글로 2글자 이상 입력</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input name="birthday"></td>
				<td>점(.)으로 구분하여 년(yyyy).월(mm).일(dd) 형태로 작성</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input name="tel"></td>
				<td>숫자로 10글자 이상, 하이픈(-) 없이 입력</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input name="email"></td>
				<td>이메일 주소 입력</td>
			</tr>
			<tr>
				<td colspan=3>
					<input type="button" value="회원가입" onclick="inputCheck();">
					<input type="reset">
				</td>
			</tr>
		</form>
	</table>
</body>
</html>