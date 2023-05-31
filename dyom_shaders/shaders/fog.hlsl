float fogSize = 0.0;
float fogRed = 0.0;
float fogGreen = 0.0;
float fogBlue = 0.0;
float fogStart = 0.77;
float fogEnd = 1.11;

float4 PS_Fog(float4 color, float depth)
{
    if (fogSize == 0) return color;

    depth = pow(abs(depth), fogSize);

    float4 fogColor = float4(fogRed, fogGreen, fogBlue, 1);
    float fogFactor = saturate((depth - fogStart) / (fogEnd - fogStart));

    color.rgb = lerp(color.rgb, fogColor.rgb, fogFactor);
    return color;
}
    