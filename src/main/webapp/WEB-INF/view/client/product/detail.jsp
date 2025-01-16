<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Document</title>
                    <link rel="stylesheet" href="/client/css/layout/layout.css">
                    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css">
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
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

                    <section class="swiper-container">
                        <div class="swiper-pagination-container" style="--bg-url: url(/client/images/inner_header.jpg)">
                            <h2 style="width: 60%; text-align: center; line-height: 1;">${product.name}</h2>
                            <ul class="breadcrumb">
                                <li><a href="#">Home</a></li>
                                <li><a href="#">Products</a></li>
                                <li><a href="#">Vietnamese Robusta Green Coffee Beans</a></li>
                                <li><a href="#" class="current-breadcrumb">${product.name}</a></li>
                            </ul>
                        </div>
                    </section>


                    <section class="product-detail-container">
                        <div class="pro-dt-wrapper width-container">
                            <div class="product-dt-img pro-dt" style="position: relative;">
                                <img width="600" height="600" src="/images/product/${product.image}" alt="">
                                <c:if test="${(product.status.name).equals('Sale')}">
                                    <div class="lte-img-sale" style="left: 15px !important; top: 0;"><span>sale</span>
                                    </div>
                                </c:if>
                            </div>
                            <div class="product-dt-desc pro-dt">
                                <div class="pro-dt-header">
                                    <h1>
                                        ${product.name}</h1>
                                </div>

                                <div class="pro-dt-breadcrumb">
                                    <ul class="pro-breadcrumb">
                                        <li><a href="#">Home</a></li>
                                        <li><a href="#">Vietnamese Robusta Green Coffee Beans</a></li>
                                        <li><a href="#">${product.name}</a></li>
                                    </ul>
                                </div>

                                <div class="pro-dt-desc">
                                    <div class="lte-price" style="font-size: 25px; margin-bottom: 10px;">
                                        <span>$${product.price + 1.0}</span>
                                        $${product.price}
                                    </div>
                                    <ul class="pro-desc">
                                        <li><span>Moisture: </span>2.5% max</li>
                                        <li><span>Foreign Matters: </span>0.5% max</li>
                                        <li><span>Black Beans: </span>0.1% max</li>
                                        <li><span>Broken Beans: </span>0.1% max</li>
                                        <li><span>Screen Size: </span>90% min above sieve No.18, No.16</li>
                                        <li><span>Packing: </span>Jute bag</li>
                                        <li><span>Net Weight: </span>60 kgs</li>
                                    </ul>
                                </div>

                                <form class="cart" action="/add-product-to-cart/${product.id}" method="post"
                                    style="gap: 20px ; justify-content: start !important;">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <input type="number" name="quantity" min="1" value="1" step="1"
                                        style="width: 25%; ">

                                    <span class="lte-btn-wrap"><button type="submit" name="add-to-cart" value="42105"
                                            class="cart-btn" fdprocessedid="r3ri7">Add to cart</button></span>

                                </form>
                                <div class="category">
                                    <div style="color: #4D8B55; font-weight: bolder; font-size: 18px;     font-family: var(--font-family-desc);
">Category:
                                        <span
                                            style="color: black; font-weight: normal;">${product.category.getName()}</span>
                                    </div style="color: 4D8B55;">
                                </div>

                            </div>
                        </div>
                    </section>

                    <section class="product-desc-container">
                        <div class="pro-desc-wrapper width-container">
                            <h1>Coffee Beans Product Information</h1>
                            <div class="pro-desc-header">

                                <h2 class="header-desc" style="font-weight: normal; font-size: 18px;"><span
                                        style="font-weight: bolder;">Detail: </span>
                                    ${product.detailDesc}</h2>
                                <h2 class="header-desc">Discover the Excellence of Vietnam's ${product.name}
                                </h2>
                                <p>${product.shortDesc}</p>
                            </div>

                            <div class="pro-desc-spec">
                                <h2 class="header-desc">Specifications:</h2>
                                <ul class="pro-desc">
                                    <li><span class="bolder-span">Moisture: </span>2.5% max</li>
                                    <li><span class="bolder-span">Foreign Matters: </span>0.5% max</li>
                                    <li><span class="bolder-span">Black Beans: </span>0.1% max</li>
                                    <li><span class="bolder-span">Broken Beans: </span>0.1% max</li>
                                    <li><span class="bolder-span">Screen Size: </span>90% min above sieve No.18, No.16
                                    </li>
                                    <li><span class="bolder-span">Packing: </span>Jute bag</li>
                                    <li><span class="bolder-span">Net Weight: </span>60 kgs</li>
                                </ul>
                            </div>
                            <div class="pro-desc-spec">
                                <h2 class="header-desc">Origin:</h2>
                                <ul class="pro-desc">
                                    <li><span class="bolder-span">Country: </span>Vietnam</li>
                                    <li><span class="bolder-span">Port of Loading (POL): </span>Ho Chi Minh Port,
                                        Vietnam
                                    </li>
                                </ul>
                            </div>

                            <div class="pro-desc-spec">
                                <h2 class="header-desc">Contact Information:</h2>
                                <ul class="pro-desc">
                                    <li><span class="bolder-span">Whatsapp: </span>+84 789 818 828</li>
                                    <li><span class="bolder-span">Email: </span>info@helenacoffee.vn</li>
                                </ul>
                                <p>The above-mentioned prices are FOB Ho Chi Minh, excluding international freight
                                    charges,
                                    import
                                    duties, taxes, and other charges at the destination ports, which are the
                                    responsibility
                                    of the
                                    buyer.</p>
                                <p>We offer flexible payment terms and various shipping options, which can be discussed
                                    further based on
                                    your order volume and delivery requirements. Our team strives to provide timely and
                                    efficient
                                    deliveries, ensuring optimal customer satisfaction.</p>
                                <p>In order to provide you with a seamless experience, we would be grateful if you could
                                    provide more
                                    information regarding your targeted order quantities, specific quality requirements,
                                    and
                                    preferred
                                    packaging options. This will help us tailor our services to best meet your needs and
                                    provide a more
                                    detailed proposal.</p>
                                <p>We look forward to establishing a strong business relationship with your esteemed
                                    organization, and
                                    we hope to assist you in meeting your coffee-sourcing objectives. Should you have
                                    any
                                    further
                                    questions or require additional information, please feel free to reach out to us at
                                    your
                                    convenience.</p>
                                <P>Should you need any further assistance or wish to discuss coffee prices, please feel
                                    free
                                    to reach
                                    out to me via WhatsApp or Telegram at +84.789.818.828.</P>
                            </div>


                        </div>
                    </section>


                    <jsp:include page="../layout/footer.jsp" />

                </body>
                <script src="/client/js/layout.js"></script>

                <script src="/client/js/layout.js"></script>

                </html>