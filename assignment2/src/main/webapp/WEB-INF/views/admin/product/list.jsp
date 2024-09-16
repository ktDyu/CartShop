<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="row">
    <div class="col-2"></div>
    <div class="col-8 mt-5">
        <form>
            <p>Từ khóa: <input name="keyword" value="${param.keyword}"></p>

            <button>Tìm kiếm</button>
        </form>

        <table class="table table-bordered table-striped table-hover mb-0">
            <thead>
            <tr class="table-primary">
                <th scope="col" rowspan="2" class="text-center align-middle">Loại</th>
                <th scope="col" rowspan="2" class="text-center align-middle">Tên</th>
                <th scope="col" rowspan="2" class="text-center align-middle">Đơn giá</th>
                <th scope="col" rowspan="2" class="text-center align-middle">Còn hàng</th>
                <th scope="col" rowspan="2" class="text-center align-middle">Ảnh</th>
                <th rowspan="2" style="width: 200px;" class="text-center align-middle"></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${page.content}" var="x">
                <tr class="text-center align-middle">
                    <td>
                        ${x.category.name}
                    </td>

                    <td>${x.name}</td>
                    <td>${x.price}</td>
                    <td>
                        <input type="checkbox" value="${x.available}" ${x.available ? 'checked' : ''}>
                    </td>
                    <td><img style="height: 80px;" src="<c:url value='/static/images/${x.image}' />" alt=""></td>

                    <td>
                        <a class="btn btn-primary" href="/admin/product/update/${x.id}" >Sửa</a>
                        <a class="btn btn-danger" onclick="return confirm('Bạn có muốn xóa không ?')"
                                   href="/admin/product/delete/${x.id}" >Xóa</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <br>
        <div >
            <c:if test="${page.totalPages>0}" >
                <c:forEach begin="0" end="${page.totalPages-1}" var="p">
                    <a href="/admin/product?p=${p}&keyword=${param.keyword}" class="btn btn-warning">${p+1}</a>
                </c:forEach>
            </c:if>
        </div>

        <br>
        <br>
        <a class="btn btn-primary" href="/admin/product/create" >Thêm sản phẩm</a>

    </div>
    <div class="col-2"></div>
</div>


