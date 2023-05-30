float inputMinRed = 0.0;
float inputMaxRed = 1.0;
float outputMinRed = 0.0;
float outputMaxRed = 1.0;
float inputMinGreen = 0.0;
float inputMaxGreen = 1.0;
float outputMinGreen = 0.0;
float outputMaxGreen = 1.0;
float inputMinBlue = 0.0;
float inputMaxBlue = 1.0;
float outputMinBlue = 0.0;
float outputMaxBlue = 1.0;

float3 PS_Levels(float3 color)
{
    float3 inputMin = float3(inputMinRed, inputMinGreen, inputMinBlue);
    float3 inputMax = float3(inputMaxRed, inputMaxGreen, inputMaxBlue);
    float3 outputMin = float3(outputMinRed, outputMinGreen, outputMinBlue);
    float3 outputMax = float3(outputMaxRed, outputMaxGreen, outputMaxBlue);

    float3 normalizedColor = saturate((color - inputMin) / (inputMax - inputMin));
    float3 adjustedColor = normalizedColor * (outputMax - outputMin) + outputMin;
    return adjustedColor;
}