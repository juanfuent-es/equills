/**
 * @author JuanFuent.es
 * @desc Convert html node elements on 3d objects for render on threejs
 */
import {
    TxtShader,
    Txt,
    Link,
    ImgShader,
    ImgZoom,
    Img,
    Video
} from "./components"
import {
    TxtTransition
} from "./transitions"
//
import {
    HUBOT,
    SPLINE
} from "./fonts/index"
//
const FONT_TITLE = {
    name: "Hubot Sans",
    source: HUBOT
}

const FONT_FAMILY = {
    name: "Spline Sans Mono",
    source: SPLINE
}
// DomGL set postprocessors default variables, insted DomGl its only a basic setup with three
export default class Conversor  {
    constructor() {
        this.elements = []
        // set elements
        this.setImgs()
        this.setVideos()
        this.setTexts()
    }

    add(_item) {
        this.elements.push(_item)
    }

    setImgs() {
        const imgsZoom = document.querySelectorAll('.img-gl')
        imgsZoom.forEach(el => this.add(new Img(el)))
    }
    
    setVideos() {
        const videos = document.querySelectorAll('.video-gl')
        videos.forEach(el => this.add(new Video(el)))
    }

    setTexts() {
        const titles = document.querySelectorAll('.title-gl')
        titles.forEach(el => {
            const _txt = new Txt(el, {
                fonts: [FONT_TITLE],
                variable: true
            })
            this.add(_txt)
        })
        //
        const texts = document.querySelectorAll('.text-gl')
        texts.forEach(el => {
            const _txt = new Txt(el, {
                fonts: [FONT_FAMILY]
            })
            this.add(_txt)
        })
        //
        const links = document.querySelectorAll('.link-gl')
        links.forEach(el => {
            const _txt = new Link(el, {
                fonts: [FONT_FAMILY]
            })
            this.add(_txt)
        })
    }

}