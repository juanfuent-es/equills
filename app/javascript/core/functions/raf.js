import { Clock } from 'three'
import mitt from 'mitt'
//
window.RAF = mitt()
const clock = new Clock()

function animate() {
    requestAnimationFrame(() => animate())
    const delta = clock.getDelta()
    window.RAF.emit('animate',  delta)
}

animate()