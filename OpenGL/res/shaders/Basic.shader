#shader vertex
#version 120

attribute vec4 position;

void main()
{
	gl_Position = position;
};

#shader fragment
#version 120

vec4 color;

uniform vec4 u_Color;

void main()
{
	gl_FragColor = u_Color;
};
