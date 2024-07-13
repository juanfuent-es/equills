import {
    Vector2
} from "three"
import {
    lerp,
    mapLinear
} from "three/src/math/MathUtils"

export default class Parallax {
    constructor(_element) {
        if (_element === undefined) throw "Element it's required"
        this.element = _element
        this.depth = _element.dataset.depth || .15
        this.friction = new Vector2(0.1, 0.1)
        this.position = new Vector2(0, 0)
    }

    resize() {
        this.max_x = this.element.width / 2 * this.depth
        this.max_y = this.element.height / 2 * this.depth
    }

    get x() {
        return this.position.x
    }
    /**
     * @param {Number} _x
     */
    set x(_x) {
        this.#position.x = _x
    }
    /**
     * @param {Number} _y
     */
    set y(_y) {
        this.#position.y = _y
    }

    get x() {
        return this.position.x
    }

    /**
     * Update position with linear interpolation
     * @param { Vector2 } _pos Mouse Position ?
     */
    update(_pos) {
        /*
         * Calculate movement on 3d coordinates with depth
         */
        // const _x = mapLinear(_pos.x, -1, 1, -this.max_y, this.max_y)
        const _x = clamp(_pos.x, -this.max_x, this.max_x)
        const _y = mapLinear(_pos.y, 1, -1, -this.max_y, this.max_y)
        this.element.offset_x = (this.element.offset_x - _pos)
    }

}