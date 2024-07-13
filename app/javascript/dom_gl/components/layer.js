import {
    PlaneGeometry,
    TextureLoader,
    MeshBasicMaterial,
    RGBAFormat,
    LinearFilter,
    SRGBColorSpace,
    NearestFilter,
    Texture
} from "three"
/*
 * @class 
 * @name Layer 
 * @desc Construye un objeto 3d para implementar en three, la base es un objeto del dom, un elemento html
 * @param { HTMLElement } Elemento HTML. *Requerido
 */
export default class Layer {
    constructor(_element, args = {}) {
        if (_element === undefined) throw "HTML element it's required"
        this.dom_element = _element
        this.loader = new TextureLoader()
        this.lerp = Number(this.dom_element.dataset.lerp) || .475
        // texture
        this.renderMode = "on"
        this.texture = new Texture()
        this.offset = {
            x: 0,
            y: 0
        }
        // material
        this.alpha = 1
        this.geometry = new PlaneGeometry(1, 1)
        this.material = new MeshBasicMaterial({
            wireframe: false,
            transparent: true,
            map: this.texture,
            opacity: this.alpha
        })
        this.mesh = null
        this.setObserver()
    }

    setObserver() {
        let options = {
            threshold: [0, .5, 1],
            rootMargin: "60px 0px"
        }
        this.observer = new IntersectionObserver(entries => {
            let entry = entries[0]
            this.renderMode = entry.isIntersecting ? 'on' : 'off'
            this.alpha = entry.intersectionRatio
        }, options)
        this.observer.observe(this.dom_element)
    }

    updateTexture(_src, callback) {
        this.loader.load(_src, (texture) => {
            this.texture = texture
            this.texture.format = RGBAFormat
            this.texture.generateMipmaps = false
            this.texture.colorSpace = SRGBColorSpace
            this.texture.magFilter = NearestFilter
			this.texture.minFilter = NearestFilter
            // Update material texture
            this.material.map = this.texture
            this.material.map.needsUpdate = true
            if (callback) callback(texture)
        })
    }

    reset() {
        this.dom_element.removeAttribute("style")
        this.dom_element.style.opacity = 0
        this.mesh.scale.set(this.width, this.height, 1)
    }

    resize() {
        this.reset()
    }
    
    render(_delta) {
        this.delta = _delta
        this[this.renderMode]()
    }

    on() {
        const opacity = this.mesh.material.opacity
        this.mesh.material.opacity += (this.alpha - opacity) * this.lerp
        this.updatePosition()
    }

    off() {
    }

    updatePosition() {
        this.mesh.position.set(this.x, this.y, 0)
    }

    get scrollY() {
        return window.scrollY || window.pageYOffset || document.documentElement.scrollTop
    }

    get x() {
        return scrollX - HALF_X + (this.left - scrollX) + this.center.x
    }
    
    get y() {
        return (scrollY + HALF_Y) - (this.top + scrollY) - this.center.y
    }

    get rect() {
        return this.dom_element.getBoundingClientRect()
    }

    // Radio Aspecto
    get aspectRatio() {
        return this.width / this.height
    }

    get width() {
        return ~~this.rect.width
    }

    get height() {
        return ~~this.rect.height
    }

    get center() {
        return {
            x: this.width / 2,
            y: this.height / 2
        }
    }

    get left() {
        return this.rect.left
    }

    get top() {
        return this.rect.top
    }

    attr(_attr) {
        if (_attr === undefined) throw "El atributo es requerido"
        return window.getComputedStyle(this.dom_element, null).getPropertyValue(_attr)
    }

    destroy() {
        // threejs
        // see: https://threejs.org/docs/#manual/en/introduction/How-to-dispose-of-objects
        this.texture.dispose()
        this.geometry.dispose()
        this.material.dispose()
        delete this.mesh
        // html element
        this.dom_element = null
        // attrs
        delete this.dom_element
        delete this.alpha
    }
}