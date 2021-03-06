#ifdef GL_ES
precision mediump float;
#endif

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;
//tigrou 2013.02.28 (for gamedevdtack exchange)

float get2DTexture(float x, float y)
{
   return sin(x)+sin(y);
}

vec2 rotate(vec2 v, float angle)
{
    float x = v.x * cos(angle) - v.y * sin(angle);
    float y = v.x * sin(angle) + v.y * cos(angle);
    return vec2(x, y);
}

void main( void ) {
  
      vec2 position = ( gl_FragCoord.xy / resolution.xy ) - mouse;
      
     float x = position.x;	
     float y = position.y;
	
     float horizon = 0.2; //adjust if needed
     float fov = 0.8; 
	
     float px = x;
     float py = y - horizon - fov; 
     float pz = y - horizon;  	
	
     //projection 
     float sx = px / pz;
     float sy = py / pz; 
	
     float scaling = 12.0; //adjust if needed, depends of texture size

     //rotate	  
     /*vec2 r = rotate(vec2(sx, sy), time/10.0);	
     sx = r.x;
     sy = r.y;*/
   
     //move	
     sx += time / 8.0 * sign(pz);
	
     float color = get2DTexture(sx * scaling, sy * scaling);  

     //shading
     color *= pow(pz,2.)*2.5;	
	
     gl_FragColor = vec4( -color/5.*cos(time),color/3.,color/2.*sin(time),  1.0);

}