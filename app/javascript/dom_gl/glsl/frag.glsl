uniform sampler2D uTexture;
varying vec2 vUv;

void main() {
	vec2 pos = vUv;
	vec3 rgb = texture2D(uTexture, pos).rgb;
	float a = texture2D(uTexture, pos).a;

	gl_FragColor = vec4(rgb, a);
}