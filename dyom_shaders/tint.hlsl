float4 PS_Tint(float4 color)
{
    float3 tint = float3(
        1.0 - tintFactor, 
        1.0 - tintFactor / 2, 
        1.0);
    return float4(color.rgb * tint, color.a);
}