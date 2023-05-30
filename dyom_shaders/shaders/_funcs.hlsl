/**
 * Converts an RGB color value to its corresponding HSL representation.
 *
 * @param color - The input RGB color to convert.
 * @return float3 - The resulting HSL color representation.
 */
float3 RGBtoHSL(float3 color)
{
    float r = color.r;
    float g = color.g;
    float b = color.b;
  
    float cMax = max(max(r, g), b);
    float cMin = min(min(r, g), b);
  
    float h, s, l;
  
    l = (cMax + cMin) * 0.5;
  
    if (cMax == cMin)
    {
        h = 0.0;
        s = 0.0;
    }
    else
    {
        float cDelta = cMax - cMin;
      
        if (l < 0.5)
        {
            s = cDelta / (cMax + cMin);
        }
        else
        {
            s = cDelta / (2.0 - cMax - cMin);
        }
      
        if (r == cMax)
        {
            h = (g - b) / cDelta;
        }
        else if (g == cMax)
        {
            h = 2.0 + (b - r) / cDelta;
        }
        else
        {
            h = 4.0 + (r - g) / cDelta;
        }
      
        h /= 6.0;
      
        if (h < 0.0)
        {
            h += 1.0;
        }
    }
  
    return float3(h, s, l);
}

/**
 * Converts a hue value to its corresponding RGB component value.
 *
 * @param p - Intermediate value used in the conversion.
 * @param q - Intermediate value used in the conversion.
 * @param t - The input hue value to convert.
 * @return float - The resulting RGB component value.
 */
float HueToRGB(float p, float q, float t)
{
    if (t < 0.0) t += 1.0;
    if (t > 1.0) t -= 1.0;
  
    if (t < 1.0 / 6.0) return p + (q - p) * 6.0 * t;
    if (t < 1.0 / 2.0) return q;
    if (t < 2.0 / 3.0) return p + (q - p) * (2.0 / 3.0 - t) * 6.0;
  
    return p;
}

/**
 * Converts an HSL color value to its corresponding RGB representation.
 *
 * @param hsl - The input HSL color to convert.
 * @return float3 - The resulting RGB color representation.
 */
float3 HSLtoRGB(float3 hsl)
{
    float h = hsl.x;
    float s = hsl.y;
    float l = hsl.z;
  
    float r, g, b;
  
    if (s == 0.0)
    {
        r = l;
        g = l;
        b = l;
    }
    else
    {
        float q;
      
        if (l < 0.5)
        {
            q = l * (1.0 + s);
        }
        else
        {
            q = l + s - (l * s);
        }
      
        float p = 2.0 * l - q;
      
        r = HueToRGB(p, q, h + 1.0 / 3.0);
        g = HueToRGB(p, q, h);
        b = HueToRGB(p, q, h - 1.0 / 3.0);
    }
  
    return float3(r, g, b);
}

/**
 * Generates a pseudo-random value based on the input vector.
 *
 * @param c - The input vector to use as a seed for the random value.
 * @return float2 - The pseudo-random value between 0 and 1.
 */
float2 rand(float2 c)
{
    float2 m = float2(12.9898, 78.233);
    float2 s = float2(43758.5453, 14142.1);
    return frac(sin(float2(dot(c, m), dot(c, m.yx))) * s);
}

float rand(float seed){
    return frac(
        sin(
            dot(
                float2(seed, seed), 
                float2(12.9898,78.233)
            )
        ) * 43758.5453
    );
}


/**
 * Generates a 2D noise value based on the input coordinates.
 *
 * @param p - The input coordinates to sample the noise value from.
 * @return float2 - The noise value between 0 and 1.
 */
float2 noise(float2 p)
{
    float2 co = floor(p);
    float2 mu = frac(p);
    mu = 3.0 * mu * mu - 2.0 * mu * mu * mu;
    float2 a = rand(co + float2(0.0, 0.0));
    float2 b = rand(co + float2(1.0, 0.0));
    float2 c = rand(co + float2(0.0, 1.0));
    float2 d = rand(co + float2(1.0, 1.0));
    return lerp(lerp(a, b, mu.x), lerp(c, d, mu.y), mu.y);
}

// Correct UV
float4 UVCorrection(float4 color, float2 uv)
{
    if (
        uv.x < 0.0 || 
        uv.x > 1.0 || 
        uv.y < 0.0 || 
        uv.y > 1.0
    ) 
    {
        return float4(0, 0, 0, 1); // Set color to black
    }
    return color;
}
