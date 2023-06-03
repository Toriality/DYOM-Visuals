float saturation = 1.0;

float4 PS_Saturation(float4 color)
{
	float gray = dot(color.rgb, float3(0.299, 0.587, 0.114));
	
    color.rgb = lerp(gray, color.rgb, saturation);
	
    return color;
}
