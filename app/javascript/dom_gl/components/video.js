import {
    Vector2,
    VideoTexture,
    ShaderMaterial
} from "three"
import Layer from "../components/layer"
import Vertex from "../glsl/vtx.glsl"
import Fragment from '../glsl/fragments/cover.glsl'

export default class Video extends Layer {
    constructor(_video) {
        super(_video)
        this.texture = new VideoTexture(this.dom_element)
        this.material = new ShaderMaterial({
            vertexShader: Vertex,
            fragmentShader: Fragment,
            transparent: true,
            wireframe: false,
            uniforms: {
                uTexture: {
                    value: this.texture
                },
                uRatio: {
                    value: new Vector2(this.aspectRatio, 1)
                },
                uSize: {
                    value: new Vector2(this.width, this.height)
                }
            }
        })
    }

    resize() {
        this.reset()
        this.material.uniforms.uSize.value.set(this.width, this.height)
        if (this.width > this.height) {
            this.material.uniforms.uRatio.value.set(this.aspectRatio, 1)
        } else {
            this.material.uniforms.uRatio.value.set(1, this.aspectRatio)
        }
    }

    get width() {
        let _width = Number(this.dom_element.dataset.width)
        if (_width) return _width
        else return this.dom_element.videoWidth
    }

    get height() {
        let _height = Number(this.dom_element.dataset.height)
        if (_height) return _height
        else return this.dom_element.videoHeight
    }

    get src() {
        return this.dom_element.src
    }

}