#ifdef GL_ES
precision mediump float;
#endif

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

void main( void ) {

	const float size=0.05;
	const float hlf=0.05*0.5;
		
	vec2 pos=gl_FragCoord.xy/resolution.xy;
	pos.x+=cos(time*1.31*0.5)*0.33;
	pos.y+=sin(time*1.72*0.5)*0.27;
	
	float toCenter=sqrt(
		pow(abs(0.5-pos.x), 2.0)+
		pow(abs(0.5-pos.y), 2.0)
	);
		
	vec2 pos2=gl_FragCoord.xy/resolution.xy;
	pos2.x+=sin(time*1.51*0.5)*0.25;
	pos2.y+=cos(time*1.4*0.5)*0.25;
	
	float toCenter2=sqrt(
		pow(abs(0.5-pos2.x), 2.0)+
		pow(abs(0.5-pos2.y), 2.0)
	);

	
	bool one=mod(toCenter, size)>hlf;
	bool two=mod(toCenter2, size)>hlf;
	float val=0.3;
	if((one && !two)) {
		val=0.7;	
	}
	if((!one && two)) {
		val=0.5;	
	}
			
	gl_FragColor = vec4(val*0.5, val, val*0.7, 1.0);

}