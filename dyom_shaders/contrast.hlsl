float4 PS_Contrast(float4 color)
{   
    color.rgb = ((color.rgb - 0.5) * max(contrastFactor, 0)) + 0.5;
    return color; 
}