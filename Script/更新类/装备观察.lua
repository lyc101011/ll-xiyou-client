-- @Author: baidwwy
-- @Date:   2024-10-31 01:20:14
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-10-31 20:25:03
local 装备观察 = class()
local tp,zts
local insert = table.insert
-- local qmx = 取普通模型
local qmx = 引擎.取模型
function 装备观察:初始化(根)
    self.ID = 168
    self.x = 全局游戏宽度/2-180-95
    self.y = 94+115--全局游戏高度/2-160
    self.xx = 0
    self.yy = 0
    self.注释 = "装备观察"
    self.可视 = false
    self.鼠标 = false
    self.焦点 = false
    self.可移动 = true
    tp = 根
    self.窗口时间 = 0
    zts = tp.字体表.普通字体
end


function 装备观察:加载资源()
    self.人物装备 = {}
    local 格子 = tp._物品格子
    local 资源 = tp.资源
    local 底图 =资源:载入('wzife.wdf',"网易WDF动画",0xA393A808)
    for i=1,6 do
        self.人物装备[i] = 格子(0,0,i,"装备观察_人物装备2",底图)
    end
    self.人物装备[1]:置根(tp)
    self.灵饰 = {}
    for i=1,4 do
        self.灵饰[i] = 格子(0,0,i,"装备观察_灵饰2",tp.底图)
    end
    self.装备坐标 = {x={10,10+51*3+9*3,10,10+51*3+9*3,10,10+51*3+9*3},y={120,120,120+59*1,120+59*1,120+59*2,120+59*2}}
    self.灵饰坐标 = {x={10+60*1,10+60*2,10,10+60*3},y={59,59,59,59}}

    local 资源 = tp.资源
    local 按钮 = tp._按钮
    local 自适应 = tp._自适应
    self.资源组 = {
        [1] = 自适应.创建(0,1,262,278+66,3,9),
        [2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),--关闭
        [3] =资源:载入("wdf/audio/jmk/背包/zbls.png","图片"),
        [4] = 自适应.创建(2,1,112,170,3,9),
    }
end
--1650025321 wzife.wd3任务完成
function 装备观察:打开(数据)
    if self.可视 then
        self.可视 = false
        self.资源组=nil
        return
    else
        insert(tp.窗口_,self)
        if not self.资源组 then
            self:加载资源()
        end
        self.人物组 = {}
        self.zb=数据.装备
        self.ls=数据.灵饰
        self.角色=数据.角色
        self:加载物品信息()
        self:取人物形象()
        tp.运行时间 = tp.运行时间 + 1
        self.窗口时间 = tp.运行时间
        self.可视 = true
    end
end
function 装备观察:加载物品信息()
    for i=1,6 do
        self.人物装备[i]:置物品(self.zb[i])
    end
    for i=1,4 do
        self.灵饰[i]:置物品(self.ls[i])
    end
end

function 装备观察:显示(dt,x,y)
    self.焦点 = false
    self.资源组[1]:显示(self.x,self.y)
    self.资源组[2]:更新(x,y)
    tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
    引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"观 察")
    self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+3)
    if self.资源组[2]:事件判断() then
        self:打开()
        return
    end
    self.资源组[3]:显示(self.x+22-8,self.y+22+9)
    self.资源组[4]:显示(self.x+60+14,self.y+59+33)
    for i=1,6 do
        self.人物装备[i]:置坐标(self.x+self.装备坐标.x[i]+1+5,self.y+self.装备坐标.y[i]-1-28,nil,nil,4,-1)
        self.人物装备[i]:显示(dt,x,y,self.鼠标,nil,3)
        if self.人物装备[i].物品 ~= nil and self.人物装备[i].焦点 then
            tp.提示:道具行囊(x,y,self.人物装备[i].物品)

        end
        if self.人物装备[i].焦点 then
            self.焦点 = true
        end
    end
    for i=1,4 do
        self.灵饰[i]:置坐标(self.x + self.灵饰坐标.x[i]+1+5,self.y + self.灵饰坐标.y[i]-1-28,nil,nil,4,-1)
        self.灵饰[i]:显示(dt,x,y,self.鼠标,nil,3)
        if self.灵饰[i].物品 ~= nil and self.灵饰[i].焦点 then
            tp.提示:道具行囊(x,y,self.灵饰[i].物品,true)
        end
    end
    tp.影子:显示(self.x+128,self.y+220)
    if self.人物组[1] then
        self.人物组[1]:更新(dt)
        self.人物组[1]:显示(self.x+128,self.y+220)
        if self.人物组[2] ~= nil then
            self.人物组[2]:更新(dt)
            self.人物组[2]:显示(self.x+128,self.y+220)
        end
    end
    zts:置颜色(白色)--222222)
    zts:显示(self.x+13,self.y+274, "玩家昵称：  "..self.角色.名称)
    zts:显示(self.x+13,self.y+274+24, "ID    号：  "..self.角色.id)
    zts:显示(self.x+13,self.y+274+24*2, "等    级：  "..self.角色.等级)
end


function 装备观察:取人物形象()
    local 资源 = tp.资源
    local q = qmx(self.角色.模型)
    local 人物模型 = 资源:载入(q[3],"网易WDF动画",q[1])
    self.人物组 = {}
    if self.zb[3] ~= nil then
        local wq = nil
        local v = tp:取武器子类(self.zb[3].子类)
        if self.zb[3].名称 == "龙鸣寒水" or self.zb[3].名称 == "非攻" then
            v = "弓弩1"
        end
        local q = qmx(self.角色.模型,v)
        人物模型 = 资源:载入(q[3],"网易WDF动画",q[1])
        local m = tp:取武器附加名称(self.zb[3].子类,self.zb[3].级别限制,self.zb[3].名称)
        local x = qmx(m.."_"..self.角色.模型)
        local wq = 资源:载入(x[3],"网易WDF动画",x[1])
        wq:置差异(wq.帧数-人物模型.帧数)
        self.人物组[2] = wq
        self.人物组[2]:置方向(4)
    end
    人物模型:置染色(self.角色.染色方案,self.角色.染色组[1],self.角色.染色组[2],self.角色.染色组[3])
    if self.角色.锦衣[1] ~= nil then
        --table.print(self.角色.锦衣)
        local wq = nil
        if self.zb[3] ~= nil then
            wq = self.zb[3].子类
        end
        local 临时资源=引擎.取普通锦衣模型(self.角色.锦衣[1],self.角色.模型,nil,wq)
        人物模型 = 资源:载入(临时资源[3],"网易WDF动画",临时资源[1])
    end
    self.人物组[1] = 人物模型
    self.人物组[1]:置方向(4)

end


function 装备观察:检查点(x,y)
    if self.资源组 ~= nil and self.资源组[1]:是否选中(x,y) then
        return true
    end
end

function 装备观察:初始移动(x,y)
    tp.运行时间 = tp.运行时间 + 1
    if not tp.消息栏焦点 then
        self.窗口时间 = tp.运行时间
    end
    if not self.焦点 then
        tp.移动窗口 = true
    end
    if self.鼠标 and  not self.焦点 then
        self.xx = x - self.x
        self.yy = y - self.y
    end
end

function 装备观察:开始移动(x,y)
    if self.鼠标 then
        self.x = x - self.xx
        self.y = y - self.yy
    end
end

return 装备观察