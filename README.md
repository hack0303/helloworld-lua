# helloworld-lua

一个结构规范、可扩展的 Lua 应用项目模板，包含完整的工程化配置（代码检查、格式化、单元测试、自动化构建），可作为 Lua 项目的基础骨架。

## 🌟 项目特性
- 遵循 Lua 项目最佳目录结构，便于扩展和维护
- 集成 LuaCheck 静态代码检查，提前发现代码问题
- 使用 Stylua 统一代码格式，保证团队代码风格一致
- 基于 Busted 实现单元测试，保障代码质量
- 通过 Makefile 封装常用任务，一键完成测试/格式化/运行等操作
- 提供可执行的启动脚本，方便直接运行

## 🚀 快速开始

### 环境要求
- Lua 5.4+（推荐 5.4 版本）
- LuaRocks（用于安装依赖工具）
- Git（版本控制）

### 安装依赖工具
```bash
# 安装 LuaCheck（静态代码检查）
luarocks install luacheck

# 安装 Busted（单元测试框架）
luarocks install busted

# 安装 Stylua（代码格式化，需先安装 Rust 环境）
# 方式1：通过 Cargo 安装（推荐）
cargo install stylua
# 方式2：手动下载二进制包（无 Rust 环境时）
# 参考：https://github.com/JohnnyMorganz/StyLua/releases
```

### 克隆项目 & 运行
```bash
# 克隆项目
git clone git@github.com:hack0303/helloworld-lua.git
cd helloworld-lua

# 运行项目（三种方式）
# 方式1：直接运行主文件
lua main.lua

# 方式2：运行可执行脚本（Windows）
lua.bat

# 方式3：运行可执行脚本（Unix-like）
./bin/helloworld-lua
```

## 📖 使用说明

### 核心命令
通过 Makefile 封装了所有常用操作，无需记忆复杂命令：
```bash
# 一键执行：代码检查 → 格式化 → 单元测试（推荐）
make

# 仅运行项目
make run

# 执行单元测试（显示详细日志）
make test

# 代码静态检查（检查语法/未定义变量/未使用变量等）
make lint

# 格式化所有 Lua 代码（统一代码风格）
make format

# 清理临时文件（如编译后的 .luac 文件）
make clean
```

### 项目结构说明
```
helloworld-lua/
├── bin/                    # 可执行脚本入口（带可执行权限）
│   └── helloworld-lua     # 项目启动脚本（Unix-like）
├── src/                   # 源代码目录（业务逻辑核心）
│   └── my_app/            # 项目核心模块目录（以项目名命名，避免冲突）
│       └── core.lua       # 核心业务逻辑示例
├── spec/                  # 单元测试目录（Busted 默认路径）
│   └── core_spec.lua      # core 模块的单元测试用例
├── .luacheckrc            # LuaCheck 静态检查配置
├── .stylua.toml           # Stylua 代码格式化配置
├── Makefile               # 自动化任务脚本（封装所有常用操作）
├── main.lua               # 项目主启动文件（配置模块路径 + 启动逻辑）
├── lua.bat                # Windows 启动脚本
├── helloworld-lua-dev-1.rockspec  # LuaRocks 包配置文件
├── LICENSE                # Apache 2.0 许可证文件
└── README.md              # 项目说明文档
```

## 🛠️ 开发指南

### 添加新模块
1. 在 `src/my_app/` 下创建新的 Lua 文件（如 `utils.lua`）：
```lua
-- src/my_app/utils.lua
local utils = {}

function utils.trim(str)
    return str:gsub("^%s+", ""):gsub("%s+$", "")
end

return utils
```

2. 在主文件或其他模块中引入：
```lua
local utils = require("my_app.utils")
print(utils.trim("  hello lua  ")) -- 输出：hello lua
```

### 编写单元测试
在 `spec/` 目录下创建对应模块的测试文件（如 `utils_spec.lua`）：
```lua
describe("my_app.utils", function()
    local utils = require("my_app.utils")

    it("should trim whitespace from string", function()
        assert.are.equal("hello", utils.trim("  hello  "))
        assert.are.equal("lua", utils.trim("lua"))
    end)
end)
```

执行测试：
```bash
make test
```

### 配置说明
- **`.luacheckrc`**: 配置 LuaCheck 静态代码检查规则
- **`.stylua.toml`**: 配置 Stylua 代码格式化风格
- **`helloworld-lua-dev-1.rockspec`**: LuaRocks 包配置文件，可用于打包发布

## 📄 许可证
本项目基于 Apache 2.0 许可证开源 - 详见 [LICENSE](LICENSE) 文件。

## 📬 贡献指南
1. Fork 本仓库
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交代码 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 打开 Pull Request

## 🔧 常见问题

### Q: 模块路径错误，提示 "module 'my_app.core' not found"？
A: 确保在项目根目录下运行，main.lua 已配置正确的模块路径。如果从其他目录运行，需要设置 `LUA_PATH` 环境变量。

### Q: 如何添加项目依赖？
A: 可以通过修改 `helloworld-lua-dev-1.rockspec` 文件的 `dependencies` 部分，或直接使用 `luarocks install <package-name>` 安装。

### Q: 如何打包发布为 LuaRocks 包？
A: 完善 `helloworld-lua-dev-1.rockspec` 文件中的信息，然后运行 `luarocks pack helloworld-lua-dev-1.rockspec`。

### Q: 如何配置 CI/CD？
A: 可以在项目根目录添加 `.github/workflows/ci.yml` 配置 GitHub Actions，实现自动化测试和代码检查。