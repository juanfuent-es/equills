import Layer from "../layer"
import Canvas from "../../lib/canvas"
import { ImgCover } from '../../utils'
import { CanvasTexture } from "three"

export default class Img extends Layer {
    constructor(_img) {
        super(_img)
        this.img_canvas = new Canvas()
        this.texture = new CanvasTexture(this.img_canvas.canvas)
    }

    resize() {
        this.reset()
        this.reloadTexture()
        /*
        * The code below works fine when image change on mediaquery
        * But not means the image adjust on 'image size' on css when size it's modified by aspectRatio, ObjectFit (Cover, Contain)
        * Maybe applying a cover draw with shader?
        * @see: https://codepen.io/ReGGae/pen/aPpgbe
        * @see: https://gist.github.com/statico/df64c5d167362ecf7b34fca0b1459a44
        */
        // this.updateTexture(this.src, (texture) => {
        //     this.material.uniforms.uTexture.value = texture
        // })
    }
    
    reloadTexture() {
        this.texture.dispose()
        //
        this.texture = new CanvasTexture(this.img_canvas.canvas)
        this.material.map = this.texture
        this.material.map.needsUpdate = true
        this.updateTexture()
    }
    
    updateTexture() {
        this.img_canvas.clear()
        this.img_canvas.setSize(this.width, this.height)
        //
        const coverParams = ImgCover(this.width, this.height, this.naturalWidth, this.naturalHeight)
        this.img_canvas.drawImage(this.dom_element, coverParams)
    }

    get imgRatio() {
        return this.naturalWidth / this.naturalHeight
    }

    get naturalWidth() {
        return this.dom_element.naturalWidth
    }
    
    get naturalHeight() {
        return this.dom_element.naturalHeight
    }

    get src() {
        return this.dom_element.currentSrc
    }

}