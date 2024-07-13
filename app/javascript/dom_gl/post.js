import {
    Scene,
    OrthographicCamera
} from 'three'
// Composer
import {
    EffectComposer
} from 'three/examples/jsm/postprocessing/EffectComposer'
import {
    RenderPass
} from 'three/examples/jsm/postprocessing/RenderPass'
import {
    ShaderPass
} from 'three/examples/jsm/postprocessing/ShaderPass'
import {
    FilmPass
} from 'three/examples/jsm/postprocessing/FilmPass'
import {
    VignetteShader
} from 'three/examples/jsm/shaders/VignetteShader'

import {
    HalftonePass
} from 'three/examples/jsm/postprocessing/HalftonePass'
import { AfterimagePass } from 'three/examples/jsm/postprocessing/AfterimagePass'
//Base
import DomGl from "./dom_gl"
import * as dat from 'dat.gui'

export default class DomGlPost extends DomGl {
    constructor(container) {
        super(container)
        this.gui = new dat.GUI()
        this.renderPass = new RenderPass(this.scene, this.camera)
        this.composer = new EffectComposer(this.renderer)
        this.composer.addPass(this.renderPass)
        this.ortographic = null
        // this.setHalftone()
        this.setFilm()
        // this.setAfterImage()
    }

    setAfterImage() {
        this.afterimagePass = new AfterimagePass()
		this.composer.addPass( this.afterimagePass )
        this.AI_gui = this.gui.addFolder('AfterImage')
        this.AI_gui.add( this.afterimagePass.uniforms[ 'damp' ], 'value', 0, 1 ).name('Intensity').step( 0.001 )
    }

    setHalftone() {
        this.halftoneParams = {
            shape: 1,
            radius: 4,
            rotateR: Math.PI / 12,
            rotateB: Math.PI / 12 * 2,
            rotateG: Math.PI / 12 * 3,
            scatter: 0,
            blending: 1,
            blendingMode: 1,
            greyscale: false,
            disable: false
        }
        this.halftonePass = new HalftonePass(WIDTH, HEIGHT, this.halftoneParams)
        this.composer.addPass(this.halftonePass)
    }

    setFilm() {
        this.post_scene = new Scene()
        // Set ortographic camera
        this.ortographic = new OrthographicCamera(-HALF_X, HALF_X, HALF_Y, -HALF_Y, -100, 100)

        this.shaderVignette = VignetteShader;
        this.vignette = new ShaderPass(this.shaderVignette)

        this.vignette.uniforms['offset'].value = 0.9
        this.vignette.uniforms['darkness'].value = .95
        //
        this.renderBackground = new RenderPass(this.post_scene, this.ortographic)
        this.renderModel = new RenderPass(this.scene, this.camera)
        //
        this.composer.addPass(this.vignette)
        //
        this.setFilmGUI()
    }

    setFilmGUI() {
        this.filmParams = {
            nIntensity: .35,
            sIntensity: .1,
            sCount: 999,
            grayscale: false
        }
        let film = this.gui.addFolder('PostProccesing - Film')
        film.add(this.filmParams, 'nIntensity', 0.1, 1.).name('Noise Intensity').listen()
        film.add(this.filmParams, 'sCount', 10, 1000).name('Lines Count').listen()
        film.add(this.filmParams, 'sIntensity', 0.1, 1.).name('Intensity Lines').listen()
        film.add(this.filmParams, 'grayscale').name('Grayscale').listen()
        this.effectFilm = new FilmPass(this.filmParams.nIntensity, this.filmParams.sIntensity, this.filmParams.sCount, this.filmParams.grayscale)
        this.composer.addPass(this.effectFilm)
    }

    resize() {
        this.composer.setSize(WIDTH, HEIGHT)
        this.renderer.setSize(WIDTH, HEIGHT)
        // Dispatch resize method for all '3D' elements
        for (let i = 0; i < this.elements.length; i++) this.elements[i].resize()
        this.updateCamera()
        // FILM CAMERA
        if (this.ortographic) this.ortographic.updateProjectionMatrix()
    }

    render(t) {
        this.renderElements(t)
        this.updateFilmUniforms(t)
        this.composer.render()
    }

    updateFilmUniforms(_delta) {
        this.effectFilm.uniforms.nIntensity.value = this.filmParams.nIntensity
        this.effectFilm.uniforms.sCount.value = this.filmParams.sCount
        this.effectFilm.uniforms.sIntensity.value = this.filmParams.sIntensity
        this.effectFilm.uniforms.grayscale.value = this.filmParams.grayscale
    }

}