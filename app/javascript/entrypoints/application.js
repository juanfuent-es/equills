import Layout from "../layout"
import Lenis from '@studio-freight/lenis'

// import {
//     DomGl, // Basic threejs setup
//     DomGlPost // threejs setup with postprocessor connected with effect composer
// } from "./dom_gl/index"
class App extends Layout {
    constructor() {
        super()
        this.setLenis()
    }

    setLenis() {
        this.lenis = new Lenis({
            duration: .1,
            lerp: this.lerp,
            orientation: 'vertical',
            gestureOrientation: 'vertical',
            smoothWheel: true,
            smoothTouch: true
        })
        //
        window.RAF.on("animate", (delta) => this.render(delta))
    }
    
    loaded() {
        this.preloader.hide()
    }
    
    render() {
        const time = new Date().getTime() * .1
        this.lenis.raf(time)
        STATS.update()
    }

}

const _app = new App()