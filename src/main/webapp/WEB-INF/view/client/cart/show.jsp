<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Document</title>
                    <link rel="stylesheet" href="/client/css/layout/layout.css">
                    <link rel="stylesheet" href="/client/css/cart/cart.css">
                    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css">
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Hind+Mysuru:wght@300;400;500;600;700&family=Playfair+Display:ital,wght@0,400..900;1,400..900&family=Special+Elite&display=swap"
                        rel="stylesheet">
                    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap"
                        rel="stylesheet">

                </head>

                <body>

                    <jsp:include page="../layout/header.jsp" />
                    <jsp:include page="../layout/swiper.jsp" />


                    <section class="cart-table-container">
                        <div class="cart-table-wrapper width-container">
                            <div action="" class="cart-table">
                                <table class="c-table">
                                    <thead>
                                        <tr>
                                            <th class="product-remove"></th>
                                            <th class="product-thumbnail"></th>
                                            <th class="product-name">Product</th>
                                            <th class="product-price">Price</th>
                                            <th class="product-quantity">Quantity</th>
                                            <th class="product-subtotal">Subtotal</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${ empty cartDetails}">
                                            <tr style="margin-top: 3rem;">
                                                <td colspan="6">
                                                    There is no product in your cart
                                                </td>
                                            </tr>
                                        </c:if>
                                        <c:forEach var="cartDetail" items="${cartDetails}">
                                            <tr class="cart-item">
                                                <td class="product-remove">
                                                    <form method="post" action="/delete-cart-product/${cartDetail.id}">
                                                        <input type="hidden" name="${_csrf.parameterName}"
                                                            value="${_csrf.token}" />
                                                        <button class=""
                                                            style="border: none; cursor: pointer; background-color: inherit; font-size: 22px; color: red; font-weight: bolder;">
                                                            <i class="fa fa-times text-danger"></i>
                                                        </button>
                                                    </form>
                                                </td>
                                                <td class="product-thumbnail">
                                                    <a href="">
                                                        <img width="480" height="480"
                                                            src="/images/product/${cartDetail.product.image}" alt="">
                                                    </a>
                                                </td>
                                                <td class="product-name">
                                                    <a href="">${cartDetail.product.name}</a>
                                                </td>
                                                <td class="product-price">
                                                    <span>$${cartDetail.product.price}</span>
                                                </td>
                                                <td class="product-quantity">
                                                    <div class="quantity">
                                                        <input type="number" id="" class="quantity-input" name=""
                                                            value="${cartDetail.quantity}"
                                                            data-cart-detail-id="${cartDetail.id}"
                                                            data-cart-detail-price="${cartDetail.price}" title="Qty"
                                                            size="4" min="0" max="" step="1" placeholder="">
                                                    </div>
                                                </td>
                                                <td class="product-subtotal">
                                                    <span data-cart-detail-id="${cartDetail.id}">$
                                                        <fmt:formatNumber type="number"
                                                            value="${cartDetail.price * cartDetail.quantity}" />
                                                    </span>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </section>

                    <section class="cart-sum-container">
                        <div class="cart-sum-wrapper width-container">
                            <table class="c-sum-table">
                                <tbody>
                                    <tr>
                                        <th>Subtotal</th>
                                        <td class="">
                                            <span class="mb-0" data-cart-total-price="${totalPrice}">$
                                                <fmt:formatNumber type="number" value="${totalPrice}" />
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Shipping</th>
                                        <td class="">
                                            <p>Shipping to anywhere: 50$ for 1kg. For orders above 1kg, please contact
                                                us
                                                via WhatsApp
                                                at +84 789 818 828 or email info@helenacoffee.vn to receive a custom
                                                quote
                                                with detailed
                                                shipping costs to your location. Rates will vary based on total weight
                                                and
                                                destination
                                                country. We will provide competitive DHL/FedEx rates with full
                                                transparency
                                                on all fees
                                                and taxes. Our team is happy to answer any questions and ensure you
                                                receive
                                                the best
                                                shipping price.: <span>$50.00</span></p>
                                            <p>Shipping to <span>Vatican</span>.</p>
                                            <h3>CHANGE ADDRESS <i class="fa-solid fa-truck"></i></h3>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Total</th>
                                        <td class="">
                                            <span class="mb-0" data-cart-total-price="${totalPrice}">$
                                                <fmt:formatNumber type="number" value="${totalPrice}" />
                                            </span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </section>
                    <div class="cart-checkout">
                        <a href="detail.html">Proceed to checkout</a>
                    </div>

                    <jsp:include page="../layout/footer.jsp" />




                </body>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

                <script>
                    $('.quantity-input').on('input change', function () {
                        const input = $(this);
                        const currentValue = input.val();
                        const price = input.attr("data-cart-detail-price");
                        const id = input.attr("data-cart-detail-id");

                        // Update item price
                        const priceElement = $(`span[data-cart-detail-id='${id}']`);
                        if (priceElement) {
                            const newPrice = +price * currentValue;
                            priceElement.text(newPrice.toFixed(2));
                        }

                        // Recalculate total by summing all items
                        const totalPriceElement = $('[data-cart-total-price]');
                        if (totalPriceElement.length) {
                            let newTotal = 0;
                            $('.quantity-input').each(function () {
                                const qty = $(this).val();
                                const price = $(this).attr('data-cart-detail-price');
                                newTotal += parseFloat(qty) * parseFloat(price);
                            });

                            totalPriceElement.each(function () {
                                $(this).text(newTotal.toFixed(2));
                                $(this).attr("data-cart-total-price", newTotal);
                            });
                        }
                    });
                </script>

                </html>