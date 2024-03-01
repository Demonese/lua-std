# 璀境石的 Lua 标准库

我受够了每次都要在不同的项目中编写相同的基础代码。

## `std.math`

* 常量
    * `std.math.huge`：来自 `math.huge`
    * `std.math.pi`：来自 `math.pi`
* 常用
    * `std.math.min`：来自 `math.min`
    * `std.math.max`：来自 `math.max`
    * `std.math.abs`：来自 `math.abs`
    * `std.math.fmod`：来自 `math.fmod`
    * `std.math.modf`：来自 `math.modf`
    * `std.math.floor`：来自 `math.floor`
    * `std.math.ceil`：来自 `math.ceil`
    * `std.math.round`
    * `std.math.clamp`
    * `std.math.lerp`
* 单位转换
    * `std.math.deg`：来自 `math.deg`
    * `std.math.rad`：来自 `math.rad`
* 三角函数
    * `std.math.cos`：来自 `math.cos`
    * `std.math.sin`：来自 `math.sin`
    * `std.math.tan`：来自 `math.tan`
    * `std.math.acos`：来自 `math.acos`
    * `std.math.asin`：来自 `math.asin`
    * `std.math.atan`：合并 `math.atan` 和 `math.atan2`
    * `std.math.sqrt`：来自 `math.sqrt`
* 双曲函数
    * `std.math.cosh`：来自 `math.cosh`
    * `std.math.sinh`：来自 `math.sinh`
    * `std.math.tanh`：来自 `math.tanh`
* 指数&幂函数
    * `std.math.pow`：来自 `math.pow`
    * `std.math.exp`：来自 `math.exp`
* 对数函数
    * `std.math.log`：来自 `math.log`
* 随机数
    * `std.math.random`：来自 `math.random`
    * `std.math.randomseed`：来自 `math.randomseed`

## `std.table`

* 访问
    * `std.table.front`
    * `std.table.back`
* 修改
    * `std.table.insert`：来自 `table.insert`
    * `std.table.remove`：来自 `table.remove`
    * `std.table.sort`：来自 `table.sort`
* 生成
    * `std.table.concat`：来自 `table.concat`
* 参数打包/解包
    * `std.table.pack`：来自 `table.pack`
    * `std.table.unpack`：来自 `table.unpack`
* 复制
    * `std.table.clone`
    * `std.table.copy`
