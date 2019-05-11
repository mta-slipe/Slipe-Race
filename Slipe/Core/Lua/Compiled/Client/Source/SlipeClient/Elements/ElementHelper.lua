-- Generated by CSharp.lua Compiler
local System = System
local SlipeClientBrowsers
local SlipeClientEffects
local SlipeClientElements
local SlipeClientGameServer
local SlipeClientGameWorld
local SlipeClientGui
local SlipeClientLights
local SlipeClientMarkers
local SlipeClientPeds
local SlipeClientPickups
local SlipeClientRadar
local SlipeClientSounds
local SlipeClientVehicles
local SlipeClientWeapons
local SlipeMtaDefinitions
local SlipeSharedCollisionShapes
local SlipeSharedElements
local DictTypeString
System.import(function (out)
  SlipeClientBrowsers = Slipe.Client.Browsers
  SlipeClientEffects = Slipe.Client.Effects
  SlipeClientElements = Slipe.Client.Elements
  SlipeClientGameServer = Slipe.Client.GameServer
  SlipeClientGameWorld = Slipe.Client.GameWorld
  SlipeClientGui = Slipe.Client.Gui
  SlipeClientLights = Slipe.Client.Lights
  SlipeClientMarkers = Slipe.Client.Markers
  SlipeClientPeds = Slipe.Client.Peds
  SlipeClientPickups = Slipe.Client.Pickups
  SlipeClientRadar = Slipe.Client.Radar
  SlipeClientSounds = Slipe.Client.Sounds
  SlipeClientVehicles = Slipe.Client.Vehicles
  SlipeClientWeapons = Slipe.Client.Weapons
  SlipeMtaDefinitions = Slipe.MtaDefinitions
  SlipeSharedCollisionShapes = Slipe.Shared.CollisionShapes
  SlipeSharedElements = Slipe.Shared.Elements
  DictTypeString = System.Dictionary(System.Type, System.String)
end)
System.namespace("Slipe.Client.Elements", function (namespace)
  -- <summary>
  -- Class that helps the element manager to cast MTA elements to their slip representation
  -- </summary>
  namespace.class("ElementHelper", function (namespace)
    local ElementTypeNames, GetByType, GetTypeName, GetByType1, InstantiateElement, static
    static = function (this)
      local default = DictTypeString()
      default:set(System.typeof(SlipeSharedElements.Element), "element")
      default:set(System.typeof(SlipeClientPeds.Player), "player")
      default:set(System.typeof(SlipeClientVehicles.Vehicle), "vehicle")
      default:set(System.typeof(SlipeClientGameWorld.WorldObject), "object")
      default:set(System.typeof(SlipeClientBrowsers.Browser), "browser")
      default:set(System.typeof(SlipeClientGui.GuiBrowser), "gui-browser")
      default:set(System.typeof(SlipeSharedCollisionShapes.CollisionShape), "colshape")
      default:set(System.typeof(SlipeClientGameServer.Team), "team")
      default:set(System.typeof(SlipeClientPickups.Pickup), "pickup")
      default:set(System.typeof(SlipeClientRadar.Blip), "blip")
      default:set(System.typeof(SlipeClientRadar.RadarArea), "radararea")
      default:set(System.typeof(SlipeClientMarkers.Marker), "marker")
      default:set(System.typeof(SlipeClientGameWorld.Water), "water")
      default:set(System.typeof(SlipeClientLights.Light), "light")
      default:set(System.typeof(SlipeClientLights.SearchLight), "searchlight")
      default:set(System.typeof(SlipeClientPeds.Ped), "ped")
      default:set(System.typeof(SlipeClientEffects.Effect), "effect")
      default:set(System.typeof(SlipeClientSounds.Sound), "sound")
      default:set(System.typeof(SlipeClientWeapons.CustomWeapon), "weapon")
      default:set(System.typeof(SlipeClientWeapons.Projectile), "projectile")
      default:set(System.typeof(SlipeClientElements.RootElement), "root")
      default:set(System.typeof(SlipeClientElements.ResourceRootElement), "resource")
      default:set(System.typeof(SlipeClientGui.Button), "gui-button")
      default:set(System.typeof(SlipeClientGui.CheckBox), "gui-checkbox")
      default:set(System.typeof(SlipeClientGui.ComboBox), "gui-combobox")
      default:set(System.typeof(SlipeClientGui.Edit), "gui-edit")
      default:set(System.typeof(SlipeClientGui.GridList), "gui-gridlist")
      default:set(System.typeof(SlipeClientGui.Memo), "gui-memo")
      default:set(System.typeof(SlipeClientGui.ProgressBar), "gui-progressbar")
      default:set(System.typeof(SlipeClientGui.RadioButton), "gui-radiobutton")
      default:set(System.typeof(SlipeClientGui.ScrollBar), "gui-scrollbar")
      default:set(System.typeof(SlipeClientGui.ScrollPane), "gui-scrollpane")
      default:set(System.typeof(SlipeClientGui.StaticImage), "gui-staticimage")
      default:set(System.typeof(SlipeClientGui.TabPanel), "gui-tabpanel")
      default:set(System.typeof(SlipeClientGui.Tab), "gui-tab")
      default:set(System.typeof(SlipeClientGui.Label), "gui-label")
      default:set(System.typeof(SlipeClientGui.Window), "gui-window")
      ElementTypeNames = default
    end
    -- <summary>
    -- Get a list of all classes of a specific element
    -- </summary>
    GetByType = function (startAt, streamedIn, T)
      local elements = System.List(T)()

      if not ElementTypeNames:ContainsKey(System.typeof(T)) then
        return elements
      end

      local mtaElements = SlipeMtaDefinitions.MtaShared.GetListFromTable(SlipeMtaDefinitions.MtaClient.GetElementsByType(ElementTypeNames:get(System.typeof(T)), startAt:getMTAElement(), streamedIn), "element")
      for _, mtaElement in System.each(mtaElements) do
        local element = SlipeSharedElements.ElementManager.getInstance():GetElement(System.cast(SlipeMtaDefinitions.MtaElement, mtaElement))
        if element ~= nil and System.is(element, T) then
          elements:Add(System.cast(T, element))
        end
      end

      return elements
    end
    -- <summary>
    -- Get the string representation of an element type
    -- </summary>
    -- <returns>A string describing the MTA element type</returns>
    GetTypeName = function (this, type)
      return ElementTypeNames:get(type)
    end
    -- <summary>
    -- Get a list of all classes of a specific element
    -- </summary>
    GetByType1 = function (T)
      return GetByType(SlipeSharedElements.Element.getRoot(), false, T)
    end
    -- <summary>
    -- Instantiate an MTA element as a slipe class of the specific type
    -- </summary>
    InstantiateElement = function (this, type, element)
      repeat
        local default = type
        if default == "element" then
          return System.new(SlipeSharedElements.Element, 2, element)
        elseif default == "player" then
          return SlipeClientPeds.Player(element)
        elseif default == "vehicle" then
          return SlipeClientVehicles.Vehicle(element)
        elseif default == "object" then
          return SlipeClientGameWorld.WorldObject(element)
        elseif default == "colshape" then
          return SlipeSharedCollisionShapes.CollisionShape(element)
        elseif default == "browser" then
          return System.new(SlipeClientBrowsers.Browser, 2, element)
        elseif default == "team" then
          return SlipeClientGameServer.Team(element)
        elseif default == "pickup" then
          return SlipeClientPickups.Pickup(element)
        elseif default == "blip" then
          return SlipeClientRadar.Blip(element)
        elseif default == "radararea" then
          return SlipeClientRadar.RadarArea(element)
        elseif default == "marker" then
          return SlipeClientMarkers.Marker(element)
        elseif default == "water" then
          return SlipeClientGameWorld.Water(element)
        elseif default == "light" then
          return SlipeClientLights.Light(element)
        elseif default == "searchlight" then
          return SlipeClientLights.SearchLight(element)
        elseif default == "ped" then
          return SlipeClientPeds.Ped(element)
        elseif default == "effect" then
          return SlipeClientEffects.Effect(element)
        elseif default == "sound" then
          return System.new(SlipeClientSounds.Sound, 2, element)
        elseif default == "weapon" then
          return SlipeClientWeapons.CustomWeapon(element)
        elseif default == "projectile" then
          return SlipeClientWeapons.Projectile(element)
        elseif default == "root" then
          return SlipeClientElements.RootElement(element)
        elseif default == "resource" then
          return SlipeClientElements.ResourceRootElement(element)
        elseif default == "gui-button" then
          return SlipeClientGui.Button(element)
        elseif default == "gui-browser" then
          return SlipeClientGui.GuiBrowser(element)
        elseif default == "gui-checkbox" then
          return SlipeClientGui.CheckBox(element)
        elseif default == "gui-combobox" then
          return SlipeClientGui.ComboBox(element)
        elseif default == "gui-edit" then
          return SlipeClientGui.Edit(element)
        elseif default == "gui-gridlist" then
          return SlipeClientGui.GridList(element)
        elseif default == "gui-memo" then
          return SlipeClientGui.Memo(element)
        elseif default == "gui-progressbar" then
          return SlipeClientGui.ProgressBar(element)
        elseif default == "gui-radiobutton" then
          return SlipeClientGui.RadioButton(element)
        elseif default == "gui-scrollbar" then
          return SlipeClientGui.ScrollBar(element)
        elseif default == "gui-scrollpane" then
          return SlipeClientGui.ScrollPane(element)
        elseif default == "gui-staticimage" then
          return SlipeClientGui.StaticImage(element)
        elseif default == "gui-tabpanel" then
          return SlipeClientGui.TabPanel(element)
        elseif default == "gui-tab" then
          return SlipeClientGui.Tab(element)
        elseif default == "gui-label" then
          return SlipeClientGui.Label(element)
        elseif default == "gui-window" then
          return SlipeClientGui.Window(element)
        else
          return System.new(SlipeSharedElements.Element, 2, element)
        end
      until 1
    end
    return {
      __inherits__ = function (out)
        return {
          out.Slipe.Shared.Elements.IElementHelper
        }
      end,
      GetByType = GetByType,
      GetTypeName = GetTypeName,
      GetByType1 = GetByType1,
      InstantiateElement = InstantiateElement,
      static = static
    }
  end)
end)