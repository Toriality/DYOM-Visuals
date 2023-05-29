float4 PS_Saturation(float4 color)
{
    float3 hsl = RGBtoHSL(color.rgb);

    hsl.y *= saturationFactor;

    float3 rgb = HSLtoRGB(hsl);

    return float4(rgb, color.a);
}