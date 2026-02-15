-- .luacheckrc - LuaCheck 配置文件
codes = true
enable = { "unused", "redefined", "undefined", "global", "unused_args", "unused_secondaries" }
exclude_files = { "spec/" }

-- 定义项目全局变量（避免误报）
globals = {
    "my_app"
}

-- 设置 Lua 版本
std = "lua5.4"

-- 忽略的警告（按需调整）
ignore = {
    "611"  -- 忽略 "unused variable" 中测试用的临时变量
}