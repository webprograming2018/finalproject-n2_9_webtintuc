<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="commentAPI" value="/api-admin-new-comment"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách bài viết yêu thích</title>
</head>
<body>
<br/>
	   <div class="row">
	   <c:forEach var="item" items="${favorites}">
		   	<div class="col-lg-4 col-sm-6 portfolio-item">
	          <div class="card h-100">
	            <a href="#"><img class="card-img-top" src="<c:url value='/image/${item.newModel.image}'/>" alt=""></a>
	            <div class="card-body">
	              <h4 class="card-title">
	                <a href="#">${item.newModel.title}</a>
	              </h4>
	              <p class="card-text">${item.newModel.shortDescription}</p>
	            </div>
	          </div>
	        </div>
	   </c:forEach>
      </div>
      <!-- /.row -->
</body>
</html>