document.addEventListener('DOMContentLoaded', function () {
    const dropdownToggle = document.querySelector('.dropdown-toggle');
    const userDropdown = document.querySelector('.user-dropdown');

    dropdownToggle.addEventListener('click', function (e) {
        e.preventDefault();
        userDropdown.classList.toggle('active');
    });

    document.addEventListener('click', function (e) {
        if (!userDropdown.contains(e.target)) {
            userDropdown.classList.remove('active');
        }
    });
});