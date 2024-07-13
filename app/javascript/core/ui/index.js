import Cursor from "./cursor.js"

window.CURSOR = new Cursor()
window.RAF.on("animate", (delta) => window.CURSOR.render(delta))