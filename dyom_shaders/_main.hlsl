shared texture screen : SCREEN_TEX; 

sampler2D screenSampler = sampler_state
{
    Texture = <screen>;
};

// CLEO Timer
float time = 12.08912;

// Brightness variables
float brightnessFactor = 1.0;

// Contrast variables   
float contrastFactor = 1.0;

// Saturation variables
float saturationFactor = 1.0;

// Tint variables
float tintFactor = 0.0;

// Hue variables
float hueFactor = 0.0;

// Levels variables
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

// Distort variables
float distortFactor = 0.0;

// Raindrops variables
bool useRainDrops = false;

// Flip variables
bool flipVertical = false;
bool flipHorizontal = false;

// Bars variables
float barWidth = 0.0;
float barHeight = 0.0;

// Glitch variables
float glitchVertialFactor = 0.1;
float gitchHorizontalFactor = 0.1;
float glitchFactor = 0.0;

// Zoom variables
float zoomFactor = 1.0;

// Quantize variables
int quantizeSteps = 0;

// Onecolor variables
int oneColorColor = 0;

// Invert variables
bool useInvert = false;

// Interlaces variable
int interlaces = 0;

// Vignette variables
float vignetteStartFactor = 2.0;
float vignetteEndFactor = 1.0;
float vignetteRed = 1.0;
float vignetteGreen = 0.0;
float vignetteBlue = 0.0;
float vignetteAlpha = 0;
int vignetteShape = 0;

// Transition variables
float transitionTime;

#include "_funcs.hlsl"
#include "brightness.hlsl"
#include "contrast.hlsl"
#include "saturation.hlsl"
#include "tint.hlsl"
#include "hue.hlsl"
#include "levels.hlsl"
#include "vignette.hlsl"
#include "raindrops.hlsl"
#include "invert.hlsl"
#include "onecolor.hlsl"
#include "quantize.hlsl"
#include "zoom.hlsl"
#include "glitch.hlsl"
#include "bars.hlsl"
#include "flip.hlsl"
#include "distort.hlsl"
#include "interlaces.hlsl"
#include "transitions.hlsl"

float4 PS_main(float2 uv : TEXCOORD): COLOR
{
    // Make UV Distortion filters
    uv = PS_Zoom(uv);
    uv = PS_Distort(uv);
    uv = PS_Flip(uv);
    uv = PS_Bars(uv);

    // Check if UV coordinates are outside the desired range
    if (
        uv.x < 0.0 || 
        uv.x > 1.0 || 
        uv.y < 0.0 || 
        uv.y > 1.0
    ) 
    {
        return float4(0, 0, 0, 1); // Set color to black
    }
    
    // Sample the screen with the modified UV
    float4 color = tex2D(screenSampler, uv);

    // Apply shaders
    color = PS_Glitch(color, uv);
    color = PS_Raindrops(color, uv);
    color = PS_Brightness(color);
    color = PS_Contrast(color);
    color = PS_Saturation(color);   
    color = PS_Tint(color);
    color.rgb = PS_Hue(color.rgb);
    color.rgb = PS_Levels(
        color.rgb,
        float3(inputMinRed, inputMinGreen, inputMinBlue),
        float3(inputMaxRed, inputMaxGreen, inputMaxBlue),
        float3(outputMinRed, outputMinGreen, outputMinBlue),
        float3(outputMaxRed, outputMaxGreen, outputMaxBlue)
        );
    color = PS_Quantize(color);
    color = PS_Invert(color);
    color = PS_OneColor(color);
    color.rgb = PS_Interlaces(color, uv);
    //color *= PS_Vignette(color, uv);

    return color;
}

technique draw
{
     pass P0
    {
        PixelShader  = compile ps_3_0 PS_main();
    }
}

