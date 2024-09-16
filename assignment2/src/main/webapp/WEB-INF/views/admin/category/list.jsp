<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="row">
    <div class="col-2"></div>
    <div class="col-8 mt-5">

        <table class="table table-bordered table-striped table-hover mb-0">
            <thead>
            <tr class="table-primary">
                <th scope="col" rowspan="2" class="text-center align-middle">ID</th>
                <th scope="col" rowspan="2" class="text-center align-middle">Tên</th>
                <th rowspan="2" style="width: 200px;" class="text-center align-middle"></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listCate}" var="x">
                <tr class="text-center align-middle">
                    <td>${x.id}</td>
                    <td>${x.name}</td>
                    <td>
                        <a class="btn btn-primary" href="/admin/category/update/${x.id}" >Sửa</a>
                        <a class="btn btn-danger" onclick="return confirm('Bạn có muốn xóa không ?')"
                           href="/admin/category/delete/${x.id}" >Xóa</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <br>
        <a class="btn btn-primary" href="/admin/category/create" >Thêm Nhóm Sản Phẩm</a>

    </div>
    <div class="col-2"></div>
</div>


