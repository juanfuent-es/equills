/*  ____                  ________ 
   / __ \____  ____ ___  / ____/ / 
  / / / / __ \/ __ `__ \/ / __/ /  
 / /_/ / /_/ / / / / / / /_/ / /___
/_____/\____/_/ /_/ /_/\____/_____*/

import "./core/constants"
import "./core/functions"
// import "./core/helpers"
import "./core/stats"
import "./core/ui"

import Preloader from "./components/preloader"
import Credits from './components/credits'
import Share from './components/share'

export default class Layout {
    constructor() {
        this.preloader = new Preloader()
        this.credits = new Credits("The artist's deck")
        this.share = new Share()
        this.events()
    }

    events() {
        window.onload = (e) => this.loaded(e)
        window.addEventListener("pageshow",  (e) => this.pageShow(e))
        window.onpopstate = (e) => this.reload(e)
        window.SIZE.on('resize', () => this.resize())
        this.resize()
    }

    pageShow(e) {
        let historyTraversal = e.persisted || (typeof window.performance != "undefined" && window.performance.navigation.type === 2)
        if (historyTraversal) this.reload()
        else this.loaded()
    }
    
    resize() {
    }

    reload(e) {
        return window.location.reload()
    }

    loaded() {
        this.preloader.hide()
    }
}