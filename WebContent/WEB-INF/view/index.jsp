<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

<title>메인 페이지</title>

<style>
.card.mh-100 {
	height: 254px;
}
</style>
</head>
<body>
	<u:navbar/> 
<div class="container my-container">

<div class="row row-cols-1 row-cols-md-2">
  <div class="col mb-4">  
    <div class="card h-100">
	  <a href="${root }/article/list.do?cat=art" class="list-group-item list-group-item-primary title" >예술</a>
	  <c:forEach items="${articleList.art }" var="article">
	  	<a href="${root }/article/read.do?no=${article.number}" class="list-group-item list-group-item-action">${article.title }</a>
	  </c:forEach>
    </div>
  </div>
  <div class="col mb-4">
    <div class="card mh-100">
	  <a href="${root }/article/list.do?cat=cook" class="list-group-item list-group-item-secondary title" >요리</a>
	  <c:forEach items="${articleList.cook }" var="article">
	  	<a href="${root }/article/read.do?no=${article.number}" class="list-group-item list-group-item-action">${article.title }</a>
	  </c:forEach>	
    </div>
  </div>
  <div class="col mb-4">
    <div class="card mh-100">
	  <a href="${root }/article/list.do?cat=game" class="list-group-item list-group-item-success title">게임</a>
	  <c:forEach items="${articleList.game }" var="article">
	  	<a href="${root }/article/read.do?no=${article.number}" class="list-group-item list-group-item-action">${article.title }</a>
	  </c:forEach>	
    </div>
  </div>
  <div class="col mb-4">
    <div class="card mh-100">
	  <a href="${root }/article/list.do?cat=music" class="list-group-item list-group-item-danger title">음악</a>
	  <c:forEach items="${articleList.music }" var="article">
	  	<a href="${root }/article/read.do?no=${article.number}" class="list-group-item list-group-item-action">${article.title }</a>
	  </c:forEach>	
    </div>
  </div>
  <div class="col mb-4">
    <div class="card mh-100">
	  <a href="${root }/article/list.do?cat=sport" class="list-group-item list-group-item-warning title">스포츠</a>
	  <c:forEach items="${articleList.sport }" var="article">
	  	<a href="${root }/article/read.do?no=${article.number}" class="list-group-item list-group-item-action">${article.title }</a>
	  </c:forEach>	
    </div>
  </div>
  <div class="col mb-4">
    <div class="card mh-100">
	  <a href="${root }/article/list.do?cat=tour" class="list-group-item list-group-item-dark title">여행</a>
	  <c:forEach items="${articleList.tour }" var="article">
	  	<a href="${root }/article/read.do?no=${article.number}" class="list-group-item list-group-item-action">${article.title }</a>
	  </c:forEach>		
    </div>
  </div>
</div>
</div>
</body>
</html>