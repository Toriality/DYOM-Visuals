int oneColor = 0;

float4 PS_OneColor(float4 color)
{
    if (oneColor == 0)
    {
        return color;
    }

    // Check which color to keep
    bool keepRed = (oneColor == 1 && color.r > max(color.g, color.b) * 2);
    bool keepGreen = (oneColor == 2 && color.g > max(color.r / 2.4, color.b) * 2);
    bool keepBlue = (oneColor == 3 && color.b > max(color.r, color.g / 1.2));

    // Convert the color to grayscale
    float gray = dot(color.rgb, float3(0.299, 0.587, 0.114));

    // Apply the selective grayscale effect
    color.rgb = lerp(color.rgb, float3(gray, gray, gray), keepRed || keepGreen || keepBlue ? 0 : 1);

    return color;
};