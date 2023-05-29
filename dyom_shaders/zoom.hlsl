float2 PS_Zoom(float2 uv)
{
    float2 zoomCenter = float2(0.5, 0.5); // Adjust to change zoom center
    float2 zoomedUV = (uv - zoomCenter) / zoomFactor + zoomCenter;
    return zoomedUV;
}