// fuck that shit.

#ifdef GL_ES
precision mediump float;
#endif

uniform float time;
uniform vec2 resolution;

void main( void )
{
	vec2 pos = gl_FragCoord.xy / resolution.xy;
	vec2 uPos = pos;
	uPos.y -= 0.5;
	
	vec3 color = vec3(.000);
	const float k = 2.0;
	for( float i = k; i > 0.5; --i )
	{
		float t = time * (1.75);
	
		uPos.y += (sin( uPos.x*exp(i) - t)) * sin(cos(sin(time*3.0)) / 12.0 * abs(cos(time*3.7)*sin(time*2.9)*3.0));
		float fTemp = abs(3.0/(500.0*k) / uPos.y);
		color += vec3( cos(time*2.1)/30.0+fTemp*(i*1.5), fTemp*i/k*2.0, pow(fTemp,0.93)*0.9 );
	}
	
	gl_FragColor = vec4(color, 0.1);
}
