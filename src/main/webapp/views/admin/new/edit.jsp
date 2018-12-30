<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-new"/>
<html>
<head>
    <title>Chỉnh sửa bài viết</title>
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
                <li class="active">Chỉnh sửa bài viết</li>
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
                    <form id="formSubmit">
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Thể loại bài viết</label>
                            <div class="col-sm-9">
                                <select name="categoryId">
                                    <c:if test="${empty model.categoryId}">
                                        <option value="">Loại bài viết</option>
                                        <c:forEach var="item" items="${categories}">
                                            <option value="${item.id}">${item.name}</option>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${not empty model.categoryId}">
                                        <c:forEach var="item" items="${categories}">
                                            <option value="${item.id}" <c:if test="${item.id eq model.categoryId}">selected="selected"</c:if>>
                                                    ${item.name}
                                            </option>
                                        </c:forEach>
                                        <option value="">Loại bài viết</option>
                                    </c:if>
                                </select>
                            </div>
                        </div>
                        <br/>
                        <br/>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Tiêu đề</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="title" name="title" value="${model.title}"/>
                            </div>
                        </div>
                        <br/>
                        <br/>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Mô tả ngắn</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="shortDescription" name="shortDescription" value="${model.shortDescription}"/>
                            </div>
                        </div>
                        <br/>
                        <br/>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Chọn hình đại diện</label>
                            <div class="col-sm-9">
                                <input type="file" name="file" id="uploadImage"/>
                            </div>
                        </div>
                        <br/>
                        <br/>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Hình đại diện</label>
                            <div class="col-sm-9">
                            	<c:if test="${not empty model.image}">
                            		<img src="<c:url value='/image/${model.image}'/>" height="100px" width="100px"/>
                            	</c:if>
                            	<c:if test="${empty model.image}">
                            		<img src="<c:url value='/image/default.png'/>" height="100px" width="100px"/>                        		
                            	</c:if>
                            </div>
                        </div>
                        <br/>
                        <br/>
                        <br/>
                        <div class="form-group">
                        	<br/>
                        	<br/>
                            <label class="col-sm-3 control-label no-padding-right">Nội dung</label>
                            <div class="col-sm-9">                  
                                <textarea id="content" name="content">${model.content}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <c:if test="${not empty model.id}">
                                    <input type="button" class="btn btn-white btn-warning btn-bold" value="Cập nhật bài viết" id="btnAddOrUpdateNew"/>
                                </c:if>
                                <c:if test="${empty model.id}">
                                    <input type="button" class="btn btn-white btn-warning btn-bold" value="Thêm mới bài viết" id="btnAddOrUpdateNew"/>
                                </c:if>
                            </div>
                        </div>
                        <input type="hidden" value="${model.id}" id="id" name="id"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('#btnAddOrUpdateNew').click(function (e) {
            e.preventDefault();
            var file = $('#uploadImage')[0].files[0];
            var imageName = '';
            if (file != undefined) {
                imageName = file.name;
            }
            var data = {};
            var formData = $('#formSubmit').serializeArray();
            $.each(formData, function (i,v) {
                data[""+v.name+""] = v.value;
            });
            if (imageName != '') {
                data['image'] = imageName;
            }
            var newId = $('#id').val();
            if (newId == "") {
                addNew(data);
            } else {
            	data['id'] = newId;
                updateNew(data, newId);
            }
        });
    });
    function addNew(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'POST',
            data: JSON.stringify(data),
            contentType: 'application/json',
            dataType: 'json',
            success: function(result) {
                window.location.href = "<c:url value='/admin-new-edit?id="+result.id+"&message=insert_success'/>";
            },
            error: function(result) {
                window.location.href = "<c:url value='/admin-new-edit?id="+result.id+"&message=error_system'/>";
            }
        });
    }
    function updateNew(data, id) {
        $.ajax({
            url: '${APIurl}',
            type: 'POST',
            data: JSON.stringify(data),
            contentType: 'application/json',
            dataType: 'json',
            success: function(result) {
                window.location.href = "<c:url value='/admin-new-edit?id="+id+"&message=update_success'/>";
            },
            error: function(result){
                window.location.href = "<c:url value='/admin-new-edit?id="+id+"&message=error_system'/>";
            }
        });
    }
</script>
</body>
</html>
