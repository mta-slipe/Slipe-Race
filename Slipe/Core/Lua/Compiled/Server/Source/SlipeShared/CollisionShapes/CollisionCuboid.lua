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
  -- This is a shape that has a position, width, depth and height.
  -- </summary>
  namespace.class("CollisionCuboid", function (namespace)
    local __ctor1__, __ctor2__
    __ctor1__ = function (this, element)
      SlipeSharedCollisionShapes.CollisionShape.__ctor__(this, element)
    end
    -- <summary>
    -- Creates a colision cuboid.  The position of the col starts at the southwest bottom corner of the shape.
    -- </summary>
    -- <param name="dimensions">The length, width and depth of the cuboid</param>
    __ctor2__ = function (this, position, dimensions)
      __ctor1__(this, SlipeMtaDefinitions.MtaShared.CreateColCuboid(position.X, position.Y, position.Z, dimensions.X, dimensions.Y, dimensions.Z))
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
