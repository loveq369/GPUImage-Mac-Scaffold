varying vec2 textureCoordinate;

uniform sampler2D inputImageTexture;
uniform vec3 inputColor;

void main()
{
	float grey;
	vec4 pixelColor;
    
	pixelColor = texture2D(inputImageTexture, textureCoordinate);
    grey = (pixelColor.r + pixelColor.g + pixelColor.b) / 3.0;
    
	gl_FragColor = vec4(grey * inputColor, 1.0);
}