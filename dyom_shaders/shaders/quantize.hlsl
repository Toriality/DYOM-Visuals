float quantize = 0;

float4 PS_Quantize(float4 color)
{
    if (quantize < 0.001) 
    {
        return color;
    }
	
	color.rgb = round(color.rgb / quantize) * quantize;

    return color;
}