#ifdef GL_ES
precision mediump float;
#endif

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

void main( void ) {

	vec2 res = ( gl_FragCoord.xy / resolution.xy );
	float color = sin(res.x*50.*sin(time*0.2))*res.y*9.;
	gl_FragColor = vec4(.3,color*0.1  ,color,1.0);

}