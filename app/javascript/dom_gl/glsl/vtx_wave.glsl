varying vec2 vUv;
varying float wave;

uniform float uTime;
uniform float uWave;

void main() {
    vec3 pos = position;
    pos.z += sin(pos.x * 1.75 + uTime) * uWave;
    wave = pos.z;
	vUv = uv;

    gl_Position = projectionMatrix * modelViewMatrix * vec4( pos, 1.0 );
}