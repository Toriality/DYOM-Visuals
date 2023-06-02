float tint = 0.0;


float4 PS_Tint(float4 color)
{
    float3 t = float3(
        1.0 - tint, 
        1.0 - tint / 2, 
        1.0);
    return float4(color.rgb * t, color.a);
}