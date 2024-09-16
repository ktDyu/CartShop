<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<div class="row justify-content-center">
    <div class="col-md-8">
        <form:form method="post" modelAttribute="cate" class="card p-3">
            <h2 class="text-center mb-4">Cập nhật nhóm sản phẩm</h2>
            <br>
            <div class="form-group">
                <label for="name">Đơn giá:</label>
                <form:input class="form-control" path="name" value="${cate.name}"/>
                <form:errors path="name" cssClass="text-danger"/>
            </div>
            <br>
            <button type="submit" class="btn btn-primary">Lưu lại</button>
        </form:form>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>