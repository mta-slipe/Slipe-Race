-- Generated by CSharp.lua Compiler
local System = System
local SlipeMtaDefinitions
local SlipeSharedElements
local SlipeSharedWeapons
System.import(function (out)
  SlipeMtaDefinitions = Slipe.MtaDefinitions
  SlipeSharedElements = Slipe.Shared.Elements
  SlipeSharedWeapons = Slipe.Shared.Weapons
end)
System.namespace("Slipe.Client.Weapons", function (namespace)
  -- <summary>
  -- Represents a custom weapon that can be placed in the world
  -- </summary>
  namespace.class("CustomWeapon", function (namespace)
    local getAmmo, setAmmo, getAmmoInClip, setAmmoInClip, getFiringRate, setFiringRate, getState, setState, 
    Fire, SetTarget, SetTarget1, SetTarget2, SetTarget3, SetTarget4, ResetFiringRate, __ctor1__, 
    __ctor2__
    __ctor1__ = function (this, element)
      SlipeSharedElements.PhysicalElement.__ctor__(this, element)
    end
    -- <summary>
    -- Create a custom weapon at a certain position
    -- </summary>
    __ctor2__ = function (this, model, position)
      __ctor1__(this, SlipeMtaDefinitions.MtaClient.CreateWeapon(model:getName(), position.X, position.Y, position.Z))
    end
    getAmmo = function (this)
      return SlipeMtaDefinitions.MtaClient.GetWeaponAmmo(this.element)
    end
    setAmmo = function (this, value)
      SlipeMtaDefinitions.MtaShared.SetWeaponAmmo(this.element, value, - 1, - 1)
    end
    getAmmoInClip = function (this)
      return SlipeMtaDefinitions.MtaClient.GetWeaponClipAmmo(this.element)
    end
    setAmmoInClip = function (this, value)
      SlipeMtaDefinitions.MtaClient.SetWeaponClipAmmo(this.element, value)
    end
    getFiringRate = function (this)
      return SlipeMtaDefinitions.MtaClient.GetWeaponFiringRate(this.element)
    end
    setFiringRate = function (this, value)
      SlipeMtaDefinitions.MtaClient.SetWeaponFiringRate(this.element, value)
    end
    getState = function (this)
      return System.cast(System.Int32, System.Enum.Parse(System.typeof(SlipeSharedWeapons.WeaponState), SlipeMtaDefinitions.MtaClient.GetWeaponState(this.element), true))
    end
    setState = function (this, value)
      SlipeMtaDefinitions.MtaClient.SetWeaponState(this.element, value:ToEnumString(SlipeSharedWeapons.WeaponState):ToLower())
    end
    -- <summary>
    -- Fire the weapon!
    -- </summary>
    Fire = function (this)
      return SlipeMtaDefinitions.MtaClient.FireWeapon(this.element)
    end
    -- <summary>
    -- Have the weapon target a vehicle tire
    -- </summary>
    SetTarget = function (this, vehicle, tire)
      return SlipeMtaDefinitions.MtaClient.SetWeaponTarget(this.element, vehicle:getMTAElement(), tire)
    end
    -- <summary>
    -- Have the weapon target the center of any element (vehicle, ped, player, world object)
    -- </summary>
    SetTarget1 = function (this, physicalElement)
      return SlipeMtaDefinitions.MtaClient.SetWeaponTarget(this.element, physicalElement:getMTAElement(), 255)
    end
    -- <summary>
    -- Have the weapon target a ped at a specific bone
    -- </summary>
    SetTarget2 = function (this, ped, bone)
      return SlipeMtaDefinitions.MtaClient.SetWeaponTarget(this.element, ped:getMTAElement(), bone)
    end
    -- <summary>
    -- Have the weapon target a position
    -- </summary>
    SetTarget3 = function (this, position)
      return SlipeMtaDefinitions.MtaClient.SetWeaponTarget(this.element, position.X, position.Y, position.Z)
    end
    -- <summary>
    -- Have the weapon target along its rotation
    -- </summary>
    SetTarget4 = function (this)
      return SlipeMtaDefinitions.MtaClient.SetWeaponTarget(this.element)
    end
    -- <summary>
    -- Reset the firing rate of this weapon
    -- </summary>
    ResetFiringRate = function (this)
      return SlipeMtaDefinitions.MtaClient.ResetWeaponFiringRate(this.element)
    end
    return {
      __inherits__ = function (out)
        return {
          out.Slipe.Shared.Elements.PhysicalElement
        }
      end,
      getAmmo = getAmmo,
      setAmmo = setAmmo,
      getAmmoInClip = getAmmoInClip,
      setAmmoInClip = setAmmoInClip,
      getFiringRate = getFiringRate,
      setFiringRate = setFiringRate,
      getState = getState,
      setState = setState,
      Fire = Fire,
      SetTarget = SetTarget,
      SetTarget1 = SetTarget1,
      SetTarget2 = SetTarget2,
      SetTarget3 = SetTarget3,
      SetTarget4 = SetTarget4,
      ResetFiringRate = ResetFiringRate,
      __ctor__ = {
        __ctor1__,
        __ctor2__
      },
      __metadata__ = function (out)
        return {
          class = { 0x6, System.new(out.Slipe.Shared.Elements.DefaultElementClassAttribute, 2, 29 --[[ElementType.Weapon]]) }
        }
      end
    }
  end)
end)