<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="favoriteAPI" value="/api-new-favorite"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="row">

		<div class="col-lg-3">

			<h1 class="my-4">Thể loại</h1>
			<div class="list-group">
				<c:forEach var="item" items="${categories}">
					<a href="#" class="list-group-item">${item.name}</a> 
				</c:forEach>
			</div>

		</div>
		<!-- /.col-lg-3 -->

		<div class="col-lg-9">

			<div id="carouselExampleIndicators" class="carousel slide my-4"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<img class="d-block img-fluid" src="<c:url value='/image/${slide.first}'/>" alt="First slide" style="width: 1000px">
					</div>
					<c:forEach var="item" items="${slide.listResult}">
						<div class="carousel-item">
							<img class="d-block img-fluid" src="<c:url value='/image/${item.image}'/>" alt="" style="width: 1000px">
						</div>
					</c:forEach>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>

			<div class="row" id="hotnew">
				<c:forEach var="item" items="${hotnew}">
					<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href="#"><img class="card-img-top" src="<c:url value='/image/${item.image}'/>" alt=""></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="<c:url value='/chi-tiet-bai-viet?id=${item.id}'/>">${item.title}</a>
									</h4>
									<p class="card-text">${item.shortDescription}</p>
								</div>
								<div class="card-footer">
									<c:if test="${not empty USERNAME}">
										<button type="button" class="btn btn-default" id="favoriteBtn" newId="${item.id}">Yêu thích</button>								
									</c:if>
									<c:if test="${empty USERNAME}">
										<p>Đăng nhập trước khi yêu thích</p>							
									</c:if>
								</div>
							</div>
					</div>
				</c:forEach>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.col-lg-9 -->
	</div>
	<!-- /.row -->
<script>
    $(document).ready(function () {
    });
    $(function () {
        $(document).on("click", "#hotnew button#favoriteBtn", function (e) {
            e.preventDefault();
            var data = {};
            data['newId'] = $(this).attr('newId');
            addFavorite(data);
        });
    });
    function addFavorite(data) {
        $.ajax({
            url: '${favoriteAPI}',
            type: 'POST',
            data: JSON.stringify(data),
            contentType: 'application/json',
            dataType: 'json',
            success: function(result) {
                window.location.href = "<c:url value='/danh-sach-bai-viet-yeu-thich'/>";
            },
            error: function(result) {
                window.location.href = "<c:url value='/danh-sach-bai-viet-yeu-thich?message=error_system'/>";
            }
        });
    }
</script>
</body>
</html>