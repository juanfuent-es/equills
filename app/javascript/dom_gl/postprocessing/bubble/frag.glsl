uniform sampler2D tDiffuse;
uniform float offset;
varying vec3 vUV;
varying vec2 vUVDot;

void main() {
	vec3 uv = dot(vUVDot, vUVDot) * vec3(-.5, -.5, -1.0) + vUV;

	float r = texture2DProj(tDiffuse, uv+offset).r;
	float g = texture2DProj(tDiffuse, uv-offset).g;
	float b = texture2DProj(tDiffuse, uv+offset).b;
	float a = texture2DProj(tDiffuse, uv+offset).a;
	vec4 color = vec4(r, g, b, a);

	gl_FragColor = vec4(color);
}