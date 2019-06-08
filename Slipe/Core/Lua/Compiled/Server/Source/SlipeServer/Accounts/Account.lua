-- Generated by CSharp.lua Compiler
local System = System
local SlipeMtaDefinitions
local SlipeServerAccounts
local SlipeServerPeds
local SlipeSharedElements
local ArrayAccount
local DictObjectAccount
System.import(function (out)
  SlipeMtaDefinitions = Slipe.MtaDefinitions
  SlipeServerAccounts = Slipe.Server.Accounts
  SlipeServerPeds = Slipe.Server.Peds
  SlipeSharedElements = Slipe.Shared.Elements
  ArrayAccount = System.Array(SlipeServerAccounts.Account)
  DictObjectAccount = System.Dictionary(System.Object, SlipeServerAccounts.Account)
end)
System.namespace("Slipe.Server.Accounts", function (namespace)
  -- <summary>
  -- The account class represents a player's server account.
  -- </summary>
  namespace.class("Account", function (namespace)
    local accounts, getIsGuestAccount, getName, getID, getIP, getSerial, getPlayer, getACLIdentifier, 
    getData, getAll, GetAccountsBySerial, GetAccountsByIP, GetAccountsByData, CopyFrom, GetData, SetData, 
    Remove, SetName, SetPassword, HasPermissionTo, IsInACLGroup, Get, Get1, Get2, 
    CastMultiple, class, static, __ctor1__, __ctor2__
    static = function (this)
      accounts = DictObjectAccount()
    end
    __ctor1__ = function (this, account)
      this.MTAAccount = account
      accounts:Add(this.MTAAccount, this)
    end
    -- <summary>
    -- This function adds an account to the list of registered accounts of the current server.
    -- </summary>
    __ctor2__ = function (this, name, password, caseSensitive)
      __ctor1__(this, SlipeMtaDefinitions.MtaServer.AddAccount(name, password, caseSensitive))
    end
    getIsGuestAccount = function (this)
      return SlipeMtaDefinitions.MtaServer.IsGuestAccount(this.MTAAccount)
    end
    getName = function (this)
      return SlipeMtaDefinitions.MtaServer.GetAccountName(this.MTAAccount)
    end
    getID = function (this)
      return SlipeMtaDefinitions.MtaServer.GetAccountID(this.MTAAccount)
    end
    getIP = function (this)
      return SlipeMtaDefinitions.MtaServer.GetAccountIP(this.MTAAccount)
    end
    getSerial = function (this)
      return SlipeMtaDefinitions.MtaServer.GetAccountSerial(this.MTAAccount)
    end
    getPlayer = function (this)
      local default, extern = System.try(function ()
        return true, SlipeSharedElements.ElementManager.getInstance():GetElement(SlipeMtaDefinitions.MtaServer.GetAccountPlayer(this.MTAAccount), SlipeServerPeds.Player)
      end, function (default)
        if System.is(default, SlipeMtaDefinitions.MtaException) then
          System.throw(SlipeServerAccounts.AccountException("No player can be found using this account"))
        else
          return 1, default
        end
      end)
      if default then
        return extern
      end
    end
    getACLIdentifier = function (this)
      return "user." .. getName(this)
    end
    getData = function (this)
      return SlipeMtaDefinitions.MtaShared.GetDictionaryFromTable(SlipeMtaDefinitions.MtaServer.GetAllAccountData(this.MTAAccount), "System.String", "System.String")
    end
    getAll = function ()
      local array = SlipeMtaDefinitions.MtaShared.GetArrayFromTable(SlipeMtaDefinitions.MtaServer.GetAccounts(), "account", T)
      return CastMultiple(array)
    end
    -- <summary>
    -- Returns an array of all accounts that were logged onto from a serial
    -- </summary>
    GetAccountsBySerial = function (serial)
      local array = SlipeMtaDefinitions.MtaShared.GetArrayFromTable(SlipeMtaDefinitions.MtaServer.GetAccountsBySerial(serial), "account", T)
      return CastMultiple(array)
    end
    -- <summary>
    -- Returns an array containing all accounts that were logged onto from specified IP-address.
    -- </summary>
    GetAccountsByIP = function (ip)
      local array = SlipeMtaDefinitions.MtaShared.GetArrayFromTable(SlipeMtaDefinitions.MtaServer.GetAccountsByIP(ip), "account", T)
      return CastMultiple(array)
    end
    -- <summary>
    -- Returns an array containing all accounts with specified dataName and value (
    -- </summary>
    GetAccountsByData = function (key, value)
      local array = SlipeMtaDefinitions.MtaShared.GetArrayFromTable(SlipeMtaDefinitions.MtaServer.GetAccountsByData(key, value), "account", T)
      return CastMultiple(array)
    end
    -- <summary>
    -- This function copies all of the data from one account to this account
    -- </summary>
    CopyFrom = function (this, fromAccount)
      return SlipeMtaDefinitions.MtaServer.CopyAccountData(this.MTAAccount, fromAccount.MTAAccount)
    end
    -- <summary>
    -- This function retrieves a string that has been stored using SetData.
    -- </summary>
    GetData = function (this, key)
      return SlipeMtaDefinitions.MtaServer.GetAccountData(this.MTAAccount, key)
    end
    -- <summary>
    -- This function sets a string to be stored in an account.
    -- </summary>
    SetData = function (this, key, value)
      return SlipeMtaDefinitions.MtaServer.SetAccountData(this.MTAAccount, key, value)
    end
    -- <summary>
    -- Removes this account from the server
    -- </summary>
    Remove = function (this)
      return SlipeMtaDefinitions.MtaServer.RemoveAccount(this.MTAAccount)
    end
    -- <summary>
    -- Sets the name of an account
    -- </summary>
    SetName = function (this, name, caseSensitive)
      return SlipeMtaDefinitions.MtaServer.SetAccountName(this.MTAAccount, name, caseSensitive)
    end
    -- <summary>
    -- Used to set the password of this account, encrypted with sha256
    -- </summary>
    SetPassword = function (this, value)
      return SlipeMtaDefinitions.MtaServer.SetAccountPassword(this.MTAAccount, value)
    end
    -- <summary>
    -- Check if the object has access to a given action
    -- </summary>
    HasPermissionTo = function (this, action, defaultPermission)
      return SlipeMtaDefinitions.MtaServer.HasObjectPermissionTo(getACLIdentifier(this), action, defaultPermission)
    end
    -- <summary>
    -- Check if the object is in a certain ACL group
    -- </summary>
    IsInACLGroup = function (this, group)
      return SlipeMtaDefinitions.MtaServer.IsObjectInACLGroup(getACLIdentifier(this), group:getACL())
    end
    Get = function (account)
      if account == nil then
        return nil
      end
      if not accounts:ContainsKey(account) then
        return class(account)
      end
      return accounts:get(account)
    end
    -- <summary>
    -- Get an account from some credentials
    -- </summary>
    Get1 = function (username, password, caseSensitive)
      local default, extern = System.try(function ()
        return true, Get(SlipeMtaDefinitions.MtaServer.GetAccount(username, password, caseSensitive))
      end, function (default)
        if System.is(default, SlipeMtaDefinitions.MtaException) then
          System.throw(SlipeServerAccounts.AccountException("No account with these credentials could be found"))
        else
          return 1, default
        end
      end)
      if default then
        return extern
      end
    end
    -- <summary>
    -- Get an account from an account ID
    -- </summary>
    Get2 = function (ID)
      local default, extern = System.try(function ()
        return true, Get(SlipeMtaDefinitions.MtaServer.GetAccountByID(ID))
      end, function (default)
        if System.is(default, SlipeMtaDefinitions.MtaException) then
          System.throw(SlipeServerAccounts.AccountException("No account with this ID found"))
        else
          return 1, default
        end
      end)
      if default then
        return extern
      end
    end
    CastMultiple = function (accounts)
      local result = ArrayAccount:new(#accounts)
      for i = 0, #accounts - 1 do
        result:set(i, Get(accounts:get(i)))
      end
      return result
    end
    class = {
      __inherits__ = function (out)
        return {
          out.Slipe.Server.Acl.IAclObject
        }
      end,
      getIsGuestAccount = getIsGuestAccount,
      getName = getName,
      getID = getID,
      getIP = getIP,
      getSerial = getSerial,
      getPlayer = getPlayer,
      getACLIdentifier = getACLIdentifier,
      getData = getData,
      getAll = getAll,
      GetAccountsBySerial = GetAccountsBySerial,
      GetAccountsByIP = GetAccountsByIP,
      GetAccountsByData = GetAccountsByData,
      CopyFrom = CopyFrom,
      GetData = GetData,
      SetData = SetData,
      Remove = Remove,
      SetName = SetName,
      SetPassword = SetPassword,
      HasPermissionTo = HasPermissionTo,
      IsInACLGroup = IsInACLGroup,
      Get = Get,
      Get1 = Get1,
      Get2 = Get2,
      CastMultiple = CastMultiple,
      static = static,
      __ctor__ = {
        __ctor1__,
        __ctor2__
      },
      __metadata__ = function (out)
        return {
          fields = {
            { "accounts", 0x9, System.Dictionary(System.Object, out.Slipe.Server.Accounts.Account) }
          },
          properties = {
            { "ACLIdentifier", 0x206, System.String, getACLIdentifier },
            { "All", 0x20E, System.Array(out.Slipe.Server.Accounts.Account), getAll },
            { "Data", 0x206, System.Dictionary(System.String, System.String), getData },
            { "ID", 0x206, System.Int32, getID },
            { "IP", 0x206, System.String, getIP },
            { "IsGuestAccount", 0x206, System.Boolean, getIsGuestAccount },
            { "MTAAccount", 0x4, out.Slipe.MtaDefinitions.MtaAccount },
            { "Name", 0x206, System.String, getName },
            { "Player", 0x206, out.Slipe.Server.Peds.Player, getPlayer },
            { "Serial", 0x206, System.String, getSerial }
          },
          methods = {
            { ".ctor", 0x104, __ctor1__, out.Slipe.MtaDefinitions.MtaAccount },
            { ".ctor", 0x306, __ctor2__, System.String, System.String, System.Boolean },
            { "CastMultiple", 0x18C, CastMultiple, System.Array(out.Slipe.MtaDefinitions.MtaAccount), System.Array(out.Slipe.Server.Accounts.Account) },
            { "CopyFrom", 0x186, CopyFrom, class, System.Boolean },
            { "Get", 0x38E, Get1, System.String, System.String, System.Boolean, class },
            { "Get", 0x18C, Get, out.Slipe.MtaDefinitions.MtaAccount, class },
            { "Get", 0x18E, Get2, System.Int32, class },
            { "GetAccountsByData", 0x28E, GetAccountsByData, System.String, System.String, System.Array(out.Slipe.Server.Accounts.Account) },
            { "GetAccountsByIP", 0x18E, GetAccountsByIP, System.String, System.Array(out.Slipe.Server.Accounts.Account) },
            { "GetAccountsBySerial", 0x18E, GetAccountsBySerial, System.String, System.Array(out.Slipe.Server.Accounts.Account) },
            { "GetData", 0x186, GetData, System.String, System.String },
            { "HasPermissionTo", 0x286, HasPermissionTo, System.String, System.Boolean, System.Boolean },
            { "IsInACLGroup", 0x186, IsInACLGroup, out.Slipe.Server.Acl.AclGroup, System.Boolean },
            { "Remove", 0x86, Remove, System.Boolean },
            { "SetData", 0x286, SetData, System.String, System.String, System.Boolean },
            { "SetName", 0x286, SetName, System.String, System.Boolean, System.Boolean },
            { "SetPassword", 0x186, SetPassword, System.String, System.Boolean }
          },
          events = {
            { "OnDataChange", 0xE, System.Delegate(out.Slipe.Server.Elements.RootElement, out.Slipe.Server.Accounts.Events.OnDataChangeEventArgs, System.Void) }
          },
          class = { 0x6 }
        }
      end
    }
    return class
  end)
end)
