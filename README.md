# DYOM Visuals

_Enhance your missions with special effects and shaders_

## Summary

1. [Installation](#installation)
2. [Documentation](#documentation)
   1. [Visuals File](#visuals-file)
   2. [Nomenclatures](#nomenclatures)
   3. [List of Effects](#list-of-effects)
      - [HUD](#HUD)
      - [Radar](#Radar)
      - [SiteRocket](#SiteRocket)
      - [Shake](#Shake)
      - [FadeIn](#FadeIn)
      - [FadeOut](#FadeOut)
      - [Darkness](#Darkness)
      - [Drunkenness](#Drunkenness)
      - [ForceAiming](#ForceAiming)
      - [ForceWalking](#ForceWalking)
      - [ForceFirstPersonCamera](#ForceFirstPersonCamera)
      - [ForceCinematicCamera](#ForceCinematicCamera)
   4. [List of Shaders](#list-of-shaders)
      - [Brightness](#Brightness)
      - [Contrast](#Contrast)
      - [Saturation](#Saturation)
      - [Tint](#Tint)
      - [Hue](#Hue)
      - [InputMinRed](#InputMinRed)
      - [InputMaxRed](#InputMaxRed)
      - [OutputMinRed](#OutputMinRed)
      - [OutputMaxRed](#OutputMaxRed)
      - [InputMinGreen](#InputMinGreen)
      - [InputMaxGreen](#InputMaxGreen)
      - [OutputMinGreen](#OutputMinGreen)
      - [OutputMaxGreen](#OutputMaxGreen)
      - [InputMinBlue](#InputMinBlue)
      - [InputMaxBlue](#InputMaxBlue)
      - [OutputMinBlue](#OutputMinBlue)
      - [OutputMaxBlue](#OutputMaxBlue)
      - [Distort](#Distort)
      - [RainDrops](#RainDrops)
      - [FlipVertical](#FlipVertical)
      - [FlipHorizontal](#FlipHorizontal)
      - [BarWidth](#BarWidth)
      - [BarHeight](#BarHeight)
      - [Glitch](#Glitch)
      - [GlitchVertical](#GlitchVertical)
      - [GlitchHorizontal](#GlitchHorizontal)
      - [Zoom](#Zoom)
      - [Quantize](#Quantize)
      - [OneColor](#OneColor)
      - [Invert](#Invert)
      - [Interlaces](#Interlaces)

## Installation

...

## Documentation

### Visuals File

When you create a new mission in DYOM, an SD code is assigned to this mission. Navigate to `My Documents/GTA San Andreas User Files/SD` and create a folder with the name of the SD code for your mission.

Inside this folder you should create a new file called `visuals.ini`. Within this file you will be able to customize all of the effects, shaders, and transitions that you want to put into your mission.

To set up the visuals, the file should contain the following syntax

```ini
[OBJECTIVE_X]
VisualName=Value
```

So, for example, if you want Objective 20 of your mission to hide the radar and HUD, and they only reappear after Objective 35, you could do the following

```ini
[OBJECTIVE_20]
HUD=0
Radar=0

[OBJECTIVE_35]
HUD=1
Radar=1
```

It's that simple!

### Nomenclatures

DYOM Visuals is a feature-packed addition to enhance your missions with innovative special effects. It offers a wide range of visuals divided into three distinct categories: **Effects, Shaders, and Transitions**.

- **Effects:** This category includes settings that leverage existing features in the original game to bring about changes in display and gameplay. You can enable/disable the Heads-Up Display (HUD), adjust the Field of View (FOV), and even enforce specific camera styles. These options give you greater control over the visual presentation and overall gameplay experience.

- **Shaders:** Shaders are powerful visual graphics that overlay the original game screen with various elements such as colors, overlays, distortions, and more. They provide extensive customization possibilities, allowing you to create unique and immersive visual environments. With shaders like contrast adjustment, CCTV effect, and color adjustment, you can craft captivating visuals tailored to your mission's specific needs.

- **Transitions:** This category comprises shaders designed to smoothly transition from one point to another, with customizable durations. These transitions can elevate the cinematic feel of your missions by adding visually appealing effects. For example, you can seamlessly shift from color to grayscale or vice versa, enhancing the atmosphere and storytelling elements within your missions.

- **Visuals:** Englobe all the above categories

### List of Effects

<table>

<thead id="HUD">
  <tr>
    <th colspan="3">
    <center>
    HUD
    </center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>0 or 1</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>1</td>
  </tr>
  <tr>
    <td colspan="2">Enables/disables all the HUD elements, except the radar</td>
  </tr>
</tbody>

<thead id="Radar">
  <tr>
    <th colspan="3">
    <center>Radar</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>0 or 1</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>1</td>
  </tr>
  <tr>
    <td colspan="2">Enables/disables radar</td>
  </tr>
</tbody>

<thead id="SiteRocket">
  <tr>
    <th colspan="3">
    <center>SiteRocket</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>0 or 1</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>0</td>
  </tr>
  <tr>
    <td colspan="2">Enables/disables rocket launcher crosshair in first person view on vehicles. Used in Ryder's Catalyst mission.</td>
  </tr>
</tbody>

<thead id="Shake">
  <tr>
    <th colspan="3">
    <center>Shake</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>Any integer</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>0</td>
  </tr>
  <tr>
    <td colspan="2">Shakes the game camera with given intensity.</td>
  </tr>
</tbody>

<thead id="FadeIn">
  <tr>
    <th colspan="3">
    <center>FadeIn</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>Any integer</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>0</td>
  </tr>
  <tr>
    <td colspan="2">Fade in for X milliseconds.</td>
  </tr>
</tbody>

<thead id="FadeOut">
  <tr>
    <th colspan="3">
    <center>FadeOut</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>Any integer</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>0</td>
  </tr>
  <tr>
    <td colspan="2">Fade out for X milliseconds</td>
  </tr>
</tbody>

<thead id="Darkness">
  <tr>
    <th colspan="3">
    <center>Darkness</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>0 or 1</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>0</td>
  </tr>
  <tr>
    <td colspan="2">Applies the darkness effect used in the End Of The Line mission.</td>
  </tr>
</tbody>

<thead id="Drunkenness">
  <tr>
    <th colspan="3">
    <center>Drunkenness</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>Any integer</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>0</td>
  </tr>
  <tr>
    <td colspan="2">Swings the camera simulating a drunkenness effect with a given intensity.</td>
  </tr>
</tbody>

<thead id="ForceAiming">
  <tr>
    <th colspan="3">
    <center>ForceAiming</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>0 or 1</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>0</td>
  </tr>
  <tr>
    <td colspan="2">Forces the right mouse button to be pressed, and disables the player's ability to change weapons.</td>
  </tr>
</tbody>

<thead id="ForceWalking">
  <tr>
    <th colspan="3">
    <center>ForceWalking</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>0 or 1</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>0</td>
  </tr>
  <tr>
    <td colspan="2">Forces the left ALT keyboard button to be pressed. Disables the player's ability to jump, run and crouch.</td>
  </tr>
</tbody>

<thead id="ForceFirstPersonCamera">
  <tr>
    <th colspan="3">
    <center>ForceFirstPersonCamera</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>0 or 1</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>0</td>
  </tr>
  <tr>
    <td colspan="2">Forces the first person camera on vehicles.</td>
  </tr>
</tbody>

<thead id="ForceCinematicCamera">
  <tr>
    <th colspan="3">
    <center>ForceCinematicCamera</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>0 or 1</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>0</td>
  </tr>
  <tr>
    <td colspan="2">Force cinematic camera on vehicles.</td>
  </tr>
</tbody>

</table>

### List of Shaders

<table>

<thead id="Brightness">
  <tr>
    <th colspan="3">
    <center>Brightness </center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>Any float</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>1.0</td>
  </tr>
  <tr>
    <td colspan="2">Adjusts the brightness of the screen
</td>
  </tr>
</tbody>

<thead id="Contrast">
  <tr>
    <th colspan="3">
    <center>Contrast</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>Any float</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>1.0</td>
  </tr>
  <tr>
    <td colspan="2">
    Adjusts the contrast of the screen
    </td>
  </tr>
</tbody>

<thead id="Saturation">
  <tr>
    <th colspan="3">
    <center>Saturation</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>Any float</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>1.0</td>
  </tr>
  <tr>
    <td colspan="2">
    Adjusts the saturation of the screen
    </td>
  </tr>
</tbody>

<thead id="Tint">
  <tr>
    <th colspan="3">
    <center>Tint</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>Any float</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>0.0</td>
  </tr>
  <tr>
    <td colspan="2">
    Adjusts the color temperature
    </td>
  </tr>
</tbody>

<thead id="Hue">
  <tr>
    <th colspan="3">
    <center>Hue</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>Any float</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>1.0</td>
  </tr>
  <tr>
    <td colspan="2">
    Adjusts the color palette
    </td>
  </tr>
</tbody>

<thead id="InputMinRed">
  <tr>
    <th colspan="3">
    <center>InputMinRed</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>Any float</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>0.0</td>
  </tr>
  <tr>
    <td colspan="2">
    Change minimum value for the red channel of the screen input
    </td>
  </tr>
</tbody>

<thead id="InputMaxRed">
  <tr>
    <th colspan="3">
    <center>InputMaxRed</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>Any float</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>1.0</td>
  </tr>
  <tr>
    <td colspan="2">
    Change maximum value for the red channel of the screen input
    </td>
  </tr>
</tbody>

<thead id="OutputMinRed">
  <tr>
    <th colspan="3">
    <center>OutputMinRed</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>Any float</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>0.0</td>
  </tr>
  <tr>
    <td colspan="2">
    Change minimum value for the red channel of the screen output
    </td>
  </tr>
</tbody>

<thead id="OutputMaxRed">
  <tr>
    <th colspan="3">
    <center>OutputMaxRed</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>Any float</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>1.0</td>
  </tr>
  <tr>
    <td colspan="2">
    Change maximum value for the red channel of the screen output
    </td>
  </tr>
</tbody>

<thead id="InputMinGreen">
  <tr>
    <th colspan="3">
    <center>InputMinGreen</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>Any float</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>0.0</td>
  </tr>
  <tr>
    <td colspan="2">
    Change minimum value for the green channel of the screen input
    </td>
  </tr>
</tbody>

<thead id="InputMaxGreen">
  <tr>
    <th colspan="3">
    <center>InputMaxGreen</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>Any float</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>1.0</td>
  </tr>
  <tr>
    <td colspan="2">
    Change maximum value for the green channel of the screen input
    </td>
  </tr>
</tbody>

<thead id="OutputMinGreen">
  <tr>
    <th colspan="3">
    <center>OutputMinGreen</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>Any float</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>0.0</td>
  </tr>
  <tr>
    <td colspan="2">
    Change minimum value for the green channel of the screen output
    </td>
  </tr>
</tbody>

<thead id="OutputMaxGreen">
  <tr>
    <th colspan="3">
    <center>OutputMaxGreen</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>Any float</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>1.0</td>
  </tr>
  <tr>
    <td colspan="2">
    Change maximum value for the green channel of the screen output
    </td>
  </tr>
</tbody>

<thead id="InputMinBlue">
  <tr>
    <th colspan="3">
    <center>InputMinBlue</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>Any float</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>0.0</td>
  </tr>
  <tr>
    <td colspan="2">
    Change minimum value for the green channel of the screen input
    </td>
  </tr>
</tbody>

<thead id="InputMaxBlue">
  <tr>
    <th colspan="3">
    <center>InputMaxBlue</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>Any float</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>1.0</td>
  </tr>
  <tr>
    <td colspan="2">
    Change maximum value for the green channel of the screen input
    </td>
  </tr>
</tbody>

<thead id="OutputMinBlue">
  <tr>
    <th colspan="3">
    <center>OutputMinBlue</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>Any float</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>0.0</td>
  </tr>
  <tr>
    <td colspan="2">
    Change minimum value for the green channel of the screen output
    </td>
  </tr>
</tbody>

<thead id="OutputMaxBlue">
  <tr>
    <th colspan="3">
    <center>OutputMaxBlue</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>Any float</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>1.0</td>
  </tr>
  <tr>
    <td colspan="2">
    Change maximum value for the green channel of the screen output
    </td>
  </tr>
</tbody>

<thead id="Distort">
  <tr>
    <th colspan="3">
    <center>Distort</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>Any float</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>0.0</td>
  </tr>
  <tr>
    <td colspan="2">
    Applies a TV-like distortion to the screen
    </td>
  </tr>
</tbody>

<thead id="RainDrops">
  <tr>
    <th colspan="3">
    <center>RainDrops</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>0 or 1</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>0</td>
  </tr>
  <tr>
    <td colspan="2">
    Applies raindrops overlay on the screen
    </td>
  </tr>
</tbody>

<thead id="FlipVertical">
  <tr>
    <th colspan="3">
    <center>FlipVertical</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>0 or 1</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>0</td>
  </tr>
  <tr>
    <td colspan="2">
    Flips the screen vertically
    </td>
  </tr>
</tbody>

<thead id="FlipHorizontal">
  <tr>
    <th colspan="3">
    <center>FlipHorizontal</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>0 or 1</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>0</td>
  </tr>
  <tr>
    <td colspan="2">
    Flips the screen horizontally
    </td>
  </tr>
</tbody>

<thead id="BarWidth">
  <tr>
    <th colspan="3">
    <center>BarWidth</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>Any float</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>0.0</td>
  </tr>
  <tr>
    <td colspan="2">
    Draws black bars on each side of the screen with given width dimension
    </td>
  </tr>
</tbody>

<thead id="BarHeight">
  <tr>
    <th colspan="3">
    <center>BarHeight</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>Any float</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>0.0</td>
  </tr>
  <tr>
    <td colspan="2">
    Draws black bars on the top and bottom of the screen with given height dimension
    </td>
  </tr>
</tbody>

<thead id="Glitch">
  <tr>
    <th colspan="3">
    <center>Glitch</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>Any float</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>0.0</td>
  </tr>
  <tr>
    <td colspan="2">
    Applies a glitch effect on the screen with given intensity
    </td>
  </tr>
</tbody>

<thead id="GlitchVertical">
  <tr>
    <th colspan="3">
    <center>GlitchVertical</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>Any float</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>0.1</td>
  </tr>
  <tr>
    <td colspan="2">
    Changes the vertical offset of the Glitch effect
    </td>
  </tr>
</tbody>

<thead id="GlitchHorizontal">
  <tr>
    <th colspan="3">
    <center>GlitchHorizontal</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>Any float</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>0.1</td>
  </tr>
  <tr>
    <td colspan="2">
    Changes the horizontal offset of the Glitch effect
    </td>
  </tr>
</tbody>

<thead id="Zoom">
  <tr>
    <th colspan="3">
    <center>Zoom</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>Any float</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>1.0</td>
  </tr>
  <tr>
    <td colspan="2">
    Applies a zoom in or zoom out with given value. Negative values will flip the screen vertically
    </td>
  </tr>
</tbody>

<thead id="Quantize">
  <tr>
    <th colspan="3">
    <center>Quantize</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>Any integer</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>0</td>
  </tr>
  <tr>
    <td colspan="2">
    Balances level of detail in the screen, creating a retro appearance for low values, such as 8-bits colors. Use 0 to disable it
    </td>
  </tr>
</tbody>

<thead id="OneColor">
  <tr>
    <th colspan="3">
    <center>OneColor</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>0, 1, 2 or 3</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>0</td>
  </tr>
  <tr>
    <td colspan="2">
    Artistically disables all the colors except one. Use 1 for keep red color, 2 for green color, 3 for blue color, 0 to disable
    </td>
  </tr>
</tbody>

<thead id="Invert">
  <tr>
    <th colspan="3">
    <center>Invert</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>0 or 1</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>0</td>
  </tr>
  <tr>
    <td colspan="2">
    Invert colors of the screen
    </td>
  </tr>
</tbody>

<thead id="Interlaces">
  <tr>
    <th colspan="3">
    <center>Interlaces</center>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="3"><img width="300" height="300"></td>
    <td>Values</td>
    <td>Any integer</td>
  </tr>
  <tr>
    <td>Default</td>
    <td>0</td>
  </tr>
  <tr>
    <td colspan="2">
    Applies the given number of black animated bars on the screen, for TV and camera effects
    </td>
  </tr>
</tbody>

</table>

### List of Transitions
