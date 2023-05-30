bool rainDrops = false;

float4 PS_Raindrops(float4 color, float2 uv)
{
    if (rainDrops == false)
    {
        return color; 
    }

    float2 u = uv;
    float2 v = (uv * 0.1);
    float2 n = noise(v * 200.0); // Displacement
    
    float4 f = tex2Dlod(screenSampler, float4(u, 0.0, 2.5));
    f = color;
    
    // Loop through the different inverse sizes of drops
    for (float r = 4.0; r > 0.0; r--)
    {
        float2 x = float2(1920, 1080) * r * 0.015; // Assuming a resolution of 1920x1080
        float2 p = 6.28 * u * x + (n - 0.5) * 2.0;
        float2 s = sin(p);
        
        // Current drop properties. Coordinates are rounded to ensure a
        // consistent value among the fragment of a given drop.
        float2 v = round(u * x - 0.25) / x;
        float4 d = float4(noise(v * 200.0), noise(v));
        
        // Drop shape and fading
        float t = (s.x + s.y) * max(0.0, 1.0 - frac(time * (d.b + 0.1) + d.g) * 2.0);
        
        // d.r -> only x% of drops are kept on, with x depending on the size of drops
        if (d.r < (5.0 - r) * 0.08 && t > 0.5)
        {
            // Drop normal
            float3 v = normalize(-float3(cos(p), lerp(0.2, 2.0, t - 0.5)));
            
            // Poor man's refraction (no visual need to do more)
            f = tex2D(screenSampler, u - v.xy * 0.3);
        }
    }
    
    return f;
}