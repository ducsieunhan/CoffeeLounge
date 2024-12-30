<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Table Users</title>
                <link rel="stylesheet" href="/client/css/starter/starter.css">

                <link href="/admin/css/styles.css" rel="stylesheet" />


                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>


                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />

                <div id="layoutSidenav">

                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manage Orders</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Users</li>
                                </ol>

                                <section class="register-section">
                                    <div class="register-wrapper width-container">
                                        <h2>Delete User Id: ${id}</h2>
                                        <div class="alert alert-danger">Are you sure to delete this user?</div>
                                        <form:form method="POST" action="/admin/user/delete" modelAttribute="deleteUser"
                                            class="register-form">
                                            <div class="form-group">
                                                <label for="email">Id <span class="bill-important">*</span></label>
                                                <form:input path="id" type="text" id="id" name="id" class="input-text"
                                                    readonly="true" />
                                            </div>
                                            <div class="form-group">
                                                <label for="email">Email <span class="bill-important">*</span></label>
                                                <form:input path="email" type="email" id="email" name="email"
                                                    class="input-text" readonly="true" />
                                            </div>
                                            <button class="submit-btn" type="submit" value="submit">Delete This
                                                User</button>
                                        </form:form>
                                    </div>
                                </section>

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

            <script>

                const checks = document.querySelectorAll('.check-pass');
                const passwordField = document.getElementById('password');

                checks.forEach(check => {
                    check.addEventListener('click', () => {
                        const inputField = check.closest('.form-group').querySelector('input');
                        if (inputField.type === 'password') {
                            inputField.type = 'text'; // Show password
                            check.classList.remove('fa-eye');
                            check.classList.add('fa-eye-slash');
                        } else {
                            inputField.type = 'password'; // Hide password
                            check.classList.remove('fa-eye-slash');
                            check.classList.add('fa-eye');
                        }
                    })
                });

            </script>

            </html>