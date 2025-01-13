<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Document</title>
                <link rel="stylesheet" href="/client/css/layout/layout.css">
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link rel="stylesheet" href="/client/css/product/product.css">
                <link
                    href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Hind+Mysuru:wght@300;400;500;600;700&family=Playfair+Display:ital,wght@0,400..900;1,400..900&family=Special+Elite&display=swap"
                    rel="stylesheet">
                <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap"
                    rel="stylesheet">

            </head>


            <body>
                <jsp:include page="../layout/header.jsp" />

                <jsp:include page="../layout/swiper.jsp" />


                <section class="products-container">
                    <div class="width-container products-column">
                        <div class="products-sorting-container">
                            <div class="products-search-box">
                                <form action="" class="products-search">
                                    <input type="search" class="search-field" placeholder="Search products...">
                                    <button type="submit" class="search-btn"><i
                                            class="fa-solid fa-magnifying-glass"></i></button>
                                </form>
                            </div>

                            <div class="products-sorting-type">
                                <div class="sorting-type-header">
                                    <i class="fa-solid fa-mug-hot" style="color: seagreen;"></i>
                                    <h3>PRODUCT CATEGORIES</h3>
                                </div>

                                <hr class="devide-part-hr">

                                <ul class="products-categories">
                                    <c:forEach var="category" items="${categories}">

                                        <li class="cof-cate-item"><a href="">${category.name}</a></li>

                                    </c:forEach>
                                </ul>
                            </div>

                            <div class="products-top-rated">
                                <div class="sorting-type-header">
                                    <i class="fa-solid fa-mug-hot" style="color: seagreen;"></i>
                                    <h3>Top rated products</h3>
                                </div>

                                <hr class="devide-part-hr">

                                <ul class="products-top">
                                    <c:forEach var="product" items="${top_products}">

                                        <li class="cof-cate-item">
                                            <img width="480" height="480" src="/images/product/${product.image}" alt="">
                                            <div class="cof-top-price">
                                                <a href="">${product.name}
                                                </a>
                                                <div><span>$10.50</span> $${product.price}</div>
                                            </div>
                                        </li>

                                    </c:forEach>
                                </ul>
                            </div>

                        </div>
                        <div class="products-display-container">
                            <div class="product-sorting-by ">
                                <p class="product-result-count">Showing 1–6 of 50 results</p>
                                <form action="" class="sorting-by">
                                    <select name="orderby" class="orderby" id="">
                                        <option value="price-asc">Sort by price: low to high</option>
                                        <option value="price-desc">Sort by price: hight to low</option>
                                    </select>
                                </form>
                            </div>

                            <div class="products-container">
                                <ul class="products">
                                    <c:forEach var="product" items="${products}">
                                        <li class="product-item">
                                            <div class="lte-item">
                                                <div class="lte-image">
                                                    <a href="/product/{$product.id}">
                                                        <img width="480" height="480"
                                                            src="/images/product/${product.image}" alt="">
                                                    </a>
                                                    <button class="show-more-btn"><a href="/product/{$product.id}">Read
                                                            More</a></button>
                                                </div>
                                                <div class="lte-image-desc">
                                                    <a href="">
                                                        <h2>${product.name}</h2>
                                                    </a>
                                                </div>
                                            </div>
                                        </li>
                                    </c:forEach>

                                </ul>
                            </div>

                            <nav aria-label="products-pagination">
                                <ul class="pagination justify-content-center">
                                    <li class="page-item">
                                        <a class="${1 eq currentPage ? 'page-link disabled' : 'page-link'} "
                                            href="/shop?page=${currentPage-1}" aria-label="Previous">
                                            <span class="fa-solid fa-angle-left" aria-hidden="true"></span>
                                        </a>
                                    </li>
                                    <c:forEach begin="0" end="${totalPages-1}" varStatus="loop">
                                        <li class="page-item"><a
                                                class="${(loop.index+1) eq currentPage ? 'page-link active' : 'page-link'} "
                                                href="/shop?page=${loop.index+1}">${loop.index+1}</a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item">
                                        <a class="${currentPage eq totalPages ? 'page-link disabled' : 'page-link'} "
                                            href="/shop?page=${currentPage+1}" aria-label="Next">
                                            <span class="fa-solid fa-angle-right" aria-hidden="true"></span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </section>


                <jsp:include page="../layout/footer.jsp" />

            </body>
            <script src="/client/js/layout.js"></script>

            <script src="/client/js/layout.js"></script>

            </html>