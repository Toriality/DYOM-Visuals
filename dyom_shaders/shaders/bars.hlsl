float barWidth = 0.0;
float barHeight = 0.0;

float2 PS_Bars(float2 uv)
{
    float leftBar = step(uv.x, barWidth);
    float rightBar = step(1.0 - uv.x, barWidth);
    float topBar = step(uv.y, barHeight);
    float bottomBar = step(1.0 - uv.y, barHeight);

    float2 deformedUV = uv * 1.0  - (leftBar + rightBar + topBar + bottomBar); 
    //(1.0 - (leftBar + rightBar + topBar + bottomBar));
    //uv.xy *= 1.0 - (leftBar + rightBar + topBar + bottomBar);

    return deformedUV;
}
