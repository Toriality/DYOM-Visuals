float glitchY = 0.1;
float glitchX = 0.1;
float glitch = 0.0;

float4 PS_Glitch(float4 color, float2 uv)
{
    // Create horizontal glitch effect
    float glitchOffset = 0.1 * glitchX;
    float4 glitchColor = tex2D(screenSampler, float2(uv.x + glitchOffset, uv.y));

    // Create vertical glitch effect
    float vertGlitchOffset = 0.1 * glitchY;
    float4 vertGlitchColor = tex2D(screenSampler, float2(uv.x, uv.y + vertGlitchOffset));

    // Mix the glitch colors with the original color
    float4 mixedColor = color;
    mixedColor.r = lerp(color.r, glitchColor.r, glitch);
    mixedColor.b = lerp(color.b, vertGlitchColor.b, glitch);

    return mixedColor;
}  
