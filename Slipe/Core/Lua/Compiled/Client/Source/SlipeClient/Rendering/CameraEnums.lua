-- Generated by CSharp.lua Compiler
local System = System
System.namespace("Slipe.Client.Rendering", function (namespace)
  -- <summary>
  -- Represents different google view effects
  -- </summary>
  namespace.enum("GoggleEffects", function ()
    return {
      Normal = 0,
      NightVision = 1,
      ThermalVision = 2
    }
  end)


  -- <summary>
  -- Represents different camera modes for the player
  -- </summary>
  namespace.enum("CameraMode", function ()
    return {
      Player = 0,
      Vehicle = 1,
      Vehicle_Max = 2
    }
  end)
end)