# open-refugee-project
collection of modules for DCS mission making
This is a repository for useful building blocks for mission makers, making it easier to speed up the complex process of mission making.

Here you'll find several easy to implement lua modules with a short description and guide on how to implement them in your missions.

## 1. Labels
  Dependencies:                   
  Description:
        Dot labels as found in Invasions of the Refugees, aircraft have small grey/black dots, no markers for ground targets.
  Usage:
        Open your .miz with a archive manager and place Labels.lua in it with the following folder structure:
        \\Config\View\Labels.lua
        
        Enforce labels as DOT ONLY in mission editor.
        
## 2. ACT Escort
  Dependencies:                   mist.lua               
  Description:
        Provides intercepting and escorting function for DCS World.
  Usage:
        Set desired range (in meters), maxAngle and minAngle (relative to target heading to the right)
        debug = true enabled overlay with position and zone information.
        esc.timeReq is amount of time interceptor needs to be in zone for escortee to respond
        esc.follow = true means target will follow escort until esc.state is changed externally to "complete"
        otherwise target will fly back to zone with name "escortZone" set in ME.
  
  Planned functions:
        Set reaction to threat to enable escorting REDFOR
        Random chance of target becoming hostile if REDFOR
        Radio callouts with voice lines
## 3. ACT DialogLib
  Dependencies:                   
  Description:
      Provides functions to more easilty script dialog for DCS missions.
  Usage:
  Load dialogLib.lua on mission init, then call functions dl.singleLine() or dl.multiLine()
    singleLine takes single array with dialogID (used for voice file, not yet implemented), duration, frequency and message.
    multiLine takes array containing earlier mentioned arrays, waitTime (time in between lines)
## 4. ACT antiShip
  Dependencies:                   
  Description:
      Improves Anti-Ship gameplay in DCS world by simple damage modeling and nerfing of AI.
  Usage:
  Load ACT_antiShip.lua on mission init.
