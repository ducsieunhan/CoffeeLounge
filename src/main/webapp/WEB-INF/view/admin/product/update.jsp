<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="Hỏi Dân IT" />
                <title></title>
                <link href="/admin/css/styles.css" rel="stylesheet" />

                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    }); 
                </script>
            </head>


            <style>
                body {
                    font-family: 'Lato', sans-serif;
                }

                h1 {
                    margin-bottom: 40px;
                }

                label {
                    color: #333;
                }

                .btn-send {
                    font-weight: 300;
                    text-transform: uppercase;
                    letter-spacing: 0.2em;
                    width: 80%;
                    margin-left: 3px;
                }

                .help-block.with-errors {
                    color: #ff5050;
                    margin-top: 5px;

                }

                .card {
                    margin-left: 10px;
                    margin-right: 10px;
                }
            </style>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manage Product</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active"><a href="/admin/product">Product</a></li>
                                    <li class="breadcrumb-item active">Update Product</li>
                                </ol>
                                <div class="mt-5">
                                    <div class="row ">
                                        <div class="col-lg-7 mx-auto">
                                            <div class="card mt-2 mx-auto p-4 bg-light">
                                                <div class="card-body bg-light">

                                                    <div class="container">

                                                        <form:form id="contact-form" role="form" class="lh-lg"
                                                            action="/admin/product/update" method="post"
                                                            modelAttribute="updateProduct"
                                                            enctype="multipart/form-data">

                                                            <div class="controls">
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <div class="form-group">

                                                                            <c:set var="errorName">
                                                                                <form:errors path="name"
                                                                                    cssClass="invalid-feedback" />
                                                                            </c:set>

                                                                            <label for="form_name">Product Name
                                                                                *</label>
                                                                            <form:input path="name" id="form_name"
                                                                                type="text" name="name"
                                                                                class="form-control ${not empty errorName ? 'is-invalid' : ''}" />

                                                                            ${errorName}
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <div class="form-group">

                                                                            <c:set var="errorPrice">
                                                                                <form:errors path="price"
                                                                                    cssClass="invalid-feedback" />
                                                                            </c:set>

                                                                            <label for="form_price">Product price
                                                                                *</label>
                                                                            <form:input path="price" id="form_price"
                                                                                type="number" name="surname"
                                                                                class="form-control ${not empty errorPrice ? 'is-invalid' : ''}"
                                                                                step="0.01" />
                                                                            ${errorPrice}

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <div class="form-group">
                                                                            <label for="form_status">Select product
                                                                                status
                                                                                *</label>
                                                                            <form:select path="status.name"
                                                                                id="form_status" name="status"
                                                                                class="form-control">

                                                                                <form:option value="Available">Available
                                                                                </form:option>
                                                                                <form:option value="Unavailable">
                                                                                    Unavailable</form:option>
                                                                            </form:select>

                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <div class="form-group">
                                                                            <label for="form_category">Please categorize
                                                                                product
                                                                                *</label>
                                                                            <form:select path="category.name"
                                                                                id="form_category" class="form-control">
                                                                                <form:options items="${categories}"
                                                                                    itemValue="name" itemLabel="name" />
                                                                            </form:select>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <div class="form-group">
                                                                            <label for="form_description">Short
                                                                                description
                                                                                *</label>
                                                                            <form:input path="shortDesc"
                                                                                id="form_description" type="text"
                                                                                name="shortDesc" class="form-control" />

                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <div class="form-group">
                                                                            <label for="form_lastname">Image
                                                                                *</label>
                                                                            <form:input path="" class="form-control"
                                                                                type="file" id="avatarFile"
                                                                                name="ducsieunhan"
                                                                                accept=".png, .jpg, .jpeg" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <div class="form-group">
                                                                            <c:set var="errorQuantity">
                                                                                <form:errors path="quantity"
                                                                                    cssClass="invalid-feedback" />
                                                                            </c:set>

                                                                            <label for="form_quantity">Product Quantity
                                                                                *</label>
                                                                            <form:input path="quantity"
                                                                                id="form_quantity" type="text"
                                                                                class="form-control ${not empty errorQuantity ? 'is-invalid' : ''}" />
                                                                            ${errorQuantity}
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-12">
                                                                        <div class="form-group">
                                                                            <label for="form_message">Description
                                                                            </label>
                                                                            <form:textarea path="detailDesc"
                                                                                id="form_detailDesc"
                                                                                class="form-control" rows="4" />
                                                                        </div>

                                                                    </div>

                                                                    <div class="col-12 mb-3">
                                                                        <img src="" alt="avatar preview"
                                                                            style="max-height: 250px; display: none;"
                                                                            id="avatarPreview">
                                                                    </div>

                                                                    <div class="col-md-12 mt-3 text-center">

                                                                        <input type="submit" class="btn btn-success btn-send  pt-2 btn-block
                                                              " value="Create Product">

                                                                    </div>

                                                                </div>


                                                            </div>
                                                        </form:form>
                                                    </div>
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
                <script src="/js/scripts.js"></script>

            </body>

            </html>