-- Generated by CSharp.lua Compiler
local System = System
System.namespace("Slipe.Client.Peds.Events", function (namespace)
  namespace.class("OnStuntStartEventArgs", function (namespace)
    local __ctor__
    __ctor__ = function (this, t)
      this.StuntType = System.cast(System.String, t)
    end
    return {
      __ctor__ = __ctor__,
      __metadata__ = function (out)
        return {
          properties = {
            { "StuntType", 0x6, System.String }
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
