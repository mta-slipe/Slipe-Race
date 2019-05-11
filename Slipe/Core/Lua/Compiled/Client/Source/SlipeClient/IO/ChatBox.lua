-- Generated by CSharp.lua Compiler
local System = System
local SlipeMtaDefinitions
local SlipeSharedUtilities
local SystemNumerics
System.import(function (out)
  SlipeMtaDefinitions = Slipe.MtaDefinitions
  SlipeSharedUtilities = Slipe.Shared.Utilities
  SystemNumerics = System.Numerics
end)
System.namespace("Slipe.Client.IO", function (namespace)
  -- <summary>
  -- Represents the ingame chatbox
  -- </summary>
  namespace.class("ChatBox", function (namespace)
    local getActive, getVisible, setVisible, getInputBoxActive, getFont, getLines, getBackgroundColor, getTextColor, 
    getInputColor, getInputPrefixColor, getInputTextColor, getScale, getOffset, getPositionalAlignment, getAllignment, getWidth, 
    getTextFades, getBackgroundFades, getLineLife, getLineFadeOut, getUseCegui, getTextScale, WriteLine, Clear, 
    HandleMessage, class
    getActive = function ()
      return SlipeMtaDefinitions.MtaClient.IsChatBoxInputActive()
    end
    getVisible = function ()
      return SlipeMtaDefinitions.MtaClient.IsChatVisible()
    end
    setVisible = function (value)
      SlipeMtaDefinitions.MtaClient.ShowChat(value)
    end
    getInputBoxActive = function ()
      return SlipeMtaDefinitions.MtaClient.IsChatBoxInputActive()
    end
    getFont = function ()
      return System.cast(System.Int32, SlipeMtaDefinitions.MtaClient.GetChatboxLayout("chat_font"))
    end
    getLines = function ()
      return SlipeMtaDefinitions.MtaClient.GetChatboxLayout("chat_lines")
    end
    getBackgroundColor = function ()
      local r = SlipeMtaDefinitions.MtaClient.GetChatboxLayout("chat_color")
      return System.new(SlipeSharedUtilities.Color, 3, r[1], r[2], r[3], r[4])
    end
    getTextColor = function ()
      local r = SlipeMtaDefinitions.MtaClient.GetChatboxLayout("chat_text_color")
      return System.new(SlipeSharedUtilities.Color, 3, r[1], r[2], r[3], r[4])
    end
    getInputColor = function ()
      local r = SlipeMtaDefinitions.MtaClient.GetChatboxLayout("chat_input_color")
      return System.new(SlipeSharedUtilities.Color, 3, r[1], r[2], r[3], r[4])
    end
    getInputPrefixColor = function ()
      local r = SlipeMtaDefinitions.MtaClient.GetChatboxLayout("chat_input_prefix_color")
      return System.new(SlipeSharedUtilities.Color, 3, r[1], r[2], r[3], r[4])
    end
    getInputTextColor = function ()
      local r = SlipeMtaDefinitions.MtaClient.GetChatboxLayout("chat_input_text_color")
      return System.new(SlipeSharedUtilities.Color, 3, r[1], r[2], r[3], r[4])
    end
    getScale = function ()
      local r = SlipeMtaDefinitions.MtaClient.GetChatboxLayout("chat_scale")
      return SystemNumerics.Vector2(r[1], r[2])
    end
    getOffset = function ()
      local x = SlipeMtaDefinitions.MtaClient.GetChatboxLayout("chat_position_offset_x")
      local y = SlipeMtaDefinitions.MtaClient.GetChatboxLayout("chat_position_offset_y")
      return SystemNumerics.Vector2(x, y)
    end
    getPositionalAlignment = function ()
      local x = SlipeMtaDefinitions.MtaClient.GetChatboxLayout("chat_position_horizontal")
      local y = SlipeMtaDefinitions.MtaClient.GetChatboxLayout("chat_position_vertical")
      return SystemNumerics.Vector2(x, y)
    end
    getAllignment = function ()
      return SlipeMtaDefinitions.MtaClient.GetChatboxLayout("chat_position_vertical")
    end
    getWidth = function ()
      return SlipeMtaDefinitions.MtaClient.GetChatboxLayout("chat_width")
    end
    getTextFades = function ()
      return SlipeMtaDefinitions.MtaClient.GetChatboxLayout("chat_css_style_text")
    end
    getBackgroundFades = function ()
      return SlipeMtaDefinitions.MtaClient.GetChatboxLayout("chat_css_style_background")
    end
    getLineLife = function ()
      return SlipeMtaDefinitions.MtaClient.GetChatboxLayout("chat_line_life")
    end
    getLineFadeOut = function ()
      return SlipeMtaDefinitions.MtaClient.GetChatboxLayout("chat_line_fade_out")
    end
    getUseCegui = function ()
      return SlipeMtaDefinitions.MtaClient.GetChatboxLayout("chat_use_cegui")
    end
    getTextScale = function ()
      return SlipeMtaDefinitions.MtaClient.GetChatboxLayout("text_scale")
    end
    -- <summary>
    -- Writes a line to the chatbox
    -- </summary>
    -- <param name="color"></param>
    -- <param name="colorCoded"></param>
    WriteLine = function (message, color, colorCoded)
      SlipeMtaDefinitions.MtaClient.OutputChatBox(message, color:getR(), color:getG(), color:getB(), colorCoded)
    end
    -- <summary>
    -- Clears the chatbox
    -- </summary>
    Clear = function ()
      SlipeMtaDefinitions.MtaClient.ClearChatBox()
    end
    HandleMessage = function (message, color)
      local default = class.OnMessage
      if default ~= nil then
        default(message, color)
      end
    end
    class = {
      getActive = getActive,
      getVisible = getVisible,
      setVisible = setVisible,
      getInputBoxActive = getInputBoxActive,
      getFont = getFont,
      getLines = getLines,
      getBackgroundColor = getBackgroundColor,
      getTextColor = getTextColor,
      getInputColor = getInputColor,
      getInputPrefixColor = getInputPrefixColor,
      getInputTextColor = getInputTextColor,
      getScale = getScale,
      getOffset = getOffset,
      getPositionalAlignment = getPositionalAlignment,
      getAllignment = getAllignment,
      getWidth = getWidth,
      getTextFades = getTextFades,
      getBackgroundFades = getBackgroundFades,
      getLineLife = getLineLife,
      getLineFadeOut = getLineFadeOut,
      getUseCegui = getUseCegui,
      getTextScale = getTextScale,
      WriteLine = WriteLine,
      Clear = Clear,
      HandleMessage = HandleMessage
    }
    return class
  end)
end)