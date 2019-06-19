-- Generated by CSharp.lua Compiler
local System = System
local SlipeMtaDefinitions
local SlipeServerVehicles
local SlipeSharedElements
local SystemNumerics
System.import(function (out)
  SlipeMtaDefinitions = Slipe.MtaDefinitions
  SlipeServerVehicles = Slipe.Server.Vehicles
  SlipeSharedElements = Slipe.Shared.Elements
  SystemNumerics = System.Numerics
end)
System.namespace("Slipe.Server.Vehicles", function (namespace)
  -- <summary>
  -- Represents a towable trailer
  -- </summary>
  namespace.class("Trailer", function (namespace)
    local getTowingVehicle, setTowingVehicle, op_Explicit1, AttachTo4, class, __ctor1__, __ctor2__, __ctor3__
    __ctor1__ = function (this, element)
      SlipeServerVehicles.BaseVehicle.__ctor__[1](this, element)
    end
    -- <summary>
    -- Create a plane from a model at a position
    -- </summary>
    __ctor2__ = function (this, model, position)
      __ctor3__(this, model, position:__clone__(), SystemNumerics.Vector3.getZero(), "", 1, 1)
    end
    -- <summary>
    -- Create a plane using all createVehicle arguments
    -- </summary>
    __ctor3__ = function (this, model, position, rotation, numberplate, variant1, variant2)
      SlipeServerVehicles.BaseVehicle.__ctor__[2](this, model, position:__clone__(), rotation:__clone__(), numberplate, variant1, variant2)
    end
    getTowingVehicle = function (this)
      return SlipeSharedElements.ElementManager.getInstance():GetElement(SlipeMtaDefinitions.MtaShared.GetVehicleTowingVehicle(this.element), SlipeServerVehicles.BaseVehicle)
    end
    setTowingVehicle = function (this, value)
      AttachTo4(this, value)
    end
    op_Explicit1 = function (vehicle)
      if System.is(SlipeServerVehicles.VehicleModel.FromId(vehicle:getModel()), SlipeServerVehicles.TrailerModel) then
        return class(vehicle:getMTAElement())
      end

      System.throw((System.InvalidCastException("The vehicle is not a trailer")))
    end
    -- <summary>
    -- Attach this trailer to a vehicle
    -- </summary>
    AttachTo4 = function (this, vehicle)
      return SlipeMtaDefinitions.MtaShared.AttachTrailerToVehicle(this.element, vehicle:getMTAElement())
    end
    class = {
      __inherits__ = function (out)
        return {
          out.Slipe.Server.Vehicles.BaseVehicle
        }
      end,
      getTowingVehicle = getTowingVehicle,
      setTowingVehicle = setTowingVehicle,
      op_Explicit1 = op_Explicit1,
      AttachTo4 = AttachTo4,
      __ctor__ = {
        __ctor1__,
        __ctor2__,
        __ctor3__
      },
      __metadata__ = function (out)
        return {
          properties = {
            { "TowingVehicle", 0x106, out.Slipe.Server.Vehicles.BaseVehicle, getTowingVehicle, setTowingVehicle }
          },
          methods = {
            { ".ctor", 0x106, __ctor1__, out.Slipe.MtaDefinitions.MtaElement },
            { ".ctor", 0x206, __ctor2__, out.Slipe.Server.Vehicles.TrailerModel, System.Numerics.Vector3 },
            { ".ctor", 0x606, __ctor3__, out.Slipe.Server.Vehicles.TrailerModel, System.Numerics.Vector3, System.Numerics.Vector3, System.String, System.Int32, System.Int32 },
            { "AttachTo", 0x186, AttachTo4, out.Slipe.Server.Vehicles.BaseVehicle, System.Boolean }
          },
          events = {
            { "OnAttach", 0x6, System.Delegate(class, out.Slipe.Server.Vehicles.Events.OnAttachEventArgs, System.Void) },
            { "OnDetach", 0x6, System.Delegate(class, out.Slipe.Server.Vehicles.Events.OnDetachEventArgs, System.Void) }
          },
          class = { 0x6 }
        }
      end
    }
    return class
  end)

  -- <summary>
  -- Represents different trailer models
  -- </summary>
  namespace.class("TrailerModel", function (namespace)
    local __ctor__
    __ctor__ = function (this, id)
      SlipeServerVehicles.VehicleModel.__ctor__(this, id)
    end
    return {
      __inherits__ = function (out)
        return {
          out.Slipe.Server.Vehicles.VehicleModel
        }
      end,
      __ctor__ = __ctor__,
      __metadata__ = function (out)
        return {
          methods = {
            { ".ctor", 0x104, nil, System.Int32 }
          },
          class = { 0x6 }
        }
      end
    }
  end)
end)
