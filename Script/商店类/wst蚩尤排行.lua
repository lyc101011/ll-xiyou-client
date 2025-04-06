-- @Author: baidwwy
-- @Date:   2024-06-26 17:41:57
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-06-26 19:56:32
local tp,jhzts,jhztsb
local insert = table.insert
local bw = require("gge包围盒")(0,0,131,19)
local box = 引擎.画矩形
local mousea = 引擎.鼠标按住
local mouseb = 引擎.鼠标弹起
local 场景类_wst蚩尤排行 = class()
function 场景类_wst蚩尤排行:初始化(根)
    self.ID = 204
    self.x = 364
    self.y = 100
    self.xx = 0
    self.yy = 0
    self.注释 = "wst蚩尤排行"
    self.可视 = false
    self.鼠标 = false
    self.焦点 = false
    self.可移动 = true
    self.窗口时间 = 0
    tp = 根
    jhzts = tp.字体表.普通字体
    jhztsb = tp.字体表.描边字体
end
function 场景类_wst蚩尤排行:关闭()
    self.资源组=nil
    self.加入=nil
    self.可视 = false
    self.排行信息=nil
    return
end

function 场景类_wst蚩尤排行:打开(内容)
    if self.可视 then
        self:关闭()
        return
    else
        insert(tp.窗口_,self)
        self.排行信息=内容
        self:加载资源()
        -- self:刷新排行信息()
        self.x = (全局游戏宽度/2)-190
        self.y = (全局游戏高度/2)-239
        tp.运行时间 = tp.运行时间 + 1
        self.窗口时间 = tp.运行时间
        self.可视 = true
    end
end

function 场景类_wst蚩尤排行:加载资源()
    local 按钮 = tp._按钮
    local 自适应 = tp._自适应
    local 资源 = tp.资源
    self.资源组 = {
        [1] = 自适应.创建(0,1,392,436,3,9),
        [2] = 自适应.创建(4,1,366,394,3,9),
    }
    self.加入=0
end

function 场景类_wst蚩尤排行:显示(dt,x,y)
    --------------------
    -- 素材位置调整()
    -- ax=AFCHX
    -- ay=AFCHY
    -- self.x = (全局游戏宽度/2)+ax
    -- self.y = (全局游戏高度/2)+ay
    -- self.资源组[1] = tp._自适应.创建(0,1,ax,ay,3,9)
    --------------------
    self.焦点 = false
    self.资源组[1]:显示(self.x,self.y)
    self.资源组[2]:显示(self.x+13,self.y+64-39)
    jhztsb:置颜色(黄色)
    引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"蚩尤挑战排行榜")
    jhztsb:显示(self.x+19,self.y+68-39,"名次")
    jhztsb:显示(self.x+101,self.y+68-39,"昵称")
    jhztsb:显示(self.x+204,self.y+68-39,"实id")
    jhztsb:显示(self.x+270,self.y+68-39,"历史最高层数")
    jhzts:置颜色(黑色)
    if self.资源组[1]:是否选中(x,y) and 引擎.取鼠标滚轮() ==1 and self.加入 >= 1 then
        self.加入 = self.加入 - 1
    elseif self.资源组[1]:是否选中(x,y)  and 引擎.取鼠标滚轮() ==-1 then
        if self.加入+18 < #self.排行信息 then
            self.加入 = self.加入 + 1
        end
    end
    for n=1,18 do
        if self.排行信息[n+self.加入] ~= nil then
            jhzts:显示(self.x+30,self.y+97+(n-1)*20-39,n+self.加入)
            jhzts:显示(self.x+78,self.y+97+(n-1)*20-39,self.排行信息[n+self.加入].名称)
            jhzts:显示(self.x+198,self.y+97+(n-1)*20-39,self.排行信息[n+self.加入].id)
            jhzts:显示(self.x+301,self.y+97+(n-1)*20-39,self.排行信息[n+self.加入].分数)
        end
    end
    jhzts:置颜色(白色)
    jhztsb:置颜色(白色)
end


function 场景类_wst蚩尤排行:检查点(x,y)
    if self.可视 and self.资源组[1]:是否选中(x,y) then
        return true
    end
end

function 场景类_wst蚩尤排行:初始移动(x,y)
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

function 场景类_wst蚩尤排行:开始移动(x,y)
    if self.可视 and self.鼠标 then
        self.x = x - self.xx
        self.y = y - self.yy
    end
end

return 场景类_wst蚩尤排行