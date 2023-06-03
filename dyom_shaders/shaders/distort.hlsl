float distort = 0.0;

float2 PS_Distort(float2 uv)
{
	float2 offset = uv - 0.5;
	
	float r = length(offset);
	r *= 1.0 + r * r * distort;
	r *= 1.0 - 0.3 * max(distort, 0);
	
    return 0.5 + normalize(offset) * r;
}