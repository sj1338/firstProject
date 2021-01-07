<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<select class="form-control" id="exampleFormControlSelect1" name="category" >
  <%-- <option value="${param.cat }" style="font-weight : bold" selected readonly >${categoryMap[param.cat] }</option> --%>
  <option value="art" 
  <c:if test="${param.cat eq 'art' }">
   selected
  </c:if>
  >예술</option>
  
  <option value="cook" 
  <c:if test="${param.cat eq 'cook' }">
   selected
  </c:if>
  >요리</option>
  <option value="game" 
  <c:if test="${param.cat eq 'game' }">
   selected
  </c:if>
  >게임</option>
  <option value="music" 
  <c:if test="${param.cat eq 'music' }">
   selected
  </c:if>
  >음악</option>
  <option value="sport" 
  <c:if test="${param.cat eq 'sport' }">
   selected
  </c:if>
  >스포츠</option>
  <option value="tour" 
  <c:if test="${param.cat eq 'tour' }">
   selected
  </c:if>
  >관광</option>
</select>