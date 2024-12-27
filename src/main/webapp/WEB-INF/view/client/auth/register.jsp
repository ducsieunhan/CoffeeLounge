<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Register Account</title>
                <link rel="stylesheet" href="/client/css/layout/layout.css">
                <link rel="stylesheet" href="/client/css/starter/starter.css">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Hind+Mysuru:wght@300;400;500;600;700&family=Playfair+Display:ital,wght@0,400..900;1,400..900&family=Special+Elite&display=swap"
                    rel="stylesheet">
                <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap"
                    rel="stylesheet">
            </head>

            <style>
                .form-group {
                    text-align: start;
                    position: relative !important;

                    .check-pass {
                        position: absolute !important;
                        top: 58% !important;
                        right: 2%;
                        cursor: pointer;
                        font-size: 18px;
                    }
                }
            </style>


            <body>

                <jsp:include page="../layout/header.jsp" />
                <jsp:include page="../layout/swiper.jsp" />

                <section class="register-section">
                    <div class="register-wrapper width-container">
                        <h2>Register</h2>
                        <form:form method="POST" action="/register" modelAttribute="newUser" class="register-form">
                            <div class="form-group">
                                <label for="email">Email <span class="bill-important">*</span></label>
                                <form:input path="email" type="email" id="email" name="email" class="input-text" />
                            </div>
                            <div class="form-group form-password">
                                <label for="password">Password <span class="bill-important">*</span></label>
                                <form:input path="password" type="password" id="password" name="password"
                                    class="input-text" />
                                <i class="fa-regular fa-eye check-pass" onclick="checkPassword()"></i>
                            </div>
                            <div class="form-group">
                                <label for="fullName">Full Name <span class="bill-important">*</span></label>
                                <form:input path="fullName" type="text" id="fullName" name="fullName"
                                    class="input-text" />
                            </div>
                            <div class="form-group">
                                <label for="phone">Phone <span class="bill-important">*</span></label>
                                <form:input path="phone" type="tel" id="phone" name="phone" class="input-text" />
                            </div>
                            <button class="submit-btn" type="submit" value="submit">Register</button>
                            <a class="haveAccount" href="">Already have account?</a>
                        </form:form>
                    </div>
                </section class="register-section">

                <jsp:include page="../layout/footer.jsp" />


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