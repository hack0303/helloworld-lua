-- src/my_app/core.lua - 项目核心模块
local core = {}

-- 示例方法：打印欢迎信息
function core.greet()
    print("Hello from helloworld-lua core module!")
end

-- 示例方法：计算两数之和（演示模块功能）
function core.add(a, b)
    return a + b
end

return core