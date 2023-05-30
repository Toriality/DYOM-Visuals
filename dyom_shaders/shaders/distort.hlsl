float distort = 0.0;

float2 PS_Distort(float2 uv)
{
    float2 centerOffset = 0.5 - uv;
    float distortion = 1 + distort  * dot(centerOffset, centerOffset);
    
    float2 deformedUV = uv * distortion + (1.0 - distortion) * 0.5;

    return deformedUV;
}