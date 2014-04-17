//http://www.iquilezles.org/apps/shadertoy/
//edit :openkava
//edit :crab
#ifdef GL_ES
precision highp float;
#endif

uniform vec2 resolution;
uniform float time;
uniform vec2 mouse;

void main(void)
{
    vec2 p = -1.0 + 2.0 * gl_FragCoord.xy / resolution.xy;
    // vec2 cc = vec2( cos(.25*time), sin(.25*time*1.423) );
    vec2 cc = mouse;
	
    float dmin = 1000.0;
    vec2 z  = p*vec2(1.33,1.0);
    for( int i=0; i<64; i++ )
    {
        z = cc + vec2( z.x*z.x - z.y*z.y, 3.0*z.x*z.y );
        float m2 = dot(z,z);
        if( m2>10.0 ) break;
        dmin=min(dmin,m2);
        }

    float color = sqrt(sqrt(dmin))*0.7;
    gl_FragColor = vec4(color,0.1,0.2,1.0);
}