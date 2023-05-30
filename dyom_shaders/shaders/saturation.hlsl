float saturation = 1.0;

float4 PS_Saturation(float4 color)
{
    float3 hsl = RGBtoHSL(color.rgb);

    hsl.y *= saturation;

    float3 rgb = HSLtoRGB(hsl);

    return float4(rgb, color.a);
}