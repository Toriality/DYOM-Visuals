float fogRed = 0.5;
float fogGreen = 0.5;
float fogBlue = 0.5;
float fogAlpha = 1.0;
float fogStart = 2.0;
float fogEnd = 20.0;

float4 PS_Fog(float4 color, float depth)
{
	// linearize depth
	float near = 0.1;
	float far = drawDistance;
	depth = near * far / (far - depth * (far - near)); // linear depth in world units

    float3 fogColor = float3(fogRed, fogGreen, fogBlue);
    float fogFactor = saturate((depth - fogStart) / (fogEnd - fogStart));
	fogFactor = sqrt(fogFactor);
	//fogFactor = pow(fogFactor, 0.25);
	
	fogFactor = round(fogFactor * 10.0) / 10.0;

    color.rgb = lerp(color.rgb, fogColor.rgb, fogFactor * fogAlpha);
		
    return color;
}
    