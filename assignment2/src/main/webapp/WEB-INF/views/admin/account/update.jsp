<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<div class="row justify-content-center">
    <div class="col-md-8">
        <form:form method="post" action="/admin/account/update/${acc.username}" modelAttribute="acc"   class="card p-3">
            <h2 class="text-center mb-4">Chỉnh sửa người dùng</h2>
            <div class="form-group">
                <label for="fullname">Họ tên:</label>
                <form:input path="fullname" class="form-control" value="${acc.fullname}"/>
                <form:errors path="fullname" cssClass="text-danger"/>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <form:input path="email" type="email" class="form-control" value="${acc.email}"/>
                <form:errors path="email" cssClass="text-danger"/>

            </div>
            <br>
            <div class="form-group form-check">
                <label for="activated">Active : </label>
                <form:checkbox path="activated" id="activated" value="${acc.activated}"/>
            </div>
            <div class="form-group form-check">
                <label>Admin : </label>
                <form:checkbox path="admin" id="admin" value="${acc.admin}"/>

            </div>
            <button type="submit" class="btn btn-primary mt-3">Lưu lại</button>
        </form:form>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
