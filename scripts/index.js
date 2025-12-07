gsap.registerPlugin(ScrollTrigger);

window.addEventListener('DOMContentLoaded', () => {
    if (window.innerWidth > 1024) {
        // Set inicial dos cards usando GSAP
        gsap.set('#card1, #card2, #card3', {
            opacity: 0,
            scale: 0.8
        });

        // Timeline + ScrollTrigger
        const tl = gsap.timeline({
            scrollTrigger: {
                trigger: '.art-cards',
                start: 'top center',   // começa quando a seção chega ao centro
                end: 'center bottom',
                scrub: false,
                pin: true,
                toggleActions: 'play none none none'
            }
        });

        tl.to('#card1', {
            opacity: 1,
            scale: 1,
            boxShadow: "0 0 25px rgba(255,255,255,0.15), 0 10px 25px rgba(0,0,0,0.9)",
            duration: 0.3,
            ease: 'power3.out'
        });

        tl.to('#card2', {
            opacity: 1,
            scale: 1,
            boxShadow: "0 0 25px rgba(255,255,255,0.15), 0 10px 25px rgba(0,0,0,0.9)",
            duration: 0.3,
            ease: 'power3.out'
        });

        tl.to('#card3', {
            opacity: 1,
            scale: 1,
            boxShadow: "0 0 25px rgba(255,255,255,0.15), 0 10px 25px rgba(0,0,0,0.9)",
            duration: 0.3,
            ease: 'power3.out'
        });
        // Animações para o carousel
        let carousel = document.querySelector('#carouselExample')

        carousel.addEventListener('slide.bs.carousel', function (event) {
        let nextImg = event.relatedTarget.querySelector("img");

        gsap.fromTo(nextImg,
            { opacity: 0, scale: 0.1 },
            { opacity: 1, scale: 1, duration: 0.8, ease: "power2.out" }
        );
        });

    }
});
const tl = gsap.timeline()
tl.to('.titulo-menu', {
    scale: 1.03,
    duration: 0.5,
})
tl.to('.titulo-menu', {
    scale: 1,
    duration: 0.5
})

if (window.innerWidth < 1024){
    gsap.to('.card', {
        opacity: 1,
        scale: 1,
        boxShadow: "0 0 25px rgba(255,255,255,0.15), 0 10px 25px rgba(0,0,0,0.5)",  
        duration: 1,
        stagger: 0.3,
        scrollTrigger: {
            trigger: '.art-cards',
            start: 'top center',
            end: 'bottom center',
            scrub: false,
            toggleActions: 'play none none none'
        }
    })
}

const cards = document.querySelectorAll('.card');

cards.forEach((card) => {
    card.addEventListener('mouseenter', () => {
            gsap.to(card, {
            border: '1px solid rgb(255, 123, 0)',
            duration: 0.2,
            })
        })
        card.addEventListener('mouseleave', () => {
                gsap.to('.card', {
                border: '1px solid #394a63',
                duration: 0.2,
                })
            })
    })



const texts = document.querySelectorAll('.text');
let carouselFases = document.querySelector('#carouselExample')


carouselFases.addEventListener('slide.bs.carousel', (e) => {
  const index = e.to;

  texts.forEach(t => t.classList.remove('active'));
  texts[index].classList.add('active');
});