#ifdef GL_ES
precision mediump float;
#endif

varying vec4 v_color;
varying vec2 v_texCoords;
varying vec2 surfacePosition;

uniform sampler2D u_texture;
uniform vec2 resolution;

void main() 
{
	gl_FragColor = v_color * texture2D( u_texture, v_texCoords );
}
