-- Generated by CSharp.lua Compiler
local System = System
local SlipeMtaDefinitions
local SlipeServerAccounts
local ArrayBan
System.import(function (out)
  SlipeMtaDefinitions = Slipe.MtaDefinitions
  SlipeServerAccounts = Slipe.Server.Accounts
  ArrayBan = System.Array(SlipeServerAccounts.Ban)
end)
System.namespace("Slipe.Server.Accounts", function (namespace)
  -- <summary>
  -- A ban is a pointer that represents a banned player arbitrarily.
  -- </summary>
  namespace.class("Ban", function (namespace)
    local getAdmin, setAdmin, getIp, getSerial, getReason, setReason, getNickname, setNickname, 
    getTimeStamp, getUnbanTimeStamp, setUnbanTimeStamp, getAll, Remove, Remove1, HandleAdded, HandleRemoved, 
    class, __ctor1__, __ctor2__
    -- <summary>
    -- Add a ban of a specific IP and/or serial
    -- </summary>
    __ctor1__ = function (this, ip, serial, banner, reason, seconds)
      local default
      if banner == nil then
        default = nil
      else
        default = banner:getMTAElement()
      end
      __ctor2__(this, SlipeMtaDefinitions.MtaServer.AddBan(ip, nil, serial, default, reason, seconds))
    end
    __ctor2__ = function (this, ban)
      this.ban = ban
    end
    getAdmin = function (this)
      return SlipeMtaDefinitions.MtaServer.GetBanAdmin(this.ban)
    end
    setAdmin = function (this, value)
      SlipeMtaDefinitions.MtaServer.SetBanAdmin(this.ban, value)
    end
    getIp = function (this)
      local default, extern = System.try(function ()
        return true, SlipeMtaDefinitions.MtaServer.GetBanIP(this.ban)
      end, function (default)
        if System.is(default, SlipeMtaDefinitions.MtaException) then
          return true, nil
        else
          return 1, default
        end
      end)
      if default then
        return extern
      end
    end
    getSerial = function (this)
      local default, extern = System.try(function ()
        return true, SlipeMtaDefinitions.MtaServer.GetBanSerial(this.ban)
      end, function (default)
        if System.is(default, SlipeMtaDefinitions.MtaException) then
          return true, nil
        else
          return 1, default
        end
      end)
      if default then
        return extern
      end
    end
    getReason = function (this)
      return SlipeMtaDefinitions.MtaServer.GetBanReason(this.ban)
    end
    setReason = function (this, value)
      SlipeMtaDefinitions.MtaServer.SetBanReason(this.ban, value)
    end
    getNickname = function (this)
      return SlipeMtaDefinitions.MtaServer.GetBanNick(this.ban)
    end
    setNickname = function (this, value)
      SlipeMtaDefinitions.MtaServer.SetBanNick(this.ban, value)
    end
    getTimeStamp = function (this)
      return SlipeMtaDefinitions.MtaServer.GetBanTime(this.ban)
    end
    getUnbanTimeStamp = function (this)
      return SlipeMtaDefinitions.MtaServer.GetUnbanTime(this.ban)
    end
    setUnbanTimeStamp = function (this, value)
      SlipeMtaDefinitions.MtaServer.SetUnbanTime(this.ban, value)
    end
    getAll = function ()
      local mtaBans = SlipeMtaDefinitions.MtaShared.GetArrayFromTable(SlipeMtaDefinitions.MtaServer.GetBans(), "ban", T)
      local bans = ArrayBan:new(#mtaBans)
      for i = 0, #mtaBans - 1 do
        bans:set(i, System.new(class, 2, System.cast(SlipeMtaDefinitions.MtaBan, mtaBans:get(i))))
      end
      return bans
    end
    -- <summary>
    -- Remove this ban
    -- </summary>
    Remove = function (this, player)
      local default
      if player == nil then
        default = nil
      else
        default = player:getMTAElement()
      end
      SlipeMtaDefinitions.MtaServer.RemoveBan(this.ban, default)
    end
    -- <summary>
    -- Remove this ban without any unbanning player
    -- </summary>
    Remove1 = function (this)
      Remove(this)
    end
    HandleAdded = function (this)
      local default = this.OnAdded
      if default ~= nil then
        default()
      end
    end
    HandleRemoved = function (this, responsiblePlayer)
      local default = this.OnRemoved
      if default ~= nil then
        default(responsiblePlayer)
      end
    end
    class = {
      getAdmin = getAdmin,
      setAdmin = setAdmin,
      getIp = getIp,
      getSerial = getSerial,
      getReason = getReason,
      setReason = setReason,
      getNickname = getNickname,
      setNickname = setNickname,
      getTimeStamp = getTimeStamp,
      getUnbanTimeStamp = getUnbanTimeStamp,
      setUnbanTimeStamp = setUnbanTimeStamp,
      getAll = getAll,
      Remove = Remove,
      Remove1 = Remove1,
      HandleAdded = HandleAdded,
      HandleRemoved = HandleRemoved,
      __ctor__ = {
        __ctor1__,
        __ctor2__
      }
    }
    return class
  end)
end)