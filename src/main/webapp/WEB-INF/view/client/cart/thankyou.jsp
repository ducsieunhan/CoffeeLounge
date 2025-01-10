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


                    <div style="font-size: 4rem; text-align: center; font-weight: bold;">Thank You!</div>


                    <jsp:include page="../layout/footer.jsp" />




                </body>



                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="/client/js/layout.js"></script>

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

                </html>