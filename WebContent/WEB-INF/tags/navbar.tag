<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>

<div class="container">
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
  <a class="navbar-brand" href="${root }/index.jsp"><b>FirstProject.com</b></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          카테고리
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="${root }/cook.do">요리</a>
          <a class="dropdown-item" href="${root }/game.do">게임</a>
          <a class="dropdown-item" href="${root }/music.do">음악</a>
          <a class="dropdown-item" href="${root }/sport.do">스포츠</a>
          <a class="dropdown-item" href="${root }/tour.do">관광</a>
          <a class="dropdown-item" href="${root }/art.do">예술</a>
        </div>
      </li>
      </ul>
      
     <form class="form-inline my-2 my-lg-0 mx-auto" >
      <input class="form-control mr-sm-2" type="search" placeholder="제목 검색" aria-label="Search">
      <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Search</button>
    </form>
    
    <u:notLogin>
        <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="${root }/login.do">로그인</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${root }/join.do">회원가입</a>
      </li>
    </ul>
    </u:notLogin>
    
    <u:isLogin>
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="${root }/logout.do">로그아웃</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${root }/myPage.do">마이페이지</a>
      </li>
    </ul>
    </u:isLogin>
    
  </div>
</nav>
</div>