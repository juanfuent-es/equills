import TxtBase from "./base"
import {
    MeshBasicMaterial
} from "three"
//
export default class Link extends TxtBase {
    constructor(_element, args = {}) {
        super(_element, args)
        this.material = new MeshBasicMaterial({
            transparent: true,
            map: this.texture,
            opacity: .5,
            transparent: true
        })
        this.events()
    }

    events() {
        this.alpha = .5
        this.dom_element.addEventListener("mouseenter", () => {
            this.alpha = 1
        })
        this.dom_element.addEventListener("mouseleave", () => {
            this.alpha = .5
        })
    }

}