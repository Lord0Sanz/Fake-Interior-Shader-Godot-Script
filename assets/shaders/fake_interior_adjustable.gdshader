// MIT License
// 
// Copyright (c) 2026 [PROJEKTSANSSTUDIOS]
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// Configurable Fake 3D Interior Shader
// Description: Creates a 3D interior illusion with customizable face parameters

shader_type spatial;
render_mode unshaded;

uniform sampler2D room_atlas;
uniform float brightness : hint_range(0.0, 4.0) = 1.0; // Brightness control clamped 0-4

/* 0:+X  1:-X  2:+Y  3:-Y  4:+Z  5:-Z */
uniform vec2 face_offset[6];
uniform vec2 face_size[6];

varying vec3 v_pos;
varying vec3 v_cam;

vec2 face_uv(vec3 p, vec3 f) {
	if (f.x > 0.5)  return vec2(-p.z,  p.y);
	if (f.x < -0.5) return vec2( p.z,  p.y);
	if (f.y > 0.5)  return vec2( p.x, -p.z);
	if (f.y < -0.5) return vec2( p.x,  p.z);
	if (f.z > 0.5)  return vec2( p.x,  p.y);
	return vec2(-p.x,  p.y);
}

int face_index(vec3 f) {
	if (f.x > 0.5)  return 0;
	if (f.x < -0.5) return 1;
	if (f.y > 0.5)  return 2;
	if (f.y < -0.5) return 3;
	if (f.z > 0.5)  return 4;
	return 5;
}

void vertex() {
	v_pos = VERTEX;
	v_cam = inverse(MODELVIEW_MATRIX)[3].xyz;
}

void fragment() {
	vec3 ray = normalize(v_pos - v_cam);

	float tx = (ray.x > 0.0) ? (0.5 - v_cam.x) / ray.x : (-0.5 - v_cam.x) / ray.x;
	float ty = (ray.y > 0.0) ? (0.5 - v_cam.y) / ray.y : (-0.5 - v_cam.y) / ray.y;
	float tz = (ray.z > 0.0) ? (0.5 - v_cam.z) / ray.z : (-0.5 - v_cam.z) / ray.z;

	float t = min(min(tx, ty), tz);
	vec3 hit = v_cam + ray * t;

	vec3 face;
	if (t == tx) face = vec3(sign(ray.x), 0.0, 0.0);
	else if (t == ty) face = vec3(0.0, sign(ray.y), 0.0);
	else face = vec3(0.0, 0.0, sign(ray.z));

	vec2 uv = face_uv(hit, face) * 0.5 + 0.5;

	/* FIX: flip both axes */
	uv = vec2(1.0 - uv.x, 1.0 - uv.y);

	uv = clamp(uv, 0.0, 1.0);

	int i = face_index(face);
	vec2 atlas_uv = face_offset[i] + uv * face_size[i];

	// Sample texture and apply brightness
	vec3 color = texture(room_atlas, atlas_uv).rgb;
	
	// Apply brightness control
	color = color * brightness;
	
	// Clamp to prevent negative values
	color = max(color, 0.0);
	
	ALBEDO = color;
}
