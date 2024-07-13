/*
* Get params of img for draw inner container 
* @see: https://stackoverflow.com/questions/21961839/simulation-background-size-cover-in-canvas
*/
function fitImage(contains) {
    return (parentWidth, parentHeight, childWidth, childHeight, scale = 1, offsetX = 0.5, offsetY = 0.5) => {
        const childRatio = childWidth / childHeight
        const parentRatio = parentWidth / parentHeight
        let width = parentWidth * scale
        let height = parentHeight * scale

        if (contains ? (childRatio > parentRatio) : (childRatio < parentRatio)) {
            height = width / childRatio
        } else {
            width = height * childRatio
        }

        return {
            width,
            height,
            offsetX: (parentWidth - width) * offsetX,
            offsetY: (parentHeight - height) * offsetY
        }
    }
}

const ImgContain = fitImage(true)
const ImgCover = fitImage(false)

export {
    ImgCover,
    ImgContain
}