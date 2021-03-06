-- Generated by CSharp.lua Compiler
local System = System
local SlipeClientAssets
local SlipeMtaDefinitions
System.import(function (out)
  SlipeClientAssets = Slipe.Client.Assets
  SlipeMtaDefinitions = Slipe.MtaDefinitions
end)
System.namespace("Slipe.Client.Assets", function (namespace)
  -- <summary>
  -- A single DFF file
  -- </summary>
  namespace.class("Dff", function (namespace)
    local Load, ApplyTo, Restore, __ctor__
    __ctor__ = function (this, filepath)
      SlipeClientAssets.Asset.__ctor__(this, filepath)
    end
    -- <summary>
    -- Loads the DFF file into memory
    -- </summary>
    Load = function (this)
      this.dff = SlipeMtaDefinitions.MtaClient.EngineLoadDFF(this.filepath)
    end
    -- <summary>
    -- Applies the model to the game
    -- </summary>
    -- <param name="supportsAlpha"></param>
    ApplyTo = function (this, model, supportsAlpha)
      if this.dff == nil then
        System.throw(System.Exception(System.String.Format("DFF file {0} has not yet been loaded", this.filepath)))
      end

      SlipeMtaDefinitions.MtaClient.EngineReplaceModel(this.dff, model, supportsAlpha)
    end
    Restore = function (model)
      SlipeMtaDefinitions.MtaClient.EngineRestoreModel(model)
    end
    return {
      __inherits__ = function (out)
        return {
          out.Slipe.Client.Assets.Asset
        }
      end,
      Load = Load,
      ApplyTo = ApplyTo,
      Restore = Restore,
      __ctor__ = __ctor__,
      __metadata__ = function (out)
        return {
          fields = {
            { "dff", 0x1, out.Slipe.MtaDefinitions.MtaElement }
          },
          methods = {
            { ".ctor", 0x106, nil, System.String },
            { "ApplyTo", 0x206, ApplyTo, System.Int32, System.Boolean },
            { "Load", 0x6, Load },
            { "Restore", 0x10E, Restore, System.Int32 }
          },
          class = { 0x6 }
        }
      end
    }
  end)
end)
