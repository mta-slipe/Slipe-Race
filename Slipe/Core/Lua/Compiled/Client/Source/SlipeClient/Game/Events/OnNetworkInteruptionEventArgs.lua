-- Generated by CSharp.lua Compiler
local System = System
System.namespace("Slipe.Client.Game.Events", function (namespace)
  namespace.class("OnNetworkInteruptionEventArgs", function (namespace)
    local __ctor__
    __ctor__ = function (this, status, ticksSinceInteruptionStarted)
      this.Status = System.cast(System.Int32, status)
      this.Ticks = System.cast(System.Int32, ticksSinceInteruptionStarted)
    end
    return {
      Status = 0,
      Ticks = 0,
      __ctor__ = __ctor__,
      __metadata__ = function (out)
        return {
          properties = {
            { "Status", 0x6, System.Int32 },
            { "Ticks", 0x6, System.Int32 }
          },
          methods = {
            { ".ctor", 0x204, nil, System.Object, System.Object }
          },
          class = { 0x6 }
        }
      end
    }
  end)
end)
