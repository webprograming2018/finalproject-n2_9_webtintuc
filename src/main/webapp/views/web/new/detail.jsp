<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="commentAPI" value="/api-admin-new-comment"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết bài viết</title>
</head>
<body>
<div class="row">
	<div class="card mt-4">
            <img class="card-img-top img-fluid" src="<c:url value='/image/${model.image}'/>" alt="" style="width: 1136px">
            <div class="card-body">
              <h3 class="card-title">${model.title}</h3>
              <p class="card-text">${model.content}</p>
            </div>
     </div>
     <div class="card card-outline-secondary my-4">
            <div class="card-header">
              Bình luận bài viết
            </div>
            <div class="card-body">
              <c:forEach var="item" items="${comments}">
              	<p>${item.content}</p>
                <small class="text-muted">${item.userName}</small>
                <hr>
              </c:forEach>
              <c:if test="${not empty USERNAME}">
              	<textarea rows="4" cols="150" id="comment"></textarea>
              	<hr>
              	<button class="btn btn-success" id="commentBtn">Bình luận</button>
              </c:if>
              <c:if test="${empty USERNAME}">
              	<p>Yêu cầu đăng nhập trước khi bình luận</p>
              </c:if>
            </div>
            <input type="hidden" value="${model.id}" id="id"/>
     </div>
</div>
<script>
    $(document).ready(function () {
    });
    $('#commentBtn').click(function (e) {
        e.preventDefault();
        var data = {};
        data['content'] = $('#comment').val();
        data['newId'] = $('#id').val();
        addComment(data, $('#id').val());
    });
    function addComment(data,id) {
        $.ajax({
            url: '${commentAPI}',
            type: 'POST',
            data: JSON.stringify(data),
            contentType: 'application/json',
            dataType: 'json',
            success: function(result) {
                window.location.href = "<c:url value='/chi-tiet-bai-viet?id="+id+"'/>";
            },
            error: function(result) {
                window.location.href = "<c:url value='/chi-tiet-bai-viet?id="+id+"&message=error_system'/>";
            }
        });
    }
</script>
</body>
</html>