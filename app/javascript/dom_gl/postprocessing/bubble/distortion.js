/*
* @credits http://www.decarpentier.nl/downloads/lensdistortion-webgl/lensdistortion-webgl.html
* @see: https://threejs.org/docs/?q=shader#examples/en/postprocessing/EffectComposer
*/

import vertex from "./vertex.glsl";
import fragment from "./frag.glsl";

export default function DistortionShader () {
	return {
		uniforms: {
			"tDiffuse": 		{ type: "t", value: null },
			"offset": 			{ type: "f", value: 0 },
			"strength": 		{ type: "f", value: 0 },
			"uTime": 			{ type: "f", value: 1 },
			"height": 			{ type: "f", value: 1 },
			"aspectRatio":		{ type: "f", value: 1 },
			"cylindricalRatio": { type: "f", value: 1 }
		},
		vertexShader: vertex,
		fragmentShader: fragment
	}
}