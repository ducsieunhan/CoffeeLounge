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

                <style>
                    .invalid-feedback {
                        color: red;
                    }
                </style>

                <body>

                    <jsp:include page="../layout/header.jsp" />
                    <jsp:include page="../layout/swiper.jsp" />


                    <section class="cart-bill-container">
                        <div class="cart-bill-wrapper width-container">
                            <div class="billing-details">
                                <h2 class="bill-header">Billing details</h2>


                                <form:form action="/place-order" method="post" class="form-info" id="form-info"
                                    modelAttribute="placeOrder">

                                    <c:set var="errorFirstName">
                                        <form:errors path="firstName" cssClass="invalid-feedback" />
                                    </c:set>
                                    <c:set var="errorLastName">
                                        <form:errors path="lastName" cssClass="invalid-feedback" />
                                    </c:set>
                                    <c:set var="errorCountry">
                                        <form:errors path="country" cssClass="invalid-feedback" />
                                    </c:set>
                                    <c:set var="errorStreet">
                                        <form:errors path="street" cssClass="invalid-feedback" />
                                    </c:set>
                                    <c:set var="errorTown">
                                        <form:errors path="town" cssClass="invalid-feedback" />
                                    </c:set>
                                    <c:set var="errorPostcode">
                                        <form:errors path="postcode" cssClass="invalid-feedback" />
                                    </c:set>
                                    <c:set var="errorPhone">
                                        <form:errors path="phone" cssClass="invalid-feedback" />
                                    </c:set>
                                    <c:set var="errorEmail">
                                        <form:errors path="email" cssClass="invalid-feedback" />
                                    </c:set>

                                    <div class="name-row">
                                        <div class="f-name">
                                            <label for="fname">First name <span class="bill-important">*</span></label>
                                            <form:input path="firstName" type="text" id="firstname" name="firstname"
                                                class="input-text ${not empty errorFirstName ? 'is-invalid' : ''}" />
                                            ${errorFirstName}
                                        </div>
                                        <div class="l-name">
                                            <label for="fname">Last name <span class="bill-important">*</span></label>
                                            <form:input path="lastName" type="text" id="lastname" name="lastname"
                                                class="input-text ${not empty errorLastName ? 'is-invalid' : ''}" />
                                            ${errorLastName}
                                        </div>
                                    </div>
                                    <div class="country">
                                        <label for="fname">Country / Region <span
                                                class="bill-important ">*</span></label>
                                        <form:select path="country" name="country"
                                            class="form-control ${not empty errorCountry ? 'is-invalid' : ''} "
                                            id="country">
                                            <form:option value="United States">United States</form:option>
                                            <form:option value="China">China</form:option>
                                            <form:option value="India">India</form:option>
                                            <form:option value="United Kingdom">United Kingdom</form:option>
                                            <form:option value="Germany">Germany</form:option>
                                            <form:option value="France">France</form:option>
                                            <form:option value="Japan">Japan</form:option>
                                            <form:option value="Canada">Canada</form:option>
                                            <form:option value="Australia">Australia</form:option>
                                            <form:option value="Brazil">Brazil</form:option>
                                            <form:option value="Russia">Russia</form:option>
                                            <form:option value="South Korea">South Korea</form:option>
                                            <form:option value="Italy">Italy</form:option>
                                            <form:option value="Mexico">Mexico</form:option>
                                            <form:option value="Spain">Spain</form:option>
                                            <form:option value="Indonesia">Indonesia</form:option>
                                            <form:option value="Vietnam">Vietnam</form:option>
                                            <form:option value="Turkey">Turkey</form:option>
                                            <form:option value="South Africa">South Africa</form:option>
                                            <form:option value="Saudi Arabia">Saudi Arabia</form:option>
                                        </form:select>
                                        ${errorCountry}
                                    </div>
                                    <div class="street">
                                        <label for="fname">Street address <span class="bill-important">*</span></label>
                                        <form:input path="street" type="text" id="street" name="street"
                                            class="input-text ${not empty errorStreet ? 'is-invalid' : ''}" />
                                        ${errorStreet}
                                    </div>
                                    <div class="town">
                                        <label for="fname">Town / City <span
                                                class="bill-important">*</span></label></label>
                                        <form:input path="town" type="text" id="town" name="town"
                                            class="input-text ${not empty errorTown ? 'is-invalid' : ''}" />
                                        ${errorTown}
                                    </div>
                                    <div class="postcode">
                                        <label for="fname">Postcode / Zip <span class="bill-important">*</span></label>
                                        <form:input path="postcode" type="text" id="postcode" name="postcode"
                                            class="input-text ${not empty errorPostcode ? 'is-invalid' : ''}" />
                                        ${errorPostcode}
                                    </div>
                                    <div class="phone">
                                        <label for="fname">Phone <span class="bill-important">*</span></label>
                                        <form:input path="phone" type="text" id="phone" name="phone"
                                            class="input-text ${not empty errorPhone ? 'is-invalid' : ''}" />
                                        ${errorPhone}
                                    </div>
                                    <div class="email">
                                        <label for="fname">Email address <span class="bill-important">*</span></label>
                                        <form:input path="email" type="text" id="email" name="email"
                                            class="input-text ${not empty errorEmail ? 'is-invalid' : ''}" />
                                        ${errorEmail}
                                    </div>
                                    <div class="notes">
                                        <label for="fname">Order notes (optional)</label>
                                        <form:textarea path="notes" name="notes" id="notes" />
                                    </div>

                                </form:form>
                            </div>


                            <div class="order-details">
                                <h2 class="bill-header">Your order</h2>
                                <table class="bill-table">
                                    <tbody class="b-table-body">
                                        <c:forEach var="cartDetail" items="${cartDetails}" varStatus="status">
                                            <tr>
                                                <td class="b-product-name">
                                                    ${cartDetail.product.name}
                                                    <strong>x${cartDetail.quantity}</strong>
                                                </td>
                                                <td class="b-product-total">$${cartDetail.product.price *
                                                    cartDetail.quantity}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                    <tfoot>
                                        <tr class="b-cart-subtotal">
                                            <th>Subtotal</th>
                                            <td class=""><span>$${totalPrice}</span></td>
                                        </tr>

                                        <tr class="shipping">
                                            <th>Shipping</th>
                                            <td class="">
                                                <p>Shipping to anywhere: 50$ for 1kg. For orders above 1kg, please
                                                    contact
                                                    us via
                                                    WhatsApp
                                                    at +84 789 818 828 or email info@helenacoffee.vn to receive a custom
                                                    quote with
                                                    detailed
                                                    shipping costs to your location. Rates will vary based on total
                                                    weight
                                                    and
                                                    destination
                                                    country. We will provide competitive DHL/FedEx rates with full
                                                    transparency on all
                                                    fees
                                                    and taxes. Our team is happy to answer any questions and ensure you
                                                    receive the best
                                                    shipping price.: <span>$50.00</span></p>
                                            </td>
                                        </tr>
                                        <tr class="total">
                                            <th>Total</th>
                                            <td class=""><span>$${totalPrice}</span></td>
                                        </tr>
                                    </tfoot>
                                </table>

                                <div class="privacy">
                                    <p>Your personal data will be used to process your order, support your experience
                                        throughout this
                                        website, and for other purposes described in our privacy policy.</p>
                                </div>

                                <input type="submit" class="form-btn" style="border: none; cursor: pointer;"
                                    form="form-info"></input>

                            </div>


                        </div>
                    </section>


                    <jsp:include page="../layout/footer.jsp" />




                </body>

                </html>