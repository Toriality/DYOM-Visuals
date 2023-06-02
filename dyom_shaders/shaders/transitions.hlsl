float toGray = 0.0;
float fromGray = 5.0;

float4 PS_toGray(float4 color) 
{
    if (toGray == 0) return color;

    float3 hsl = RGBtoHSL(color.rgb);

    hsl.y *= 1 - clamp(timeMission / toGray, 0, 1);

    float3 rgb = HSLtoRGB(hsl);

    return float4(rgb, color.a);
}

float4 PS_fromGray(float4 color) 
{
    if (toGray == 0) return color;

    float3 hsl = RGBtoHSL(color.rgb);

    hsl.y *= 0 + clamp(timeMission / fromGray, 0, 1);

    float3 rgb = HSLtoRGB(hsl);

    return float4(rgb, color.a);
}