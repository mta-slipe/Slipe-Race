-- Generated by CSharp.lua Compiler
local System = System
local SlipeClientAssets
local SystemDiagnostics
local ListInt32
System.import(function (out)
  SlipeClientAssets = Slipe.Client.Assets
  SystemDiagnostics = System.Diagnostics
  ListInt32 = System.List(System.Int32)
end)
System.namespace("Slipe.Client.Assets", function (namespace)
  -- <summary>
  -- A single mod, consisting of a .txd and optionally a .dff and .col
  -- </summary>
  namespace.class("Mod", function (namespace)
    local ApplyTo, OnFileDownload, ApplyFiles, __ctor1__, __ctor2__
    -- <summary>
    -- Creates a new Mod using TXD, DFF and COL instances
    -- </summary>
    -- <param name="dff"></param>
    -- <param name="col"></param>
    __ctor1__ = function (this, txd, dff, col)
      this.txd = txd
      this.dff = dff
      this.col = col
      this.state = 0 --[[DownloadState.Default]]
      this.modelsToApply = ListInt32()
    end
    -- <summary>
    -- Creates a new mod using TXD, DFF and COL filepaths
    -- </summary>
    -- <param name="dffFilepath"></param>
    -- <param name="colFilepath"></param>
    __ctor2__ = function (this, txdFilepath, dffFilepath, colFilepath)
      this.txd = SlipeClientAssets.Txd(txdFilepath)
      if dffFilepath ~= nil then
        this.dff = SlipeClientAssets.Dff(dffFilepath)
      end
      if colFilepath ~= nil then
        this.col = SlipeClientAssets.Col(colFilepath)
      end
      this.state = 0 --[[DownloadState.Default]]
      this.modelsToApply = ListInt32()
    end
    -- <summary>
    -- Downloads, loads and applies all files required for this mod.
    -- </summary>
    ApplyTo = function (this, model)
      if this.state == 2 --[[DownloadState.Downloaded]] then
        ApplyFiles(this, model)
        return
      elseif this.state == 1 --[[DownloadState.Downloading]] then
        this.modelsToApply:Add(model)
        return
      end

      this.state = 1 --[[DownloadState.Downloading]]
      this.modelsToApply:Add(model)

      this.txd.OnDownloadComplete = this.txd.OnDownloadComplete + System.fn(this, OnFileDownload)
      this.txd:Download()

      if this.dff ~= nil then
        this.dff.OnDownloadComplete = this.dff.OnDownloadComplete + System.fn(this, OnFileDownload)
        this.dff:Download()
      end

      if this.col ~= nil then
        this.col.OnDownloadComplete = this.col.OnDownloadComplete + System.fn(this, OnFileDownload)
        this.col:Download()
      end
    end
    OnFileDownload = function (this)
      if this.txd:getState() ~= 2 --[[DownloadState.Downloaded]] or this.dff ~= nil and this.dff:getState() ~= 2 --[[DownloadState.Downloaded]] or this.col ~= nil and this.col:getState() ~= 2 --[[DownloadState.Downloaded]] then
        return
      end
      this.state = 2 --[[DownloadState.Downloaded]]
      ApplyFiles(this, -1)
    end
    ApplyFiles = function (this, model)
      SystemDiagnostics.Debug.WriteLine(model)
      if model == - 1 then
        for _, numericModel in System.each(this.modelsToApply) do
          ApplyFiles(this, numericModel)
        end
        return
      end
      this.txd:Load(true)
      this.txd:ApplyTo(model)
      if this.dff ~= nil then
        this.dff:Load()
        this.dff:ApplyTo(model, false)
      end

      if this.col ~= nil then
        this.col:Load()
        this.col:ApplyTo(model)
      end
    end
    return {
      state = 0,
      ApplyTo = ApplyTo,
      __ctor__ = {
        __ctor1__,
        __ctor2__
      }
    }
  end)
end)