-- Generated by CSharp.lua Compiler
local System = System
System.namespace("Slipe.Server.Acl", function (namespace)
  -- <summary>
  -- Represents different types of ACL rights
  -- </summary>
  namespace.enum("AclRightEnum", function ()
    return {
      GENERAL = 0,
      FUNCTION = 1,
      RESOURCE = 2,
      COMMAND = 3
    }
  end)
end)