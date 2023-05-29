float4 PS_Vignette(float4 color, float2 uv)
{
    float2 center;
    float dist;
    if (vignetteShape == 0)
    {
    center = length(uv.xy - 0.5);
    dist = 1.0 - vignetteStartFactor * pow(center, vignetteEndFactor);
    }
    else
    {
    center = abs(uv - 0.5);
    dist = 1.0 - vignetteStartFactor * pow(max(abs(center.x), abs(center.y)), vignetteEndFactor);
    }

    float4 finalColor = float4(dist,dist,dist,dist);

    finalColor.rgb = lerp(float3(vignetteRed,vignetteGreen,vignetteBlue), float3(1,1,1), finalColor.rgb);
    finalColor.a = vignetteAlpha;

    return finalColor;
}