attribute vec4 a_position;
attribute vec4 a_color;
attribute vec2 a_texCoord0;

uniform mat4 u_worldView;

varying vec4 v_color;
varying vec2 v_texCoords;
varying vec2 surfacePosition;

void main() 
{                          
	v_color = a_color; //vec4(1, 1, 1, 1);
	v_texCoords = a_texCoord0;
	surfacePosition = ( a_position * u_worldView ).xy;
		
	gl_Position =  u_worldView * a_position;
	
	//gl_Position =  u_worldView * vec4( a_position , 0.0, 1.0);
	 
}
