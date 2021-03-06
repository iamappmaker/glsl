#ifdef GL_ES
precision mediump float;
#endif

float f(float x, float y) {
    float a = x * x - y * y;
    float b = 2.0 * x * y;
    return sin(sqrt(a * a + b * b)/60.);
}

void main( void ) {

    vec2 position = gl_FragCoord.xy;

    float color = 1.0;
    color += f(position.x, position.y);

    gl_FragColor = vec4( vec3( color, 200, 30), 5.0 );

}