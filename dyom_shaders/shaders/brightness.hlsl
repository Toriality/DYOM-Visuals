float brightness = 1.0;

float4 PS_Brightness(float4 color)
{   
    color.rgb *= brightness;
    return color;
}