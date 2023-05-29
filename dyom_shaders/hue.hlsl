float3 PS_Hue(float3 color)
{
    float3 hsl = RGBtoHSL(color);
    hsl.x += hueFactor; // Shift the hue by the hueFactor value

    // Wrap the hue value within the [0, 1] range
    hsl.x = frac(hsl.x);
    hsl = HSLtoRGB(hsl);
    return hsl;
}
