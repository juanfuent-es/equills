uniform sampler2D uTexture;
uniform vec2 uSize;
uniform vec2 uRatio;

varying vec2 vUv;

void main() {
    float ratioScreen = uSize.x / uSize.y;
    float ratioTexture = uRatio.x / uRatio.y;

    vec2 new;
    vec2 offset;
    if (ratioScreen < ratioTexture ) {
        new = vec2(uRatio.x * uSize.y / uRatio.y, uSize.y);
        offset = vec2((new.x - uSize.x) / 2.0, 0.0) / new;
    } else {
        new = vec2(uSize.x, uRatio.y * uSize.x / uRatio.x);
        offset = vec2(0.0, (new.y - uSize.y) / 2.0) / new;
    }

    vec2 newUv = vUv * uSize / new + offset;
    gl_FragColor = texture2D(uTexture, newUv);
}