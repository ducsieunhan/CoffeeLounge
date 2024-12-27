<!-- <section class="swiper-container">
    <div class="swiper-pagination-container" style="--bg-url: url(/client/images/cart/Helena-Coffee-Vietnam-19.jpg)">
        <h2 style="width: 60%; text-align: center; line-height: 1;">Cart</h2>
        <ul class="breadcrumb">
            <li><a href="#">Home</a></li>
            <li><a href="#" class="current-breadcrumb">Cart</a></li>
        </ul>
    </div>
</section> -->

<% String bgUrl=request.getParameter("bgUrl"); if (bgUrl==null) {
    bgUrl="/client/images/cart/Helena-Coffee-Vietnam-19.jpg" ; } %>

    <section class="swiper-container">
        <div class="swiper-pagination-container" style="--bg-url: url(<%=bgUrl%>)">
            <h2 style="width: 60%; text-align: center; line-height: 1;">${page_name}</h2>
            <ul class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li><a href="#" class="current-breadcrumb">${page_name}</a></li>
            </ul>
        </div>
    </section>