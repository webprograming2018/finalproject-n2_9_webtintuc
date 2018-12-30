<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<a class="navbar-brand" href="<c:url value='/trang-chu'/>">Trang chủ</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item">
                        <a class="nav-link" href='<c:url value="/bai-viet-moi"/>'>Bài viết mới đăng</a>
                </li>
				<c:if test="${empty USERNAME}">
                    <li class="nav-item">
                        <a class="nav-link" href='<c:url value="/dang-nhap"/>'>Đăng nhập</a>
                    </li>
                </c:if>
                <c:if test="${not empty USERNAME}">
                    <li class="nav-item">
                    	<a class="nav-link" href="#">Welcome, ${USERNAME}</a>
                    </li>
                    <li class="nav-item">
                    	<a class="nav-link" href="<c:url value="/danh-sach-bai-viet-yeu-thich"/>">Danh sách bài viết yêu thích</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href='<c:url value="/thoat"/>'>Thoát</a>
                    </li>
                </c:if>
			</ul>
		</div>
	</div>
</nav>