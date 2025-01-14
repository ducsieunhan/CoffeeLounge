document.addEventListener('DOMContentLoaded', () => {
    $('.filterBtn').each(function () {
        $(this).click(function (event) {
            let filterUrl = $(this).text().trim();

            const currentUrl = new URL(window.location.href);
            const searchParams = currentUrl.searchParams;

            searchParams.set('page', '1');
            searchParams.set('category', filterUrl);
            debugger
            window.location.href = currentUrl.toString();
        })
    })
}); 