-- Generated by CSharp.lua Compiler
local System = System
local SlipeMtaDefinitions
local SlipeServerAccounts
local SlipeServerGame
local SlipeServerPeds
local SlipeServerRendering
local SlipeSharedElements
local SlipeSharedExceptions
local SlipeSharedPeds
local SlipeSharedUtilities
System.import(function (out)
  SlipeMtaDefinitions = Slipe.MtaDefinitions
  SlipeServerAccounts = Slipe.Server.Accounts
  SlipeServerGame = Slipe.Server.Game
  SlipeServerPeds = Slipe.Server.Peds
  SlipeServerRendering = Slipe.Server.Rendering
  SlipeSharedElements = Slipe.Shared.Elements
  SlipeSharedExceptions = Slipe.Shared.Exceptions
  SlipeSharedPeds = Slipe.Shared.Peds
  SlipeSharedUtilities = Slipe.Shared.Utilities
end)
System.namespace("Slipe.Server.Peds", function (namespace)
  -- <summary>
  -- Class for a player in the MTA server
  -- </summary>
  namespace.class("Player", function (namespace)
    local getWantedLevel, setWantedLevel, getName, setName, getTeam, setTeam, getAccount, getForceMap, 
    setForceMap, getBlurLevel, setBlurLevel, getIdleTime, getIP, getMoney, setMoney, getNametagColor, 
    setNametagColor, getNametagText, setNametagText, getNametagShowing, setNametagShowing, getPing, getSerial, getVersion, 
    getMuted, setMuted, getAll, getAlive, getDead, getRandom, getCount, IsDisplayObserver, 
    Login, LogOut, Spawn, SetAnnounceValue, GetAnnounceValue, GiveMoney, Redirect, ResendACInfo, 
    ResendModInfo, SetHudComponentVisible, SetVoiceBroadCastTo, SetVoiceIgnoreFrom, TakeMoney, TakeScreenShot, PlaySoundFrontEnd, DetonateSatchels, 
    GetFromName, class, __ctor__
    __ctor__ = function (this, mtaElement)
      SlipeServerPeds.Ped.__ctor__[1](this, mtaElement)
      this.Camera = SlipeServerRendering.Camera(this)
    end
    getWantedLevel = function (this)
      return SlipeMtaDefinitions.MtaServer.GetPlayerWantedLevel(this.element)
    end
    setWantedLevel = function (this, value)
      SlipeMtaDefinitions.MtaServer.SetPlayerWantedLevel(this.element, value)
    end
    getName = function (this)
      return SlipeMtaDefinitions.MtaShared.GetPlayerName(this.element)
    end
    setName = function (this, value)
      SlipeMtaDefinitions.MtaServer.SetPlayerName(this.element, value)
    end
    getTeam = function (this)
      local default, extern = System.try(function ()
        return true, SlipeSharedElements.ElementManager.getInstance():GetElement(SlipeMtaDefinitions.MtaShared.GetPlayerTeam(this.element), SlipeServerGame.Team)
      end, function (default)
        if System.is(default, SlipeMtaDefinitions.MtaException) then
          return true, nil
        else
          return 1, default
        end
      end)
      if default then
        return extern
      end
    end
    setTeam = function (this, value)
      SlipeMtaDefinitions.MtaServer.SetPlayerTeam(this:getMTAElement(), value:getMTAElement())
    end
    getAccount = function (this)
      return SlipeServerAccounts.Account.Get(SlipeMtaDefinitions.MtaServer.GetPlayerAccount(this.element))
    end
    getForceMap = function (this)
      return SlipeMtaDefinitions.MtaServer.IsPlayerMapForced(this.element)
    end
    setForceMap = function (this, value)
      SlipeMtaDefinitions.MtaServer.ForcePlayerMap(this.element, value)
    end
    getBlurLevel = function (this)
      return SlipeMtaDefinitions.MtaServer.GetPlayerBlurLevel(this.element)
    end
    setBlurLevel = function (this, value)
      SlipeMtaDefinitions.MtaServer.SetPlayerBlurLevel(this.element, value)
    end
    getIdleTime = function (this)
      return SlipeMtaDefinitions.MtaServer.GetPlayerIdleTime(this.element)
    end
    getIP = function (this)
      return SlipeMtaDefinitions.MtaServer.GetPlayerIP(this.element)
    end
    getMoney = function (this)
      return SlipeMtaDefinitions.MtaServer.GetPlayerMoney(this.element)
    end
    setMoney = function (this, value)
      SlipeMtaDefinitions.MtaServer.SetPlayerMoney(this.element, value, false)
    end
    getNametagColor = function (this)
      local r = SlipeMtaDefinitions.MtaShared.GetPlayerNametagColor(this.element)
      return System.new(SlipeSharedUtilities.Color, 4, System.toByte(r[1]), System.toByte(r[2]), System.toByte(r[3]))
    end
    setNametagColor = function (this, value)
      SlipeMtaDefinitions.MtaShared.SetPlayerNametagColor(this.element, value:getR(), value:getG(), value:getB())
    end
    getNametagText = function (this)
      return SlipeMtaDefinitions.MtaShared.GetPlayerNametagText(this.element)
    end
    setNametagText = function (this, value)
      SlipeMtaDefinitions.MtaShared.SetPlayerNametagText(this.element, value)
    end
    getNametagShowing = function (this)
      return SlipeMtaDefinitions.MtaShared.IsPlayerNametagShowing(this.element)
    end
    setNametagShowing = function (this, value)
      SlipeMtaDefinitions.MtaShared.SetPlayerNametagShowing(this.element, value)
    end
    getPing = function (this)
      return SlipeMtaDefinitions.MtaShared.GetPlayerPing(this.element)
    end
    getSerial = function (this)
      return SlipeMtaDefinitions.MtaServer.GetPlayerSerial(this.element)
    end
    getVersion = function (this)
      return SlipeMtaDefinitions.MtaServer.GetPlayerVersion(this.element)
    end
    getMuted = function (this)
      return SlipeMtaDefinitions.MtaServer.IsPlayerMuted(this.element)
    end
    setMuted = function (this, value)
      SlipeMtaDefinitions.MtaServer.SetPlayerMuted(this.element, value)
    end
    getAll = function ()
      local elements = SlipeMtaDefinitions.MtaShared.GetArrayFromTable(SlipeMtaDefinitions.MtaServer.GetElementsByType("player", SlipeSharedElements.Element.getRoot():getMTAElement()), "MTAElement", T)
      return SlipeSharedElements.ElementManager.getInstance():CastArray(elements, class)
    end
    getAlive = function ()
      local elements = SlipeMtaDefinitions.MtaShared.GetArrayFromTable(SlipeMtaDefinitions.MtaServer.GetAlivePlayers(), "MTAElement", T)
      return SlipeSharedElements.ElementManager.getInstance():CastArray(elements, class)
    end
    getDead = function ()
      local elements = SlipeMtaDefinitions.MtaShared.GetArrayFromTable(SlipeMtaDefinitions.MtaServer.GetDeadPlayers(), "MTAElement", T)
      return SlipeSharedElements.ElementManager.getInstance():CastArray(elements, class)
    end
    getRandom = function ()
      local default, extern = System.try(function ()
        return true, SlipeSharedElements.ElementManager.getInstance():GetElement(SlipeMtaDefinitions.MtaServer.GetRandomPlayer(), class)
      end, function (default)
        if System.is(default, SlipeMtaDefinitions.MtaException) then
          return true, nil
        else
          return 1, default
        end
      end)
      if default then
        return extern
      end
    end
    getCount = function ()
      return SlipeMtaDefinitions.MtaServer.GetPlayerCount()
    end
    -- <summary>
    -- Check if this palyer can observe a certain display
    -- </summary>
    IsDisplayObserver = function (this, display)
      return SlipeMtaDefinitions.MtaServer.TextDisplayIsObserver(display.DisplayElement, this.element)
    end
    -- <summary>
    -- Logs the player into an account
    -- </summary>
    Login = function (this, account, password)
      return SlipeMtaDefinitions.MtaServer.LogIn(this.element, account.MTAAccount, password)
    end
    -- <summary>
    -- Logs the player out of the account they're currently logged on
    -- </summary>
    LogOut = function (this)
      return SlipeMtaDefinitions.MtaServer.LogOut(this.element)
    end
    -- <summary>
    -- Spawn the player at a certain position
    -- </summary>
    Spawn = function (this, position, skin, rotation, interior, dimension, team)
      local default
      if team == nil then
        default = nil
      else
        default = team:getMTAElement()
      end
      SlipeMtaDefinitions.MtaServer.SpawnPlayer(this.element, position.X, position.Y, position.Z, rotation, skin, interior, dimension, default)
    end
    -- <summary>
    -- This function allows you to change ASE announce values for any player using a specified key. As an example this can be used to change the "score" value which will be shown at game-monitor.com's server list.
    -- </summary>
    SetAnnounceValue = function (this, key, value)
      return SlipeMtaDefinitions.MtaServer.SetPlayerAnnounceValue(this.element, key, value)
    end
    -- <summary>
    -- This function retrieves a players ASE announce value under a certain key.
    -- </summary>
    GetAnnounceValue = function (this, key)
      return SlipeMtaDefinitions.MtaServer.GetPlayerAnnounceValue(this.element, key)
    end
    -- <summary>
    -- Adds money to the player's money
    -- </summary>
    GiveMoney = function (this, amount)
      return SlipeMtaDefinitions.MtaServer.GivePlayerMoney(this.element, amount)
    end
    -- <summary>
    -- Redirects the player to a different server
    -- </summary>
    Redirect = function (this, serverIP, serverPort, serverPassword)
      return SlipeMtaDefinitions.MtaServer.RedirectPlayer(this.element, serverIP, serverPort, serverPassword)
    end
    -- <summary>
    -- This function will force the specified player to resend their AC info, triggering the onPlayerACInfo event again.
    -- </summary>
    ResendACInfo = function (this)
      return SlipeMtaDefinitions.MtaServer.ResendPlayerACInfo(this.element)
    end
    -- <summary>
    -- This function will force the specified player to resend their mod info, triggering the onPlayerModInfo event again.
    -- </summary>
    ResendModInfo = function (this)
      return SlipeMtaDefinitions.MtaServer.ResendPlayerModInfo(this.element)
    end
    -- <summary>
    -- Set the visibility of a Hud component
    -- </summary>
    SetHudComponentVisible = function (this, component, visible)
      return SlipeMtaDefinitions.MtaServer.SetPlayerHudComponentVisible(this.element, component:ToEnumString(SlipeSharedPeds.HudComponent):ToLower(), visible)
    end
    -- <summary>
    -- This function allows you to change who can hear the voice of a player.
    -- </summary>
    SetVoiceBroadCastTo = function (this, targets)
      return SlipeMtaDefinitions.MtaServer.SetPlayerVoiceBroadcastTo(this.element, targets)
    end
    -- <summary>
    -- This function allows you to mute voices for a player
    -- </summary>
    SetVoiceIgnoreFrom = function (this, targets)
      return SlipeMtaDefinitions.MtaServer.SetPlayerVoiceIgnoreFrom(this.element, targets)
    end
    -- <summary>
    -- Substract money from the player
    -- </summary>
    TakeMoney = function (this, amount)
      return SlipeMtaDefinitions.MtaServer.TakePlayerMoney(this.element, amount)
    end
    -- <summary>
    -- This function forces a client to capture the current screen output and send it back to the server. The image will contain the GTA HUD and the output of any dxDraw functions that are not flagged as 'post GUI'. The image specifically excludes the chat box and all GUI (including the client console). The result is received with the event onPlayerScreenShot.
    -- </summary>
    TakeScreenShot = function (this, dimensions, tag, quality, maxBandwith, maxPacketSize)
      return SlipeMtaDefinitions.MtaServer.TakePlayerScreenShot(this.element, System.ToInt32(dimensions.X), System.ToInt32(dimensions.Y), tag, quality, maxBandwith, maxPacketSize)
    end
    -- <summary>
    -- Play an internal GTA sound to this player
    -- </summary>
    PlaySoundFrontEnd = function (this, frontEndSound)
      return SlipeMtaDefinitions.MtaServer.PlaySoundFrontEnd(this.element, frontEndSound)
    end
    -- <summary>
    -- Detonate the satchels this player has laid
    -- </summary>
    DetonateSatchels = function (this)
      return SlipeMtaDefinitions.MtaServer.DetonateSatchels(this.element)
    end
    -- <summary>
    -- Retrieves a player class instance from a specified player name
    -- </summary>
    GetFromName = function (name)
      local default, extern = System.try(function ()
        return true, SlipeSharedElements.ElementManager.getInstance():GetElement(SlipeMtaDefinitions.MtaShared.GetPlayerFromName(name), class)
      end, function (default)
        if System.is(default, SlipeMtaDefinitions.MtaException) then
          System.throw(SlipeSharedExceptions.NullElementException("No player with the name " .. name .. " could be found."))
        else
          return 1, default
        end
      end)
      if default then
        return extern
      end
    end
    class = {
      __inherits__ = function (out)
        return {
          out.Slipe.Server.Peds.Ped
        }
      end,
      getWantedLevel = getWantedLevel,
      setWantedLevel = setWantedLevel,
      getName = getName,
      setName = setName,
      getTeam = getTeam,
      setTeam = setTeam,
      getAccount = getAccount,
      getForceMap = getForceMap,
      setForceMap = setForceMap,
      getBlurLevel = getBlurLevel,
      setBlurLevel = setBlurLevel,
      getIdleTime = getIdleTime,
      getIP = getIP,
      getMoney = getMoney,
      setMoney = setMoney,
      getNametagColor = getNametagColor,
      setNametagColor = setNametagColor,
      getNametagText = getNametagText,
      setNametagText = setNametagText,
      getNametagShowing = getNametagShowing,
      setNametagShowing = setNametagShowing,
      getPing = getPing,
      getSerial = getSerial,
      getVersion = getVersion,
      getMuted = getMuted,
      setMuted = setMuted,
      getAll = getAll,
      getAlive = getAlive,
      getDead = getDead,
      getRandom = getRandom,
      getCount = getCount,
      IsDisplayObserver = IsDisplayObserver,
      Login = Login,
      LogOut = LogOut,
      Spawn = Spawn,
      SetAnnounceValue = SetAnnounceValue,
      GetAnnounceValue = GetAnnounceValue,
      GiveMoney = GiveMoney,
      Redirect = Redirect,
      ResendACInfo = ResendACInfo,
      ResendModInfo = ResendModInfo,
      SetHudComponentVisible = SetHudComponentVisible,
      SetVoiceBroadCastTo = SetVoiceBroadCastTo,
      SetVoiceIgnoreFrom = SetVoiceIgnoreFrom,
      TakeMoney = TakeMoney,
      TakeScreenShot = TakeScreenShot,
      PlaySoundFrontEnd = PlaySoundFrontEnd,
      DetonateSatchels = DetonateSatchels,
      GetFromName = GetFromName,
      __ctor__ = __ctor__,
      __metadata__ = function (out)
        return {
          properties = {
            { "Account", 0x206, out.Slipe.Server.Accounts.Account, getAccount },
            { "Alive", 0x20E, System.Array(out.Slipe.Server.Peds.Player), getAlive },
            { "All", 0x20E, System.Array(out.Slipe.Server.Peds.Player), getAll },
            { "BlurLevel", 0x106, System.Int32, getBlurLevel, setBlurLevel },
            { "Camera", 0x6, out.Slipe.Server.Rendering.Camera },
            { "Count", 0x20E, System.Int32, getCount },
            { "Dead", 0x20E, System.Array(out.Slipe.Server.Peds.Player), getDead },
            { "ForceMap", 0x106, System.Boolean, getForceMap, setForceMap },
            { "IdleTime", 0x206, System.Int32, getIdleTime },
            { "IP", 0x206, System.String, getIP },
            { "Money", 0x106, System.Int32, getMoney, setMoney },
            { "Muted", 0x106, System.Boolean, getMuted, setMuted },
            { "Name", 0x106, System.String, getName, setName },
            { "NametagColor", 0x106, out.Slipe.Shared.Utilities.Color, getNametagColor, setNametagColor },
            { "NametagShowing", 0x106, System.Boolean, getNametagShowing, setNametagShowing },
            { "NametagText", 0x106, System.String, getNametagText, setNametagText },
            { "Ping", 0x206, System.Int32, getPing },
            { "Random", 0x20E, class, getRandom },
            { "Serial", 0x206, System.String, getSerial },
            { "Team", 0x106, out.Slipe.Server.Game.Team, getTeam, setTeam },
            { "Version", 0x206, System.String, getVersion },
            { "WantedLevel", 0x106, System.Int32, getWantedLevel, setWantedLevel }
          },
          methods = {
            { ".ctor", 0x106, nil, out.Slipe.MtaDefinitions.MtaElement },
            { "DetonateSatchels", 0x86, DetonateSatchels, System.Boolean },
            { "GetAnnounceValue", 0x186, GetAnnounceValue, System.String, System.String },
            { "GetFromName", 0x18E, GetFromName, System.String, class },
            { "GiveMoney", 0x186, GiveMoney, System.Int32, System.Boolean },
            { "IsDisplayObserver", 0x186, IsDisplayObserver, out.Slipe.Server.Displays.Display, System.Boolean },
            { "Login", 0x286, Login, out.Slipe.Server.Accounts.Account, System.String, System.Boolean },
            { "LogOut", 0x86, LogOut, System.Boolean },
            { "PlaySoundFrontEnd", 0x186, PlaySoundFrontEnd, System.Int32, System.Boolean },
            { "Redirect", 0x386, Redirect, System.String, System.Int32, System.String, System.Boolean },
            { "ResendACInfo", 0x86, ResendACInfo, System.Boolean },
            { "ResendModInfo", 0x86, ResendModInfo, System.Boolean },
            { "SetAnnounceValue", 0x286, SetAnnounceValue, System.String, System.String, System.Boolean },
            { "SetHudComponentVisible", 0x286, SetHudComponentVisible, System.Int32, System.Boolean, System.Boolean },
            { "SetVoiceBroadCastTo", 0x186, SetVoiceBroadCastTo, System.Array(out.Slipe.Shared.Elements.Element), System.Boolean },
            { "SetVoiceIgnoreFrom", 0x186, SetVoiceIgnoreFrom, System.Array(out.Slipe.Shared.Elements.Element), System.Boolean },
            { "Spawn", 0x606, Spawn, System.Numerics.Vector3, System.Int32, System.Int32, System.Int32, System.Int32, out.Slipe.Server.Game.Team },
            { "TakeMoney", 0x186, TakeMoney, System.Int32, System.Boolean },
            { "TakeScreenShot", 0x586, TakeScreenShot, System.Numerics.Vector2, System.String, System.Int32, System.Int32, System.Int32, System.Boolean }
          },
          events = {
            { "OnConsole", 0x6, System.Delegate(class, out.Slipe.Server.Peds.Events.OnConsoleEventArgs, System.Void) },
            { "OnCollisionShapeHit", 0x6, System.Delegate(class, out.Slipe.Shared.Elements.Events.OnCollisionShapeHitEventArgs, System.Void) },
            { "OnCollisionShapeLeave", 0x6, System.Delegate(class, out.Slipe.Shared.Elements.Events.OnCollisionShapeLeaveEventArgs, System.Void) },
            { "OnJoin", 0xE, System.Delegate(class, out.Slipe.Server.Peds.Events.OnJoinEventArgs, System.Void) },
            { "OnAcInfo", 0x6, System.Delegate(class, out.Slipe.Server.Peds.Events.OnAcInfoEventArgs, System.Void) },
            { "OnBanAdded", 0x6, System.Delegate(class, out.Slipe.Server.Peds.Events.OnBanAddedEventArgs, System.Void) },
            { "OnBanned", 0x6, System.Delegate(class, out.Slipe.Server.Peds.Events.OnBannedEventArgs, System.Void) },
            { "OnNicknameChanged", 0x6, System.Delegate(class, out.Slipe.Server.Peds.Events.OnNicknameChangedEventArgs, System.Void) },
            { "OnChat", 0x6, System.Delegate(class, out.Slipe.Server.Peds.Events.OnChatEventArgs, System.Void) },
            { "OnClick", 0x6, System.Delegate(class, out.Slipe.Server.Peds.Events.OnClickEventArgs, System.Void) },
            { "OnCommand", 0x6, System.Delegate(class, out.Slipe.Server.Peds.Events.OnCommandEventArgs, System.Void) },
            { "OnContact", 0x6, System.Delegate(class, out.Slipe.Server.Peds.Events.OnContactEventArgs, System.Void) },
            { "OnDamage", 0x6, System.Delegate(class, out.Slipe.Server.Peds.Events.OnDamageEventArgs, System.Void) },
            { "OnLogin", 0x6, System.Delegate(class, out.Slipe.Server.Peds.Events.OnLoginEventArgs, System.Void) },
            { "OnLogout", 0x6, System.Delegate(class, out.Slipe.Server.Peds.Events.OnLogoutEventArgs, System.Void) },
            { "OnMarkerHit", 0x6, System.Delegate(class, out.Slipe.Server.Peds.Events.OnMarkerHitEventArgs, System.Void) },
            { "OnMarkerLeave", 0x6, System.Delegate(class, out.Slipe.Server.Peds.Events.OnMarkerLeaveEventArgs, System.Void) },
            { "OnPickupHit", 0x6, System.Delegate(class, out.Slipe.Server.Peds.Events.OnPickupHitEventArgs, System.Void) },
            { "OnPickupLeave", 0x6, System.Delegate(class, out.Slipe.Server.Peds.Events.OnPickupLeaveEventArgs, System.Void) },
            { "OnPickupUse", 0x6, System.Delegate(class, out.Slipe.Server.Peds.Events.OnPickupUseEventArgs, System.Void) },
            { "OnModInfo", 0x6, System.Delegate(class, out.Slipe.Server.Peds.Events.OnModInfoEventArgs, System.Void) },
            { "OnMuted", 0x6, System.Delegate(class, out.Slipe.Server.Peds.Events.OnMutedEventArgs, System.Void) },
            { "OnUnmuted", 0x6, System.Delegate(class, out.Slipe.Server.Peds.Events.OnUnmutedEventArgs, System.Void) },
            { "OnNetworkInteruption", 0x6, System.Delegate(class, out.Slipe.Server.Peds.Events.OnNetworkInteruptionEventArgs, System.Void) },
            { "OnPrivateMessage", 0x6, System.Delegate(class, out.Slipe.Server.Peds.Events.OnPrivateMessageEventArgs, System.Void) },
            { "OnQuit", 0x6, System.Delegate(class, out.Slipe.Server.Peds.Events.OnQuitEventArgs, System.Void) },
            { "OnScreenShot", 0x6, System.Delegate(class, out.Slipe.Server.Peds.Events.OnScreenShotEventArgs, System.Void) },
            { "OnSpawn", 0x6, System.Delegate(class, out.Slipe.Server.Peds.Events.OnSpawnEventArgs, System.Void) },
            { "OnStealthKill", 0x6, System.Delegate(class, out.Slipe.Server.Peds.Events.OnStealthKillEventArgs, System.Void) },
            { "OnTarget", 0x6, System.Delegate(class, out.Slipe.Server.Peds.Events.OnTargetEventArgs, System.Void) },
            { "OnVehicleEnter", 0x6, System.Delegate(class, out.Slipe.Server.Peds.Events.OnVehicleEnterEventArgs, System.Void) },
            { "OnVehicleExit", 0x6, System.Delegate(class, out.Slipe.Server.Peds.Events.OnVehicleExitEventArgs, System.Void) },
            { "OnVoiceStart", 0x6, System.Delegate(class, out.Slipe.Server.Peds.Events.OnVoiceStartEventArgs, System.Void) },
            { "OnVoiceStop", 0x6, System.Delegate(class, out.Slipe.Server.Peds.Events.OnVoiceStopEventArgs, System.Void) },
            { "OnWeaponFire", 0x6, System.Delegate(class, out.Slipe.Server.Peds.Events.OnWeaponFireEventArgs, System.Void) }
          },
          class = { 0x6, System.new(out.Slipe.Shared.Elements.DefaultElementClassAttribute, 2, 1 --[[ElementType.Player]]) }
        }
      end
    }
    return class
  end)
end)
