<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<div class="row justify-content-center">
    <div class="col-md-8">
        <form:form method="post" modelAttribute="acc" class="card p-3">
            <h2 class="text-center mb-4">Thêm người dùng</h2>
            <div class="form-group">

                <label for="username">Tên đăng nhập:</label>
                <form:input type="text" path="username" class="form-control" id="username"/>
                <form:errors path="username" cssClass="text-danger"/>
            </div>
            <div class="form-group">
                <p>Họ tên:
                    <form:input path="fullname" class="form-control" />
                    <form:errors path="fullname" cssClass="text-danger"/>
                </p>

            </div>
            <div class="form-group">
                <label for="password">Mật khẩu:</label>
                <form:input path="password" type="password" class="form-control" id="password"/>
                <form:errors path="password" cssClass="text-danger"/>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <form:input path="email" type="email" class="form-control" id="email"/>
                <form:errors path="email" cssClass="text-danger"/>
            </div>
            <br>
            <div class="form-group form-check">
                <label >Active : </label>
                <form:checkbox path="activated" id="activated"/>
            </div>
            <div class="form-group form-check">
                <label >Admin : </label>
                <form:checkbox path="admin" id="admin"/>
            </div>
            <button type="submit" class="btn btn-primary mt-3">Lưu lại</button>
        </form:form>
    </div>
</div>

