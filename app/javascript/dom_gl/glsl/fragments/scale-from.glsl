vec2 scaleFrom(float scale, vec2 origin, vec2 uv) {
    return (uv - origin) / scale + origin;
}

#pragma glslify: export(scaleFrom);