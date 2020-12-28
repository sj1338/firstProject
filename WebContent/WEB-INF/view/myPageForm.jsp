<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<style>


.info {
	margin-right: 300px;
	margin-left: 300px;
    padding: 100px;

	font-size:30px;
}
</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
  <u:navbar />
	  <ul class = info>
	  	<li class="list-group-item">아이디 : ${authUser.id}</li>
    	<li class="list-group-item">비밀번호 : ${authUser.name} </li>
    	<li class="list-group-item">가입 날짜 : ${authUser.regdate}</li>
	  </ul>
 <div class = text-center>
   <a href="${root}/changePwd.do" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">비밀번호 변경</a>
   <a href="${root}/removeMember.do" class="btn btn-success btn-lg active" role="button" aria-pressed="true" >회원 탈퇴</a>
   </div>
</body>
</html>