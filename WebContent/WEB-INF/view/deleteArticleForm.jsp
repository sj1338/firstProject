	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<u:navbar />


	<div class="container">
			<h1>게시물 삭제</h1>
			<form action="delete.do" method="post">
				<input type="text" name="no" id="" value="${param.no }" hidden />
		<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">암호</span>
				</div>
				<input type="password" name="password" class="form-control"
					placeholder="Username" aria-label="Username"
					aria-describedby="basic-addon1"> <br />
		</div>
				<input class="btn btn-primary" type="submit" value="삭제">
				<c:if test="${errors.invalidePassword }">암호가 일치하지 않습니다.</c:if>
			</form>
	</div>


	<c:if test="${success }">
		<div class="modal" tabindex="-1" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">삭제 성공</h5>
					</div>
					<div class="modal-body">
						<p>글이 삭제되었습니다.</p>
					</div>
					<div class="modal-footer">
						<a href="${root }/index.do" class="btn btn-primary">홈으로 가기</a>
					</div>
				</div>
			</div>
		</div>

		<script>
			$('#myModal').modal({
				backdrop : 'static',
				keyboard : false
			});
		</script>
	</c:if>
</body>
</html>







