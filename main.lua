-- main.lua - 项目主启动文件
package.path = package.path .. ";./src/?.lua;./src/?/init.lua"

-- 引入核心模块
local core = require("my_app.core")

-- 主程序逻辑
local function main()
    print("Starting helloworld-lua...")
    
    -- 演示核心模块功能
    local sum = core.add(10, 20)
    print("10 + 20 = " .. sum)
    
    core.greet()
    
    print("helloworld-lua started successfully!")
end

-- 启动主程序
main()