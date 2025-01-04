document.addEventListener('DOMContentLoaded', () => {
    const bullets = document.querySelectorAll('.swiper-pagination-bullet');
    const swiperContainer = document.querySelector('.swiper-pagination-container');

    const swiperImages = [
        'https://ngoncoffeeroasters.com/wp-content/uploads/2023/12/delicious-iced-coffee-table.jpg.webp',
        'https://images.pexels.com/photos/264487/pexels-photo-264487.jpeg',
        'https://images.pexels.com/photos/4226806/pexels-photo-4226806.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ];

    bullets.forEach((bullet, index) => {
        bullet.addEventListener('click', () => {
            bullets.forEach(b => b.classList.remove('bullet-active'));

            bullet.classList.add('bullet-active');

            swiperContainer.style.backgroundImage = `url(${swiperImages[index]})`;
        });
    });



    var swiper = new Swiper(".slide-container", {
        slidesPerView: 4,
        spaceBetween: 20,
        slidesPerGroup: 4,
        loop: true,
        centerSlide: "true",
        fade: "true",
        grabCursor: "true",
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
            dynamicBullets: true,
        },
        navigation: {
            nextEl: ".swiper-button-prev",
            prevEl: ".swiper-button-next",
        },

        breakpoints: {
            0: {
                slidesPerView: 1,
            },
            520: {
                slidesPerView: 2,
            },
            768: {
                slidesPerView: 3,
            },
            1000: {
                slidesPerView: 4,
            },
        },
    });


    // <--------- type section --------> 

    const typeBox = document.getElementById('type-image-box_wrap');

    const typeImg = [
        {
            imgSrc: "https://ngoncoffeeroasters.com/wp-content/uploads/2023/12/icons8-vietnam-drip-96.png",
            desc: "Phin Filter"
        },
        {
            imgSrc: "https://ngoncoffeeroasters.com/wp-content/uploads/2023/12/icons8-ice-coffee-96.png",
            desc: "Iced Coffee"
        },
        {
            imgSrc: "https://ngoncoffeeroasters.com/wp-content/uploads/2023/12/icons8-espresso-96.png",
            desc: "Expresso"
        },
        {
            imgSrc: "https://ngoncoffeeroasters.com/wp-content/uploads/2023/12/icons8-dripper-96.png",
            desc: "Pour over"
        },
        {
            imgSrc: "https://ngoncoffeeroasters.com/wp-content/uploads/2023/12/icons8-cold-brew-96.png",
            desc: "Cold Brew"
        },
        {
            imgSrc: "https://ngoncoffeeroasters.com/wp-content/uploads/2023/12/icons8-french-press-96.png",
            desc: "French Press"
        }
    ]

    typeImg.forEach(type => {
        typeBox.innerHTML += `
                        <div class="type-card">
                            <div class="type-card-img">
                                <img src="${type.imgSrc}">
                            </div>
                            <div class="type-card-desc"><span>${type.desc}</span></div>
                        </div> 
        `
    })
    // document.addEventListener('scroll', () => {
    //     const scroller = window.scrollY;
    //     const parallexImg = document.querySelector('.video-statistic');

    //     if (parallexImg) {
    //         const speed = 0.9;
    //         parallexImg.style.transform = `translateY(${scroller * speed}px)`;
    //     }
    // });


    const dropdownToggle = document.querySelector('.dropdown-toggle');
    const userDropdown = document.querySelector('.user-dropdown');

    dropdownToggle.addEventListener('click', function (e) {
        e.preventDefault();
        userDropdown.classList.toggle('active');
    });

    // Đóng dropdown khi click ra ngoài
    document.addEventListener('click', function (e) {
        if (!userDropdown.contains(e.target)) {
            userDropdown.classList.remove('active');
        }
    });


});





