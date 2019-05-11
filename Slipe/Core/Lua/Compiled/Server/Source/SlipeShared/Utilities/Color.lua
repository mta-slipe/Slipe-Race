-- Generated by CSharp.lua Compiler
local System = System
local SlipeMtaDefinitions
System.import(function (out)
  SlipeMtaDefinitions = Slipe.MtaDefinitions
end)
System.namespace("Slipe.Shared.Utilities", function (namespace)
  -- <summary>
  -- Class defining a color and an alpha value
  -- </summary>
  namespace.class("Color", function (namespace)
    local getR, setR, getG, setG, getB, setB, getA, setA, 
    getHex, op_Implicit, op_Implicit1, getMaroon, getrkRed, getBrown, getFirebrick, getCrimson, 
    getRed, getTomato, getCoral, getIndianRed, getLightCoral, getrkSalmon, getSalmon, getLightSalmon, 
    getOrangeRed, getrkOrange, getOrange, getGold, getrkGoldenRod, getGoldenRod, getPaleGoldenRod, getrkKhaki, 
    getKhaki, getOlive, getYellow, getYellowGreen, getrkOliveGreen, getOliveDrab, getLawnGreen, getChartReuse, 
    getGreenYellow, getrkGreen, getGreen, getForestGreen, getLime, getLimeGreen, getLightGreen, getPaleGreen, 
    getrkSeaGreen, getMediumSpringGreen, getSpringGreen, getSeaGreen, getMediumAquaMarine, getMediumSeaGreen, getLightSeaGreen, getrkSlateGray, 
    getTeal, getrkCyan, getAqua, getCyan, getLightCyan, getrkTurquoise, getTurquoise, getMediumTurquoise, 
    getPaleTurquoise, getAquaMarine, getPowderBlue, getCadetBlue, getSteelBlue, getCornFlowerBlue, getDeepSkyBlue, getDodgerBlue, 
    getLightBlue, getSkyBlue, getLightSkyBlue, getMidnightBlue, getNavy, getrkBlue, getMediumBlue, getBlue, 
    getRoyalBlue, getBlueViolet, getIndigo, getrkSlateBlue, getSlateBlue, getMediumSlateBlue, getMediumPurple, getrkMagenta, 
    getrkViolet, getrkOrchid, getMediumOrchid, getPurple, getThistle, getPlum, getViolet, getMagenta, 
    getOrchid, getMediumVioletRed, getPaleVioletRed, getDeepPink, getHotPink, getLightPink, getPink, getAntiqueWhite, 
    getBeige, getBisque, getBlanchelmond, getWheat, getCornSilk, getLemonChion, getLightGoldenRodYellow, getLightYellow, 
    getSaddleBrown, getSienna, getChocolate, getPeru, getSandyBrown, getBurlyWood, getTan, getRosyBrown, 
    getMoccasin, getNavajoWhite, getPeachPu, getMistyRose, getLavenderBlush, getLinen, getOldLace, getPapayaWhip, 
    getSeaShell, getMintCream, getSlateGray, getLightSlateGray, getLightSteelBlue, getLavender, getFloralWhite, getAliceBlue, 
    getGhostWhite, getHoneydew, getIvory, getAzure, getSnow, getBlack, getDimGray, getGray, 
    getrkGray, getSilver, getLightGray, getGainsboro, getWhiteSmoke, getWhite, class, __ctor1__, 
    __ctor2__, __ctor3__, __ctor4__
    -- <summary>
    -- Creates a color from a hex code
    -- </summary>
    __ctor1__ = function (this, hex)
      setR(this, System.div(System.div(hex, 256), 256))
      setG(this, System.div((hex - getR(this) * 256 * 256), 256))
      setB(this, hex - getR(this) * 256 * 256 - getB(this) * 256)
    end
    -- <summary>
    -- Creats a color from a hex code
    -- </summary>
    __ctor2__ = function (this, hex)
      setR(this, System.toInt32(System.div(System.div(System.div(hex, 256), 256), 256)))
      setG(this, System.div(System.div(System.toInt32(hex - getR(this) * 256 * 256 * 256), 256), 256))
      setB(this, System.div(System.toInt32(hex - getR(this) * 256 * 256 * 256 - getG(this) * 256 * 256), 256))
      setA(this, System.toInt32(hex - getR(this) * 256 * 256 * 256 - getG(this) * 256 * 256 - getB(this) * 256))
    end
    -- <summary>
    -- Creates a color from the individual rgba values
    -- </summary>
    __ctor3__ = function (this, r, g, b, a)
      setR(this, r)
      setG(this, g)
      setB(this, b)
      setA(this, a)
    end
    -- <summary>
    -- Creates a color with a solid alpha
    -- </summary>
    __ctor4__ = function (this, r, g, b)
      __ctor3__(this, r, g, b, 255)
    end
    getR = function (this)
      return this.r
    end
    setR = function (this, value)
      this.r = value
    end
    getG = function (this)
      return this.g
    end
    setG = function (this, value)
      this.g = value
    end
    getB = function (this)
      return this.b
    end
    setB = function (this, value)
      this.b = value
    end
    getA = function (this)
      return this.a
    end
    setA = function (this, value)
      this.a = value
    end
    getHex = function (this)
      return SlipeMtaDefinitions.MtaShared.Tocolor(getR(this), getG(this), getB(this), getA(this))
    end
    op_Implicit = function (color)
      return System.new(class, 2, color)
    end
    op_Implicit1 = function (color)
      return class(color)
    end
    getMaroon = function ()
      return System.new(class, 4, 128, 0, 0)
    end
    getrkRed = function ()
      return System.new(class, 4, 139, 0, 0)
    end
    getBrown = function ()
      return System.new(class, 4, 165, 42, 42)
    end
    getFirebrick = function ()
      return System.new(class, 4, 178, 34, 34)
    end
    getCrimson = function ()
      return System.new(class, 4, 220, 20, 60)
    end
    getRed = function ()
      return System.new(class, 4, 255, 0, 0)
    end
    getTomato = function ()
      return System.new(class, 4, 255, 99, 71)
    end
    getCoral = function ()
      return System.new(class, 4, 255, 127, 80)
    end
    getIndianRed = function ()
      return System.new(class, 4, 205, 92, 92)
    end
    getLightCoral = function ()
      return System.new(class, 4, 240, 128, 128)
    end
    getrkSalmon = function ()
      return System.new(class, 4, 233, 150, 122)
    end
    getSalmon = function ()
      return System.new(class, 4, 250, 128, 114)
    end
    getLightSalmon = function ()
      return System.new(class, 4, 255, 160, 122)
    end
    getOrangeRed = function ()
      return System.new(class, 4, 255, 69, 0)
    end
    getrkOrange = function ()
      return System.new(class, 4, 255, 140, 0)
    end
    getOrange = function ()
      return System.new(class, 4, 255, 165, 0)
    end
    getGold = function ()
      return System.new(class, 4, 255, 215, 0)
    end
    getrkGoldenRod = function ()
      return System.new(class, 4, 184, 134, 11)
    end
    getGoldenRod = function ()
      return System.new(class, 4, 218, 165, 32)
    end
    getPaleGoldenRod = function ()
      return System.new(class, 4, 238, 232, 170)
    end
    getrkKhaki = function ()
      return System.new(class, 4, 189, 183, 107)
    end
    getKhaki = function ()
      return System.new(class, 4, 240, 230, 140)
    end
    getOlive = function ()
      return System.new(class, 4, 128, 128, 0)
    end
    getYellow = function ()
      return System.new(class, 4, 255, 255, 0)
    end
    getYellowGreen = function ()
      return System.new(class, 4, 154, 205, 50)
    end
    getrkOliveGreen = function ()
      return System.new(class, 4, 85, 107, 47)
    end
    getOliveDrab = function ()
      return System.new(class, 4, 107, 142, 35)
    end
    getLawnGreen = function ()
      return System.new(class, 4, 124, 252, 0)
    end
    getChartReuse = function ()
      return System.new(class, 4, 127, 255, 0)
    end
    getGreenYellow = function ()
      return System.new(class, 4, 173, 255, 47)
    end
    getrkGreen = function ()
      return System.new(class, 4, 0, 100, 0)
    end
    getGreen = function ()
      return System.new(class, 4, 0, 128, 0)
    end
    getForestGreen = function ()
      return System.new(class, 4, 34, 139, 34)
    end
    getLime = function ()
      return System.new(class, 4, 0, 255, 0)
    end
    getLimeGreen = function ()
      return System.new(class, 4, 50, 205, 50)
    end
    getLightGreen = function ()
      return System.new(class, 4, 144, 238, 144)
    end
    getPaleGreen = function ()
      return System.new(class, 4, 152, 251, 152)
    end
    getrkSeaGreen = function ()
      return System.new(class, 4, 143, 188, 143)
    end
    getMediumSpringGreen = function ()
      return System.new(class, 4, 0, 250, 154)
    end
    getSpringGreen = function ()
      return System.new(class, 4, 0, 255, 127)
    end
    getSeaGreen = function ()
      return System.new(class, 4, 46, 139, 87)
    end
    getMediumAquaMarine = function ()
      return System.new(class, 4, 102, 205, 170)
    end
    getMediumSeaGreen = function ()
      return System.new(class, 4, 60, 179, 113)
    end
    getLightSeaGreen = function ()
      return System.new(class, 4, 32, 178, 170)
    end
    getrkSlateGray = function ()
      return System.new(class, 4, 47, 79, 79)
    end
    getTeal = function ()
      return System.new(class, 4, 0, 128, 128)
    end
    getrkCyan = function ()
      return System.new(class, 4, 0, 139, 139)
    end
    getAqua = function ()
      return System.new(class, 4, 0, 255, 255)
    end
    getCyan = function ()
      return System.new(class, 4, 0, 255, 255)
    end
    getLightCyan = function ()
      return System.new(class, 4, 224, 255, 255)
    end
    getrkTurquoise = function ()
      return System.new(class, 4, 0, 206, 209)
    end
    getTurquoise = function ()
      return System.new(class, 4, 64, 224, 208)
    end
    getMediumTurquoise = function ()
      return System.new(class, 4, 72, 209, 204)
    end
    getPaleTurquoise = function ()
      return System.new(class, 4, 175, 238, 238)
    end
    getAquaMarine = function ()
      return System.new(class, 4, 127, 255, 212)
    end
    getPowderBlue = function ()
      return System.new(class, 4, 176, 224, 230)
    end
    getCadetBlue = function ()
      return System.new(class, 4, 95, 158, 160)
    end
    getSteelBlue = function ()
      return System.new(class, 4, 70, 130, 180)
    end
    getCornFlowerBlue = function ()
      return System.new(class, 4, 100, 149, 237)
    end
    getDeepSkyBlue = function ()
      return System.new(class, 4, 0, 191, 255)
    end
    getDodgerBlue = function ()
      return System.new(class, 4, 30, 144, 255)
    end
    getLightBlue = function ()
      return System.new(class, 4, 173, 216, 230)
    end
    getSkyBlue = function ()
      return System.new(class, 4, 135, 206, 235)
    end
    getLightSkyBlue = function ()
      return System.new(class, 4, 135, 206, 250)
    end
    getMidnightBlue = function ()
      return System.new(class, 4, 25, 25, 112)
    end
    getNavy = function ()
      return System.new(class, 4, 0, 0, 128)
    end
    getrkBlue = function ()
      return System.new(class, 4, 0, 0, 139)
    end
    getMediumBlue = function ()
      return System.new(class, 4, 0, 0, 205)
    end
    getBlue = function ()
      return System.new(class, 4, 0, 0, 255)
    end
    getRoyalBlue = function ()
      return System.new(class, 4, 65, 105, 225)
    end
    getBlueViolet = function ()
      return System.new(class, 4, 138, 43, 226)
    end
    getIndigo = function ()
      return System.new(class, 4, 75, 0, 130)
    end
    getrkSlateBlue = function ()
      return System.new(class, 4, 72, 61, 139)
    end
    getSlateBlue = function ()
      return System.new(class, 4, 106, 90, 205)
    end
    getMediumSlateBlue = function ()
      return System.new(class, 4, 123, 104, 238)
    end
    getMediumPurple = function ()
      return System.new(class, 4, 147, 112, 219)
    end
    getrkMagenta = function ()
      return System.new(class, 4, 139, 0, 139)
    end
    getrkViolet = function ()
      return System.new(class, 4, 148, 0, 211)
    end
    getrkOrchid = function ()
      return System.new(class, 4, 153, 50, 204)
    end
    getMediumOrchid = function ()
      return System.new(class, 4, 186, 85, 211)
    end
    getPurple = function ()
      return System.new(class, 4, 128, 0, 128)
    end
    getThistle = function ()
      return System.new(class, 4, 216, 191, 216)
    end
    getPlum = function ()
      return System.new(class, 4, 221, 160, 221)
    end
    getViolet = function ()
      return System.new(class, 4, 238, 130, 238)
    end
    getMagenta = function ()
      return System.new(class, 4, 255, 0, 255)
    end
    getOrchid = function ()
      return System.new(class, 4, 218, 112, 214)
    end
    getMediumVioletRed = function ()
      return System.new(class, 4, 199, 21, 133)
    end
    getPaleVioletRed = function ()
      return System.new(class, 4, 219, 112, 147)
    end
    getDeepPink = function ()
      return System.new(class, 4, 255, 20, 147)
    end
    getHotPink = function ()
      return System.new(class, 4, 255, 105, 180)
    end
    getLightPink = function ()
      return System.new(class, 4, 255, 182, 193)
    end
    getPink = function ()
      return System.new(class, 4, 255, 192, 203)
    end
    getAntiqueWhite = function ()
      return System.new(class, 4, 250, 235, 215)
    end
    getBeige = function ()
      return System.new(class, 4, 245, 245, 220)
    end
    getBisque = function ()
      return System.new(class, 4, 255, 228, 196)
    end
    getBlanchelmond = function ()
      return System.new(class, 4, 255, 235, 205)
    end
    getWheat = function ()
      return System.new(class, 4, 245, 222, 179)
    end
    getCornSilk = function ()
      return System.new(class, 4, 255, 248, 220)
    end
    getLemonChion = function ()
      return System.new(class, 4, 255, 250, 205)
    end
    getLightGoldenRodYellow = function ()
      return System.new(class, 4, 250, 250, 210)
    end
    getLightYellow = function ()
      return System.new(class, 4, 255, 255, 224)
    end
    getSaddleBrown = function ()
      return System.new(class, 4, 139, 69, 19)
    end
    getSienna = function ()
      return System.new(class, 4, 160, 82, 45)
    end
    getChocolate = function ()
      return System.new(class, 4, 210, 105, 30)
    end
    getPeru = function ()
      return System.new(class, 4, 205, 133, 63)
    end
    getSandyBrown = function ()
      return System.new(class, 4, 244, 164, 96)
    end
    getBurlyWood = function ()
      return System.new(class, 4, 222, 184, 135)
    end
    getTan = function ()
      return System.new(class, 4, 210, 180, 140)
    end
    getRosyBrown = function ()
      return System.new(class, 4, 188, 143, 143)
    end
    getMoccasin = function ()
      return System.new(class, 4, 255, 228, 181)
    end
    getNavajoWhite = function ()
      return System.new(class, 4, 255, 222, 173)
    end
    getPeachPu = function ()
      return System.new(class, 4, 255, 218, 185)
    end
    getMistyRose = function ()
      return System.new(class, 4, 255, 228, 225)
    end
    getLavenderBlush = function ()
      return System.new(class, 4, 255, 240, 245)
    end
    getLinen = function ()
      return System.new(class, 4, 250, 240, 230)
    end
    getOldLace = function ()
      return System.new(class, 4, 253, 245, 230)
    end
    getPapayaWhip = function ()
      return System.new(class, 4, 255, 239, 213)
    end
    getSeaShell = function ()
      return System.new(class, 4, 255, 245, 238)
    end
    getMintCream = function ()
      return System.new(class, 4, 245, 255, 250)
    end
    getSlateGray = function ()
      return System.new(class, 4, 112, 128, 144)
    end
    getLightSlateGray = function ()
      return System.new(class, 4, 119, 136, 153)
    end
    getLightSteelBlue = function ()
      return System.new(class, 4, 176, 196, 222)
    end
    getLavender = function ()
      return System.new(class, 4, 230, 230, 250)
    end
    getFloralWhite = function ()
      return System.new(class, 4, 255, 250, 240)
    end
    getAliceBlue = function ()
      return System.new(class, 4, 240, 248, 255)
    end
    getGhostWhite = function ()
      return System.new(class, 4, 248, 248, 255)
    end
    getHoneydew = function ()
      return System.new(class, 4, 240, 255, 240)
    end
    getIvory = function ()
      return System.new(class, 4, 255, 255, 240)
    end
    getAzure = function ()
      return System.new(class, 4, 240, 255, 255)
    end
    getSnow = function ()
      return System.new(class, 4, 255, 250, 250)
    end
    getBlack = function ()
      return System.new(class, 4, 0, 0, 0)
    end
    getDimGray = function ()
      return System.new(class, 4, 105, 105, 105)
    end
    getGray = function ()
      return System.new(class, 4, 128, 128, 128)
    end
    getrkGray = function ()
      return System.new(class, 4, 169, 169, 169)
    end
    getSilver = function ()
      return System.new(class, 4, 192, 192, 192)
    end
    getLightGray = function ()
      return System.new(class, 4, 211, 211, 211)
    end
    getGainsboro = function ()
      return System.new(class, 4, 220, 220, 220)
    end
    getWhiteSmoke = function ()
      return System.new(class, 4, 245, 245, 245)
    end
    getWhite = function ()
      return System.new(class, 4, 255, 255, 255)
    end
    class = {
      r = 0,
      getR = getR,
      setR = setR,
      g = 0,
      getG = getG,
      setG = setG,
      b = 0,
      getB = getB,
      setB = setB,
      a = 0,
      getA = getA,
      setA = setA,
      getHex = getHex,
      op_Implicit = op_Implicit,
      op_Implicit1 = op_Implicit1,
      getMaroon = getMaroon,
      getrkRed = getrkRed,
      getBrown = getBrown,
      getFirebrick = getFirebrick,
      getCrimson = getCrimson,
      getRed = getRed,
      getTomato = getTomato,
      getCoral = getCoral,
      getIndianRed = getIndianRed,
      getLightCoral = getLightCoral,
      getrkSalmon = getrkSalmon,
      getSalmon = getSalmon,
      getLightSalmon = getLightSalmon,
      getOrangeRed = getOrangeRed,
      getrkOrange = getrkOrange,
      getOrange = getOrange,
      getGold = getGold,
      getrkGoldenRod = getrkGoldenRod,
      getGoldenRod = getGoldenRod,
      getPaleGoldenRod = getPaleGoldenRod,
      getrkKhaki = getrkKhaki,
      getKhaki = getKhaki,
      getOlive = getOlive,
      getYellow = getYellow,
      getYellowGreen = getYellowGreen,
      getrkOliveGreen = getrkOliveGreen,
      getOliveDrab = getOliveDrab,
      getLawnGreen = getLawnGreen,
      getChartReuse = getChartReuse,
      getGreenYellow = getGreenYellow,
      getrkGreen = getrkGreen,
      getGreen = getGreen,
      getForestGreen = getForestGreen,
      getLime = getLime,
      getLimeGreen = getLimeGreen,
      getLightGreen = getLightGreen,
      getPaleGreen = getPaleGreen,
      getrkSeaGreen = getrkSeaGreen,
      getMediumSpringGreen = getMediumSpringGreen,
      getSpringGreen = getSpringGreen,
      getSeaGreen = getSeaGreen,
      getMediumAquaMarine = getMediumAquaMarine,
      getMediumSeaGreen = getMediumSeaGreen,
      getLightSeaGreen = getLightSeaGreen,
      getrkSlateGray = getrkSlateGray,
      getTeal = getTeal,
      getrkCyan = getrkCyan,
      getAqua = getAqua,
      getCyan = getCyan,
      getLightCyan = getLightCyan,
      getrkTurquoise = getrkTurquoise,
      getTurquoise = getTurquoise,
      getMediumTurquoise = getMediumTurquoise,
      getPaleTurquoise = getPaleTurquoise,
      getAquaMarine = getAquaMarine,
      getPowderBlue = getPowderBlue,
      getCadetBlue = getCadetBlue,
      getSteelBlue = getSteelBlue,
      getCornFlowerBlue = getCornFlowerBlue,
      getDeepSkyBlue = getDeepSkyBlue,
      getDodgerBlue = getDodgerBlue,
      getLightBlue = getLightBlue,
      getSkyBlue = getSkyBlue,
      getLightSkyBlue = getLightSkyBlue,
      getMidnightBlue = getMidnightBlue,
      getNavy = getNavy,
      getrkBlue = getrkBlue,
      getMediumBlue = getMediumBlue,
      getBlue = getBlue,
      getRoyalBlue = getRoyalBlue,
      getBlueViolet = getBlueViolet,
      getIndigo = getIndigo,
      getrkSlateBlue = getrkSlateBlue,
      getSlateBlue = getSlateBlue,
      getMediumSlateBlue = getMediumSlateBlue,
      getMediumPurple = getMediumPurple,
      getrkMagenta = getrkMagenta,
      getrkViolet = getrkViolet,
      getrkOrchid = getrkOrchid,
      getMediumOrchid = getMediumOrchid,
      getPurple = getPurple,
      getThistle = getThistle,
      getPlum = getPlum,
      getViolet = getViolet,
      getMagenta = getMagenta,
      getOrchid = getOrchid,
      getMediumVioletRed = getMediumVioletRed,
      getPaleVioletRed = getPaleVioletRed,
      getDeepPink = getDeepPink,
      getHotPink = getHotPink,
      getLightPink = getLightPink,
      getPink = getPink,
      getAntiqueWhite = getAntiqueWhite,
      getBeige = getBeige,
      getBisque = getBisque,
      getBlanchelmond = getBlanchelmond,
      getWheat = getWheat,
      getCornSilk = getCornSilk,
      getLemonChion = getLemonChion,
      getLightGoldenRodYellow = getLightGoldenRodYellow,
      getLightYellow = getLightYellow,
      getSaddleBrown = getSaddleBrown,
      getSienna = getSienna,
      getChocolate = getChocolate,
      getPeru = getPeru,
      getSandyBrown = getSandyBrown,
      getBurlyWood = getBurlyWood,
      getTan = getTan,
      getRosyBrown = getRosyBrown,
      getMoccasin = getMoccasin,
      getNavajoWhite = getNavajoWhite,
      getPeachPu = getPeachPu,
      getMistyRose = getMistyRose,
      getLavenderBlush = getLavenderBlush,
      getLinen = getLinen,
      getOldLace = getOldLace,
      getPapayaWhip = getPapayaWhip,
      getSeaShell = getSeaShell,
      getMintCream = getMintCream,
      getSlateGray = getSlateGray,
      getLightSlateGray = getLightSlateGray,
      getLightSteelBlue = getLightSteelBlue,
      getLavender = getLavender,
      getFloralWhite = getFloralWhite,
      getAliceBlue = getAliceBlue,
      getGhostWhite = getGhostWhite,
      getHoneydew = getHoneydew,
      getIvory = getIvory,
      getAzure = getAzure,
      getSnow = getSnow,
      getBlack = getBlack,
      getDimGray = getDimGray,
      getGray = getGray,
      getrkGray = getrkGray,
      getSilver = getSilver,
      getLightGray = getLightGray,
      getGainsboro = getGainsboro,
      getWhiteSmoke = getWhiteSmoke,
      getWhite = getWhite,
      __ctor__ = {
        __ctor1__,
        __ctor2__,
        __ctor3__,
        __ctor4__
      }
    }
    return class
  end)
end)
