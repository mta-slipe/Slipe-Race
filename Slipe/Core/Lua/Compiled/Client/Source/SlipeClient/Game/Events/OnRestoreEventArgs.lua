-- Generated by CSharp.lua Compiler
local System = System
System.namespace("Slipe.Client.Game.Events", function (namespace)
  namespace.class("OnRestoreEventArgs", function (namespace)
    local __ctor__
    __ctor__ = function (this, cleared)
      this.RenderTargetsCleared = System.cast(System.Boolean, cleared)
    end
    return {
      RenderTargetsCleared = false,
      __ctor__ = __ctor__,
      __metadata__ = function (out)
        return {
          properties = {
            { "RenderTargetsCleared", 0x6, System.Boolean }
          },
          methods = {
            { ".ctor", 0x104, nil, System.Object }
          },
          class = { 0x6 }
        }
      end
    }
  end)
end)