# DYOM Visuals

_Enhance your missions with special effects and shaders_

## Summary

1. [Installation](#installation)
2. [Documentation](#documentation)
   1. [Visuals File](#visuals-file)
   2. [Nomenclatures](#nomenclatures)
   3. [List of Effects](#list-of-effects)
   4. [List of Shaders](#list-of-shaders)
   5. [DYOM_Shaders Folder](#dyomshaders-folder)
   6. [Keyboard Shortcuts](#keyboard-shortcuts)

## Installation

1. Go to the Releases page and download latest version of the addon
2. Extract the contents of the .zip to your GTA San Andreas/CLEO folder
3. That's all!

A few notes to take

- This mod only works with the latest version of DYOM, which currently is 8.1
- This mod does not breaks compatibility of your missions. The end user doesn't need to have this mod in order to be able to play your missions

## Documentation

### Visuals.ini File

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

### Visuals Categories

All the visuals in the modification are divided into three distinct categories:

- **Effects:** Features and visuals existing in the original game that can affect the screen and gameplay, such as activating the HUD, FOV, and forcing camera styles.

- **Shaders:** Special visual FX developed with HLSL (DirectX) that modify the game screen by changing colors, adding overlays, transitions, and more.

- **Transitions:** These are shaders that move from point A to point B in a determined duration.

### List of Effects

<table>
  <thead>
    <tr>
      <th>Name</th>
      <th>Values</th>
      <th>Default</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>HUD</td>
      <td>0 or 1</td>
      <td>1</td>
      <td>Enables/disables all the HUD elements, except the radar</td>
    </tr>
    <tr>
      <td>Radar</td>
      <td>0 or 1</td>
      <td>1</td>
      <td>Enables/disables radar</td>
    </tr>
    <tr>
      <td>SiteRocket</td>
      <td>0 or 1</td>
      <td>0</td>
      <td>Enables/disables rocket launcher crosshair in first person view on vehicles. Used in Ryder's Catalyst mission.</td>
    </tr>
    <tr>
      <td>Shake</td>
      <td>Any integer</td>
      <td>0</td>
      <td>Shakes the game camera with given intensity.</td>
    </tr>
    <tr>
      <td>FadeIn</td>
      <td>Any integer</td>
      <td>0</td>
      <td>Fade in for X milliseconds.</td>
    </tr>
    <tr>
      <td>FadeOut</td>
      <td>Any integer</td>
      <td>0</td>
      <td>Fade out for X milliseconds</td>
    </tr>
    <tr>
      <td>Darkness</td>
      <td>0 or 1</td>
      <td>0</td>
      <td>Applies the darkness effect used in the End Of The Line mission.</td>
    </tr>
    <tr>
      <td>Drunkenness</td>
      <td>Any integer</td>
      <td>0</td>
      <td>Swings the camera simulating a drunkenness effect with a given intensity.</td>
    </tr>
    <tr>
      <td>ForceAiming</td>
      <td>0 or 1</td>
      <td>0</td>
      <td>Forces the right mouse button to be pressed, and disables the player's ability to change weapons.</td>
    </tr>
    <tr>
      <td>ForceWalking</td>
      <td>0 or 1</td>
      <td>0</td>
      <td>Forces the left ALT keyboard button to be pressed. Disables the player's ability to jump, run and crouch.</td>
    </tr>
    <tr>
      <td>ForceBumper</td>
      <td>0 or 1</td>
      <td>0</td>
      <td>Forces the first person camera on vehicles.</td>
    </tr>
    <tr>
      <td>ForceCinematic</td>
      <td>0 or 1</td>
      <td>0</td>
      <td>Force cinematic camera on vehicles.</td>
    </tr>
  </tbody>
</table>

### List of Shaders

<table>
  <thead>
    <tr>
      <th>Name</th>
      <th>Values</th>
      <th>Default</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Brightness</td>
      <td>Any float</td>
      <td>1.0</td>
      <td>Adjusts the brightness of the screen</td>
    </tr>
    <tr>
      <td>Contrast</td>
      <td>Any float</td>
      <td>1.0</td>
      <td>Adjusts the contrast of the screen</td>
    </tr>
    <tr>
      <td>Saturation</td>
      <td>Any float</td>
      <td>1.0</td>
      <td>Adjusts the saturation of the screen</td>
    </tr>
    <tr>
      <td>Tint</td>
      <td>Any float</td>
      <td>0.0</td>
      <td>Adjusts the color temperature</td>
    </tr>
    <tr>
      <td>Hue</td>
      <td>Any float</td>
      <td>1.0</td>
      <td>Adjusts the color palette</td>
    </tr>
    <tr>
      <td>InputMinRed</td>
      <td>Any float</td>
      <td>0.0</td>
      <td>Change minimum value for the red channel of the screen input</td>
    </tr>
    <tr>
      <td>InputMaxRed</td>
      <td>Any float</td>
      <td>1.0</td>
      <td>Change maximum value for the red channel of the screen input</td>
    </tr>
    <tr>
      <td>OutputMinRed</td>
      <td>Any float</td>
      <td>0.0</td>
      <td>Change minimum value for the red channel of the screen output</td>
    </tr>
    <tr>
      <td>OutputMaxRed</td>
      <td>Any float</td>
      <td>1.0</td>
      <td>Change maximum value for the red channel of the screen output</td>
    </tr>
    <tr>
      <td>InputMinGreen</td>
      <td>Any float</td>
      <td>0.0</td>
      <td>Change minimum value for the green channel of the screen input</td>
    </tr>
    <tr>
      <td>InputMaxGreen</td>
      <td>Any float</td>
      <td>1.0</td>
      <td>Change maximum value for the green channel of the screen input</td>
    </tr>
    <tr>
      <td>OutputMinGreen</td>
      <td>Any float</td>
      <td>0.0</td>
      <td>Change minimum value for the green channel of the screen output</td>
    </tr>
    <tr>
      <td>OutputMaxGreen</td>
      <td>Any float</td>
      <td>1.0</td>
      <td>Change maximum value for the green channel of the screen output</td>
    </tr>
    <tr>
      <td>InputMinBlue</td>
      <td>Any float</td>
      <td>0.0</td>
      <td>Change minimum value for the blue channel of the screen input</td>
    </tr>
    <tr>
      <td>InputMaxBlue</td>
      <td>Any float</td>
      <td>1.0</td>
      <td>Change maximum value for the blue channel of the screen input</td>
    </tr>
    <tr>
      <td>OutputMinBlue</td>
      <td>Any float</td>
      <td>0.0</td>
      <td>Change minimum value for the blue channel of the screen output</td>
    </tr>
    <tr>
      <td>OutputMaxBlue</td>
      <td>Any float</td>
      <td>1.0</td>
      <td>Change maximum value for the blue channel of the screen output</td>
    </tr>
    <tr>
      <td>Distort</td>
      <td>Any float</td>
      <td>0.0</td>
      <td>Applies a TV-like distortion to the screen</td>
    </tr>
    <tr>
      <td>RainDrops</td>
      <td>0 or 1</td>
      <td>0</td>
      <td>Applies raindrops overlay on the screen</td>
    </tr>
    <tr>
      <td>FlipY</td>
      <td>0 or 1</td>
      <td>0</td>
      <td>Flips the screen vertically</td>
    </tr>
    <tr>
      <td>FlipX</td>
      <td>0 or 1</td>
      <td>0</td>
      <td>Flips the screen horizontally</td>
    </tr>
    <tr>
      <td>BarWidth</td>
      <td>Any float</td>
      <td>0.0</td>
      <td>Draws black bars on each side of the screen with given width dimension</td>
    </tr>
    <tr>
      <td>BarHeight</td>
      <td>Any float</td>
      <td>0.0</td>
      <td>Draws black bars on the top and bottom of the screen with given height dimension</td>
    </tr>
    <tr>
      <td>Glitch</td>
      <td>Any float</td>
      <td>0.0</td>
      <td>Applies a glitch effect on the screen with given intensity</td>
    </tr>
    <tr>
      <td>GlitchY</td>
      <td>Any float</td>
      <td>0.1</td>
      <td>Changes the vertical offset of the Glitch effect</td>
    </tr>
    <tr>
      <td>GlitchX</td>
      <td>Any float</td>
      <td>0.1</td>
      <td>Changes the horizontal offset of the Glitch effect</td>
    </tr>
    <tr>
      <td>Zoom</td>
      <td>Any float</td>
      <td>1.0</td>
      <td>Applies a zoom in or zoom out with given value. Negative values will flip the screen vertically</td>
    </tr>
    <tr>
      <td>Quantize</td>
      <td>Any integer</td>
      <td>0</td>
      <td>Balances level of detail in the screen, creating a retro appearance for low values, such as 8-bits colors. Use 0 to disable it</td>
    </tr>
    <tr>
      <td>OneColor</td>
      <td>0, 1, 2 or 3</td>
      <td>0</td>
      <td>Artistically disables all the colors except one. Use 1 for keep red color, 2 for green color, 3 for blue color, 0 to disable</td>
    </tr>
    <tr>
      <td>Invert</td>
      <td>0 or 1</td>
      <td>0</td>
      <td>Invert colors of the screen</td>
    </tr>
    <tr>
      <td>Interlaces</td>
      <td>Any integer</td>
      <td>0</td>
      <td>Applies the given number of black animated bars on the screen, for TV and camera effects</td>
    </tr>
    <tr>
      <td>VignetteRound</td>
      <td>Any float</td>
      <td>1.0</td>
      <td>Set vignette shape to be square, circle or spindle-like</td>
    </tr>
    <tr>
      <td>VignetteStart</td>
      <td>Any float</td>
      <td>1.0</td>
      <td>Distance from center of the screen to the vignette border. 1.0 makes it the same as screen size</td>
    </tr>
    <tr>
      <td>VignetteWidth</td>
      <td>Any float</td>
      <td>0.0</td>
      <td>Width of soft edge gradient. 0.0 for hard edge</td>
    </tr>
    <tr>
      <td>VignetteAspect</td>
      <td>Any float</td>
      <td>0.0</td>
      <td>Aspect ratio of the vignette. 1.0 for perfect square/circle</td>
    </tr>
  </tbody>
</table>

### List of Transitions

<table>
  <thead>
    <tr>
      <th>Name</th>
      <th>Values</th>
      <th>Default</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>FromGray / ToGray</td>
      <td>Any float</td>
      <td>0.0</td>
      <td>Gray scale transition</td>
    </tr>
  </tbody>
</table>

### DYOM_Shaders Folder

This folder contains many of the essential settings and files for DYOM Visuals properly function. Let's take a look at each of the sub-folders and files inside:

- `Editor.ini`

  This file contains two INI sections for you to customize as you wish.

  - `[EDITOR_SHADERS]`

    Here you can input any valid shader key-value line. It wil be displayed in-game when you are at editor mode. Use F12 (Reload key) to reload shaders and see the modifications you've made

  - `[EDITOR_SHORTCUTS]`

    Here you will be able to customize the keyboard shortcuts of the add-on with any Virtual Keys you want to assign for Reload Key and Preview Mode key.

- `Shaders` folder

  This folder contains all the custom shaders developed in HLSL shader language. There is no reason to edit the files containing inside this folder.

- `Textures` folder

  This folder contains textures used in HLSL shader files.

- `Presets` folder

  This is a special folder that may be useful for you. This folder provides some interesting presets to use in your visuals.ini file. You can store your own presets here for the sake of organization.

### Keyboard Shortcuts

The add-on provide useful shortcuts that you can customize on editor.ini file. They are only used in editor mode.

<table>
  <thead>
    <th>Name</th>
    <th>Default key</th>
    <th>Description</th>
  </thead>
  <tbody>
    <tr>
      <td>Reload Key</td>
      <td>F12</td>
      <td>Reloads the shaders present on editor.ini file (or visuals.ini of the loaded mission if preview mode is active)
    </tr>
    <tr>
      <td>Preview Mode</td>
      <td>F11</td>
      <td>Switches Preview Mode ON/OFF. When it's OFF, you will see editor.ini's shaders. When it's ON, you will see the loaded mission's visuals.ini's shaders, and it will automatically update when currently selected objective changes.</td>
    </tr>
  </tbody>
</table>
