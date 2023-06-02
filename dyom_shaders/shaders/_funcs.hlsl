// https://www.chilliant.com/rgb2hsv.html

  float3 HUEtoRGB(in float H)
  {
    float R = abs(H * 6 - 3) - 1;
    float G = 2 - abs(H * 6 - 2);
    float B = 2 - abs(H * 6 - 4);
    return saturate(float3(R,G,B));
  }

  float Epsilon = 1e-10;
 
  float3 RGBtoHCV(in float3 RGB)
  {
    // Based on work by Sam Hocevar and Emil Persson
    float4 P = (RGB.g < RGB.b) ? float4(RGB.bg, -1.0, 2.0/3.0) : float4(RGB.gb, 0.0, -1.0/3.0);
    float4 Q = (RGB.r < P.x) ? float4(P.xyw, RGB.r) : float4(RGB.r, P.yzx);
    float C = Q.x - min(Q.w, Q.y);
    float H = abs((Q.w - Q.y) / (6 * C + Epsilon) + Q.z);
    return float3(H, C, Q.x);
  }

  float3 HSVtoRGB(in float3 HSV)
  {
    float3 RGB = HUEtoRGB(HSV.x);
    return ((RGB - 1) * HSV.y + 1) * HSV.z;
  }

    float3 HSLtoRGB(in float3 HSL)
  {
    float3 RGB = HUEtoRGB(HSL.x);
    float C = (1 - abs(2 * HSL.z - 1)) * HSL.y;
    return (RGB - 0.5) * C + HSL.z;
  }

  // The weights of RGB contributions to luminance.
  // Should sum to unity.
  float3 HCYwts = float3(0.299, 0.587, 0.114);
 
  float3 HCYtoRGB(in float3 HCY)
  {
    float3 RGB = HUEtoRGB(HCY.x);
    float Z = dot(RGB, HCYwts);
    if (HCY.z < Z)
    {
        HCY.y *= HCY.z / Z;
    }
    else if (Z < 1)
    {
        HCY.y *= (1 - HCY.z) / (1 - Z);
    }
    return (RGB - Z) * HCY.y + HCY.z;
  }

  float HCLgamma = 3;
  float HCLy0 = 100;
  float HCLmaxL = 0.530454533953517; // == exp(HCLgamma / HCLy0) - 0.5
  float PI = 3.1415926536;
 
  float3 HCLtoRGB(in float3 HCL)
  {
    float3 RGB = 0;
    if (HCL.z != 0)
    {
      float H = HCL.x;
      float C = HCL.y;
      float L = HCL.z * HCLmaxL;
      float Q = exp((1 - C / (2 * L)) * (HCLgamma / HCLy0));
      float U = (2 * L - C) / (2 * Q - 1);
      float V = C / Q;
      float A = (H + min(frac(2 * H) / 4, frac(-2 * H) / 8)) * PI * 2;
      float T;
      H *= 6;
      if (H <= 0.999)
      {
        T = tan(A);
        RGB.r = 1;
        RGB.g = T / (1 + T);
      }
      else if (H <= 1.001)
      {
        RGB.r = 1;
        RGB.g = 1;
      }
      else if (H <= 2)
      {
        T = tan(A);
        RGB.r = (1 + T) / T;
        RGB.g = 1;
      }
      else if (H <= 3)
      {
        T = tan(A);
        RGB.g = 1;
        RGB.b = 1 + T;
      }
      else if (H <= 3.999)
      {
        T = tan(A);
        RGB.g = 1 / (1 + T);
        RGB.b = 1;
      }
      else if (H <= 4.001)
      {
        RGB.g = 0;
        RGB.b = 1;
      }
      else if (H <= 5)
      {
        T = tan(A);
        RGB.r = -1 / T;
        RGB.b = 1;
      }
      else
      {
        T = tan(A);
        RGB.r = 1;
        RGB.b = -T;
      }
      RGB = RGB * V + U;
    }
    return RGB;
  }

  float3 RGBtoHSV(in float3 RGB)
  {
    float3 HCV = RGBtoHCV(RGB);
    float S = HCV.y / (HCV.z + Epsilon);
    return float3(HCV.x, S, HCV.z);
  }

   float3 RGBtoHSL(in float3 RGB)
  {
    float3 HCV = RGBtoHCV(RGB);
    float L = HCV.z - HCV.y * 0.5;
    float S = HCV.y / (1 - abs(L * 2 - 1) + Epsilon);
    return float3(HCV.x, S, L);
  }

  float3 RGBtoHCY(in float3 RGB)
  {
    // Corrected by David Schaeffer
    float3 HCV = RGBtoHCV(RGB);
    float Y = dot(RGB, HCYwts);
    float Z = dot(HUEtoRGB(HCV.x), HCYwts);
    if (Y < Z)
    {
      HCV.y *= Z / (Epsilon + Y);
    }
    else
    {
      HCV.y *= (1 - Z) / (Epsilon + 1 - Y);
    }
    return float3(HCV.x, HCV.y, Y);
  }

  float3 RGBtoHCL(in float3 RGB)
  {
    float3 HCL;
    float H = 0;
    float U = min(RGB.r, min(RGB.g, RGB.b));
    float V = max(RGB.r, max(RGB.g, RGB.b));
    float Q = HCLgamma / HCLy0;
    HCL.y = V - U;
    if (HCL.y != 0)
    {
      H = atan2(RGB.g - RGB.b, RGB.r - RGB.g) / PI;
      Q *= U / V;
    }
    Q = exp(Q);
    HCL.x = frac(H / 2 - min(frac(H), frac(-H)) / 6);
    HCL.y *= Q;
    HCL.z = lerp(-U, V, Q) / (HCLmaxL * 2);
    return HCL;
  }




// /**
//  * Converts an RGB color value to its corresponding HSL representation.
//  *
//  * @param color - The input RGB color to convert.
//  * @return float3 - The resulting HSL color representation.
//  */
// float3 RGBtoHSL(float3 color)
// {
//     float r = color.r;
//     float g = color.g;
//     float b = color.b;
  
//     float cMax = max(max(r, g), b);
//     float cMin = min(min(r, g), b);
  
//     float h, s, l;
  
//     l = (cMax + cMin) * 0.5;
  
//     if (cMax == cMin)
//     {
//         h = 0.0;
//         s = 0.0;
//     }
//     else
//     {
//         float cDelta = cMax - cMin;
      
//         if (l < 0.5)
//         {
//             s = cDelta / (cMax + cMin);
//         }
//         else
//         {
//             s = cDelta / (2.0 - cMax - cMin);
//         }
      
//         if (r == cMax)
//         {
//             h = (g - b) / cDelta;
//         }
//         else if (g == cMax)
//         {
//             h = 2.0 + (b - r) / cDelta;
//         }
//         else
//         {
//             h = 4.0 + (r - g) / cDelta;
//         }
      
//         h /= 6.0;
      
//         if (h < 0.0)
//         {
//             h += 1.0;
//         }
//     }
  
//     return float3(h, s, l);
// }

// /**
//  * Converts a hue value to its corresponding RGB component value.
//  *
//  * @param p - Intermediate value used in the conversion.
//  * @param q - Intermediate value used in the conversion.
//  * @param t - The input hue value to convert.
//  * @return float - The resulting RGB component value.
//  */
// float HueToRGB(float p, float q, float t)
// {
//     if (t < 0.0) t += 1.0;
//     if (t > 1.0) t -= 1.0;
  
//     if (t < 1.0 / 6.0) return p + (q - p) * 6.0 * t;
//     if (t < 1.0 / 2.0) return q;
//     if (t < 2.0 / 3.0) return p + (q - p) * (2.0 / 3.0 - t) * 6.0;
  
//     return p;
// }

// /**
//  * Converts an HSL color value to its corresponding RGB representation.
//  *
//  * @param hsl - The input HSL color to convert.
//  * @return float3 - The resulting RGB color representation.
//  */
// float3 HSLtoRGB(float3 hsl)
// {
//     float h = hsl.x;
//     float s = hsl.y;
//     float l = hsl.z;
  
//     float r, g, b;
  
//     if (s == 0.0)
//     {
//         r = l;
//         g = l;
//         b = l;
//     }
//     else
//     {
//         float q;
      
//         if (l < 0.5)
//         {
//             q = l * (1.0 + s);
//         }
//         else
//         {
//             q = l + s - (l * s);
//         }
      
//         float p = 2.0 * l - q;
      
//         r = HueToRGB(p, q, h + 1.0 / 3.0);
//         g = HueToRGB(p, q, h);
//         b = HueToRGB(p, q, h - 1.0 / 3.0);
//     }
  
//     return float3(r, g, b);
// }

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
