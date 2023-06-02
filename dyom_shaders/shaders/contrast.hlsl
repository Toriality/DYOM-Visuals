float contrast = 1.0;

float4 PS_Contrast(float4 color)
{   
    color.rgb = (color.rgb - 0.5) * max(contrast, 0) + 0.5;
	color.rgb = max(color.rgb, 0.0);
    return color; 
}