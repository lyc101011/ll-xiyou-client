-- @Author: baidwwy
-- @Date:   2024-12-03 16:43:47
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-12-07 21:38:54
local tp,zts
local insert = table.insert
local 阵营选择 = class()
 local bw = require("gge包围盒")(0,0,400,600)
 local bw1 = require("gge包围盒")(0,0,600,600)
function 阵营选择:初始化(根)
    self.ID = 121
    self.x = 1
    self.y = 0
    self.xx = 0
    self.yy = 0
    self.注释 = "阵营选择"
    self.可视 = false
    self.鼠标 = false
    self.焦点 = false
    self.可移动 = false
    tp = 根
    self.窗口时间 = 0
    local 资源 = tp.资源
    local 按钮 = tp._按钮
    local 自适应 = tp._自适应
    self.资源组 = {
        [1] = 资源:载入('pic/大蓝.png',"图片"),
        [2] = 资源:载入('pic/大黑.png',"图片"),
        -- [6] = 资源:载入('wzife.wdf',"网易WDF动画",0x590CAA9B),
    }
    zts = tp.字体表.普通字体
    zts1 = tp.字体表.猫猫字体
    self.偏移x,self.偏移y=等比例缩放公式(self.资源组[1].宽度,self.资源组[1].高度,self.资源组[1].宽度,self.资源组[1].高度)
     if 全局游戏宽度<1024 then
        self.偏移x,self.偏移y = 等比例缩放公式(800,600,self.资源组[1].宽度,self.资源组[1].高度)
     end

end


function 阵营选择:数据处理(数据)
    self.数据 =数据

end

function 阵营选择:打开(数据)
    if self.可视 then
        self.可视 = false
        return
    else
        insert(tp.窗口_,self)
        -- if tp.战斗中 then
        --     insert(tp.战斗窗口_,self) --测试模式 修改战斗中显示窗口时更改
        -- end
        tp.运行时间 = tp.运行时间 + 1
        self.窗口时间 = tp.运行时间
        self.可视 = true
        self.数据=数据
    end
end

function 阵营选择:显示(dt,x,y)
    tp.禁止关闭 = true
    self.焦点= false

    self.资源组[1]:显示(self.x,self.y,self.偏移x,self.偏移y)
    bw:置坐标(self.x + 0,self.y + 0)
    bw1:置坐标(self.x + 400,self.y + 0)
    if bw:检查点(x,y) then
    self.资源组[1]:显示(self.x-2,self.y,self.偏移x,self.偏移y)
        if 引擎.鼠标弹起(0) and self.鼠标 and not tp.消息栏焦点 then
            发送数据(1010.1)---跳转地图
            self:打开()
        end
    end
    if bw1:检查点(x,y) then
    self.资源组[2]:显示(self.x-2,self.y,self.偏移x,self.偏移y)
        if 引擎.鼠标弹起(0) and self.鼠标 and not tp.消息栏焦点 then
            发送数据(1011.1)---跳转地图
            self:打开()
        end
    end
    zts1:置颜色(黄色):显示(self.x+80+55,self.y+528,"法术派系")
    zts1:置颜色(黄色):显示(self.x+80+505,self.y+528,"物理派系")
end


function 阵营选择:检查点(x,y)
    if self.可视 and self.资源组[1]:是否选中(x,y)  then
        return true
    else
        return false
    end
end

function 阵营选择:初始移动(x,y)
    tp.运行时间 = tp.运行时间 + 1
    if not tp.消息栏焦点 then
        self.窗口时间 = tp.运行时间
    end
    if not self.焦点 then
        tp.移动窗口 = true
    end
    if self.可视 and self.鼠标 and  not self.焦点 then
        self.xx = x - self.x
        self.yy = y - self.y
    end
end

function 阵营选择:开始移动(x,y)
    if self.鼠标 then
        self.x = x - self.xx
        self.y = y - self.yy
    end
end

return 阵营选择