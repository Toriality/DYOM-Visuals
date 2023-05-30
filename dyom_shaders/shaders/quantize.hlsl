int quantize = 0;

float4 PS_Quantize(float4 color)
{
    if (quantize == 0) 
    {
        return color;
    }

    // Quantize the color channels
    float red = floor(color.r * quantize) / quantize;
    float green = floor(color.g * quantize) / quantize;
    float blue = floor(color.b * quantize) / quantize;

    // Convert to 8-bit color
    red = floor(red * 255.0 + 0.5) / 255.0;
    green = floor(green * 255.0 + 0.5) / 255.0;
    blue = floor(blue * 255.0 + 0.5) / 255.0;

    return float4(red, green, blue, color.a);
}