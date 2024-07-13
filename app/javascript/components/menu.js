import {
    gsap,
    Power2
} from "gsap"
export default class Menu {
    constructor() {
        this.openBtn = document.querySelector("#open-menu-btn")
        this.closeBtn = document.querySelector("#close-menu-btn")
        this.status = "close"
        this.events()
        this.setTL()
    }

    events() {
        this.openBtn.addEventListener("click", () => this.open())
        this.closeBtn.addEventListener("click", () => this.close())
    }

    setTL() {
        this.tl = new gsap.timeline({
            paused: true
        }).to("#menu", {
            duration: .15,
            ease: Power2.easeOut,
            opacity: 1,
            display: "flex"
        }, 0).to("#menu-wrap", {
            duration: .45,
            ease: Power2.easeOut,
            x: 0,
            force3D: true
        }, 0)
    }

    close() {
        if (this.status == "close") return false
        this.status = "close"
        return this.tl.reverse()
    }

    open() {
        if (this.status == "show") return false
        this.status = "show"
        return this.tl.play()
    }
}