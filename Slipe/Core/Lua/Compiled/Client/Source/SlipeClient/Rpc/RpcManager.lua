-- Generated by CSharp.lua Compiler
local System = System
local SlipeClientElements
local SlipeMtaDefinitions
local SlipeSharedElements
local DictStringDelegate
System.import(function (out)
  SlipeClientElements = Slipe.Client.Elements
  SlipeMtaDefinitions = Slipe.MtaDefinitions
  SlipeSharedElements = Slipe.Shared.Elements
  DictStringDelegate = System.Dictionary(System.String, System.Delegate)
end)
System.namespace("Slipe.Client.Rpc", function (namespace)
  namespace.class("RpcManager", function (namespace)
    local instance, getInstance, RegisterRPC, TriggerRPC, class, __ctor__
    __ctor__ = function (this)
      this.RegisteredRPCs = DictStringDelegate()

      SlipeClientElements.RootElement.OnMiscelaniousEvent = SlipeClientElements.RootElement.OnMiscelaniousEvent + function (eventName, source, p1, p2, p3, p4, p5, p6, p7, p8)
        System.Console.WriteLine("CLIENT RPC TRIGGER")
        if this.RegisteredRPCs:ContainsKey(eventName) then
          this.RegisteredRPCs:get(eventName)(p1)
        end
      end
    end
    getInstance = function ()
      if instance == nil then
        instance = class()
      end
      return instance
    end
    -- <summary>
    -- Register an RPC
    -- </summary>
    RegisterRPC = function (this, key, callback, CallbackType)
      this.RegisteredRPCs:set(key, function (parameters)
        callback(CallbackType(parameters))
      end)
      SlipeMtaDefinitions.MtaShared.AddEvent(key, true)
      SlipeSharedElements.Element.getRoot():ListenForEvent(key, true, "normal")
    end
    -- <summary>
    -- Trigger an RPC
    -- </summary>
    TriggerRPC = function (this, key, argument)
      SlipeMtaDefinitions.MtaClient.TriggerServerEvent(key, SlipeSharedElements.Element.getRoot():getMTAElement(), argument)
    end
    class = {
      getInstance = getInstance,
      RegisterRPC = RegisterRPC,
      TriggerRPC = TriggerRPC,
      __ctor__ = __ctor__
    }
    return class
  end)
end)
