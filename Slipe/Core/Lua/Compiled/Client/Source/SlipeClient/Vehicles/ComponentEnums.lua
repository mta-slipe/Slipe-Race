-- Generated by CSharp.lua Compiler
local System = System
System.namespace("Slipe.Client.Vehicles", function (namespace)
  -- <summary>
  -- Represents different vehicle components
  -- </summary>
  namespace.enum("ComponentType", function ()
    return {
      chassis = 0,
      chassis_vlo = 1,
      misc_a = 2,
      misc_b = 3,
      misc_c = 4,
      misc_d = 5,
      boot_dummy = 6,
      bonnet_dummy = 7,
      ug_nitro = 8,
      ug_spoiler = 9,
      ug_wing_left = 10,
      ug_wing_right = 11,
      exhaust_ok = 12,
      bump_front_dummy = 13,
      bump_rear_dummy = 14,
      wheel_lb_dummy = 15,
      wheel_rb_dummy = 16,
      wheel_lf_dummy = 17,
      wheel_rf_dummy = 18,
      door_lb_dummy = 19,
      door_rb_dummy = 20,
      door_lf_dumm = 21,
      door_rf_dummy = 22,
      windscreen_dummy = 23,
      plate_rear = 24,
      plate_front = 25,
      handlebars = 26,
      mudguard = 27,
      forks_front = 28,
      forks_rear = 29,
      wheel_front = 30,
      wheel_rear = 31
    }
  end)

  -- <summary>
  -- Representing what the position is relative to
  -- </summary>
  namespace.enum("ComponentBase", function ()
    return {
      parent = 0,
      root = 1,
      world = 2
    }
  end)
end)
