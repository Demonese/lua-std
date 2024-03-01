# ChuiKingShek's Lua standard library

I can no longer tolerate: write the same basic code in different projects.

## Math

* Constant
    * `std.math.huge`: from `math.huge`
    * `std.math.pi`: from `math.pi`
* General
    * `std.math.min`: from `math.min`
    * `std.math.max`: from `math.max`
    * `std.math.abs`: from `math.abs`
    * `std.math.fmod`: from `math.fmod`
    * `std.math.modf`: from `math.modf`
    * `std.math.floor`: from `math.floor`
    * `std.math.ceil`: from `math.ceil`
    * `std.math.round`
    * `std.math.clamp`
    * `std.math.lerp`
* Unit convert
    * `std.math.deg`: from `math.deg`
    * `std.math.rad`: from `math.rad`
* Triangle function
    * `std.math.cos`: from `math.cos`
    * `std.math.sin`: from `math.sin`
    * `std.math.tan`: from `math.tan`
    * `std.math.acos`: from `math.acos`
    * `std.math.asin`: from `math.asin`
    * `std.math.atan`: combine `math.atan` and `math.atan2`
    * `std.math.sqrt`: from `math.sqrt`
* Hyperbolic function
    * `std.math.cosh`: from `math.cosh`
    * `std.math.sinh`: from `math.sinh`
    * `std.math.tanh`: from `math.tanh`
* Power & exponential function
    * `std.math.pow`: from `math.pow`
    * `std.math.exp`: from `math.exp`
* Logarithm function
    * `std.math.log`: from `math.log`
* Random
    * `std.math.random`: from `math.random`
    * `std.math.randomseed`: from `math.randomseed`
