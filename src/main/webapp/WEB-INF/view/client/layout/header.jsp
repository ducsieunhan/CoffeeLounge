<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <section class="header">
            <div class="page-header width-container">
                <div class="header-wrap">

                    <div class="header-left">
                        <div class="page-navigation">
                            <nav class="navbar menu menu-container">
                                <a href="/">Home</a>
                                <a href="/product">Products</a>
                                <a href="actions/index.html">Blog</a>
                                <a href="oceanguard/index.html">About</a>
                            </nav>
                        </div>
                    </div>

                    <div class="header-center">
                        <div class="branding">
                            <a href="#" rel="home" style="display: block; width: 50px; height: 50px;"> <img src=""
                                    alt="">
                            </a>
                        </div>
                    </div>
                    <div class="header-right">
                        <div class="header-right-content">
                            <c:if test="${not empty pageContext.request.userPrincipal}">
                                <div class="user-dropdown">
                                    <a href="#" class="dropdown-toggle icon-head">
                                        <i class="fa-solid fa-user"></i>
                                    </a>
                                    <div class="dropdown-menu">
                                        <a href="/login" style="color: black; font-weight: bold;"
                                            class="drop-item">${sessionScope.fullName}</a>
                                        <form method="post" action="/logout" class="drop-item">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <button class="dropdown-item" style="color: black;padding: 8px 16px; font-size: 14px;
                                                background-color: white; font-weight: bold;
                                                border: none; cursor: pointer;">Log
                                                Out</button>
                                        </form>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${ empty pageContext.request.userPrincipal}">
                                <a href="/login" class="icon-head"><i class="fa-solid fa-user "></i></a>
                            </c:if>
                            <a href="" class="icon-head"><i class="fa-solid fa-magnifying-glass"></i></a>
                            <c:if test="${not empty pageContext.request.userPrincipal}">
                                <a href="/cart" class="icon-head cart-icon" data-cart-sum="${sessionScope.sum}"><i
                                        class="fa-solid fa-bag-shopping"></i></a>
                            </c:if>
                            <c:if test="${ empty pageContext.request.userPrincipal}">
                                <a href="/cart" class="icon-head cart-icon" data-cart-sum="0"><i
                                        class="fa-solid fa-bag-shopping"></i></a>
                            </c:if>

                        </div>
                    </div>
                </div>
            </div>
        </section>