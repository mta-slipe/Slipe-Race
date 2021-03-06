-- Generated by CSharp.lua Compiler
local System = System
local SlipeMtaDefinitions
local SlipeSharedGameWorld
local SlipeSharedUtilities
local SystemNumerics
System.import(function (out)
  SlipeMtaDefinitions = Slipe.MtaDefinitions
  SlipeSharedGameWorld = Slipe.Shared.GameWorld
  SlipeSharedUtilities = Slipe.Shared.Utilities
  SystemNumerics = System.Numerics
end)
System.namespace("Slipe.Shared.GameWorld", function (namespace)
  -- <summary>
  -- Shared singleton of the GTA world
  -- </summary>
  namespace.class("SharedWorld", function (namespace)
    local getInstance, getLockedTrafficLights, setLockedTrafficLights, getAircraftMaxVelocity, setAircraftMaxVelocity, getAircraftMaxHeight, setAircraftMaxHeight, getCloudsEnabled, 
    setCloudsEnabled, getFarClipDistance, setFarClipDistance, getFogDistance, setFogDistance, getGameSpeed, setGameSpeed, getGravity, 
    setGravity, getHeatHaze, setHeatHaze, getJetpackMaxHeight, setJetpackMaxHeight, getMinuteDuration, setMinuteDuration, getMoonsize, 
    setMoonsize, getOcclusionsEnabled, setOcclusionsEnabled, getRainLevel, setRainLevel, getSkyGradient, setSkyGradient, getSunColor, 
    setSunColor, getSunSize, setSunSize, getTime, setTime, getTrafficLightState, setTrafficLightState, getWeather, 
    setWeather, getWindVelocity, setWindVelocity, setInteriorSounds, getWaterColor, setWaterColor, getWaveHeight, setWaveHeight, 
    ResetFarClipDistance, ResetFogDistance, ResetHeatHaze, GetGarage, ResetMoonSize, ResetRainLevel, ResetSkyGradient, ResetSunColor, 
    ResetSunSize, ResetWindVelocity, GetZoneName, RemoveWorldModel, RestoreWorldModel, RestoreAllWorldModels, ResetWaterColor, SetWaterLevel, 
    ResetWaterLevel, class
    getInstance = function ()
      if class.instance == nil then
        class.instance = class()
      end
      return class.instance
    end
    getLockedTrafficLights = function (this)
      return SlipeMtaDefinitions.MtaShared.AreTrafficLightsLocked()
    end
    setLockedTrafficLights = function (this, value)
      SlipeMtaDefinitions.MtaShared.SetTrafficLightsLocked(value)
    end
    getAircraftMaxVelocity = function (this)
      return SlipeMtaDefinitions.MtaShared.GetAircraftMaxVelocity()
    end
    setAircraftMaxVelocity = function (this, value)
      SlipeMtaDefinitions.MtaShared.SetAircraftMaxVelocity(value)
    end
    getAircraftMaxHeight = function (this)
      return SlipeMtaDefinitions.MtaShared.GetAircraftMaxHeight()
    end
    setAircraftMaxHeight = function (this, value)
      SlipeMtaDefinitions.MtaShared.SetAircraftMaxHeight(value)
    end
    getCloudsEnabled = function (this)
      return SlipeMtaDefinitions.MtaShared.GetCloudsEnabled()
    end
    setCloudsEnabled = function (this, value)
      SlipeMtaDefinitions.MtaShared.SetCloudsEnabled(value)
    end
    getFarClipDistance = function (this)
      return SlipeMtaDefinitions.MtaShared.GetFarClipDistance()
    end
    setFarClipDistance = function (this, value)
      SlipeMtaDefinitions.MtaShared.SetFarClipDistance(value)
    end
    getFogDistance = function (this)
      return SlipeMtaDefinitions.MtaShared.GetFogDistance()
    end
    setFogDistance = function (this, value)
      SlipeMtaDefinitions.MtaShared.SetFogDistance(value)
    end
    getGameSpeed = function (this)
      return SlipeMtaDefinitions.MtaShared.GetGameSpeed()
    end
    setGameSpeed = function (this, value)
      SlipeMtaDefinitions.MtaShared.SetGameSpeed(value)
    end
    getGravity = function (this)
      return SlipeMtaDefinitions.MtaShared.GetGravity()
    end
    setGravity = function (this, value)
      SlipeMtaDefinitions.MtaShared.SetGravity(value)
    end
    getHeatHaze = function (this)
      return SlipeSharedGameWorld.HeatHaze.FromRaw(SlipeMtaDefinitions.MtaShared.GetHeatHaze())
    end
    setHeatHaze = function (this, value)
      SlipeMtaDefinitions.MtaShared.SetHeatHaze(value.Intensity, value.RandomShift, value.SpeedMin, value.SpeedMax, System.ToInt32(value.ScanSize:__clone__().X), System.ToInt32(value.ScanSize:__clone__().Y), System.ToInt32(value.RenderSize:__clone__().X), System.ToInt32(value.RenderSize:__clone__().Y), value.ShowInside)
    end
    getJetpackMaxHeight = function (this)
      return SlipeMtaDefinitions.MtaShared.GetJetpackMaxHeight()
    end
    setJetpackMaxHeight = function (this, value)
      SlipeMtaDefinitions.MtaShared.SetJetpackMaxHeight(value)
    end
    getMinuteDuration = function (this)
      return SlipeMtaDefinitions.MtaShared.GetMinuteDuration()
    end
    setMinuteDuration = function (this, value)
      SlipeMtaDefinitions.MtaShared.SetMinuteDuration(value)
    end
    getMoonsize = function (this)
      return SlipeMtaDefinitions.MtaShared.GetMoonSize()
    end
    setMoonsize = function (this, value)
      SlipeMtaDefinitions.MtaShared.SetMoonSize(value)
    end
    getOcclusionsEnabled = function (this)
      return SlipeMtaDefinitions.MtaShared.GetOcclusionsEnabled()
    end
    setOcclusionsEnabled = function (this, value)
      SlipeMtaDefinitions.MtaShared.SetOcclusionsEnabled(value)
    end
    getRainLevel = function (this)
      return SlipeMtaDefinitions.MtaShared.GetRainLevel()
    end
    setRainLevel = function (this, value)
      SlipeMtaDefinitions.MtaShared.SetRainLevel(value)
    end
    getSkyGradient = function (this)
      local raw = SlipeMtaDefinitions.MtaShared.GetSkyGradient()
      return System.tuple(System.new(SlipeSharedUtilities.Color, 4, System.toByte(raw[1]), System.toByte(raw[2]), System.toByte(raw[3])), System.new(SlipeSharedUtilities.Color, 4, System.toByte(raw[4]), System.toByte(raw[5]), System.toByte(raw[6])))
    end
    setSkyGradient = function (this, value)
      SlipeMtaDefinitions.MtaShared.SetSkyGradient(value[1]:getR(), value[1]:getG(), value[1]:getB(), value[2]:getR(), value[2]:getG(), value[2]:getB())
    end
    getSunColor = function (this)
      local raw = SlipeMtaDefinitions.MtaShared.GetSunColor()
      return System.tuple(System.new(SlipeSharedUtilities.Color, 4, System.toByte(raw[1]), System.toByte(raw[2]), System.toByte(raw[3])), System.new(SlipeSharedUtilities.Color, 4, System.toByte(raw[4]), System.toByte(raw[5]), System.toByte(raw[6])))
    end
    setSunColor = function (this, value)
      SlipeMtaDefinitions.MtaShared.SetSunColor(value[1]:getR(), value[1]:getG(), value[1]:getB(), value[2]:getR(), value[2]:getG(), value[2]:getB())
    end
    getSunSize = function (this)
      return System.ToInt32(SlipeMtaDefinitions.MtaShared.GetSunSize())
    end
    setSunSize = function (this, value)
      SlipeMtaDefinitions.MtaShared.SetSunSize(value)
    end
    getTime = function (this)
      local time = SlipeMtaDefinitions.MtaShared.GetTime()
      return SlipeSharedGameWorld.GameTime(time[1], time[2])
    end
    setTime = function (this, value)
      SlipeMtaDefinitions.MtaShared.SetTime(value.Hour, value.Minute)
    end
    getTrafficLightState = function (this)
      return SlipeMtaDefinitions.MtaShared.GetTrafficLightState()
    end
    setTrafficLightState = function (this, value)
      if value == 10 --[[TrafficLightState.Auto]] then
        SlipeMtaDefinitions.MtaShared.SetTrafficLightState("auto")
      else
        SlipeMtaDefinitions.MtaShared.SetTrafficLightState(value)
      end
    end
    getWeather = function (this)
      local result = SlipeMtaDefinitions.MtaShared.GetWeather()
      return SlipeSharedGameWorld.Weather(result[1], result[2])
    end
    setWeather = function (this, value)
      if value:getTransitionTo() > 0 then
        SlipeMtaDefinitions.MtaShared.SetWeatherBlended(value:getTransitionTo())
      else
        SlipeMtaDefinitions.MtaShared.SetWeather(value:getCurrent())
      end
    end
    getWindVelocity = function (this)
      local result = SlipeMtaDefinitions.MtaShared.GetWindVelocity()
      return SystemNumerics.Vector3(result[1], result[2], result[3])
    end
    setWindVelocity = function (this, value)
      SlipeMtaDefinitions.MtaShared.SetWindVelocity(value.X, value.Y, value.Z)
    end
    setInteriorSounds = function (this, value)
      SlipeMtaDefinitions.MtaShared.SetInteriorSoundsEnabled(value)
    end
    getWaterColor = function (this)
      local result = SlipeMtaDefinitions.MtaShared.GetWaterColor()
      return System.new(SlipeSharedUtilities.Color, 3, System.toByte(result[1]), System.toByte(result[2]), System.toByte(result[3]), System.toByte(result[4]))
    end
    setWaterColor = function (this, value)
      SlipeMtaDefinitions.MtaShared.SetWaterColor(value:getR(), value:getG(), value:getB(), value:getA())
    end
    getWaveHeight = function (this)
      return SlipeMtaDefinitions.MtaShared.GetWaveHeight()
    end
    setWaveHeight = function (this, value)
      SlipeMtaDefinitions.MtaShared.SetWaveHeight(value)
    end
    -- <summary>
    -- This function resets the far clip distance to its default state.
    -- </summary>
    ResetFarClipDistance = function (this)
      return SlipeMtaDefinitions.MtaShared.ResetFarClipDistance()
    end
    -- <summary>
    -- This function resets the fog render distance to its default state.
    -- </summary>
    ResetFogDistance = function (this)
      return SlipeMtaDefinitions.MtaShared.ResetFogDistance()
    end
    -- <summary>
    -- Reset the heat haze
    -- </summary>
    ResetHeatHaze = function (this)
      return SlipeMtaDefinitions.MtaShared.ResetHeatHaze()
    end
    -- <summary>
    -- Get a specific garage class instance from a garage ID
    -- </summary>
    GetGarage = function (this, garage)
      return SlipeSharedGameWorld.SharedGarage(garage)
    end
    -- <summary>
    -- This function is used to reset the size of the moon to its normal size.
    -- </summary>
    ResetMoonSize = function (this)
      return SlipeMtaDefinitions.MtaShared.ResetMoonSize()
    end
    -- <summary>
    -- This function resets the rain level of the current weather to its default.
    -- </summary>
    ResetRainLevel = function (this)
      return SlipeMtaDefinitions.MtaShared.ResetRainLevel()
    end
    -- <summary>
    -- Reset the sky gradient to the normal value
    -- </summary>
    ResetSkyGradient = function (this)
      return SlipeMtaDefinitions.MtaShared.ResetSkyGradient()
    end
    -- <summary>
    -- Reset the color of the sun to normal
    -- </summary>
    ResetSunColor = function (this)
      return SlipeMtaDefinitions.MtaShared.ResetSunColor()
    end
    -- <summary>
    -- Reset the size of the sun to normal
    -- </summary>
    ResetSunSize = function (this)
      return SlipeMtaDefinitions.MtaShared.ResetSunSize()
    end
    -- <summary>
    -- Resets the wind velocity to default
    -- </summary>
    ResetWindVelocity = function (this)
      return SlipeMtaDefinitions.MtaShared.ResetWindVelocity()
    end
    -- <summary>
    -- Get the name of the zone of a position
    -- </summary>
    GetZoneName = function (this, position, citiesOnly)
      return SlipeMtaDefinitions.MtaShared.GetZoneName(position.X, position.Y, position.Z, citiesOnly)
    end
    -- <summary>
    -- Remove all world models in a certain sphere
    -- </summary>
    RemoveWorldModel = function (this, modelID, radius, position, interior)
      return SlipeMtaDefinitions.MtaShared.RemoveWorldModel(modelID, radius, position.X, position.Y, position.Z, interior)
    end
    -- <summary>
    -- Restore all world models in a certain sphere
    -- </summary>
    RestoreWorldModel = function (this, modelID, radius, position, interior)
      return SlipeMtaDefinitions.MtaShared.RestoreWorldModel(modelID, radius, position.X, position.Y, position.Z, interior)
    end
    -- <summary>
    -- Restore the removal of all world models
    -- </summary>
    RestoreAllWorldModels = function (this)
      return SlipeMtaDefinitions.MtaShared.RestoreAllWorldModels()
    end
    -- <summary>
    -- This function reset the water color of the GTA world to default.
    -- </summary>
    ResetWaterColor = function (this)
      return SlipeMtaDefinitions.MtaShared.ResetWaterColor()
    end
    -- <summary>
    -- Sets the height of all the water in the game world.
    -- </summary>
    SetWaterLevel = function (this, level, includeWaterFeatures, includeWaterElements)
      return SlipeMtaDefinitions.MtaShared.SetWaterLevel(level, includeWaterFeatures, includeWaterElements)
    end
    -- <summary>
    -- This function resets the water of the GTA world back to its default level. Water elements are not affected.
    -- </summary>
    ResetWaterLevel = function (this)
      return SlipeMtaDefinitions.MtaShared.ResetWaterLevel()
    end
    --too many upvalues (limit is 60)
    local const = {}
    const.setTrafficLightState = setTrafficLightState
    const.getWaterColor = getWaterColor
    const.setWaterColor = setWaterColor
    const.getWaveHeight = getWaveHeight
    const.setWaveHeight = setWaveHeight
    const.getWeather = getWeather
    const.setWeather = setWeather
    const.getWindVelocity = getWindVelocity
    const.setWindVelocity = setWindVelocity
    class = {
      getInstance = getInstance,
      getLockedTrafficLights = getLockedTrafficLights,
      setLockedTrafficLights = setLockedTrafficLights,
      getAircraftMaxVelocity = getAircraftMaxVelocity,
      setAircraftMaxVelocity = setAircraftMaxVelocity,
      getAircraftMaxHeight = getAircraftMaxHeight,
      setAircraftMaxHeight = setAircraftMaxHeight,
      getCloudsEnabled = getCloudsEnabled,
      setCloudsEnabled = setCloudsEnabled,
      getFarClipDistance = getFarClipDistance,
      setFarClipDistance = setFarClipDistance,
      getFogDistance = getFogDistance,
      setFogDistance = setFogDistance,
      getGameSpeed = getGameSpeed,
      setGameSpeed = setGameSpeed,
      getGravity = getGravity,
      setGravity = setGravity,
      getHeatHaze = getHeatHaze,
      setHeatHaze = setHeatHaze,
      getJetpackMaxHeight = getJetpackMaxHeight,
      setJetpackMaxHeight = setJetpackMaxHeight,
      getMinuteDuration = getMinuteDuration,
      setMinuteDuration = setMinuteDuration,
      getMoonsize = getMoonsize,
      setMoonsize = setMoonsize,
      getOcclusionsEnabled = getOcclusionsEnabled,
      setOcclusionsEnabled = setOcclusionsEnabled,
      getRainLevel = getRainLevel,
      setRainLevel = setRainLevel,
      getSkyGradient = getSkyGradient,
      setSkyGradient = setSkyGradient,
      getSunColor = getSunColor,
      setSunColor = setSunColor,
      getSunSize = getSunSize,
      setSunSize = setSunSize,
      getTime = getTime,
      setTime = setTime,
      getTrafficLightState = getTrafficLightState,
      setTrafficLightState = setTrafficLightState,
      getWeather = getWeather,
      setWeather = setWeather,
      getWindVelocity = getWindVelocity,
      setWindVelocity = setWindVelocity,
      setInteriorSounds = setInteriorSounds,
      getWaterColor = getWaterColor,
      setWaterColor = setWaterColor,
      getWaveHeight = getWaveHeight,
      setWaveHeight = setWaveHeight,
      ResetFarClipDistance = ResetFarClipDistance,
      ResetFogDistance = ResetFogDistance,
      ResetHeatHaze = ResetHeatHaze,
      GetGarage = GetGarage,
      ResetMoonSize = ResetMoonSize,
      ResetRainLevel = ResetRainLevel,
      ResetSkyGradient = ResetSkyGradient,
      ResetSunColor = ResetSunColor,
      ResetSunSize = ResetSunSize,
      ResetWindVelocity = ResetWindVelocity,
      GetZoneName = GetZoneName,
      RemoveWorldModel = RemoveWorldModel,
      RestoreWorldModel = RestoreWorldModel,
      RestoreAllWorldModels = RestoreAllWorldModels,
      ResetWaterColor = ResetWaterColor,
      SetWaterLevel = SetWaterLevel,
      ResetWaterLevel = ResetWaterLevel,
      __metadata__ = function (out)
        return {
          fields = {
            { "instance", 0xB, class }
          },
          properties = {
            { "AircraftMaxHeight", 0x106, System.Single, getAircraftMaxHeight, setAircraftMaxHeight },
            { "AircraftMaxVelocity", 0x106, System.Single, getAircraftMaxVelocity, setAircraftMaxVelocity },
            { "CloudsEnabled", 0x106, System.Boolean, getCloudsEnabled, setCloudsEnabled },
            { "FarClipDistance", 0x106, System.Single, getFarClipDistance, setFarClipDistance },
            { "FogDistance", 0x106, System.Single, getFogDistance, setFogDistance },
            { "GameSpeed", 0x106, System.Single, getGameSpeed, setGameSpeed },
            { "Gravity", 0x106, System.Single, getGravity, setGravity },
            { "HeatHaze", 0x106, out.Slipe.Shared.GameWorld.HeatHaze, getHeatHaze, setHeatHaze },
            { "Instance", 0x20E, class, getInstance },
            { "InteriorSounds", 0x306, System.Boolean, setInteriorSounds },
            { "JetpackMaxHeight", 0x106, System.Single, getJetpackMaxHeight, setJetpackMaxHeight },
            { "LockedTrafficLights", 0x106, System.Boolean, getLockedTrafficLights, setLockedTrafficLights },
            { "MinuteDuration", 0x106, System.Int32, getMinuteDuration, setMinuteDuration },
            { "Moonsize", 0x106, System.Int32, getMoonsize, setMoonsize },
            { "OcclusionsEnabled", 0x106, System.Boolean, getOcclusionsEnabled, setOcclusionsEnabled },
            { "RainLevel", 0x106, System.Single, getRainLevel, setRainLevel },
            { "SkyGradient", 0x106, System.Tuple, getSkyGradient, setSkyGradient },
            { "SunColor", 0x106, System.Tuple, getSunColor, setSunColor },
            { "SunSize", 0x106, System.Int32, getSunSize, setSunSize },
            { "Time", 0x106, out.Slipe.Shared.GameWorld.GameTime, getTime, setTime },
            { "TrafficLightState", 0x106, System.Int32, getTrafficLightState, const.setTrafficLightState },
            { "WaterColor", 0x106, out.Slipe.Shared.Utilities.Color, const.getWaterColor, const.setWaterColor },
            { "WaveHeight", 0x106, System.Single, const.getWaveHeight, const.setWaveHeight },
            { "Weather", 0x106, out.Slipe.Shared.GameWorld.Weather, const.getWeather, const.setWeather },
            { "WindVelocity", 0x106, System.Numerics.Vector3, const.getWindVelocity, const.setWindVelocity }
          },
          methods = {
            { ".ctor", 0x6, nil },
            { "GetGarage", 0x186, GetGarage, System.Int32, out.Slipe.Shared.GameWorld.SharedGarage },
            { "GetZoneName", 0x286, GetZoneName, System.Numerics.Vector3, System.Boolean, System.String },
            { "RemoveWorldModel", 0x486, RemoveWorldModel, System.Int32, System.Single, System.Numerics.Vector3, System.Int32, System.Boolean },
            { "ResetFarClipDistance", 0x86, ResetFarClipDistance, System.Boolean },
            { "ResetFogDistance", 0x86, ResetFogDistance, System.Boolean },
            { "ResetHeatHaze", 0x86, ResetHeatHaze, System.Boolean },
            { "ResetMoonSize", 0x86, ResetMoonSize, System.Boolean },
            { "ResetRainLevel", 0x86, ResetRainLevel, System.Boolean },
            { "ResetSkyGradient", 0x86, ResetSkyGradient, System.Boolean },
            { "ResetSunColor", 0x86, ResetSunColor, System.Boolean },
            { "ResetSunSize", 0x86, ResetSunSize, System.Boolean },
            { "ResetWaterColor", 0x86, ResetWaterColor, System.Boolean },
            { "ResetWaterLevel", 0x86, ResetWaterLevel, System.Boolean },
            { "ResetWindVelocity", 0x86, ResetWindVelocity, System.Boolean },
            { "RestoreAllWorldModels", 0x86, RestoreAllWorldModels, System.Boolean },
            { "RestoreWorldModel", 0x486, RestoreWorldModel, System.Int32, System.Single, System.Numerics.Vector3, System.Int32, System.Boolean },
            { "SetWaterLevel", 0x386, SetWaterLevel, System.Single, System.Boolean, System.Boolean, System.Boolean }
          },
          class = { 0x6 }
        }
      end
    }
    return class
  end)
end)
