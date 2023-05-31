float desolate = 0.0;

float4 PS_Desolate(float4 color, float depth)
{
    if (desolate == 0) return color;

    depth = pow(abs(depth), desolate);

    float gray = dot(color.rgb, float3(0.299, 0.582, 0.114));
    float4 fogColor = float4(gray,gray,gray,1.0);
    float fogDensity = 1;
    float fogFactor = saturate(depth * fogDensity);
    
    color.rgb = lerp(color.rgb, fogColor.rgb, fogFactor);
    return color;
}