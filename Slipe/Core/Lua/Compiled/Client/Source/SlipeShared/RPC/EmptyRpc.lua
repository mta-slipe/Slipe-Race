-- Generated by CSharp.lua Compiler
local System = System
System.namespace("Slipe.Shared.Rpc", function (namespace)
  namespace.class("EmptyRpc", function (namespace)
    local getOnClientRpcFailed, setOnClientRpcFailed, Parse, __ctor__
    __ctor__ = function (this)
      this.rpcFailedAction = 0 --[[ClientRpcFailedAction.Ignore]]
    end
    getOnClientRpcFailed = function (this)
      return this.rpcFailedAction
    end
    setOnClientRpcFailed = function (this, value)
      this.rpcFailedAction = value
    end
    Parse = function (this, value)
    end
    return {
      __inherits__ = function (out)
        return {
          out.Slipe.Shared.Rpc.IRpc
        }
      end,
      rpcFailedAction = 0,
      getOnClientRpcFailed = getOnClientRpcFailed,
      setOnClientRpcFailed = setOnClientRpcFailed,
      Parse = Parse,
      __ctor__ = __ctor__,
      __metadata__ = function (out)
        return {
          fields = {
            { "rpcFailedAction", 0x1, System.Int32 }
          },
          properties = {
            { "OnClientRpcFailed", 0x106, System.Int32, getOnClientRpcFailed, setOnClientRpcFailed }
          },
          methods = {
            { ".ctor", 0x6, nil },
            { "Parse", 0x106, Parse, System.Object }
          },
          class = { 0x6 }
        }
      end
    }
  end)
end)