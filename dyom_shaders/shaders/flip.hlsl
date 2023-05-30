bool flipY = false;
bool flipX = false;

float2 PS_Flip(float2 uv)
{
    float2 flippedUV = uv;
    if (flipY) flippedUV = float2(uv.x, 1.0 - uv.y);
    if (flipX) flippedUV = float2(1.0 - uv.x, uv.y);

    return flippedUV;
}   