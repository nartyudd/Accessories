<%-- 
    Document   : index
    Created on : Jul 8, 2023, 1:08:00 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:url value="/" var="action" />
<section class="container">
    <h1 class="text-center text-info mt-1">DANH SÁCH SẢN PHẨM</h1>
    <se:authorize access="hasRole('ROLE_ADMIN')">
        <div>
            <a href="<c:url value="/products" />" class="btn btn-info mt-1">Thêm sản phẩm</a>
        </div>
    </se:authorize>
    <c:if test="${counter > 1}">
        <ul class="pagination mt-1">
            <li class="page-item"><a class="page-link" href="${action}">Tất cả</a></li>
                <c:forEach begin="1" end="${counter}" var="i">
                    <c:url value="/" var="pageUrl">
                        <c:param name="page" value="${i}" />
                    </c:url>
                <li class="page-item"><a class="page-link" href="${pageUrl}">${i}</a></li>
                </c:forEach>
            <!--            <li class="page-item">
                            <form action="${action}" id="pageSearch">
                                <input type="number" max="${counter}" min="1" name="page" onchange="document.getElementById("pageSearch").submit()" />
                            </form>
                        </li>-->
        </ul>
    </c:if>
    <table class="table table-hover">
        <tbody>
        <div class="row">
            <c:forEach items="${products}" var="p">
                <div class="col">
                    <div class="card" style="width: 300px">
                        <div class="card-body">
                            <img src="${p.image}" alt="${p.name}" style="width: 250px"/>
                            <h4 class="card-title">${p.name}</h4>
                            <p class="card-text">${p.price} VNĐ</p>
                            <p>
                                <se:authorize access="hasRole('ROLE_ADMIN')">
                                    <c:url value="/products/${p.id}" var="api" />
                                    <a href="${api}" class="btn btn-info">Cập nhật</a>
                                    <button class="btn btn-danger" onclick="deleteProduct('${api}')">Xóa</button>
                                </se:authorize>
                            </p>
                        </div>
                    </div>

                </div>
            </c:forEach>
        </div>
        </tbody>
    </table>
</section>

<script src="<c:url value="/js/main.js" />"></script>
