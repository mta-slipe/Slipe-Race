-- Generated by CSharp.lua Compiler
local System = System
System.namespace("Slipe.Server.Peds.Events", function (namespace)
  namespace.class("OnChatEventArgs", function (namespace)
    local __ctor__
    __ctor__ = function (this, message, type)
      this.Message = System.cast(System.String, message)
      this.MessageType = System.cast(System.Int32, type)
    end
    return {
      MessageType = 0,
      __ctor__ = __ctor__,
      __metadata__ = function (out)
        return {
          properties = {
            { "Message", 0x6, System.String },
            { "MessageType", 0x6, System.Int32 }
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