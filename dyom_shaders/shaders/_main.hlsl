shared texture screen : SCREEN_TEX; 
shared texture depthscreen : DEPTH_TEX;

extern sampler2D screenSampler = sampler_state
{
    Texture = <screen>;
	Filter = MIN_MAG_MIP_LINEAR;
	//AddressU = MIRROR;
	//AddressV = MIRROR;
};

extern sampler2D depthSampler = sampler_state
{
    Texture = <depthscreen>;
	Filter = MIN_MAG_MIP_LINEAR;
	//AddressU = MIRROR;
	//AddressV = MIRROR;
};

float screenWidth = 1.0;
float screenHeight = 1.0;
float timeMission = 1.0;
float timeObjective = 1.0;
float timeLeft = 1.0;
float drawDistance = 1.0;


#include "_funcs.hlsl"
#include "bars.hlsl"
#include "brightness.hlsl"
#include "contrast.hlsl"
#include "desolate.hlsl"
#include "distort.hlsl"
#include "flip.hlsl"
#include "fog.hlsl"
#include "glitch.hlsl"
#include "hue.hlsl"
#include "interlaces.hlsl"
#include "levels.hlsl"
#include "onecolor.hlsl"
#include "quantize.hlsl"
#include "raindrops.hlsl"
#include "saturation.hlsl"
#include "tint.hlsl"
#include "transitions.hlsl"
#include "vignette.hlsl"
#include "zoom.hlsl"

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
    float depth = tex2D(depthSampler, uv).x;


    // Screen shaders
    color = PS_Glitch(color, uv);
    color = PS_Raindrops(color, uv);
    color = PS_Brightness(color);
    color = PS_Contrast(color);
    color = PS_Saturation(color);   
    color = PS_Tint(color);
    color.rgb = PS_Hue(color.rgb);
    color.rgb = PS_Levels(color.rgb);   
    color = PS_Quantize(color); 
    color = PS_OneColor(color);
    color.rgb = PS_Interlaces(color, uv);
    //color = PS_fromGray(color);
    //color = PS_toGray(color);
    
    // Depth shaders
    color = PS_Fog(color, depth);
    color = PS_Desolate(color, depth);

    // Vignette
    color = PS_Vignette(color, uv);

    return color;
}

technique draw
{
     pass P0
    {
        PixelShader  = compile ps_3_0 PS_main();
    }
}

