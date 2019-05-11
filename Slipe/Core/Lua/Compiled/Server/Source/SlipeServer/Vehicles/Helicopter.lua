-- Generated by CSharp.lua Compiler
local System = System
local SlipeServerVehicles
System.import(function (out)
  SlipeServerVehicles = Slipe.Server.Vehicles
end)
System.namespace("Slipe.Server.Vehicles", function (namespace)
  -- <summary>
  -- Represents helicopter vehicles
  -- </summary>
  namespace.class("Helicopter", function (namespace)
    local __ctor1__, __ctor2__, __ctor3__
    -- <summary>
    -- Create a plane from a model at a position
    -- </summary>
    __ctor1__ = function (this, model, position)
      SlipeServerVehicles.Vehicle.__ctor__[2](this, model, position:__clone__())
    end
    -- <summary>
    -- Create a plane using all createVehicle arguments
    -- </summary>
    __ctor2__ = function (this, model, position, rotation, numberplate, variant1, variant2)
      SlipeServerVehicles.Vehicle.__ctor__[3](this, model, position:__clone__(), rotation:__clone__(), numberplate, variant1, variant2)
    end
    __ctor3__ = function (this, element)
      SlipeServerVehicles.Vehicle.__ctor__[1](this, element)
    end
    return {
      __inherits__ = function (out)
        return {
          out.Slipe.Server.Vehicles.Vehicle
        }
      end,
      __ctor__ = {
        __ctor1__,
        __ctor2__,
        __ctor3__
      }
    }
  end)

  -- <summary>
  -- Models that represent helicopters
  -- </summary>
  namespace.class("HelicopterModel", function (namespace)
    local getCargobob, getHunter, getLeviathan, getMaverick, getNewschopper, getPoliceMaverick, getRaindance, getSeasparrow, 
    getSparrow, getRcGoblin, getRcRaider, class, __ctor__
    __ctor__ = function (this, id)
      SlipeServerVehicles.BaseVehicleModel.__ctor__(this, id)
    end
    getCargobob = function ()
      return class(548)
    end
    getHunter = function ()
      return class(425)
    end
    getLeviathan = function ()
      return class(417)
    end
    getMaverick = function ()
      return class(487)
    end
    getNewschopper = function ()
      return class(488)
    end
    getPoliceMaverick = function ()
      return class(497)
    end
    getRaindance = function ()
      return class(563)
    end
    getSeasparrow = function ()
      return class(447)
    end
    getSparrow = function ()
      return class(469)
    end
    getRcGoblin = function ()
      return class(501)
    end
    getRcRaider = function ()
      return class(465)
    end
    class = {
      __inherits__ = function (out)
        return {
          out.Slipe.Server.Vehicles.BaseVehicleModel
        }
      end,
      getCargobob = getCargobob,
      getHunter = getHunter,
      getLeviathan = getLeviathan,
      getMaverick = getMaverick,
      getNewschopper = getNewschopper,
      getPoliceMaverick = getPoliceMaverick,
      getRaindance = getRaindance,
      getSeasparrow = getSeasparrow,
      getSparrow = getSparrow,
      getRcGoblin = getRcGoblin,
      getRcRaider = getRcRaider,
      __ctor__ = __ctor__
    }
    return class
  end)
end)
