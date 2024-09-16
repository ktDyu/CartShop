<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<div class="row justify-content-center">
    <div class="col-md-8">
        <form:form method="post" modelAttribute="pro" class="card p-3">
            <h2 class="text-center mb-4">Cập nhật sản phẩm</h2>
            <br>
            <div class="form-group">
                <label>Loại:</label>
                <form:select path="category">
                    <form:options items="${listCate}" itemLabel="name" itemValue="id"/>
                </form:select>

            </div>
            <br>
            <div class="form-group">
                <label for="name">Tên:</label>
                <form:input class="form-control" path="name" value="${pro.name}"/>
                <form:errors path="name" cssClass="text-danger"/>
            </div>
            <br>
            <div class="form-group">
                <label for="price">Đơn giá:</label>
                <form:input class="form-control" path="price" value="${pro.price}"/>
                <form:errors path="price" cssClass="text-danger"/>
            </div>
            <br>
            <div class="form-group form-check">
                <label>Còn hàng</label>
                <form:checkbox class="form-check-input" id="inStock" path="available"/>

            </div>
            <br>
            <div class="form-group">
                <label for="image">Ảnh:</label>
                <form:input type="file" class="form-control-file" id="image" path="image"/>
                <c:if test="${not empty pro.image}">
                    <img src="<c:url value='/static/images/${pro.image}' />" alt="${pro.name}" style="height: 100px; margin-top: 10px;">
                    <input type="hidden" name="image" value="${pro.image}" />
                </c:if>

            </div>
            <br>
            <button type="submit" class="btn btn-primary">Lưu lại</button>
        </form:form>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>