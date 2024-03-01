local math = require("math")

---@class std.math
local M = {}

--- constant

M.huge = math.huge
M.pi = math.pi

--- general

M.max = math.max
M.min = math.min
M.abs = math.abs
M.fmod = math.fmod
M.modf = math.modf
M.floor = math.floor
M.ceil = math.ceil

---@param x number
---@return number
function M.round(x)
    local l, r = M.floor(x), M.ceil(x)
    if (x - l) < (r - x) then
        return l
    else
        return r
    end
end

---@param x number
---@param min number
---@param max number
---@return number
function M.clamp(x, min, max)
    return M.max(min, M.min(x, max))
end

---@param a number
---@param b number
---@param k number
---@return number
function M.lerp(a, b, k)
    return a * (1.0 - k) + b * k
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

---@diagnostic disable-next-line: deprecated
if math.atan2 then
    --- Returns the arc tangent of `y/x` (in radians).  
    ---@param y  number
    ---@param x? number
    ---@return number
    ---@nodiscard
    ---@diagnostic disable-next-line: duplicate-set-field
    function M.atan(y, x)
        if x then
            ---@diagnostic disable-next-line: deprecated
            return math.atan2(y, x)
        else
            return math.atan(y)
        end
    end
else
    --- Returns the arc tangent of `y/x` (in radians).  
    ---@param y  number
    ---@param x? number
    ---@return number
    ---@nodiscard
    ---@diagnostic disable-next-line: duplicate-set-field
    function M.atan(y, x)
        ---@diagnostic disable-next-line: redundant-parameter
        return math.atan(y, x)
    end
end

M.sqrt = math.sqrt

--- hyperbolic function

---@diagnostic disable-next-line: deprecated
if math.cosh then
    ---@diagnostic disable-next-line: deprecated
    M.cosh = math.cosh
else
    --- Returns the hyperbolic cosine of `x` (assumed to be in radians). 
    ---@param x number
    ---@return number
    ---@nodiscard
    ---@diagnostic disable-next-line: duplicate-set-field
    function M.cosh(x)
        return (M.exp(x) + M.exp(-x)) / 2.0
    end
end

---@diagnostic disable-next-line: deprecated
if math.sinh then
    ---@diagnostic disable-next-line: deprecated
    M.sinh = math.sinh
else
    --- Returns the hyperbolic sine of `x` (assumed to be in radians). 
    ---@param x number
    ---@return number
    ---@nodiscard
    ---@diagnostic disable-next-line: duplicate-set-field
    function M.sinh(x)
        return (M.exp(x) - M.exp(-x)) / 2.0
    end
end

---@diagnostic disable-next-line: deprecated
if math.tanh then
    ---@diagnostic disable-next-line: deprecated
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

--- power & exponential function

---@diagnostic disable-next-line: deprecated
if math.pow then
    ---@diagnostic disable-next-line: deprecated
    M.pow = math.pow
else
    --- Returns `x ^ y` .  
    ---@param x number
    ---@param y number
    ---@return number
    ---@nodiscard
    ---@diagnostic disable-next-line: duplicate-set-field
    function M.pow(x, y)
        return x ^ y
    end
end
M.exp = math.exp

--- logarithm function

M.log = math.log

--- random

M.random = math.random
M.randomseed = math.randomseed

return M
