-- @Author: baidwwy
-- @Date:   2024-06-21 14:06:53
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-07-20 17:20:18
local 场景类_wst书铁商店类 = class()
local tp,zts,zts1
local insert = table.insert
local xxx = 0
local yyy = 0
local bw = require("gge包围盒")(0,0,240,20)
local box = 引擎.画矩形
local sts = {"单价","数量","总额","现金"}
local tos = 引擎.取摊位金钱颜色
local mouseb = 引擎.鼠标弹起

function 场景类_wst书铁商店类:初始化(根)
    self.ID = 199
    self.x = 364
    self.y = 100
    self.xx = 0
    self.yy = 0
    self.注释 = "商店"
    self.可视 = false
    self.鼠标 = false
    self.焦点 = false
    self.可移动 = true
    self.选中 = 0
    self.控件类 = require("ggeui/加载类")()
    local 总控件 = self.控件类:创建控件('wst书铁商店类总控件')
    总控件:置可视(true,true)
    self.输入框 = 总控件:创建输入("wst书铁商店类数量输入",0,0,100,14)
    self.输入框:置可视(false,false)
    self.输入框:置限制字数(3)
    self.输入框:置数字模式()
    self.输入框:屏蔽快捷键(true)
    self.输入框:置光标颜色(-16777216)
    self.输入框:置文字颜色(-16777216)
    self.输入框:置文本("")
    self.数量 = 0
    self.窗口时间 = 0
    tp = 根
    zts = 根.字体表.普通字体
    zts1 = 根.字体表.描边字体
end

function 场景类_wst书铁商店类:打开(内容)
    if self.可视 then
        self.资源组=nil
        self.可视=false
        self.道具=nil
        return
    else
        self.选中 = 0
        self.输入框:置焦点(false)
        self.输入框:置可视(false,false)
        if self.资源组==nil then
            local 资源 = tp.资源
            local 按钮 = tp._按钮
            local 自适应 = tp._自适应
            self.资源组 = {
                [1] = 自适应.创建(0,1,272,369,3,9),
                [2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
                [3] = 按钮.创建(自适应.创建(12,4,78,22,1,3),0,0,4,true,true,"宝宝相关"),
                [4] = 资源:载入('org.rpk',"网易WDF动画",0x1000394),
                [5] = 自适应.创建(3,1,94,19,1,3),
                [7] = 按钮.创建(自适应.创建(12,4,78,22,1,3),0,0,4,true,true,"人物相关"),
                [8] = 按钮.创建(自适应.创建(12,4,78,22,1,3),0,0,4,true,true,"其它物品"),
                [9] = 按钮.创建(自适应.创建(12,4,78,22,1,3),0,0,4,true,true,"免费领取"),
                -- [10] = 按钮.创建(自适应.创建(12,4,32,22,1,3),0,0,4,true,true,"道"),
                [11] = 自适应.创建(3,1,35,19,1,3),
                [12] = 自适应.创建(4,1,249,300,3,nil),
            }
            self.资源组[2]:绑定窗口_(self.ID)
            self.资源组[3]:绑定窗口_(self.ID)
            for n=7,9 do
                self.资源组[n]:绑定窗口_(self.ID)
            end
        end
        self.道具=nil
        self.bb类={}
        self.指南书={}
        self.其它={}
        self.商店类型="书"
        local 物品格子 = tp._物品格子
        for an=1,25 do
            self.指南书[an] = 物品格子(0,an,an,"指南书")
            self.其它[an] = 物品格子(0,an,an,"其它")
            self.bb类[an] = 物品格子(0,an,an,"bb类")
        end
        for an=1,25 do
            self.指南书[an]:置物品(内容.指南书[an])
            self.其它[an]:置物品(内容.其它[an])
            self.bb类[an]:置物品(内容.bb类[an])
        end
        insert(tp.窗口_,self)
        self.输入框:置可视(true,true)
        self.输入框:置文本(1)
        tp.运行时间 = tp.运行时间 + 1
        self.窗口时间 = tp.运行时间
        self.可视 = true
    end
end

function 场景类_wst书铁商店类:显示(dt,x,y)
    --------------------
    -- 素材位置调整()
    -- ax=AFCHX
    -- ay=AFCHY
    -- self.资源组[1] = tp._自适应.创建(0,1,272,300+ay ,3,9)
    --------------------
    self.焦点 = false
    self.资源组[1]:显示(self.x,self.y)
    tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
    引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"全部免费")
    self.资源组[3]:更新(x,y)
    self.资源组[7]:更新(x,y)
    self.资源组[8]:更新(x,y)
    self.资源组[9]:更新(x,y)
    zts:置颜色(白色):显示(self.x + 10 +41,self.y + 332,"数 量")
    self.输入框:置坐标(self.x + 97,self.y + 332)
    self.资源组[3]:显示(self.x+11+85,self.y+28)
    self.资源组[4]:显示(self.x+9,self.y+28+29)
    self.资源组[7]:显示(self.x+11,self.y+28)
    self.资源组[8]:显示(self.x+11+170,self.y+28)
    self.资源组[9]:显示(self.x+142,self.y+328)
    self.资源组[11]:显示(self.x + 50 +41,self.y + 328)
    if self.资源组[3]:事件判断() then
        self.选中=0
        self.商店类型 = "bb类"
        self.道具 = nil
        for an=1,#self.指南书 do
            if self.指南书[an]~=nil then
                self.指南书[an].确定 = false
            end
        end
        for an=1,#self.其它 do
            if self.其它[an]~=nil then
                self.其它[an].确定 = false
            end
        end
    elseif self.资源组[7]:事件判断() then
        self.选中=0
        self.商店类型 = "书"
        self.道具 = nil
        for an=1,#self.指南书 do
            if self.指南书[an]~=nil then
                self.指南书[an].确定 = false
            end
        end
        for an=1,#self.bb类 do
            if self.bb类[an]~=nil then
                self.bb类[an].确定 = false
            end
        end
    elseif self.资源组[8]:事件判断() then
        self.选中=0
        self.商店类型 = "其它"
        self.道具 = nil
        for an=1,#self.其它 do
            if self.其它[an]~=nil then
                self.其它[an].确定 = false
            end
        end
        for an=1,#self.bb类 do
            if self.bb类[an]~=nil then
                self.bb类[an].确定 = false
            end
        end
    elseif self.资源组[9]:事件判断() then
        if self.输入框:取文本() == "" then
            self.输入框:置文本(1)
        end
        if self.商店类型=="bb类" then
            if self.道具==nil or self.选中==0 or self.bb类[self.选中]==nil then
                tp.常规提示:打开("#Y/请选择一样物品")
            else
                发送数据(3901.9,{商店类型=self.商店类型,选中=self.选中,数量=self.输入框:取文本()})
            end
        elseif self.商店类型=="书" then
            if self.道具==nil or self.选中==0 or self.指南书[self.选中]==nil then
                tp.常规提示:打开("#Y/请选择一本指南书")
            else
                发送数据(3901.9,{商店类型=self.商店类型,选中=self.选中,数量=self.输入框:取文本()})
            end
        elseif self.商店类型=="其它" then
            if self.道具==nil or self.选中==0 or self.其它[self.选中]==nil then
                tp.常规提示:打开("#Y/请选择一样物品")
            else
                发送数据(3901.9,{商店类型=self.商店类型,选中=self.选中,数量=self.输入框:取文本()})
            end
        end
    end
    if self.商店类型=="bb类" then
        self:显示_bb类(dt,x,y)
    elseif self.商店类型=="书" then
        self:显示_指南书(dt,x,y)
    elseif self.商店类型=="其它" then
        self:显示_其它(dt,x,y)
    end
    self.控件类:更新(dt,x,y)
    if self.输入框._已碰撞 then
        self.焦点 = true
    end
    self.控件类:显示(x,y)
end

function 场景类_wst书铁商店类:显示_bb类(dt,x,y)
    local xx = 0
    local yy = 0
    for i=1,25 do
        self.bb类[i]:置坐标(self.x + xx * 51 + 10,self.y + yy * 51 + 26+29)
        self.bb类[i]:显示(dt,x,y,self.鼠标)
        if self.bb类[i].物品 ~= nil and self.bb类[i].焦点 then
            tp.提示:道具行囊(x,y,self.bb类[i].物品,true)
            if mouseb(0) then
                if self.道具 == nil then
                    if self.bb类[self.选中]~= nil then
                        self.bb类[self.选中].确定 = false
                    end
                    self.bb类[i].确定 = true
                    self.选中 = i
                    self.道具 = self.bb类[i].物品
                else
                    if self.选中 == i then
                    else
                        if self.bb类[self.选中]~= nil then
                            self.bb类[self.选中].确定 = false
                        end
                        self.bb类[i].确定 = true
                        self.选中 = i
                        self.道具 = self.bb类[i].物品
                    end
                end
            end
        end
        xx = xx + 1
        if xx == 5 then
            xx = 0
            yy = yy + 1
        end
    end
end

function 场景类_wst书铁商店类:显示_指南书(dt,x,y)
    local xx = 0
    local yy = 0
    for i=1,25 do
        self.指南书[i]:置坐标(self.x + xx * 51 + 10,self.y + yy * 51 + 26+29)
        self.指南书[i]:显示(dt,x,y,self.鼠标)
        if self.指南书[i].物品 ~= nil and self.指南书[i].焦点 then
            tp.提示:道具行囊(x,y,self.指南书[i].物品,true)
            if mouseb(0) then
                if self.道具 == nil then
                    if self.指南书[self.选中]~= nil then
                        self.指南书[self.选中].确定 = false
                    end
                    self.指南书[i].确定 = true
                    self.选中 = i
                    self.道具 = self.指南书[i].物品
                else
                    if self.选中 == i then
                    else
                        if self.指南书[self.选中]~= nil then
                            self.指南书[self.选中].确定 = false
                        end
                        self.指南书[i].确定 = true
                        self.选中 = i
                        self.道具 = self.指南书[i].物品
                    end
                end
            end
        end
        xx = xx + 1
        if xx == 5 then
            xx = 0
            yy = yy + 1
        end
    end
end

function 场景类_wst书铁商店类:显示_其它(dt,x,y)
    local xx = 0
    local yy = 0
    for i=1,25 do
        self.其它[i]:置坐标(self.x + xx * 51 + 10,self.y + yy * 51 + 26+29)
        self.其它[i]:显示(dt,x,y,self.鼠标)
        if self.其它[i].物品 ~= nil and self.其它[i].焦点 then
            tp.提示:道具行囊(x,y,self.其它[i].物品,true)
            if mouseb(0) then
                if self.道具 == nil then
                    if self.其它[self.选中]~= nil then
                        self.其它[self.选中].确定 = false
                    end
                    self.其它[i].确定 = true
                    self.选中 = i
                    self.道具 = self.其它[i].物品
                else
                    if self.选中 == i then
                    else
                        if self.其它[self.选中]~= nil then
                            self.其它[self.选中].确定 = false
                        end
                        self.其它[i].确定 = true
                        self.选中 = i
                        self.道具 = self.其它[i].物品
                    end
                end
            end
        end
        xx = xx + 1
        if xx == 5 then
            xx = 0
            yy = yy + 1
        end
    end
end

function 场景类_wst书铁商店类:检查点(x,y)
    if self.资源组[1]:是否选中(x,y)  then
        return true
    end
end

function 场景类_wst书铁商店类:初始移动(x,y)
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

function 场景类_wst书铁商店类:开始移动(x,y)
    if self.鼠标 then
        self.x = x - self.xx
        self.y = y - self.yy

    end
end

return 场景类_wst书铁商店类