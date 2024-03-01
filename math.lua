local math = require("math")

---@class std.math
local M = {}

--- constant

M.huge = math.huge
M.pi = math.pi
M.e = 2.718281828459045
---@diagnostic disable-next-line: undefined-field
if math.maxinteger then
    ---@diagnostic disable-next-line: undefined-field
    M.maxinteger = math.maxinteger
else
    M.maxinteger = 0x7FFFFFFF
end
---@diagnostic disable-next-line: undefined-field
if math.mininteger then
    ---@diagnostic disable-next-line: undefined-field
    M.mininteger = math.mininteger
else
    M.mininteger = -0x80000000
end

--- normal

M.max = math.max
M.min = math.min
M.abs = math.abs
M.floor = math.floor
M.ceil = math.ceil
---@diagnostic disable-next-line: deprecated
if math.tointeger  then
    ---@diagnostic disable-next-line: deprecated
    M.tointeger = math.tointeger
else
    ---@param x any
    ---@return integer?
    ---@nodiscard
    ---@diagnostic disable-next-line: duplicate-set-field
    function M.tointeger(x)
        local v = tonumber(x)
        if not v then
            return nil
        end
        if math.floor(v) == v then
            return v
        else
            return nil
        end
    end
end
if math.type then
    M.type = math.type
else
    ---@param x any
    ---@return
    ---| '"integer"'
    ---| '"float"'
    ---| nil
    ---@nodiscard
    ---@diagnostic disable-next-line: duplicate-set-field
    function M.type(x)
        if type(x) == "number" then
            return "float"
        else
            return nil
        end
    end
end
function M.ult(m, n)
    -- TODO
end

--- unit convert

M.deg = math.deg
M.rad = math.rad

--- triangle function

M.cos = math.cos
M.sin = math.sin
M.tan = math.tan
M.acos = math.acos
M.asin = math.asin
if math.atan2 then
    --- Returns the arc tangent of `y/x` (in radians).  
    ---@param y  number
    ---@param x? number
    ---@return number
    ---@nodiscard
    ---@diagnostic disable-next-line: duplicate-set-field
    function M.atan(y, x)
        if x then
            return math.atan2(y, x)
        else
            return math.atan(y)
        end
    end
    M.atan2 = math.atan2
else
    M.atan = math.atan
    M.atan2 = math.atan
end
M.sqrt = math.sqrt

--- hyperbolic function

if math.cosh then
    M.cosh = math.cosh
else
    --- Returns the hyperbolic cosine of `x` (assumed to be in radians). 
    ---@param x number
    ---@return number
    ---@nodiscard
    ---@diagnostic disable-next-line: duplicate-set-field
    function M.cosh(x)
        return (M.pow(M.e, x) + M.pow(M.e, -x)) / 2.0
    end
end
if math.sinh then
    M.sinh = math.sinh
else
    --- Returns the hyperbolic sine of `x` (assumed to be in radians). 
    ---@param x number
    ---@return number
    ---@nodiscard
    ---@diagnostic disable-next-line: duplicate-set-field
    function M.sinh(x)
        return (M.pow(M.e, x) - M.pow(M.e, -x)) / 2.0
    end
end
if math.tanh then
    M.tanh = math.tanh
else
    --- Returns the hyperbolic tangent of `x` (assumed to be in radians).  
    ---@param x number
    ---@return number
    ---@nodiscard
    ---@diagnostic disable-next-line: duplicate-set-field
    function M.tanh(x)
        return M.sinh(x) / M.cosh(x)
    end
end

--- index function

if math.pow then
    -- lua 5.2 removed
    M.pow = math.pow
else
    ---@diagnostic disable-next-line: duplicate-set-field
    function M.pow(x, y)
        return x ^ y
    end
end
M.exp = math.exp

--- logarithm function

M.log = math.log
if math.log10 then
    -- lua 5.2 removed
    M.log10 = math.log10
else
    --- Returns the base-10 logarithm of x.  
    ---@param x number
    ---@return number
    ---@nodiscard
    ---@diagnostic disable-next-line: duplicate-set-field
    function M.log10(x)
        return M.log(x, 10)
    end
end

--- other

M.fmod = math.fmod
M.modf = math.modf
if math.frexp then
    M.frexp = math.frexp
else
    ---@diagnostic disable-next-line: duplicate-set-field
    function M.frexp(x)
        -- TODO
    end
end
if math.ldexp then
    M.ldexp = math.ldexp
else
    --- Returns `m * (2 ^ e)` .  
    ---@param m number
    ---@param e number
    ---@return number
    ---@nodiscard
    ---@diagnostic disable-next-line: duplicate-set-field
    function M.ldexp(m, e)
        return m * (2 ^ e)
    end
end

--- random

M.random = math.random
M.randomseed = math.randomseed

return M
