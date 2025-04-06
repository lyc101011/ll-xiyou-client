-- @Author: baidwwy
-- @Date:   2024-08-04 20:56:39
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-08-10 23:23:24
local 游戏公告类 = class()

function 游戏公告类:初始化(根)
    self.x=全局游戏宽度-10
    self.y=50
    self.丰富文本=根._丰富文本(9999,25)
    self.数据组={}
    self.显示开关=false
    --self.提示 = 根.提示框
    self.提示 = 根._自适应.创建(71,1,1050,32,3,9)--require("script/显示类/游戏提示类")(根)
    -- self.提示:置宽高(1050,25)
end

function 游戏公告类:添加公告(内容)
    self.数据组[#self.数据组+1]="#Y"..内容
    self.提示:置宽高(全局游戏宽度+10,32)
    if self.显示开关==false then
        self.显示次数=1
        self.显示开关=true
        self.x=全局游戏宽度-10
        self.丰富文本:清空()
        self.丰富文本:添加文本(self.数据组[1])
    end
end

function 游戏公告类:显示(x,y)
    if self.显示开关 then
        self.x=self.x-1
        self.提示:显示(-10,self.y+2)
        self.丰富文本:显示(self.x,self.y+9)
        if self.x<0 and math.abs(self.x)>=#self.数据组[1]*5  then
            self.x=全局游戏宽度
            self.显示次数=self.显示次数-1
            if self.显示次数<=0 then
                table.remove(self.数据组,1)
                if #self.数据组==0 then
                    self.显示开关=false
                    self.丰富文本:清空()
                else
                    self.丰富文本:清空()
                    self.显示次数=1
                    self.丰富文本:添加文本(self.数据组[1])
                end
            end
        end
    end
end

return 游戏公告类