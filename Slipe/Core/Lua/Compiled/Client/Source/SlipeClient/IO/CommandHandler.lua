-- Generated by CSharp.lua Compiler
local System = System
local SlipeMtaDefinitions
System.import(function (out)
  SlipeMtaDefinitions = Slipe.MtaDefinitions
end)
System.namespace("Slipe.Client.IO", function (namespace)
  -- <summary>
  -- Represents a single command handler
  -- </summary>
  namespace.class("CommandHandler", function (namespace)
    local CommandHandlerCallback, Execute, Execute1, __ctor__
    -- <summary>
    -- Adds a command handler to be used by players
    -- </summary>
    -- <param name="callback"></param>
    -- <param name="restricted"></param>
    -- <param name="caseSensitive"></param>
    __ctor__ = function (this, command, callback, restricted, caseSensitive)
      this.command = command
      this.callback = callback
      SlipeMtaDefinitions.MtaClient.AddCommandHandler(command, System.fn(this, CommandHandlerCallback), caseSensitive)
    end
    CommandHandlerCallback = function (this, command, parameters)
      local default = this.callback
      if default ~= nil then
        default(command, parameters)
      end
    end
    -- <summary>
    -- Executes the command handler
    -- </summary>
    Execute = function (this, args)
      SlipeMtaDefinitions.MtaClient.ExecuteCommandHandler(this.command, System.String.JoinParams(" ", args))
    end
    -- <summary>
    -- Executes the command handler
    -- </summary>
    -- <param name="args"></param>
    Execute1 = function (command, args)
      SlipeMtaDefinitions.MtaClient.ExecuteCommandHandler(command, System.String.JoinParams(" ", args))
    end
    return {
      Execute = Execute,
      Execute1 = Execute1,
      __ctor__ = __ctor__,
      __metadata__ = function (out)
        return {
          fields = {
            { "callback", 0x1, System.Delegate(System.String, System.Array(System.String), System.Void) },
            { "command", 0x1, System.String }
          },
          methods = {
            { ".ctor", 0x406, nil, System.String, System.Delegate(System.String, System.Array(System.String), System.Void), System.Boolean, System.Boolean },
            { "CommandHandlerCallback", 0x201, CommandHandlerCallback, System.String, System.Array(System.String) },
            { "Execute", 0x106, Execute, System.Array(System.String) },
            { "Execute", 0x20E, Execute1, System.String, System.Array(System.String) }
          },
          class = { 0x6 }
        }
      end
    }
  end)
end)
