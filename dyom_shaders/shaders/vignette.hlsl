
float vignetteRound  = 1.0; // 0.0 - square, 1.0 - circle, 1< spindle-like
float vignetteStart = 1.0; // distance from center of the screen to the vignette border. 1.0 - same as screen size. Can be greather than 1.0
float vignetteWidth = 0.0; // width of soft edge gradient. 0.0 - hard edge
float vignetteAspect = 0.0; // aspect ratio. 1.0 - prefect square/circle, 0.0 - fitted to screen proportions, less than 0 - wide, greater than 1 - tall

float vignetteRed = 0.0;
float vignetteGreen = 0.0;
float vignetteBlue = 0.0;
float vignetteAlpha = 1.0;
float vignetteMixing = 1.0;


float roundedBoxDistance(float2 pos, float2 size, float radius) 
{
	float2 v = abs(pos) - size + radius;
	v = max(v, 0.0);
    return length(v) - radius;
}

float4 PS_Vignette(float4 color, float2 uv)
{
	float aspect = lerp(screenWidth / screenHeight, 1.0, vignetteAspect);
	
	float2 size = 0.5 * float2(vignetteStart.xx);
	size.x *= aspect;
	
	float radius = 0.5 * vignetteRound * vignetteStart;
	
	float2 pos = uv - 0.5; // center on screen
	pos.x *= screenWidth / screenHeight;
	
	float dist = roundedBoxDistance(pos, size, radius);
	
	float alpha = max(dist, 0.0);
	alpha = saturate(alpha / (0.5 * vignetteWidth));
	alpha = smoothstep(1.0, 0.0, alpha);
	alpha = smoothstep(1.0, 0.0, alpha);
			
	float3 vColor = float3(vignetteRed, vignetteGreen, vignetteBlue);
	
	// mixing
	int m = round(vignetteMixing);
	if(m == 0) color.rgb = lerp(color.rgb, vColor, alpha * vignetteAlpha); // normal
	if(m == 1) color.rgb = lerp(color.rgb, color.rgb * vColor, alpha *  vignetteAlpha); // multiply
	if(m == 2) color.rgb = lerp(color.rgb, vColor, (1.0 - alpha) *  vignetteAlpha); // inverted normal
	if(m == 3) color.rgb = lerp(color.rgb, color.rgb * vColor, (1.0 - alpha) *  vignetteAlpha); // inverted multiply
				
	/*if(alpha <= 0.0) color.r = 1;
	if(alpha >= 1.0) color.g = 1; //*/
	
	return color;
}
