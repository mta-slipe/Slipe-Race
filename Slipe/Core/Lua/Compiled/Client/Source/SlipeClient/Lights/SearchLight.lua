-- Generated by CSharp.lua Compiler
local System = System
local SlipeClientGame
local SlipeMtaDefinitions
local SlipeSharedElements
local SlipeSharedHelpers
local SystemNumerics
System.import(function (out)
  SlipeClientGame = Slipe.Client.Game
  SlipeMtaDefinitions = Slipe.MtaDefinitions
  SlipeSharedElements = Slipe.Shared.Elements
  SlipeSharedHelpers = Slipe.Shared.Helpers
  SystemNumerics = System.Numerics
end)
System.namespace("Slipe.Client.Lights", function (namespace)
  -- <summary>
  -- This function creates a searchlight. A searchlight is a spotlight which looks like the one available in the Police Maverick.
  -- </summary>
  namespace.class("SearchLight", function (namespace)
    local getToAttached, getIsAttached, getStartPosition, setStartPosition, getEndPosition, setEndPosition, getStartRadius, setStartRadius, 
    getEndRadius, setEndRadius, AttachTo, AttachTo1, AttachTo2, AttachTo3, Detach, Update, 
    internal, __ctor1__, __ctor2__, __ctor3__
    internal = function (this)
      this.relativeEndPosition = System.default(SystemNumerics.Vector3)
      this.Offset = System.default(SystemNumerics.Matrix4x4)
    end
    __ctor1__ = function (this, element)
      internal(this)
      SlipeSharedElements.Element.__ctor__[2](this, element)
    end
    -- <summary>
    -- Create a searchlight from all parameters
    -- </summary>
    __ctor2__ = function (this, start, end_, startRadius, endRadius, renderSpot)
      __ctor1__(this, SlipeMtaDefinitions.MtaClient.CreateSearchLight(start.X, start.Y, start.Z, end_.X, end_.Y, end_.Z, startRadius, endRadius, renderSpot))
      this.relativeEndPosition = SystemNumerics.Vector3.op_Subtraction(end_, start)
    end
    -- <summary>
    -- Create a searchlight attached to an element
    -- </summary>
    __ctor3__ = function (this, attachTo, relativeEnd, offset, startRadius, endRadius, renderSpot)
      __ctor2__(this, SystemNumerics.Vector3.getZero(), relativeEnd:__clone__(), startRadius, endRadius, renderSpot)
      AttachTo(this, attachTo, offset:__clone__())
    end
    getToAttached = function (this)
      return this.toAttached
    end
    getIsAttached = function (this)
      return this.toAttached ~= nil
    end
    getStartPosition = function (this)
      local result = SlipeMtaDefinitions.MtaClient.GetSearchLightStartPosition(this.element)
      return SystemNumerics.Vector3(result[1], result[2], result[3])
    end
    setStartPosition = function (this, value)
      SlipeMtaDefinitions.MtaClient.SetSearchLightStartPosition(this.element, value.X, value.Y, value.Z)
    end
    getEndPosition = function (this)
      local result = SlipeMtaDefinitions.MtaClient.GetSearchLightEndPosition(this.element)
      return SystemNumerics.Vector3(result[1], result[2], result[3])
    end
    setEndPosition = function (this, value)
      SlipeMtaDefinitions.MtaClient.SetSearchLightEndPosition(this.element, value.X, value.Y, value.Z)
    end
    getStartRadius = function (this)
      return SlipeMtaDefinitions.MtaClient.GetSearchLightStartRadius(this.element)
    end
    setStartRadius = function (this, value)
      SlipeMtaDefinitions.MtaClient.SetSearchLightStartRadius(this.element, value)
    end
    getEndRadius = function (this)
      return SlipeMtaDefinitions.MtaClient.GetSearchLightEndRadius(this.element)
    end
    setEndRadius = function (this, value)
      SlipeMtaDefinitions.MtaClient.SetSearchLightEndRadius(this.element, value)
    end
    -- <summary>
    -- Attach this attachable to a toAttachable using a matrix to describe the positional and rotational offset
    -- </summary>
    AttachTo = function (this, toElement, offsetMatrix)
      this.toAttached = toElement
      this.Offset = offsetMatrix:__clone__()
      SlipeClientGame.GameClient.OnUpdate = SlipeClientGame.GameClient.OnUpdate + System.fn(this, Update)
    end
    -- <summary>
    -- Attach this attachable to a toAttachable with 2 vectors describing a position offset and a rotation offset
    -- </summary>
    AttachTo1 = function (this, toElement, positionOffset, rotationOffset)
      AttachTo2(this, toElement, positionOffset:__clone__(), SlipeSharedHelpers.NumericHelper.EulerToQuaternion(rotationOffset:__clone__()))
    end
    -- <summary>
    -- Attach this attachable to a toAttachable with a vector describing the position offset and a quaternion describing the rotation offset
    -- </summary>
    AttachTo2 = function (this, toElement, positionOffset, rotationOffset)
      AttachTo(this, toElement, SystemNumerics.Matrix4x4.Transform(SystemNumerics.Matrix4x4.CreateTranslation(positionOffset), rotationOffset))
    end
    -- <summary>
    -- Attach this attachable to a toAttachable without any offset
    -- </summary>
    AttachTo3 = function (this, toElement)
      AttachTo(this, toElement, SystemNumerics.Matrix4x4.getIdentity())
    end
    -- <summary>
    -- Detach this attachable
    -- </summary>
    Detach = function (this)
      SlipeClientGame.GameClient.OnUpdate = SlipeClientGame.GameClient.OnUpdate - System.fn(this, Update)
    end
    -- <summary>
    -- Updates this element to the correct position and rotation
    -- </summary>
    Update = function (this, source, eventArgs)
      setStartPosition(this, SystemNumerics.Vector3.op_Addition(getToAttached(this):getPosition(), this.Offset:__clone__():getTranslation()))
      setEndPosition(this, SystemNumerics.Vector3.Transform(this.relativeEndPosition, SystemNumerics.Matrix4x4.op_Multiply(getToAttached(this):getMatrix(), this.Offset:__clone__())))
    end
    return {
      __inherits__ = function (out)
        return {
          out.Slipe.Shared.Elements.Element
        }
      end,
      getToAttached = getToAttached,
      getIsAttached = getIsAttached,
      getStartPosition = getStartPosition,
      setStartPosition = setStartPosition,
      getEndPosition = getEndPosition,
      setEndPosition = setEndPosition,
      getStartRadius = getStartRadius,
      setStartRadius = setStartRadius,
      getEndRadius = getEndRadius,
      setEndRadius = setEndRadius,
      AttachTo = AttachTo,
      AttachTo1 = AttachTo1,
      AttachTo2 = AttachTo2,
      AttachTo3 = AttachTo3,
      Detach = Detach,
      Update = Update,
      __ctor__ = {
        __ctor1__,
        __ctor2__,
        __ctor3__
      },
      __metadata__ = function (out)
        return {
          fields = {
            { "relativeEndPosition", 0x3, System.Numerics.Vector3 },
            { "toAttached", 0x3, out.Slipe.Shared.Elements.PhysicalElement }
          },
          properties = {
            { "EndPosition", 0x106, System.Numerics.Vector3, getEndPosition, setEndPosition },
            { "EndRadius", 0x106, System.Single, getEndRadius, setEndRadius },
            { "IsAttached", 0x206, System.Boolean, getIsAttached },
            { "Offset", 0x6, System.Numerics.Matrix4x4 },
            { "StartPosition", 0x106, System.Numerics.Vector3, getStartPosition, setStartPosition },
            { "StartRadius", 0x106, System.Single, getStartRadius, setStartRadius },
            { "ToAttached", 0x206, out.Slipe.Shared.Elements.PhysicalElement, getToAttached }
          },
          methods = {
            { ".ctor", 0x106, __ctor1__, out.Slipe.MtaDefinitions.MtaElement },
            { ".ctor", 0x506, __ctor2__, System.Numerics.Vector3, System.Numerics.Vector3, System.Single, System.Single, System.Boolean },
            { ".ctor", 0x606, __ctor3__, out.Slipe.Shared.Elements.PhysicalElement, System.Numerics.Vector3, System.Numerics.Matrix4x4, System.Single, System.Single, System.Boolean },
            { "AttachTo", 0x206, AttachTo, out.Slipe.Shared.Elements.PhysicalElement, System.Numerics.Matrix4x4 },
            { "AttachTo", 0x306, AttachTo1, out.Slipe.Shared.Elements.PhysicalElement, System.Numerics.Vector3, System.Numerics.Vector3 },
            { "AttachTo", 0x306, AttachTo2, out.Slipe.Shared.Elements.PhysicalElement, System.Numerics.Vector3, System.Numerics.Quaternion },
            { "AttachTo", 0x106, AttachTo3, out.Slipe.Shared.Elements.PhysicalElement },
            { "Detach", 0x6, Detach },
            { "Update", 0x203, Update, out.Slipe.Client.Elements.RootElement, out.Slipe.Client.Game.Events.OnUpdateEventArgs }
          },
          class = { 0x6, System.new(out.Slipe.Shared.Elements.DefaultElementClassAttribute, 2, 33 --[[ElementType.SearchLight]]) }
        }
      end
    }
  end)
end)
