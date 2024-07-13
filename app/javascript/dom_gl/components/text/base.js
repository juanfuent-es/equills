import Layer from "../layer"

export default class TxtBase extends Layer {
    constructor(txt_lmnt, args = {}) {
        super(txt_lmnt)
        //Append like a blob oject directly on foreignKey for work's
        this.fonts = args.fonts
        this.variable = args.variable || false
        this.debug = args.debug || false
        // text node
        this.text = document.createElement("div")
        this.text.innerHTML = this.dom_element.innerHTML
        // text texture
        this.foreignObject = document.createElementNS(window.SVG_NS, "foreignObject")
        this.svg = document.createElementNS(window.SVG_NS, "svg")
        //
        this.setForeignObject()
        this.setFonts()
    }

    setFonts() {
        for (let i = 0; i < this.fonts.length; i++) {
            const font = this.fonts[i]
            let style = document.createElementNS(window.SVG_NS, "style")
            if (this.variable) {
                style.innerHTML = `@font-face {
                    font-family: '${font.name}';
                    src: url('${font.source}') format('truetype-variations');
                    font-weight: 200 900;
                    font-style: normal;
                    font-display: swap;
                }`
            } else {
                style.innerHTML = `@font-face {
                    font-family: '${font.name}';
                    src: url('${font.source}') format(woff2);
                    font-weight: normal;
                    font-style: normal;
                    font-display: swap;
                }`
            }
            this.foreignObject.append(style)
        }
    }

    test() {
        this.dom_element.style.position = "relative"
        this.dom_element.appendChild(this.svg) // ONLY FOR TEST
        this.svg.style.position = "absolute"
        this.svg.style.left = 0
        this.svg.style.top = 0
    }

    get src() {
        let xml = new XMLSerializer().serializeToString(this.svg)
        let base64 = btoa(unescape(encodeURIComponent(xml)))
        return `data:image/svg+xml;charset=utf-8;base64,${base64}`
    }

    setForeignObject() {
        this.svg.appendChild(this.foreignObject)
        this.foreignObject.appendChild(this.text)
        if (this.debug) this.test()
    }
    
    reset() {
        // Remove attrs for get initial atributes
        this.text.removeAttribute("style")
        this.dom_element.removeAttribute("style")
        //
        // Scale correction , fix for devicepixelratio 
        this.svg.setAttribute("width", this.width * PX_RATIO)
        this.svg.setAttribute("height", this.height * PX_RATIO)
        this.foreignObject.setAttribute("width", this.width)
        this.foreignObject.setAttribute("height", this.height)
        this.foreignObject.style.transform = `scale(${PX_RATIO})`
        // Reset attributes on svg text node
        this.text.setAttribute("style", this.style)
        // reset size
        this.mesh.scale.set(this.width, this.height, 1)
        // Set to transparent after redrawed
        this.dom_element.style.color = 'transparent'
    }

    resize() {
        this.reset()
        this.updateTexture(this.src, (_map) => {
            this.material.map = _map
            this.material.map.needsUpdate = true
        })
    }

    get fontWeight() {
        return this.attr("font-weight")
    }

    get fontStyle() {
        return this.attr("font-style")
    }

    get color() {
        return this.attr("color")
    }

    get font() {
        return `${this.fontStyle} ${this.fontWeight} ${this.fontSize} ${this.fontFamily}`
    }

    get fontFamily() {
        return this.attr("font-family")
    }

    get fontSize() {
        return this.attr("font-size")
    }

    get indent() {
        return this.attr("text-indent")
    }

    get textAlign() {
        return this.attr("text-align")
    }

    get lineHeight() {
        let lineHeight = this.attr("line-height")
        if (lineHeight == "normal") return this.fontSize
        else return lineHeight
    }

    get style() {
        let style = `text-transform:${this.attr('text-transform')}; text-indent:${this.indent}; font-style:${this.fontStyle}; font-weight:${this.fontWeight}; font-size:${this.fontSize}; font-family: ${this.fontFamily}; color: ${this.color}; line-height: ${this.lineHeight}; text-align: ${this.textAlign}; padding: ${this.attr('padding')};`
        // if (this.variable) style += `font-variation-settings: ${this.attr('font-variation-settings')};`
        return style
    }

}