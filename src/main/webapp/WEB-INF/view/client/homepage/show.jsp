<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Document</title>
                <link rel="stylesheet" href="/client/css/homepage/homepage.css">
                <link rel="stylesheet" href="/client/css/layout/layout.css">
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Hind+Mysuru:wght@300;400;500;600;700&family=Playfair+Display:ital,wght@0,400..900;1,400..900&family=Special+Elite&display=swap"
                    rel="stylesheet">

            </head>
            <style>
                .swiper-pagination-container {
                    color: white;
                    font-family: "Hind Mysuru", sans-serif;

                    .heading-content {
                        color: white;
                        font-size: 60px;
                        text-align: center;

                        h1 {
                            line-height: 1;
                            margin-bottom: 2rem;

                            span {
                                color: var(--highlight-text);
                            }

                        }
                    }

                    p {
                        font-size: 18px;
                    }
                }

                .background-leaf {
                    height: 50vh;
                    position: relative;

                    .coffee-image {
                        background-image: url(/client/images/products/leaves_pattern_010.png);
                        background-color: #4D8B55;
                    }
                }
            </style>

            <body>

                <jsp:include page="../layout/header.jsp" />

                <section class="swiper-container" style="margin-bottom: 4rem; height: auto;">
                    <div class="swiper-pagination-container" style="--bg-url: url(/client/images/homepage.jpg) ; height: 100vh;
        background: linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.8)), var(--bg-url);">
                        <div class="heading-content">
                            <h1><span>Vietnam</span> <br>Coffee Exporter</h1>
                        </div>
                        <p>Helena Coffee Vietnam Processing & Export in Vietnam | Helena., JSC</p>
                    </div>

                    <div class="background-leaf">
                        <div class="coffee-image">
                            <img src="/client/images/coffee-bean.png" alt="">
                        </div>
                    </div>
                </section>

                <section class="review-container">
                    <div class="review-wrapper width-container">
                        <div class="review-script">
                            <div class="rv-script-text">
                                <h2 class="review-head">Helena Coffee Vietnam | Helena., JSC</h2>
                                <h2 class="review-sc-head">Vietnam Coffee Exporter, Manufacturer & Supplier</h2>
                                <p class="review-text">Helena Coffee Processing & Export in Vietnam | Helena., JSC,
                                    which was
                                    established in 2016, is a Vietnamese coffee exporter, manufacturer & supplier.
                                    We
                                    provide the
                                    most prevalent varieties of coffee grown in Vietnam’s renowned producing
                                    regions.
                                    After years of
                                    growth, we have become one of the most well-known coffee production and export
                                    enterprises in
                                    Vietnam. Our coffee beans (Robusta & Arabica) are now exported and consumed in a
                                    variety of
                                    countries and areas across the world, including China, Taiwan, Thailand,
                                    Singapore,
                                    Ukraine, the
                                    United States, etc.</p>
                            </div>
                            <div class="rv-btn">
                                <a href="">Read More</a>
                                <a href="">Shop now</a>
                            </div>
                        </div>
                        <div class="review-img">
                            <img src="/client/images/homepage/shape_about-phz2w1rzmktwwm0dgfa3l819clptw3onlfbv26oqxu.jpg"
                                alt="">
                            <span>2024</span>
                        </div>
                    </div>
                </section>




                <!-- <section class="elementor-section">
        <div class="elementor-container width-container">
            <div class="elementor-column">

                <div class="elementor-element elementor-element-script">
                    <div class="heading-secondary-wrap">
                        <h4 class="heading-secondary">Life is too short for bad coffee.</h4>
                    </div>
                    <div class="heading-primary-wrap">
                        <h2 class="heading-primary">Feel better with a 'Ngon' (Tasty) Vietnamese Coffee 😍</h2>
                    </div>
                </div>

                <div class="elementor-element elementor-element-image">

                    <div class="elementor-widget-container">

                        <div class="tm-image-box">
                            <div class="tm-image">
                                <img src="https://ngoncoffeeroasters.com/wp-content/uploads/2023/12/1-1.png.webp" alt=""
                                    width="600" height="900">
                            </div>
                            <div class="tm-content">
                                <h3>Signature Blends</h3>
                                <div>Try our convenient protein-packed smoothies!</div>
                            </div>
                        </div>

                        <div class="tm-image-box">
                            <div class="tm-image">
                                <img src="https://ngoncoffeeroasters.com/wp-content/uploads/2023/12/2-1.png.webp" alt=""
                                    width="600" height="900">
                            </div>
                            <div class="tm-content">
                                <h3>Signature Blends</h3>
                                <div>Try our convenient protein-packed smoothies!</div>
                            </div>
                        </div>

                        <div class="tm-image-box">
                            <div class="tm-image">
                                <img src="https://ngoncoffeeroasters.com/wp-content/uploads/2023/12/3.png.webp" alt=""
                                    width="600" height="900">
                            </div>
                            <div class="tm-content">
                                <h3>Signature Blends</h3>
                                <div>Try our convenient protein-packed smoothies!</div>
                            </div>
                        </div>

                        <div class="tm-image-box">
                            <div class="tm-image">
                                <img src="https://ngoncoffeeroasters.com/wp-content/uploads/2023/12/4.png.webp" alt=""
                                    width="600" height="900">
                            </div>
                            <div class="tm-content">
                                <h3>Signature Blends</h3>
                                <div>Try our convenient protein-packed smoothies!</div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </section> 


    <section class="review-section">
        <div class="review-container width-container">
            <div class="review-column">

                <div class="review-element review-element-script">
                    <div class="heading-primary-wrap">
                        <h2 class="heading-primary">We bring the taste of Vietnam to your doorstep</h2>
                    </div>
                    <div class="heading-description-wrap">
                        <p class="heading-description">What makes our coffee beans so 'phe'? We deliver the
                            authenticity and uniqueness of Vietnamese Coffee to every corner of the world, consistent
                            and uncompromised.</p>
                    </div>
                </div>

                <div class="review-element review-element-image">

                    <div class="review-widget-container">

                        <div class="tm-image-box">
                            <div class="tm-image">
                                <img src="https://ngoncoffeeroasters.com/wp-content/uploads/2023/12/We-bring-the-taste-of-Vietnam-to-your-doorstep-1.png.webp"
                                    alt="" width="600" height="900">
                            </div>
                            <div class="tm-content">
                                <h3>Direct from Dak Lak Highlands</h3>
                                <div>
                                    Dak Lak, the central highlands of Vietnam, is the world's largest grower of Robusta
                                    beans thanks to its ideal climate and fertile volcanic soil. Now, it's beginning to
                                    produce some quality Arabica beans.</div>
                            </div>
                        </div>

                        <div class="tm-image-box">
                            <div class="tm-image">
                                <img src="https://ngoncoffeeroasters.com/wp-content/uploads/2023/12/We-bring-the-taste-of-Vietnam-to-your-doorstep-2.png"
                                    alt="" width="600" height="900">
                            </div>
                            <div class="tm-content">
                                <h3>100% Hand-picked</h3>
                                <div>
                                    At the peak of ripeness, the coffee cherries are hand-picked to guarantee a
                                    delightful and full-bodied coffee experience. Then the beans are carefully washed to
                                    preserve a pure and clear taste.</div>
                            </div>
                        </div>

                        <div class="tm-image-box">
                            <div class="tm-image">
                                <img src="https://ngoncoffeeroasters.com/wp-content/uploads/2023/12/We-bring-the-taste-of-Vietnam-to-your-doorstep-3.png.webp"
                                    alt="" width="600" height="900">
                            </div>
                            <div class="tm-content">
                                <h3>17 Years of Roasting</h3>
                                <div>
                                    At our coffee roastery, we believe in keeping things simple and consistent. That's
                                    why we take pride in roasting our coffee beans using traditional recipe for that
                                    authentic and rich taste.</div>
                            </div>
                        </div>


                    </div>

                </div>
            </div>
        </div>
    </section>




    <section class="type-section">
        <div class="type-container width-container">
            <div class="type-column">

                <div class="type-heading">
                    <h2 class="type-heading-primary">Brew the way you like!</h2>
                    <p class="type-heading-description">Everybody's brewing experience is valued in our inclusive coffee
                        culture. There's no right or wrong method to follow! You've done it perfectly if it tastes
                        amazing to you! Cheers!</p>
                </div>
                <div class="type-image-box" id="type-image-box">
                    <div class="type-image-box_wrap" id="type-image-box_wrap">

                    </div>
                </div>
                <div class="type-dicover-button">
                    <div class="type-btn-wrapper">
                        <a href="#" class="type-btn">
                            Discover Our Brew Guide
                        </a>
                    </div>
                </div>

            </div>
        </div>
    </section> -->


                <section class="factory-container">
                    <div class="factory-wrapper">
                        <div class="f-cart" style="--f-cart: url(/client/images/homepage/Helena-Coffee-Factory.webp) ">
                            <h3>Our Coffee Factory</h3>
                            <p>Providing high quality Robusta and Arabica</p>
                        </div>
                        <div class="f-cart"
                            style="--f-cart: url(/client/images/homepage/Helena-Coffee-Processing-Machines.jpg) ">
                            <h3>Coffee Processing Machines</h3>
                            <p>Helena has invested into modern coffee processing factories</p>
                        </div>
                        <div class="f-cart" style="--f-cart: url(/client/images/homepage/Vietnam-Coffee-Exporter.jpg)">
                            <h3>Robusta Coffee Warehouse</h3>
                            <p>Meet the needs of global customers of more than 10,000 tons a year</p>
                        </div>
                        <div class="f-cart" style="--f-cart: url(/client/images/homepage/Arabica-Coffee-Warehouse.jpg)">
                            <h3>Arabica Coffee Warehouse</h3>
                            <p>Supply into the supply chain 5000 tons per year</p>
                        </div>
                    </div>
                </section>

                <section class="quality-container">
                    <div class="quality-wrapper">
                        <h1>Best Quality Coffee Beans</h1>
                        <div class="quality-desc">
                            <h2>Helena Coffee Vietnam - Vietnamese Coffee Exporter, Manufacturer & Supplier is
                                devoted
                                to being a
                                <span>trusted partner</span> to the coffee industry and provides <span>consistency
                                </span> through
                                contemporary, flexible processing, efficient logistics.</h6>
                        </div>
                        <div class="quality-img">
                            <div class="q-img-cart">
                                <div class="q-img-container">
                                    <div class="q-img"
                                        style="--quality-url: url(/client/images/homepage/Arabica-Fully-Washed-S18.jpg);">
                                    </div>
                                    <div class="q-number">01</div>
                                </div>
                                <h2>Vietnamese Arabica Green Coffee Beans</h2>
                                <p><strong>Helena's Vietnamese Arabica Green Coffee Beans</strong>
                                    have grown at altitudes
                                    <em><strong>above 1200 MASL</strong></em>
                                    and from the most prevalent varieties of coffee grown in Vietnam's renowned
                                    producing regions
                                    <em><strong>Lam Dong, Quang Tri, and Son La</strong></em>
                                    growing Arabica coffee varieties such as
                                    <em><strong>Catimor, Caturra, Typica, Bourbon</strong></em>
                                    ...etc.
                                </p>
                            </div>

                            <div class="q-img-cart">
                                <div class="q-img-container">
                                    <div class="q-img" style="--quality-url: url(/client/images/homepage/Wet-processed-Robusta-Roasted-Coffee-Supplier-2.jpg); 
                        ">
                                    </div>
                                    <div class="q-number">02</div>
                                </div>
                                <h2>Vietnamese Robusta Green Coffee Beans</h2>
                                <p><strong>Helena's Vietnamese Robusta Green Coffee Beans</strong> are grown from an
                                    altitude of
                                    <strong>over 800m</strong> above sea level with extraordinarily abundant and
                                    high-quality output
                                    from the locality in the central highlands in Vietnam, such as
                                    <em><strong>Daklak,
                                            Daknong, Gia
                                            Lai,
                                            Lam Dong, etc.</strong></em>
                                </p>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="together-container">
                    <div class="together-wrapper">

                        <div class="together-img-1" style="--together-background: url(/client/images/homepage/Helena-Coffee-Beans-01-1.jpg)
                background-image: url(/client/images/homepage/Helena-Coffee-Beans-01-1.jpg); ">
                        </div>
                        <div class="togther-img-background"
                            style="--together-background: url(/client/images/homepage/branch-bg.png)">
                            <h2><span>Together</span>We make <br>A Better Worl
                            </h2>
                            <p>Coffee is not just about how it tastes, not just about how it keeps us awake. But
                                also
                                about
                                Community and Environment</p>
                            <a href="together-btn">Read More</a>
                        </div>
                        <div class="together-img-2" style="--together-background: url(/client/images/homepage/Helena-Coffee.jpg); 
            background-image: url(/client/images/homepage/Helena-Coffee.jpg);
            ">
                        </div>

                    </div>
                </section>

                <section class="cup-container">
                    <div class="cup-wrapper width-container">
                        <div class="left-cup-container">
                            <div class="icon-desc">
                                <i class="fa-solid fa-droplet"></i>
                                <div class="icon-text">
                                    <h4>100% Riped</h4>
                                    <p>Better quality thanks to strict selection of 100% ripe coffee beans.</p>
                                </div>
                            </div>
                            <div class="icon-desc">
                                <i class="fa-solid fa-pen"></i>
                                <div class="icon-text">
                                    <h4>Wide Assortment</h4>
                                    <p>Vietnam Organic Coffee Bean, superfine taste of original coffee, the best
                                        start
                                        for a
                                        roasting</p>
                                </div>
                            </div>
                            <div class="icon-desc">
                                <i class="fa-solid fa-wand-magic-sparkles"></i>
                                <div class="icon-text">
                                    <h4>Proper Processing</h4>
                                    <p>Helena has coffee in all processing method you need. Honey, Washed, Dry,
                                        Natural,....</p>
                                </div>
                            </div>
                        </div>
                        <div class="middle-cup-container">
                            <img src="/client/images/homepage/CUP_collage.jpg" alt="">
                        </div>
                        <div class="right-cup-container">
                            <div class="icon-desc">
                                <div class="icon-text" style="text-align: end;">
                                    <h4>High Quality</h4>
                                    <p>Selection of the best coffee beans from the highland of Vietnam</p>
                                </div>
                                <i class="fa-solid fa-cloud"></i>
                            </div>
                            <div class="icon-desc">
                                <div class="icon-text" style="text-align: end;">
                                    <h4>Conservation</h4>
                                    <p>Helena doing everything possible to ensure natural environments are protected
                                        and
                                        conserved
                                    </p>
                                </div>
                                <i class="fa-solid fa-cloud-arrow-up"></i>

                            </div>
                            <div class="icon-desc">
                                <div class="icon-text" style="text-align: end;">
                                    <h4>Local Communities</h4>
                                    <p>HELENA is fully aware of the responsibility needed to help support and work
                                        with
                                        these
                                        communities</p>
                                </div>
                                <i class="fa-regular fa-sun"></i>

                            </div>
                        </div>

                    </div>
                </section>

                <section class="video-container">
                    <div class="video-wrapper">
                        <div class="video-watch ">
                            <div class="overlay-dark"></div>
                            <div class="video-desc">
                                <h2>How We Produce Coffee Beans</h2>
                                <h2>Watch Video</h2>
                                <a href=""><i class="fa-solid fa-play"></i></a>
                            </div>
                        </div>
                        <div class="video-statistic">
                            <div class="v-statistic">
                                <h2>55</h2>
                                <h5>Countries Import</h5>
                            </div>
                            <div class="v-statistic">
                                <h2>500</h2>
                                <h5>Farmers</h5>
                            </div>
                            <div class="v-statistic">
                                <h2>2200</h2>
                                <h5>Coffee Pickers</h5>
                            </div>
                            <div class="v-statistic">
                                <h2>100</h2>
                                <h5>Tons / Day</h5>
                            </div>
                            </div.>
                        </div>
                </section>

                <section class="partners-container">
                    <div class="partners-wrapper width-container">
                        <h1>Our Partners</h1>
                        <div class="icon-partner">
                            <img src="/client/images/homepage/partners/caribou-coffee.png" alt="">
                            <img src="/client/images/homepage/partners/lavazza-coffee.png" alt="">
                            <img src="/client/images/homepage/partners/Le-Cafe.png" alt="">
                            <img src="/client/images/homepage/partners/Luckin-coffee.png" alt="">
                            <img src="/client/images/homepage/partners/new-logo-medium.png" alt="">
                            <img src="/client/images/homepage/partners/tully-coffee.png" alt="">
                        </div>
                    </div>
                </section>

                <section class="products-section">
                    <div class="products-container ">
                        <div class="products-wrap">
                            <div class="product-header width-container">
                                <h4>Online Store</h4>
                                <h2>Meet Our Bestsellers</h2>
                                <p>Helena Coffee Vietnam | Vietnam Coffee Manufacturer, Supplier & Exporter provides
                                    high-quality
                                    green coffee beans, roasted coffee beans, and instant coffee powder of Vietnam
                                    origin.
                                </p>
                            </div>

                            <div class="slide-container" style="overflow:hidden;">
                                <div class="products-list swiper-wrapper">

                                    <c:forEach var="product" items="${products}">
                                        <div class="product-wrapper swiper-slide">
                                            <div class="product-detail">
                                                <div class="product-thumbnail">
                                                    <a href="/product/${product.id}">
                                                        <img class="product-img" src="/images/product/${product.image}"
                                                            alt="">
                                                    </a>
                                                    <div class="product-action">
                                                        <a class="fa-regular fa-star rounded-highlight icon-tooltip icon-display-left"
                                                            data-message="Add to Favorites"></a>
                                                    </div>
                                                    <div class="product-actions">
                                                        <form class="" action="/add-product-to-cart/${product.id}"
                                                            method="post">
                                                            <input type="hidden" name="${_csrf.parameterName}"
                                                                value="${_csrf.token}" />
                                                            <button
                                                                class="a-action fa-solid fa-bag-shopping rounded-highlight icon-tooltip icon-display-up"
                                                                data-message="Add to Cart"
                                                                style="border: none; cursor: pointer;"></button>
                                                        </form>

                                                        <a class="a-action fa-regular fa-eye rounded-highlight icon-tooltip icon-display-up"
                                                            data-message="View Details"></a>
                                                    </div>
                                                </div>
                                                <div class="product-inf">
                                                    <a href="/product/${product.id}">${product.name}</a>
                                                    <div class="product-price"
                                                        style="display: flex; justify-content: center;">
                                                        <del style="color: gray; height: 0.5px; margin-right: 10px;">
                                                            <h4 style="color: gray !important;"><span
                                                                    style="color: gray !important;">$</span>${product.price}
                                                            </h4>
                                                        </del>
                                                        <h4 style="color: red !important;"><span
                                                                style="color: red !important;">$</span>${product.price}
                                                        </h4>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="background-color-expand">
                                            </div>
                                        </div>
                                    </c:forEach>

                                </div>
                                <div class="swiper-btn">
                                    <div class="swiper-button-next swiper-navBtn fa-solid fa-caret-left"></div>
                                    <div class="swiper-button-prev swiper-navBtn fa-solid fa-caret-right"></div>
                                </div>

                            </div>
                        </div>



                    </div>
                </section>

                <section class="news-section">
                    <div class="news-wrapper width-container">
                        <h2>Coffee News</h2>
                        <div class="coffee-news">
                            <div class="coffee-content">
                                <img src="/client/images/homepage/EUDR-300x200.png" alt="">
                                <h3>Understanding the European Union’s Anti-Deforestation Regulation (EUDR)</h3>
                                <h6>December 18, 2024 </h6>
                                <p>What is the EUDR? The EU Deforestation-free Regulation (EUDR) is a significant
                                    initiative by the
                                    European Union aimed at combating global deforestation and forest degradation.
                                </p>
                                <a href="">Read More</a>
                            </div>
                            <div class="coffee-content">
                                <img src="/client/images/homepage/EUDR-300x200.png" alt="">
                                <h3>Understanding the European Union’s Anti-Deforestation Regulation (EUDR)</h3>
                                <h6>December 18, 2024 </h6>
                                <p>What is the EUDR? The EU Deforestation-free Regulation (EUDR) is a significant
                                    initiative by the
                                    European Union aimed at combating global deforestation and forest degradation.
                                </p>
                                <a href="">Read More</a>
                            </div>
                            <div class="coffee-content">
                                <img src="/client/images/homepage/EUDR-300x200.png" alt="">
                                <h3>Understanding the European Union’s Anti-Deforestation Regulation (EUDR)</h3>
                                <h6>December 18, 2024 </h6>
                                <p>What is the EUDR? The EU Deforestation-free Regulation (EUDR) is a significant
                                    initiative by the
                                    European Union aimed at combating global deforestation and forest degradation.
                                </p>
                                <a href="">Read More</a>
                            </div>
                            <div class="coffee-content">
                                <img src="/client/images/homepage/EUDR-300x200.png" alt="">
                                <h3>Understanding the European Union’s Anti-Deforestation Regulation (EUDR)</h3>
                                <h6>December 18, 2024 </h6>
                                <p>What is the EUDR? The EU Deforestation-free Regulation (EUDR) is a significant
                                    initiative by the
                                    European Union aimed at combating global deforestation and forest degradation.
                                </p>
                                <a href="">Read More</a>
                            </div>
                        </div>
                        <a href="" class="news-read">Read More</a>
                    </div>
                </section>

                <jsp:include page="../layout/footer.jsp" />
            </body>

            <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
            <script src="/client/js/homepage.js"></script>
            <script src="/client/js/layout.js"></script>

            </html>