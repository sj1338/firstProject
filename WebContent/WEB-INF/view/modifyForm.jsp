<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>

.card {
  width: 50rem; 
  margin-left: auto;
  margin-right: auto;
  margin-bottom : 20px;
}

.form-group {
  width: 10rem; 
  margin-left : 155px;
  margin-bottom : 20px;
  text-align: left;
}

.button2 {
  margin-left: auto;
  margin-right: auto;
}

.card-header {
	background-color: #cfffda;
}


</style>
</head>

<body>
  <u:navbar />
  
<div class="container">
 <form action="modify.do" method="post">
 <p style="font-size: 30px">번호 : ${modReq.articleNumber}</p>
<div class="card" >
  <div class="card-header"><b>제목</b></div>
  <input type="text" name="title" value="${modReq.title }" />
    <c:if test="${errors.title }">제목을 입력하세요.</c:if>
</div>

<div class="card" >
  <div class="card-header"><b>내용</b></div>
  <textarea name="content" id="" cols="30" rows="5">${modReq.content }</textarea>
</div>
<div class="button2 text-center">
<button type="submit" class="btn btn-primary">글 수정</button>
<c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo }" />
	<a href="${root }/article/list.do?cat=${param.cat}" class="btn btn-primary" role="button" aria-pressed="true">목록</a>
	</div>
  </form>
</div>


</body>
</html>


