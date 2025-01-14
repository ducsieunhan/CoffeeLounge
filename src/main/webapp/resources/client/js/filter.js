document.addEventListener('DOMContentLoaded', () => {
    $('.filterBtn').each(function () {
        $(this).click(function (event) {
            let filterUrl = $(this).text().trim();

            const currentUrl = new URL(window.location.href);
            const searchParams = currentUrl.searchParams;

            searchParams.set('page', '1');
            searchParams.set('category', filterUrl);
            window.location.href = currentUrl.toString();
        })
    })


    $('.products-search').on('submit', function (event) {
        event.preventDefault();

        let searchUrl = $('.search-field').val().trim();
        if (!searchUrl) {
            alert("Please enter a search term.");
            return;
        }

        const currentUrl = new URL(window.location.href);
        const searchParams = currentUrl.searchParams;

        searchParams.set('page', '1');
        searchParams.set('name', searchUrl);

        window.location.href = currentUrl.toString();
    });

    const currentUrl = new URL(window.location.href);
    const selectedOrder = currentUrl.searchParams.get('orderby');

    if (selectedOrder) {
        $('#orderby').val(selectedOrder);
    }

    $('#orderby').change(function (event) {
        event.preventDefault();
        let orderbyUrl = $(this).val();
        const currentUrl = new URL(window.location.href);
        const searchParams = currentUrl.searchParams;

        searchParams.set('page', '1');
        searchParams.set('orderby', orderbyUrl);
        window.location.href = currentUrl.toString();

    });

    const selectedMin = parseInt(currentUrl.searchParams.get('min')) || 0;
    const selectedMax = parseInt(currentUrl.searchParams.get('max')) || 5500;

    const rangeMin = 0;
    const rangeMax = 5500;

    const percentMin = ((selectedMin - rangeMin) / (rangeMax - rangeMin)) * 100;
    const percentMax = ((selectedMax - rangeMin) / (rangeMax - rangeMin)) * 100;

    $('.input-min').val(selectedMin);
    $('.range-min').val(selectedMin);
    $('.input-max').val(selectedMax);
    $('.range-max').val(selectedMax);

    $('.slider .progress').css({
        left: `${percentMin}%`,
        right: `${100 - percentMax}%`,
    });

    $('#priceBtn').click(function (event) {
        event.preventDefault();
        let minUrl = $('.input-min').val();
        let maxUrl = $('.input-max').val();

        const currentUrl = new URL(window.location.href);
        const searchParams = currentUrl.searchParams;

        searchParams.set('page', '1');
        searchParams.set('min', minUrl);
        searchParams.set('max', maxUrl);
        window.location.href = currentUrl.toString();

    })
}); 