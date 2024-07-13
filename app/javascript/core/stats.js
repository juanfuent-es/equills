
/*  | |      | |      
 ___| |_ __ _| |_ ___ 
/ __| __/ _` | __/ __|
\__ \ || (_| | |_\__ \
|___/\__\__,_|\__|___/ */

import Stats from 'three/examples/jsm/libs/stats.module'

window.STATS = new Stats()
document.body.appendChild( window.STATS.dom )
window.STATS.dom.style.left = "auto"
window.STATS.dom.style.right = 0
window.RAF.on("animate", () => window.STATS.update())