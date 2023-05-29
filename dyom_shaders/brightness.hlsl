float4 PS_Brightness(float4 color)
{   
    color.rgb *= brightnessFactor;
    return color;
}