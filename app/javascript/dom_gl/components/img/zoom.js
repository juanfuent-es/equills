import Img from "./index"
import {
    lerp
} from "three/src/math/MathUtils"
import {
    ShaderMaterial
} from "three"
import Vertex from "../../glsl/vtx.glsl"
import Fragment from '../../glsl/fragments/scroll-parallax.glsl'

import {
    gsap
} from "gsap"
import {
    ScrollTrigger
} from "gsap/ScrollTrigger"
gsap.registerPlugin(ScrollTrigger)

export default class ImgZoom extends Img {
    constructor(_img) {
        super(_img)
        this.alpha = 0
        this.scale = 1
        this.lerp = .9
        // material
        this.material = new ShaderMaterial({
            vertexShader: Vertex,
            fragmentShader: Fragment,
            transparent: true,
            wireframe: false,
            uniforms: this.uniforms
        })
        this.scrollTrigger()
    }

    get uniforms() {
        return {
            uTexture: {
                value: this.texture
            },
            uPosY: {
                value: 0
            },
            uScale: {
                value: this.scale
            },
            uAlpha: {
                value: this.alpha
            },
            uTime: {
                value: 0.1
            }
        }
    }

    scrollTrigger() {
        gsap.fromTo(this, {
            alpha: 0,
            scale: 1
        }, {
            alpha: 1,
            scale: 1.1,
            scrollTrigger: {
                trigger: this.dom_element,
                start: this.start,
                end: this.end,
                scrub: true,
                markers: false
            }
        })
    }

    resize() {
        this.reset()
        // Reload texture with correct image dimensions, through canvas drawimage
        this.reloadTexture()
        // Reload ShaderMaterial with new texture
        this.reloadMaterial()
    }

    reloadMaterial() {
        this.material.dispose()
        this.material = new ShaderMaterial({
            vertexShader: Vertex,
            fragmentShader: Fragment,
            transparent: true,
            wireframe: false,
            uniforms: this.uniforms
        })
        this.mesh.material = this.material
    }

    updateUniforms(_delta) {
        this.mesh.material.uniforms.uTime.value = _delta
        //
        const opacity = this.mesh.material.uniforms.uAlpha.value
        this.mesh.material.uniforms.uAlpha.value = lerp(this.alpha, opacity, this.lerp)
        //
        const scale = this.mesh.material.uniforms.uScale.value
        this.mesh.material.uniforms.uScale.value = lerp(this.scale, scale, this.lerp)
        //
        const pos_y = this.mesh.material.uniforms.uPosY.value
        const _y = (this.top + this.height / 2 - window.HALF_Y) / window.HALF_Y
        this.mesh.material.uniforms.uPosY.value = lerp(_y, pos_y, this.lerp)
    }

    render(_delta) {
        this.updateUniforms(_delta)
    }

}