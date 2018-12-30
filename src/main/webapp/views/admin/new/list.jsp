<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="formUrl" value="/admin-new-list"/>
<c:url var="slideAPI" value="/api-admin-new-slide"/>
<c:url var="hotnewAPI" value="/api-admin-new-hotnew"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Danh sách bài viết</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Trang chủ</a>
                </li>
                <li class="active">Danh sách bài viết</li>
            </ul><!-- /.breadcrumb -->
        </div>
        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                    <c:if test="${not empty messageResponse}">
                        <div class="alert alert-block alert-${alert}">
                            <button type="button" class="close" data-dismiss="alert">
                                <i class="ace-icon fa fa-times"></i>
                            </button>
                                ${messageResponse}
                        </div>
                    </c:if>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <!-- PAGE CONTENT BEGINS -->
                        <div class="row">
                        	<div class="table-btn-controls">
                                <div class="pull-right tableTools-container">
                                    <div class="dt-buttons btn-overlap btn-group">
                                        <a flag="info" class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
                                           data-toggle="tooltip" title="Thêm bài viết mới" href="<c:url value="/admin-new-edit"/>">
                                                    <span>
                                                    <i class="fa fa-plus-circle bigger-110 purple"></i>
                                                </span>
                                        </a>
                                        <button id="btnUpdateSlide" type="button" class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
                                                data-toggle="tooltip" title="Update slide">
                                                    <span>
                                                        <i class="fa fa-plus-circle bigger-110 purple"></i>
                                                	</span>
                                        </button>
                                        <button id="btnUpdateHotNew" type="button" class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
                                                data-toggle="tooltip" title="Update hot new">
                                                    <span>
                                                        <i class="fa fa-plus-circle bigger-110 purple"></i>
                                                	</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th><input type="checkbox" value="" id="checkAll"/></th>
                                            <th>Tên bài viết</th>
                                            <th>Thao tác</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="item" items="${model.listResult}">
                                                <tr>
                                                    <td><input type="checkbox" value="${item.id}" id="checkbox_${item.id}"/></td>
                                                    <td>${item.title}</td>
                                                    <td>
                                                        <c:url var="editURL" value="/admin-new-edit">
                                                            <c:param name="id" value="${item.id}"/>
                                                        </c:url>
                                                        <a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
                                                           title="Cập nhật bài viết" href='${editURL}'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
    	
    });
    $('#btnUpdateSlide').click(function () {
        var dataArray = {};
        var ids = $('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        dataArray['newIds'] = ids;
        updateSlide(dataArray);
    });
    function updateSlide(data) {
        $.ajax({
            url: '${slideAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function(res) {
            	window.location.href = "<c:url value='/admin-new-list?&message=update_success'/>";
            },
            error: function (res) {
            	window.location.href = "<c:url value='/admin-new-list?&message=error_system'/>";
            }
        });
    }
    $('#btnUpdateHotNew').click(function () {
        var dataArray = {};
        var ids = $('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        dataArray['newIds'] = ids;
        updateHotNew(dataArray);
    });
    function updateHotNew(data) {
        $.ajax({
            url: '${hotnewAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function(res) {
            	window.location.href = "<c:url value='/admin-new-list?&message=update_success'/>";
            },
            error: function (res) {
            	window.location.href = "<c:url value='/admin-new-list?&message=error_system'/>";
            }
        });
    }
</script>
</body>
</html>
