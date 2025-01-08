<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Register Account</title>
                <link rel="stylesheet" href="/client/css/deny/deny.css">
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

            </style>

            <body>

                <jsp:include page="../layout/header.jsp" />
                <jsp:include page="../layout/swiper.jsp" />


                <div class="outer-track">
                    <div class="inner-track">
                        <div class="tractor-container">
                            <div class="tractor">
                                <div class="body">
                                    <div class="light"></div>
                                    <div class="grill"></div>
                                    <div class="exhaust"></div>
                                    <div class="steering"></div>
                                    <div class="seat"></div>
                                    <div class="wheel-front"></div>
                                    <div class="fender"></div>
                                    <div class="wheel-back"></div>
                                    <div class="hitch"></div>
                                </div>
                            </div>
                        </div>
                        <div class="rope"></div>
                        <div class="tractor-container">
                            <div class="tractor">
                                <div class="body">
                                    <div class="light"></div>
                                    <div class="grill"></div>
                                    <div class="exhaust"></div>
                                    <div class="steering"></div>
                                    <div class="seat"></div>
                                    <div class="wheel-front"></div>
                                    <div class="fender"></div>
                                    <div class="wheel-back"></div>
                                    <div class="hitch"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <a href="/" class="deny-btn">Back to homepage</a href="/">

                <jsp:include page="../layout/footer.jsp" />



            </body>

            </html>