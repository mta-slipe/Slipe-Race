-- Generated by CSharp.lua Compiler
local System = System
local SlipeMtaDefinitions
local SlipeSharedCollisionShapes
System.import(function (out)
  SlipeMtaDefinitions = Slipe.MtaDefinitions
  SlipeSharedCollisionShapes = Slipe.Shared.CollisionShapes
end)
System.namespace("Slipe.Shared.CollisionShapes", function (namespace)
  -- <summary>
  -- This is a shape that has a position and a width and a depth.
  -- </summary>
  namespace.class("CollisionRectangle", function (namespace)
    local __ctor1__, __ctor2__
    __ctor1__ = function (this, element)
      SlipeSharedCollisionShapes.CollisionShape.__ctor__(this, element)
    end
    -- <summary>
    -- Creates a rectangular collision shape. The position marks on the south west corner of the colshape.
    -- </summary>
    -- <param name="dimensions">The length and width</param>
    __ctor2__ = function (this, position, dimensions)
      __ctor1__(this, SlipeMtaDefinitions.MtaShared.CreateColRectangle(position.X, position.Y, dimensions.X, dimensions.Y))
    end
    return {
      __inherits__ = function (out)
        return {
          out.Slipe.Shared.CollisionShapes.CollisionShape
        }
      end,
      __ctor__ = {
        __ctor1__,
        __ctor2__
      }
    }
  end)
end)