#ifdef GL_ES
precision mediump float;
#endif
#define PI 3.1415926535
uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;
vec3 Check(vec2 pos) {
	float b = dot(sin(pos*3.), cos(pos*2.))<0.?1.:0.;
	return vec3(b);	
}
vec2 Rotate(vec2 pos, float angle) {
	return vec2(cos(angle)*pos.x - sin(angle)*pos.y, sin(angle)*pos.x + cos(angle)*pos.y);
}
void main( void ) {
	vec2 uv = gl_FragCoord.xy/resolution.y*2.-1.;
	uv.x -= resolution.x/resolution.y*.1;
	uv = Rotate(uv, sin(time)*.5);
	vec2 pos = vec2(0., 0.);
	float y = abs(uv.y+sin(uv.x+time*3.)/6.*(cos(time/3.)+1.) + sin((time+PI*.3)*2.)*.5 - .2);
	pos.y = 1./y + time*10.;
	pos.x = uv.x/y*2.5 + sin(time+PI*.4)*5.;
	vec3 col = Check(pos);
	gl_FragColor = vec4(col, 1.)*y;
}