<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title><style>
	* {margin: 0 auto; background-color: beige;}
	div {width:800px;}
	h2, .cen{text-align:center; }
	.m50 {margin-top:50px;}
	table {margin-top: 30px; width:800px;}
	table th {text-align:center; background-color: lightblue}
	a {text-decoration:none; color:black; cursor:pointer; margin-left: 5px; margin-right: 5px;}
	.gray {background-color: lightgray;}
	.white {background-color: white}
	input {background-color: white}
	button {background-color: lightgray; border: 1px solid black; border-radius: 2px; margin: 3px}
	.textArea {width: 80%; height: 300px; vertical-align: center; background-color: white;}
	.textinfo {width: 330px; outline: none !important; box-shadow: none !important;}
	.footer {text-align: right;}
</style>
<script type="text/javascript">

</script>
</head>
<body>
	<table>
		<tr>
			<th colspan=2>게시글 작성</th>
		</tr>
		<tr>
			<th width="10%">성 명</th>
			<td width="auto"><input type="text"></td>
		</tr>
		<tr>
			<th width="10%">제 목</th>
			<td width="auto"><input style="width: 60%" type="text"></td>
		</tr>
		<tr>
			<th width="10%">내 용</th>
			<td width="auto"><textarea class="textArea" type="text"></textarea></td>
		</tr>
		<tr>
			<th width="10%">비밀번호</th>
			<td width="auto"><input type="password"></td>
		</tr>
	</table>
	<hr>
	<div style="display: flex; justify-content: center">
		<button type="submit">등록</button>
		<button type="reset">다시쓰기</button>
		<button type="button">리스트</button>
	</div>
</body>

</html>