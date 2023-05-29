float3 PS_Levels(float3 color, float3 inputMin, float3 inputMax, float3 outputMin, float3 outputMax)
{
    float3 normalizedColor = saturate((color - inputMin) / (inputMax - inputMin));
    float3 adjustedColor = normalizedColor * (outputMax - outputMin) + outputMin;
    return adjustedColor;
}