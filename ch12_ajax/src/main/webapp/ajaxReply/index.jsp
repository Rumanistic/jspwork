<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
	<img alt="" src="../resources/img/board.png">
	<table>
		<thead>
			<tr>
				<th>댓글 작성</th>
				<td>
					<textarea rows="3" cols="50"></textarea>
				</td>
				<td><button id="btn1">등록</button></td>
			</tr>
		</thead>
		<tbody id="replyView">
		
		</tbody>
	</table>
	
	<script type="text/javascript">
		$(() => {
			selectReplyList();
		});
		
		const selectReplyList = () => {
			$.ajax({
				url: "boardReply.do",
				data: {ref: 1},
				success: (result) => {
					console.log(result)
					let str = "";
					$.each(result, (index, r) => {
						str +="<tr>" 
						+ "<th>"+r.name+"</th>"
						+ "<td>"+r.content+"</td>"
						+ "<td>"+r.redate+"</td>"
						+ "</tr>";
					})
					$("#replyView").html(str);
				},
				error: () => {
					
				}
			})
		}
	</script>
</body>
</html>