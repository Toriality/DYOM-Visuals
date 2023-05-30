shared texture screen : SCREEN_TEX; 

extern sampler2D screenSampler = sampler_state
{
    Texture = <screen>;
	AddressU = MIRROR;
	AddressV = MIRROR;
};

float screenWidth = 1.0;
float screenHeight = 1.0;
float time = 12.08912;

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
    // correct pixel/texel sampling
	uv -= 1.0 / float2(screenWidth, screenHeight);
	
    // Make UV Distortion filters
    uv = PS_Zoom(uv);
    uv = PS_Distort(uv);
    uv = PS_Flip(uv);
    uv = PS_Bars(uv);
	
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
    color.rgb = PS_Levels(color.rgb);   
    color = PS_Quantize(color);
    color = PS_Invert(color);   
    color = PS_OneColor(color);
    color.rgb = PS_Interlaces(color, uv);
    color = PS_Vignette(color, uv);
    //color = PS_fromGray(color);
    //color = PS_toGray(color);
    return color;
}

technique draw
{
     pass P0
    {
        PixelShader  = compile ps_3_0 PS_main();
    }
}

