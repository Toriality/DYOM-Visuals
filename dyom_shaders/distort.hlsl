float2 PS_Distort(float2 uv)
{
    float2 centerOffset = 0.5 - uv;
    float distortion = 1 + distortFactor * dot(centerOffset, centerOffset);
    
    float2 deformedUV = uv * distortion + (1.0 - distortion) * 0.5;

    return deformedUV;
}

// float4 distort(float2 uv, float4 color, float distortionAmount, float distortionCenter)
// {
//     float2 centerOffset = distortionCenter - uv;
//     float distortion = 1 + distortionAmount * dot(centerOffset, centerOffset);
    
//     float2 deformedUV = uv * distortion + (1.0 - distortion) * distortionCenter;
    
//     // Check if UV coordinates are outside the desired range
//     if (
//         deformedUV.x < 0.0 || 
//         deformedUV.x > 1.0 || 
//         deformedUV.y < 0.0 || 
//         deformedUV.y > 1.0
//     ) 
//     {
//         return float4(0, 0, 0, 1); // Set color to black
//     }

//     return color;
// }