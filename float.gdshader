shader_type canvas_item;

uniform float amplitude = 5.0;
uniform float speed = 1.0;

void vertex() {
	VERTEX.y += sin(TIME * speed) * amplitude;
}
