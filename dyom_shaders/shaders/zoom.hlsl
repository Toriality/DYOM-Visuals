float zoom = 1.0;

float2 PS_Zoom(float2 uv)
{
    float2 zoomCenter = float2(0.5, 0.5); // Adjust to change zoom center
    float2 zoomedUV = (uv - zoomCenter) / zoom + zoomCenter;
    return zoomedUV;
}