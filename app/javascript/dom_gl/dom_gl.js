/**
 * @author JuanFuent.es
 * @desc WebGL
 */
import {
    Scene,
    WebGLRenderer,
    PerspectiveCamera,
    Clock,
    Mesh
} from 'three'
import Conversor from './conversor'

export default class DomGl {
    constructor(container) {
        // convert dom elements to 3d objects
        this.elements = [] // Array for dom_gl {components}
        this.container = container || document.body
        this.scene = new Scene()
        this.clock = new Clock()
        // Set camera & renderer
        this.camera = new PerspectiveCamera(10, this.aspectRatio, 10, 10000)
        // this.camera = new OrthographicCamera( - 1, 1, 1, - 1, 0, 1 )
        // Task: Lerp fov on Scroll
        this.camera.position.z = 100
        this.setRenderer()
        // 
        this.setElements()
    }

    setElements() {
        this.conversor = new Conversor()
        for (let i = 0; i < this.conversor.elements.length; i++) {
            const _el = this.conversor.elements[i]
            /*
             * Create new mesh and add to scene.
             * Assign mesh to _el class 'extends' from { DOMElement }
             */
            _el.mesh = new Mesh(_el.geometry, _el.material)
            this.scene.add(_el.mesh)
            this.elements.push(_el)
        }
    }

    setRenderer() {
        this.renderer = new WebGLRenderer({
            antialias: false,
            alpha: true
        })
        this.container.appendChild(this.renderer.domElement)
        this.renderer.setPixelRatio(PX_RATIO)
    }

    updateCamera() {
        this.camera.aspect = this.aspectRatio
        this.camera.fov = this.fov
        this.camera.updateProjectionMatrix()
    }

    resize() {
        this.renderer.setSize(WIDTH, HEIGHT)
        // Dispatch resize method for all '3D' elements
        for (let i = 0; i < this.elements.length; i++) this.elements[i].resize()
        this.updateCamera()
    }
    //
    render(t) {
        this.renderElements(t)
        this.renderer.render(this.scene, this.camera)
    }

    renderElements(t) {
        for (let i = 0; i < this.elements.length; i++) {
            const el = this.elements[i]
            el.render(t + i)
        }
    }

    // Field of view
    get fov() {
        return 2 * Math.atan(window.WIDTH / this.aspectRatio / (2 * this.camera.position.z)) * (180 / Math.PI)
    }

    // Radio Aspecto
    get aspectRatio() {
        return window.WIDTH / window.HEIGHT
    }

}