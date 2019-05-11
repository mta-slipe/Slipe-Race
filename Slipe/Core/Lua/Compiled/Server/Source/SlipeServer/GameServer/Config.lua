-- Generated by CSharp.lua Compiler
local System = System
local SlipeMtaDefinitions
local SlipeServerGameServer
System.import(function (out)
  SlipeMtaDefinitions = Slipe.MtaDefinitions
  SlipeServerGameServer = Slipe.Server.GameServer
end)
System.namespace("Slipe.Server.GameServer", function (namespace)
  -- <summary>
  -- Represents server config fields
  -- </summary>
  namespace.class("Config", function (namespace)
    local getMinClientVersion, setMinClientVersion, getRecommendedClientVersion, setRecommendedClientVersion, getPassword, setPassword, getFpsLimit, setFpsLimit, 
    getNetworkEncryption, setNetworkEncryption, getBandwidthReduction, setBandwidthReduction, getPlayerSyncInterval, setPlayerSyncInterval, getLightweightSyncInterval, setLightweightSyncInterval, 
    getCameraSyncInterval, setCameraSyncInterval, getPedSyncInterval, setPedSyncInterval, getUnoccupiedVehicleSyncInterval, setUnoccupiedVehicleSyncInterval, getMouseKeySyncInterval, setMouseKeySyncInterval, 
    getAnalogKeySyncInterval, setAnalogKeySyncInterval, __ctor__
    -- <summary>
    -- Create a new config handler
    -- </summary>
    __ctor__ = function (this)
      this.PermanentSaveFlag = false
    end
    getMinClientVersion = function (this)
      return SlipeMtaDefinitions.MtaServer.GetServerConfigSetting("minclientversion")
    end
    setMinClientVersion = function (this, value)
      SlipeMtaDefinitions.MtaServer.SetServerConfigSetting("minclientversion", value, this.PermanentSaveFlag)
    end
    getRecommendedClientVersion = function (this)
      return SlipeMtaDefinitions.MtaServer.GetServerConfigSetting("recommendedclientversion")
    end
    setRecommendedClientVersion = function (this, value)
      SlipeMtaDefinitions.MtaServer.SetServerConfigSetting("recommendedclientversion", value, this.PermanentSaveFlag)
    end
    getPassword = function (this)
      return SlipeMtaDefinitions.MtaServer.GetServerConfigSetting("password")
    end
    setPassword = function (this, value)
      SlipeMtaDefinitions.MtaServer.SetServerConfigSetting("password", value, this.PermanentSaveFlag)
    end
    getFpsLimit = function (this)
      return System.Int32.Parse(SlipeMtaDefinitions.MtaServer.GetServerConfigSetting("fpslimit"))
    end
    setFpsLimit = function (this, value)
      SlipeMtaDefinitions.MtaServer.SetServerConfigSetting("fpslimit", value:ToString(), this.PermanentSaveFlag)
    end
    getNetworkEncryption = function (this)
      return (SlipeMtaDefinitions.MtaServer.GetServerConfigSetting("networkencryption") == "1")
    end
    setNetworkEncryption = function (this, value)
      if value then
        SlipeMtaDefinitions.MtaServer.SetServerConfigSetting("networkencryption", "1", this.PermanentSaveFlag)
      else
        SlipeMtaDefinitions.MtaServer.SetServerConfigSetting("networkencryption", "0", this.PermanentSaveFlag)
      end
    end
    getBandwidthReduction = function (this)
      return System.cast(System.Int32, System.Enum.Parse(System.typeof(SlipeServerGameServer.BandwidthReduction), SlipeMtaDefinitions.MtaServer.GetServerConfigSetting("bandwidth_reduction"), true))
    end
    setBandwidthReduction = function (this, value)
      SlipeMtaDefinitions.MtaServer.SetServerConfigSetting("bandwidth_reduction", value:ToEnumString(SlipeServerGameServer.BandwidthReduction):ToLower(), this.PermanentSaveFlag)
    end
    getPlayerSyncInterval = function (this)
      return System.Int32.Parse(SlipeMtaDefinitions.MtaServer.GetServerConfigSetting("player_sync_interval"))
    end
    setPlayerSyncInterval = function (this, value)
      SlipeMtaDefinitions.MtaServer.SetServerConfigSetting("player_sync_interval", value:ToString(), this.PermanentSaveFlag)
    end
    getLightweightSyncInterval = function (this)
      return System.Int32.Parse(SlipeMtaDefinitions.MtaServer.GetServerConfigSetting("lightweight_sync_interval"))
    end
    setLightweightSyncInterval = function (this, value)
      SlipeMtaDefinitions.MtaServer.SetServerConfigSetting("lightweight_sync_interval", value:ToString(), this.PermanentSaveFlag)
    end
    getCameraSyncInterval = function (this)
      return System.Int32.Parse(SlipeMtaDefinitions.MtaServer.GetServerConfigSetting("camera_sync_interval"))
    end
    setCameraSyncInterval = function (this, value)
      SlipeMtaDefinitions.MtaServer.SetServerConfigSetting("camera_sync_interval", value:ToString(), this.PermanentSaveFlag)
    end
    getPedSyncInterval = function (this)
      return System.Int32.Parse(SlipeMtaDefinitions.MtaServer.GetServerConfigSetting("ped_sync_interval"))
    end
    setPedSyncInterval = function (this, value)
      SlipeMtaDefinitions.MtaServer.SetServerConfigSetting("ped_sync_interval", value:ToString(), this.PermanentSaveFlag)
    end
    getUnoccupiedVehicleSyncInterval = function (this)
      return System.Int32.Parse(SlipeMtaDefinitions.MtaServer.GetServerConfigSetting("unoccupied_vehicle_sync_interval"))
    end
    setUnoccupiedVehicleSyncInterval = function (this, value)
      SlipeMtaDefinitions.MtaServer.SetServerConfigSetting("unoccupied_vehicle_sync_interval", value:ToString(), this.PermanentSaveFlag)
    end
    getMouseKeySyncInterval = function (this)
      return System.Int32.Parse(SlipeMtaDefinitions.MtaServer.GetServerConfigSetting("keysync_mouse_sync_interval"))
    end
    setMouseKeySyncInterval = function (this, value)
      SlipeMtaDefinitions.MtaServer.SetServerConfigSetting("keysync_mouse_sync_interval", value:ToString(), this.PermanentSaveFlag)
    end
    getAnalogKeySyncInterval = function (this)
      return System.Int32.Parse(SlipeMtaDefinitions.MtaServer.GetServerConfigSetting("keysync_analog_sync_interval"))
    end
    setAnalogKeySyncInterval = function (this, value)
      SlipeMtaDefinitions.MtaServer.SetServerConfigSetting("keysync_analog_sync_interval", value:ToString(), this.PermanentSaveFlag)
    end
    return {
      PermanentSaveFlag = false,
      getMinClientVersion = getMinClientVersion,
      setMinClientVersion = setMinClientVersion,
      getRecommendedClientVersion = getRecommendedClientVersion,
      setRecommendedClientVersion = setRecommendedClientVersion,
      getPassword = getPassword,
      setPassword = setPassword,
      getFpsLimit = getFpsLimit,
      setFpsLimit = setFpsLimit,
      getNetworkEncryption = getNetworkEncryption,
      setNetworkEncryption = setNetworkEncryption,
      getBandwidthReduction = getBandwidthReduction,
      setBandwidthReduction = setBandwidthReduction,
      getPlayerSyncInterval = getPlayerSyncInterval,
      setPlayerSyncInterval = setPlayerSyncInterval,
      getLightweightSyncInterval = getLightweightSyncInterval,
      setLightweightSyncInterval = setLightweightSyncInterval,
      getCameraSyncInterval = getCameraSyncInterval,
      setCameraSyncInterval = setCameraSyncInterval,
      getPedSyncInterval = getPedSyncInterval,
      setPedSyncInterval = setPedSyncInterval,
      getUnoccupiedVehicleSyncInterval = getUnoccupiedVehicleSyncInterval,
      setUnoccupiedVehicleSyncInterval = setUnoccupiedVehicleSyncInterval,
      getMouseKeySyncInterval = getMouseKeySyncInterval,
      setMouseKeySyncInterval = setMouseKeySyncInterval,
      getAnalogKeySyncInterval = getAnalogKeySyncInterval,
      setAnalogKeySyncInterval = setAnalogKeySyncInterval,
      __ctor__ = __ctor__
    }
  end)
end)
