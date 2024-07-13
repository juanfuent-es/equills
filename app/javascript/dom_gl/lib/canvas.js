/**
 * @author JuanFuent.es
 * @desc Setup básico de canvas
 */

export default class Canvas {
    constructor() {
        this.canvas = document.createElement("canvas")
        this.context = this.canvas.getContext("2d")
        //
        this.setSize()
    }

    setSize(_width = window.innerWidth, _height = window.innerHeight) {
        this.width = parseInt(_width) * window.PX_RATIO
        this.height = parseInt(_height) * window.PX_RATIO
        this.canvas.width = this.width
        this.canvas.height = this.height
    }

    clear() {
        this.context.clearRect(0, 0, this.width, this.height)
    }

    stroke(_color = "#000") {
        this.context.strokeStyle = _color
        this.context.stroke()
    }

    background(_fill= "#000") {
        this.context.fillStyle = _fill
        this.context.fillRect(0, 0, this.width, this.height)
    }

    bg(_fill) {
        this.background(_fill)
    }

    drawImage(_img, params) {
        this.context.drawImage(_img, params.offsetX, params.offsetY, params.width, params.height)
    }
}