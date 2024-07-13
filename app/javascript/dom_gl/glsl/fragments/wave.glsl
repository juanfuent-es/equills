varying vec2 vUv;

uniform sampler2D uTexture;
uniform float uWave;
  
void main() {
  vec2 uv = vUv;
  vec2 pos = vec2(uv.x, uv.y);
  pos.y += .0 * 0.05;

  float r = texture2D(uTexture, pos + vec2(0., 0.) + uWave * 0.05).r;
  float g = texture2D(uTexture, pos + vec2(0., 0.) + uWave * 0.05).g;
  float b = texture2D(uTexture, pos + vec2(0., 0.) + uWave * -0.02).b;
  float alpha = texture2D(uTexture, pos).a;
  gl_FragColor = vec4(r, g, b, alpha);
}