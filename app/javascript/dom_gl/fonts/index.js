async function fontAsDataURL(_url) {
    return fetch(_url)
        .then((resp) => resp.ok && resp.blob())
        .then((blob) => new Promise((res) => {
            const reader = new FileReader()
            reader.onload = (evt) => res(reader.result)
            reader.readAsDataURL(blob)
        }))
}

const HUBOT = await fontAsDataURL("/static/Hubot-Sans.woff2")
const SPLINE = await fontAsDataURL("https://fonts.gstatic.com/s/splinesansmono/v8/R70MjzAei_CDNLfgZxrW6wrZOF2WdZ6xabUGSVtNuGBiMotSwYY.woff2")

export {
    SPLINE,
    HUBOT
}