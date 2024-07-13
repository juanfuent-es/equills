import TxtBase from "./base"

export default class Txt extends TxtBase {
    constructor(txt_lmnt, args = {}) {
        super(txt_lmnt, args)
    }

    render(_delta) {
        this.delta = _delta
        this.updatePosition()
    }

}