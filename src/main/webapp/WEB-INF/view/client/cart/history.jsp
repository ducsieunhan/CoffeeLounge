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
                                            <th class="product-thumbnail"></th>
                                            <th class="product-name">Product</th>
                                            <th class="product-price">Price</th>
                                            <th class="product-quantity">Quantity</th>
                                            <th class="product-subtotal">Subtotal</th>
                                            <th class="product-status">Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${ empty orders}">
                                            <tr style="margin-top: 3rem;">
                                                <td colspan="6">
                                                    There is no order in your history
                                                </td>
                                            </tr>
                                        </c:if>
                                        <c:forEach var="order" items="${orders}">
                                            <tr class="cart-item">
                                                <td class="product-thumbnail">
                                                    <a href="" style="text-decoration: none; color: #000;">
                                                        Order id = ${order.id}
                                                    </a>
                                                </td>
                                                <td class="product-name">
                                                    <a href=""></a>
                                                </td>
                                                <td class="product-price">
                                                    <span>
                                                        $${order.total}</span>
                                                </td>
                                                <td class="product-quantity">
                                                    <div class="quantity">

                                                    </div>
                                                </td>
                                                <td class="product-subtotal">
                                                    <span data-cart-detail-id="">
                                                        <fmt:formatNumber type="number" value="" />
                                                    </span>
                                                </td>
                                                <td class="product-status">
                                                    <a href="" style="text-decoration: none; color: #000;">
                                                        ${order.status}
                                                    </a>
                                                </td>
                                            </tr>
                                            <c:forEach var="od" items="${order.orderDetails}">
                                                <tr class="cart-item">

                                                    <td class="product-thumbnail">
                                                        <a href="">
                                                            <img width="480" height="480"
                                                                src="/images/product/${od.product.image}" alt="">
                                                        </a>
                                                    </td>
                                                    <td class="product-name">
                                                        <a href="">${od.product.name}</a>
                                                    </td>
                                                    <td class="product-price">
                                                        <span>$${od.price}</span>
                                                    </td>
                                                    <td class="product-quantity">
                                                        <div class="quantity">
                                                            <input type="number" id="" class="quantity-input" name=""
                                                                value="${od.quantity}" title="Qty" size="4" min="0"
                                                                max="" step="1" placeholder="" readonly="true" />
                                                        </div>
                                                    </td>
                                                    <td class="product-subtotal">
                                                        <span data-cart-detail-id="">$${od.price}
                                                            <fmt:formatNumber type="number" value="" />
                                                        </span>
                                                    </td>
                                                    <td class="product-status">
                                                        <a href=""></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </section>







                    <jsp:include page="../layout/footer.jsp" />




                </body>



                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

                <script>




                    $('.quantity-input').each(function () {
                        $(this).on('input change', function () {
                            const input = $(this);
                            const currentValue = input.val();
                            const price = input.attr("data-cart-detail-price");
                            const id = input.attr("data-cart-detail-id");

                            // Update item price
                            const priceElement = $("span[data-cart-detail-id=".concat(id, "]"));
                            if (priceElement) {
                                console.log(id);

                                const newPrice = +price * currentValue;
                                priceElement.text(newPrice.toFixed(2));
                            }

                            const index = input.attr("data-cart-detail-index");
                            const el = document.getElementById("cartDetails".concat(index, ".quantity"));
                            if (el) {
                                $(el).val(currentValue);
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
                                    $(this).text("$ " + newTotal.toFixed(2));
                                    $(this).attr("data-cart-total-price", newTotal);
                                });
                            }
                        }
                        )
                    });

                </script>
                <script src="/client/js/layout.js"></script>


                </html>