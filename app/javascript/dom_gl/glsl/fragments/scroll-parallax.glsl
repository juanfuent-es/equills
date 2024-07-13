uniform sampler2D uTexture;
uniform float uScale;
uniform float uAlpha;
uniform float uPosY;
varying vec2 vUv;

#pragma glslify: scaleFrom = require('./scale-from.glsl');

void main() {
    float parallax = .5 - uPosY;
	vec2 pos = scaleFrom(uScale, vec2(.5, parallax), vUv);
	float alpha = uAlpha * texture2D(uTexture, pos).a;
	vec4 color = vec4(texture2D(uTexture, pos).rgb, alpha);

	gl_FragColor = vec4(color);
}