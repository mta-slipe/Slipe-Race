-- Generated by CSharp.lua Compiler
local System = System
local SlipeMtaDefinitions
System.import(function (out)
  SlipeMtaDefinitions = Slipe.MtaDefinitions
end)
System.namespace("Slipe.Shared.Cryptography", function (namespace)
  -- <summary>
  -- Represents static wrappers for Sha512 methods
  -- </summary>
  namespace.class("Sha512", function (namespace)
    local Hash, Verify
    -- <summary>
    -- Hash a string with the Sha512 algorithm
    -- </summary>
    Hash = function (input)
      return SlipeMtaDefinitions.MtaShared.Hash("sha512", input)
    end
    -- <summary>
    -- Verify an input string against a Sha512 hash
    -- </summary>
    Verify = function (input, hash)
      return (Hash(input) == hash)
    end
    return {
      Hash = Hash,
      Verify = Verify
    }
  end)
end)