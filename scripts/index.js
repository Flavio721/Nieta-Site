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
            duration: 0.3,
            ease: 'power3.out'
        });

        tl.to('#card2', {
            opacity: 1,
            scale: 1,
            duration: 0.3,
            ease: 'power3.out'
        });

        tl.to('#card3', {
            opacity: 1,
            scale: 1,
            duration: 0.3,
            ease: 'power3.out'
        });
    }
});
