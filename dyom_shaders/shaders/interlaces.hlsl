int interlaces = 0;

float4 PS_Interlaces(float4 color, float2 uv) {
    if (frac(uv.y * interlaces) > 0.5) {
        return color * ((sin(time * 2) * 0.1) + 0.75) + (rand(time) * 0.05);
    }
    return color;
}