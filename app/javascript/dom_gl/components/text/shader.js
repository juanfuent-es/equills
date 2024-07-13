import TxtBase from "./base"
import {
    ShaderMaterial
} from "three"
//
import Vertex from "../../glsl/vtx.glsl"
import Fragment from "../../glsl/fragments/gradient.glsl"

export default class TxtShader extends TxtBase {
    constructor(_element, _fonts = []) {
        super(_element, _fonts)
        this.material = new ShaderMaterial({
            vertexShader: Vertex,
            fragmentShader: Fragment,
            transparent: false,
            wireframe: false,
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
        this.material.uniforms.uTime.value = this.delta
    }

}