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
<style>

.card {
  width: 50rem; 
  margin-left: auto;
  margin-right: auto;
  margin-bottom : 20px;
}

.button2 {
  margin-left: auto;
  margin-right: auto;
}

.card-header {
	background-color: #cfffda;
}

</style>
<title>Insert title here</title>
</head>
<body>
  <u:navbar/>


<div class="card" >
  <div class="card-header"><b>제목</b></div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item"><c:out value="${article.title }"></c:out></li>
  </ul>
</div>

<div class="card" >
  <ul class="list-group list-group-flush">
    <li class="list-group-item"><b>No.</b> ${article.number } / <b>작성자 </b> ${article.writer.name } / <b>아이디 </b> ${article.writer.id }</li>
  </ul>
</div>

<div class="card" >
  <div class="card-header"><b>내용</b></div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item"><u:pre value="${article.content }" /></li>
  </ul>
</div>


<div class = "button2 text-center">
<c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo }" />
	<a href="list.do?pageNo=${pageNo}&cat=${article.category}" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">목록</a>

<c:if test="${(not empty authUser) and (authUser.id eq article.writer.id)}">
	<a href="modify.do?no=${article.number }" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">게시글수정</a>
	<a href="delete.do?no=${article.number }" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">게시글삭제</a>
</c:if>
</div>

 
</body>
</html>







