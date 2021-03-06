-- Generated by CSharp.lua Compiler
local System = System
System.namespace("Slipe.Shared.Weapons", function (namespace)
  -- <summary>
  -- Represents the slot of a weapon
  -- </summary>
  namespace.enum("WeaponSlot", function ()
    return {
      Unarmed = 0,
      Melee = 1,
      Handgun = 2,
      Shotgun = 3,
      SMG = 4,
      Rifle = 5,
      Sniper = 6,
      Heavy = 7,
      Thrown = 8,
      Special = 9,
      Gift = 10,
      Parachute = 11,
      Detonator = 12
    }
  end)

  -- <summary>
  -- Represents different skills one can have in a weapon
  -- </summary>
  namespace.enum("WeaponSkill", function ()
    return {
      Pro = 0,
      Std = 1,
      Poor = 2
    }
  end)

  -- <summary>
  -- Represents different properties weapons can have
  -- </summary>
  namespace.enum("WeaponProperty", function ()
    return {
      Weapon_Range = 0,
      Target_Range = 1,
      Accuracy = 2,
      Damage = 3,
      Maximum_Clip_Ammo = 4,
      MoveSpeed = 5,
      Flag_Aim_No_Auto = 6,
      Flag_Aim_Arm = 7,
      Flag_Aim_1st_Person = 8,
      Flag_Aim_Free = 9,
      Flag_Move_And_Aim = 10,
      Flag_Move_And_Shoot = 11,
      Flag_Type_Throw = 12,
      Flag_Type_Heavy = 13,
      Flag_Type_Constant = 14,
      Flag_Type_Dual = 15,
      Flag_Anim_Reload = 16,
      Flag_Anim_Crouch = 17,
      Flag_Anim_Reload_Loop = 18,
      Flag_Anim_Reload_Long = 19,
      Flag_Shot_Slows = 20,
      Flag_Shot_Rand_Speed = 21,
      Flag_Shot_Anim_Abrupt = 22,
      Flag_Shot_Expands = 23,
      Anim_Loop_Start = 24,
      Anim_Loop_Stop = 25,
      Anim_Loop_Bullet_Fire = 26,
      Anim2_Loop_Start = 27,
      Anim2_Loop_Stop = 28,
      Anim2_Loop_Bullet_Fire = 29,
      Anim_Breakout_Time = 30
    }
  end)

  -- <summary>
  -- Represents different states a weapon can be in
  -- </summary>
  namespace.enum("WeaponState", function ()
    return {
      Reloading = 0,
      Firing = 1,
      Ready = 2
    }
  end)
end)
