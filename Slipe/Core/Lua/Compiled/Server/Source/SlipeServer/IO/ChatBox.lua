-- Generated by CSharp.lua Compiler
local System = System
local SlipeMtaDefinitions
local SlipeSharedElements
System.import(function (out)
  SlipeMtaDefinitions = Slipe.MtaDefinitions
  SlipeSharedElements = Slipe.Shared.Elements
end)
System.namespace("Slipe.Server.IO", function (namespace)
  -- <summary>
  -- Represents the ingame chatbox
  -- </summary>
  namespace.class("ChatBox", function (namespace)
    local WriteLine, WriteLine1, Clear, SetVisible
    -- <summary>
    -- Writes a line to the chatbox
    -- </summary>
    -- <param name="player"></param>
    -- <param name="color"></param>
    -- <param name="colorCoded"></param>
    WriteLine = function (message, player, color, colorCoded)
      SlipeMtaDefinitions.MtaServer.OutputChatBox(message, player:getMTAElement(), color:getR(), color:getG(), color:getB(), colorCoded)
    end
    -- <summary>
    -- Writes a line to the chatbox
    -- </summary>
    -- <param name="color"></param>
    -- <param name="colorCoded"></param>
    WriteLine1 = function (message, color, colorCoded)
      SlipeMtaDefinitions.MtaServer.OutputChatBox(message, SlipeSharedElements.Element.getRoot():getMTAElement(), color:getR(), color:getG(), color:getB(), colorCoded)
    end
    -- <summary>
    -- Clears the chatbox for the player, if none specified for everyone.
    -- </summary>
    Clear = function (player)
      local default
      if player == nil then
        default = SlipeSharedElements.Element.getRoot():getMTAElement()
      else
        default = player:getMTAElement()
      end
      SlipeMtaDefinitions.MtaServer.ClearChatBox(default)
    end
    -- <summary>
    -- Set the chatbox visibility for the player, if none specified for anyone.
    -- </summary>
    -- <param name="player"></param>
    -- <returns></returns>
    SetVisible = function (visible, player)
      local default
      if player == nil then
        default = SlipeSharedElements.Element.getRoot():getMTAElement()
      else
        default = player:getMTAElement()
      end
      return SlipeMtaDefinitions.MtaServer.ShowChat(default, visible)
    end
    return {
      WriteLine = WriteLine,
      WriteLine1 = WriteLine1,
      Clear = Clear,
      SetVisible = SetVisible,
      __metadata__ = function (out)
        return {
          methods = {
            { "Clear", 0x10E, Clear, out.Slipe.Server.Peds.Player },
            { "SetVisible", 0x28E, SetVisible, System.Boolean, out.Slipe.Server.Peds.Player, System.Boolean },
            { "WriteLine", 0x40E, WriteLine, System.String, out.Slipe.Server.Peds.Player, out.Slipe.Shared.Utilities.Color, System.Boolean },
            { "WriteLine", 0x30E, WriteLine1, System.String, out.Slipe.Shared.Utilities.Color, System.Boolean }
          },
          events = {
            { "OnMessage", 0xE, System.Delegate(out.Slipe.Shared.Elements.Element, out.Slipe.Server.IO.Events.OnChatMessageEventArgs, System.Void) }
          },
          class = { 0xE }
        }
      end
    }
  end)
end)
