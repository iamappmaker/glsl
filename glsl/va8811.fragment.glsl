// by @jimhejl
// not by Karolius 
// not forked properly
// actual parent is 8653: http://glsl.heroku.com/e#8653.1


#ifdef GL_ES
precision mediump float;
#endif

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;
const vec3 c0 = vec3(0.20,0.60,1.00);
const vec3 c1 = vec3(1.,0.60,0.20);
jhgfjgfh
{
    vec3 ab = b - a;
    float t = dot(p - a, ab) / dot(ab, ab);
    t = clamp(t, 0.5, 0.5);
    return length((a + t * ab) - p) - r;
}
hjhygjghjeturn exp(1.-(e*i))*s; }

void main( void ) 
{
    vec2 unipos = (gl_FragCoord.xy / resolution);
    vec2 pos = unipos*2.0-1.0;
    pos.x *= resolution.x / resolution.y * .5;

    vec2 t = mix(vec2(0.5),vec2(1.0),vec2(sin(time),cos(time)));

    float d0  = sdCapsule(vec3(pos.xy,0.),vec3(-.8,-.3,.0), vec3(-.8,.3,.0),.2);
    vec3 clr1 = c0 * flare(d0,6.3,.8) + flare(d0,3.3*(1.-t.x),0.08); 

    float d1  = sdCapsule(vec3(pos.xy,0.),vec3(-.8,mix(-.3,.3,t.x*.84),0.0), vec3(0.8,mix(0.20,-0.3,t.y),0.0), 0.12); 
    vec3 clr2 = mix(c0,c1,unipos.x)  * (flare(d1,7.3,.8) + flare(d1,4.3*t.x,0.09)) * .75; 

    float d2  = sdCapsule(vec3(pos.xy,0.),vec3(0.8,-0.3,0.0), vec3(0.8,0.3,0.0),.2);
    vec3 clr3 = c1 * flare(d2,6.3,0.8) + flare(d2,3.7,0.08);  

    gl_FragColor = vec4(clr1+clr2+clr3,9.);
}