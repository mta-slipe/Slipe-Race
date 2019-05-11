-- Generated by CSharp.lua Compiler
local System = System
local SlipeClientPeds
local SlipeMtaDefinitions
local SlipeSharedPeds
local SystemNumerics
System.import(function (out)
  SlipeClientPeds = Slipe.Client.Peds
  SlipeMtaDefinitions = Slipe.MtaDefinitions
  SlipeSharedPeds = Slipe.Shared.Peds
  SystemNumerics = System.Numerics
end)
System.namespace("Slipe.Client.Peds", function (namespace)
  namespace.class("LocalPlayer", function (namespace)
    local instance, getInstance, getForceMap, setForceMap, getBlurLevel, setBlurLevel, getMoney, setMoney, 
    getWantedLevel, getIsMapVisible, getMapBoundingBox, getActiveRadioStation, setActiveRadioStation, DetonateSatchels, GiveMoney, SetHudComponentVisible, 
    IsHudComponentVisible, TakeMoney, PlaySoundFrontEnd, class, __ctor__
    __ctor__ = function (this, mtaElement)
      SlipeClientPeds.Player.__ctor__(this, mtaElement)
    end
    getInstance = function ()
      if instance == nil then
        instance = class(SlipeMtaDefinitions.MtaClient.GetLocalPlayer())
      end
      return instance
    end
    getForceMap = function (this)
      return SlipeMtaDefinitions.MtaClient.IsPlayerMapForced()
    end
    setForceMap = function (this, value)
      SlipeMtaDefinitions.MtaClient.ForcePlayerMap(value)
    end
    getBlurLevel = function (this)
      return SlipeMtaDefinitions.MtaClient.GetPlayerBlurLevel()
    end
    setBlurLevel = function (this, value)
      SlipeMtaDefinitions.MtaClient.SetPlayerBlurLevel(value)
    end
    getMoney = function (this)
      return SlipeMtaDefinitions.MtaClient.GetPlayerMoney()
    end
    setMoney = function (this, value)
      SlipeMtaDefinitions.MtaClient.SetPlayerMoney(value, false)
    end
    getWantedLevel = function (this)
      return SlipeMtaDefinitions.MtaClient.GetPlayerWantedLevel()
    end
    getIsMapVisible = function (this)
      return SlipeMtaDefinitions.MtaClient.IsPlayerMapVisible()
    end
    getMapBoundingBox = function (this)
      local r = SlipeMtaDefinitions.MtaClient.GetPlayerMapBoundingBox()
      return System.tuple(SystemNumerics.Vector2(r[1], r[2]), SystemNumerics.Vector2(r[3], r[4]))
    end
    getActiveRadioStation = function (this)
      return SlipeMtaDefinitions.MtaClient.GetRadioChannel()
    end
    setActiveRadioStation = function (this, value)
      SlipeMtaDefinitions.MtaClient.SetRadioChannel(value)
    end
    -- <summary>
    -- Detonate the satchels this player has laid
    -- </summary>
    DetonateSatchels = function (this)
      return SlipeMtaDefinitions.MtaClient.DetonateSatchels()
    end
    -- <summary>
    -- Adds money to the player's money
    -- </summary>
    GiveMoney = function (this, amount)
      return SlipeMtaDefinitions.MtaClient.GivePlayerMoney(amount)
    end
    -- <summary>
    -- Set the visibility of a Hud component
    -- </summary>
    SetHudComponentVisible = function (this, component, visible)
      return SlipeMtaDefinitions.MtaClient.SetPlayerHudComponentVisible(component:ToEnumString(SlipeSharedPeds.HudComponent):ToLower(), visible)
    end
    -- <summary>
    -- Check if a certain component is visible
    -- </summary>
    IsHudComponentVisible = function (this, component)
      return SlipeMtaDefinitions.MtaClient.IsPlayerHudComponentVisible(component:ToEnumString(SlipeSharedPeds.HudComponent):ToLower())
    end
    -- <summary>
    -- Substract money from the player
    -- </summary>
    TakeMoney = function (this, amount)
      return SlipeMtaDefinitions.MtaClient.TakePlayerMoney(amount)
    end
    -- <summary>
    -- Play an internal GTA sound
    -- </summary>
    PlaySoundFrontEnd = function (this, frontEndSound)
      return SlipeMtaDefinitions.MtaClient.PlaySoundFrontEnd(frontEndSound)
    end
    class = {
      __inherits__ = function (out)
        return {
          out.Slipe.Client.Peds.Player
        }
      end,
      getInstance = getInstance,
      getForceMap = getForceMap,
      setForceMap = setForceMap,
      getBlurLevel = getBlurLevel,
      setBlurLevel = setBlurLevel,
      getMoney = getMoney,
      setMoney = setMoney,
      getWantedLevel = getWantedLevel,
      getIsMapVisible = getIsMapVisible,
      getMapBoundingBox = getMapBoundingBox,
      getActiveRadioStation = getActiveRadioStation,
      setActiveRadioStation = setActiveRadioStation,
      DetonateSatchels = DetonateSatchels,
      GiveMoney = GiveMoney,
      SetHudComponentVisible = SetHudComponentVisible,
      IsHudComponentVisible = IsHudComponentVisible,
      TakeMoney = TakeMoney,
      PlaySoundFrontEnd = PlaySoundFrontEnd,
      __ctor__ = __ctor__
    }
    return class
  end)
end)
