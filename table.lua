local table = require("table")

---@class std.table
local M = {}

--- modify

M.insert = table.insert
M.remove = table.remove
M.sort = table.sort

--- generate

M.concat = table.concat

--- pack/unpack

if table.pack then
    M.pack = table.pack
else
    ---  Returns a new table with all arguments stored into keys `1`, `2`, etc. and with a field `"n"` with the total number of arguments.  
    ---@return table
    ---@nodiscard
    ---@diagnostic disable-next-line: duplicate-set-field
    function M.pack(...)
        local args = {...}
        local size = select("#", ...)
        ---@diagnostic disable-next-line: inject-field
        args.n = size
        return args
    end
end

if table.unpack then
    M.unpack = table.unpack
else
    M.unpack = unpack
end

--M.maxn = table.maxn
--M.move = table.move

--- clone & copy

---@generic A
---@generic B
---@param a A
---@param b B
---@return boolean
local function is_same_type(a, b)
    return type(a) == type(b)
end

---@generic V
---@param v V
---@return boolean
local function is_simple_value_type(v)
    local T = type(v)
    return T == "boolean" or T == "number" or T == "string"
end

---@generic V
---@param v V
---@return boolean
local function is_simple_table_type(v)
    return type(v) == "table" and getmetatable(v) == nil
end

---@generic T
---@param t T
---@return boolean
local function is_simple_table(t)
    if not is_simple_table_type(t) then
        return false
    end
    for k, v in pairs(t) do
        if not is_simple_value_type(k) then
            return false
        end
        if not (is_simple_value_type(v) or is_simple_table(v)) then
            return false
        end
    end
    return true
end

---@generic S
---@param source S
---@return S
local function internal_clone(source)
    local r = {}
    for k, v in pairs(source) do
        if is_simple_value_type(k) then
            if is_simple_value_type(v) then
                r[k] = v
            elseif is_simple_table_type(v) then
                r[k] = internal_clone(v)
            end
        end
    end
    return r
end

--- Deep clone a table:  
--- * support key type `boolean`, `number`, `string`  
--- * support value type `boolean`, `number`, `string`, `table`  
--- * not support metatable  
--- * not support circular reference  
---@generic S
---@param source S
---@return S
function M.clone(source)
    assert(is_simple_table(source))
    return internal_clone(source)
end

---@generic T
---@generic S
---@param target T
---@param source S
local function internal_copy(target, source)
    for tk, tv in pairs(target) do
        local sk, sv = tk, source[tk]
        if is_same_type(tv, sv) then
            if is_simple_value_type(sv) then
                target[tk] = sv
            elseif is_simple_table_type(sv) then
                internal_copy(tv, sv)
            end
        end
    end
end

--- Deep copy values to target table, follow target table type and structure:  
--- * support key type `boolean`, `number`, `string`  
--- * support value type `boolean`, `number`, `string`, `table`  
--- * not support metatable  
--- * not support circular reference  
---@generic T
---@generic S
---@param target T
---@param source S
function M.copy(target, source)
    assert(is_simple_table(target))
    assert(is_simple_table(source))
    internal_copy(target, source)
end

return M
