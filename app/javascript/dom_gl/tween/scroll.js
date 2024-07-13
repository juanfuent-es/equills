import {
    gsap
} from "gsap"
import {
    ScrollTrigger
} from "gsap/ScrollTrigger"

gsap.registerPlugin(ScrollTrigger)

export default class TweenScroll {
    constructor(_element, intersections = {
        start: 'top bottom',
        end: 'bottom center'
    }) {
        this.element = _element
        this.dom_element = _element.dom_element
        this.start = intersections.start
        this.end = intersections.end
        // this.scrollTrigger()
    }

    scrollTrigger() {
        gsap.fromTo(this.element, {
            alpha: 0,
            offset_y: () => {
                return -this.element.height
            }
        }, {
            alpha: 1,
            offset_y: 0,
            scrollTrigger: {
                trigger: this.dom_element,
                start: this.start,
                end: this.end,
                toggleActions: "play pause resume pause",
                scrub: true,
                markers: false
            }
        })
    }

}