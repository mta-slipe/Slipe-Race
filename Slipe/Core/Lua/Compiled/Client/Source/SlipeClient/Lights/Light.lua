-- Generated by CSharp.lua Compiler
local System = System
local SlipeMtaDefinitions
local SlipeSharedElements
local SlipeSharedUtilities
local SystemNumerics
System.import(function (out)
  SlipeMtaDefinitions = Slipe.MtaDefinitions
  SlipeSharedElements = Slipe.Shared.Elements
  SlipeSharedUtilities = Slipe.Shared.Utilities
  SystemNumerics = System.Numerics
end)
System.namespace("Slipe.Client.Lights", function (namespace)
  namespace.class("Light", function (namespace)
    local getColor, setColor, getDirection, setDirection, getRadius, setRadius, getLightType, __ctor1__, 
    __ctor2__, __ctor3__
    __ctor1__ = function (this, element)
      SlipeSharedElements.PhysicalElement.__ctor__(this, element)
    end
    -- <summary>
    -- Create a light with all the parameters
    -- </summary>
    __ctor2__ = function (this, type, position, radius, color, direction, createShadow)
      __ctor1__(this, SlipeMtaDefinitions.MtaClient.CreateLight(type, position.X, position.Y, position.Z, radius, color:getR(), color:getG(), color:getB(), direction.X, direction.Y, direction.Z, createShadow))
    end
    -- <summary>
    -- Create a simple red light
    -- </summary>
    __ctor3__ = function (this, type, position, radius)
      __ctor2__(this, type, position:__clone__(), radius, SlipeSharedUtilities.Color.getRed(), SystemNumerics.Vector3.getZero(), false)
    end
    getColor = function (this)
      local result = SlipeMtaDefinitions.MtaClient.GetLightColor(this.element)
      return System.new(SlipeSharedUtilities.Color, 4, System.toByte(result[1]), System.toByte(result[2]), System.toByte(result[3]))
    end
    setColor = function (this, value)
      SlipeMtaDefinitions.MtaClient.SetLightColor(this.element, value:getR(), value:getG(), value:getB())
    end
    getDirection = function (this)
      local result = SlipeMtaDefinitions.MtaClient.GetLightDirection(this.element)
      return SystemNumerics.Vector3(result[1], result[2], result[3])
    end
    setDirection = function (this, value)
      SlipeMtaDefinitions.MtaClient.SetLightDirection(this.element, value.X, value.Y, value.Z)
    end
    getRadius = function (this)
      return SlipeMtaDefinitions.MtaClient.GetLightRadius(this.element)
    end
    setRadius = function (this, value)
      SlipeMtaDefinitions.MtaClient.SetLightRadius(this.element, value)
    end
    getLightType = function (this)
      return SlipeMtaDefinitions.MtaClient.GetLightType(this.element)
    end
    return {
      __inherits__ = function (out)
        return {
          out.Slipe.Shared.Elements.PhysicalElement
        }
      end,
      getColor = getColor,
      setColor = setColor,
      getDirection = getDirection,
      setDirection = setDirection,
      getRadius = getRadius,
      setRadius = setRadius,
      getLightType = getLightType,
      __ctor__ = {
        __ctor1__,
        __ctor2__,
        __ctor3__
      },
      __metadata__ = function (out)
        return {
          class = { 0x6, System.new(out.Slipe.Shared.Elements.DefaultElementClassAttribute, 2, 32 --[[ElementType.Light]]) }
        }
      end
    }
  end)
end)
