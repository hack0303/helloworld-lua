-- spec/core_spec.lua - 核心模块单元测试
describe("my_app.core", function()
    local core = require("my_app.core")

    -- 测试 greet 方法
    it("should print a greeting message", function()
        -- 捕获 print 输出
        local output = io.popen("lua -e 'require(\"my_app.core\").greet()'"):read("*a")
        assert.are.equal("Hello from helloworld-lua core module!\n", output)
    end)

    -- 测试 add 方法
    it("should return the sum of two numbers", function()
        assert.are.equal(5, core.add(2, 3))
        assert.are.equal(-1, core.add(2, -3))
    end)
end)