#ifdef GL_ES
precision highp float;
#endif

//test on IQ's distance functions : http://www.iquilezles.org/www/articles/distfunctions/distfunctions.htm

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

float sphere(vec3 p)
{
	return length(p)-5.;
}

float displacement(vec3 p)
{
	return sqrt(cos(p.x)*cos(p.y)*cos(p.z))*sqrt(sin(p.x)*sin(p.y)*sin(p.z));
}

float opDisplace( vec3 p )
{
	float d1 = sphere(p);
    	float d2 = displacement(p);
    	return d1+d2;
}

void main(){

	vec2 p = -1. + 2.*gl_FragCoord.xy / resolution.xy;
	p.x *= resolution.x/resolution.y;
	
  vec3 vuv=vec3(0,1,0);
  vec3 vrp=vec3(0,1,0);
  vec3 prp=vec3(sin(time)*8.0,4,cos(time)*8.0);

  vec3 vpn=normalize(vrp-prp);
  vec3 u=normalize(cross(vuv,vpn));
  vec3 v=cross(vpn,u);
  vec3 vcv=(prp+vpn);
  vec3 scrCoord=vcv+p.x*u+p.y*v;
  vec3 scp=normalize(scrCoord-prp);

  const vec3 e=vec3(0.1,0,0);
  const float maxd=16.0;

  float s=0.1;
  vec3 c,p1,n;

  float f=1.0;
  for(int i=0;i<16;i++){
    if (abs(s)<.01||f>maxd) break;
    f+=s;
    p1=prp+scp*f;
    s=opDisplace(p1);
  }
  
  if (f<maxd){
      c=vec3(1.);
    n=normalize(
      vec3(s-opDisplace(p1-e.xyy),
           s-opDisplace(p1-e.yxy),
           s-opDisplace(p1-e.yyx)));
    float b=dot(n,normalize(prp-p1));
    gl_FragColor=vec4((b*c+pow(b,8.0))*(1.0-f*.01),1.0);
  }
  else gl_FragColor=vec4(0,0,0,1);
}