-- @Author: baidwwy
-- @Date:   2024-07-20 17:17:09
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-08-01 01:35:30
local 场景类_wst宝宝商店类 = class()
local tp,zts,zts1
local insert = table.insert
local xxx = 0
local yyy = 0
local bw = require("gge包围盒")(0,0,240,20)
local box = 引擎.画矩形
local sts = {"单价","数量","总额","现金"}
local tos = 引擎.取摊位金钱颜色
local mouseb = 引擎.鼠标弹起

function 场景类_wst宝宝商店类:初始化(根)
    self.ID = 202
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
    self.窗口时间 = 0
    tp = 根
    zts = 根.字体表.普通字体
    zts1 = 根.字体表.描边字体
end

function 场景类_wst宝宝商店类:打开(内容)
    if self.可视 then
        self.资源组=nil
        self.可视=false
        self.召唤兽=nil
        self.加入=nil
        return
    else
        if self.资源组==nil then
            local 资源 = tp.资源
            local 按钮 = tp._按钮
            local 自适应 = tp._自适应
            self.资源组 = {
                [1] = 自适应.创建(0,1,272,404,3,9),
                [2] = 自适应.创建(4,1,249,300,3,nil),
                [3] = 按钮.创建(自适应.创建(12,4,78,22,1,3),0,0,4,true,true,"免费领取"),
                [4] = 按钮.创建(自适应.创建(12,4,78,22,1,3),0,0,4,true,true,"查看属性"),
                [5] = 按钮.创建(自适应.创建(12,4,78,22,1,3),0,0,4,true,true," 上一页"),
                [6] = 按钮.创建(自适应.创建(12,4,78,22,1,3),0,0,4,true,true," 下一页"),
            }
            for n=3,6 do
                self.资源组[n]:绑定窗口_(self.ID)
            end
        end
        self.召唤兽=内容 or {}
        self.加入=0
        self.选中 = 0
        insert(tp.窗口_,self)
        tp.运行时间 = tp.运行时间 + 1
        self.窗口时间 = tp.运行时间
        self.可视 = true
    end
end

function 场景类_wst宝宝商店类:显示(dt,x,y)
    --------------------
    -- 素材位置调整()
    -- ax=AFCHX
    -- ay=AFCHY
    -- self.资源组[1] = tp._自适应.创建(0,1,272,400+ay,3,9)
    --------------------
    self.焦点 = false
    self.资源组[1]:显示(self.x,self.y)
    tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
    self.资源组[2]:显示(self.x+12,self.y+19)
    for an=3,6 do
        self.资源组[an]:更新(x,y)
    end
    self.资源组[5]:显示(self.x+37,self.y+330)
    self.资源组[6]:显示(self.x+154,self.y+330)
    self.资源组[3]:显示(self.x+37,self.y+366)
    self.资源组[4]:显示(self.x+154,self.y+366)
    引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"免费召唤兽")
    zts1:显示(self.x+40,self.y+24,"名称")
    zts1:显示(self.x+193,self.y+24,"定位")
    if self.资源组[3]:事件判断() then
      if self.召唤兽[self.选中]~=nil then
        发送数据(5039,{选中=self.选中})
      else
        tp.常规提示:打开("#Y/请选择一只召唤兽！")
      end
    elseif self.资源组[4]:事件判断() then
      if self.召唤兽[self.选中]~=nil then
        tp.窗口.wst宝宝查看:打开(self.召唤兽[self.选中])
      else
        tp.常规提示:打开("#Y/请选择一只召唤兽！")
      end
    elseif self.资源组[5]:事件判断() then
      self.选中=0
      self.加入=0
    elseif self.资源组[6]:事件判断() then
      self.选中=0
      self.加入=12
    end
    self:召唤兽店(dt,x,y)
end

function 场景类_wst宝宝商店类:召唤兽店(dt,x,y)
    zts:置颜色(-16777216)
    for i=1,12 do
        if self.召唤兽[i+self.加入] ~= nil then
            local jx = self.x+34
            local jy = self.y+35+i*22
            bw:置坐标(jx-22,jy-3)
            if i+self.加入 ~= self.选中 then
                if bw:检查点(x,y) then
                    box(jx-22,jy-6,jx+226,jy+15,-3551379)
                    self.焦点 = true
                    if mouseb(0) and self.鼠标 and not tp.消息栏焦点 then
                        self.选中 = i+self.加入
                    end
                end
            else
                box(jx-22,jy-6,jx+226,jy+15,-10790181)
            end
            zts:显示(jx,jy-2,self.召唤兽[i+self.加入].名称)
            zts:显示(jx+160,jy-2,self.召唤兽[i+self.加入].定位)
        end
    end
end


function 场景类_wst宝宝商店类:检查点(x,y)
    if self.资源组[1]:是否选中(x,y)  then
        return true
    end
end

function 场景类_wst宝宝商店类:初始移动(x,y)
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

function 场景类_wst宝宝商店类:开始移动(x,y)
    if self.鼠标 then
        self.x = x - self.xx
        self.y = y - self.yy

    end
end

return 场景类_wst宝宝商店类