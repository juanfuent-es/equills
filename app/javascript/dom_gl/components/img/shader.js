import Vertex from "../../glsl/vtx.glsl"
import Fragment from "../../glsl/fragments/gradient.glsl"
import Img from "./index"
import {
    gsap,
    Power3
} from "gsap"
import {
    ShaderMaterial
} from "three"

export default class ImgShader extends Img {
    constructor(_img) {
        super(_img)
        this.material = new ShaderMaterial({
            vertexShader: Vertex,
            fragmentShader: Fragment,
            transparent: false,
            uniforms: {
                uTime: {
                    value: 1.0
                },
                uTexture: {
                    value: this.texture
                }
            }
        })
    }

    resize() {
        this.reset()
        this.updateTexture(this.src, (texture) => {
            this.material.uniforms.uTexture.value = texture
        })
    }

    render(_delta) {
        this.delta = _delta
        this.material.uniforms.uTime.value = _delta
        //Stuff
    }

}