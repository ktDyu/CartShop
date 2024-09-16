<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="utf-8"%>
<div class="row">
    <div class="col-2"></div>
    <div class="col-8 mt-5">
        <table class="table table-bordered table-striped table-hover mb-0">
            <thead>
            <tr class="table-primary">
                <th scope="col" rowspan="2" class="text-center align-middle">Tên đăng nhập</th>
                <th scope="col" rowspan="2" class="text-center align-middle">Họ Tên</th>
                <th scope="col" rowspan="2" class="text-center align-middle">Mật khẩu</th>
                <th scope="col" rowspan="2" class="text-center align-middle">Email</th>
                <th scope="col" rowspan="2" class="text-center align-middle">Activate</th>
                <th scope="col" rowspan="2" class="text-center align-middle">Admin</th>
                <th rowspan="2" style="width: 200px;" class="text-center align-middle"></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listAcc}" var="x">
                <tr class="text-center align-middle">
                    <th scope="row">${x.username}</th>
                    <td>${x.fullname}</td>
                    <td>${x.password}</td>
                    <td>${x.email}</td>
                    <td>
                        <input type="checkbox" ${x.activated ? 'checked' : ''}>
                    </td>
                    <td>
                        <input type="checkbox" value="${x.admin}" ${x.admin ? 'checked' : ''}>
                    </td>
                    <td>
                        <a class="btn btn-primary" href="/admin/account/update/${x.username}" >Sửa</a>
                        <a class="btn btn-danger" onclick="return confirm('Bạn có muốn xóa không ?')"
                           href="/admin/account/delete/${x.username}" >Xóa</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <br>
        <a class="btn btn-primary" href="/admin/account/create" >Thêm người dùng</a>

    </div>
    <div class="col-2"></div>
</div>