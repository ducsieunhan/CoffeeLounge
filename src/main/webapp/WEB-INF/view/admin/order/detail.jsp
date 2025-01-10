<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Table Users</title>
                <link href="/admin/css/styles.css" rel="stylesheet" />

                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>


                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <!-- <link href="/css/demo.css" rel="stylesheet"> -->


            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />

                <div id="layoutSidenav">

                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Orders</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/order">Order</a></li>
                                    <li class="breadcrumb-item active">View detail</li>
                                </ol>
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <div class="d-flex justify-content-between">
                                                <h3>Order detail with id = ${id}</h3>
                                            </div>

                                            <hr />

                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">Product</th>
                                                            <th scope="col">Name</th>
                                                            <th scope="col">Product Price</th>
                                                            <th scope="col">Quantity</th>
                                                            <th scope="col">Total Price</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:if test="${ empty orderDetails}">
                                                            <tr>
                                                                <td colspan="6">
                                                                    There is no order in cart !
                                                                </td>
                                                            </tr>
                                                        </c:if>
                                                        <c:forEach var="orderDetail" items="${orderDetails}">

                                                            <tr>
                                                                <th scope="row">
                                                                    <div class="d-flex align-items-center">
                                                                        <img src="/images/product/${orderDetail.product.image}"
                                                                            class="img-fluid me-5 rounded-circle"
                                                                            style="width: 80px; height: 80px;" alt="">
                                                                    </div>
                                                                </th>
                                                                <td>
                                                                    <p class="mb-0 mt-4">
                                                                        <a href="/product/${orderDetail.product.id}"
                                                                            target="_blank">
                                                                            ${orderDetail.product.name}
                                                                        </a>
                                                                    </p>
                                                                </td>
                                                                <td>
                                                                    <p class="mb-0 mt-4">
                                                                        $${orderDetail.price}
                                                                    </p>
                                                                </td>
                                                                <td>
                                                                    <div class="input-group quantity mt-4"
                                                                        style="width: 100px;">
                                                                        <input type="text"
                                                                            class="form-control form-control-sm text-center border-0"
                                                                            value="${orderDetail.quantity}">
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <p class="mb-0 mt-4"
                                                                        data-cart-detail-id="${orderDetail.id}">
                                                                        $${orderDetail.price * orderDetail.quantity}
                                                                    </p>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>

                                                    </tbody>
                                                </table>
                                            </div>
                                            <a href="/admin/order" class="btn btn-success mt-3">Back</a>

                                        </div>

                                    </div>

                                </div>
                            </div>
                        </main>

                        <jsp:include page="../layout/footer.jsp" />

                    </div>

                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/scripts.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/chart-area-demo.js"></script>
                <script src="js/chart-bar-demo.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/datatables-simple-demo.js"></script>
            </body>

            </html>