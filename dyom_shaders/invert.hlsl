float4 PS_Invert(float4 color)
{
    float4 invertedColor = float4(color.a - color.rgb, color.a); 
    return useInvert ? invertedColor : color;
}