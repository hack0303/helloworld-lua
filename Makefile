# Makefile - 项目自动化任务
.PHONY: all test lint format run clean

# 环境配置
LUA = lua
LUACHECK = luacheck
STYLUA = stylua
BUSTED = busted

# 默认任务：检查 + 测试 + 格式化
all: lint format test

# 运行项目
run:
	$(LUA) main.lua

# 单元测试
test:
	$(BUSTED) spec/ --verbose

# 代码静态检查
lint:
	$(LUACHECK) src/ main.lua

# 代码格式化
format:
	$(STYLUA) src/ spec/ main.lua bin/

# 清理临时文件
clean:
	rm -rf luacov.report.out luacov.stats.out
	find . -name "*.luac" -delete