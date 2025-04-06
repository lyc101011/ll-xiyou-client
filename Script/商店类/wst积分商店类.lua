-- @Author: baidwwy
-- @Date:   2024-06-21 14:06:53
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-10-25 03:26:43
local 场景类_wst积分商店类 = class()
local tp,zts,zts1
local insert = table.insert
local xxx = 0
local yyy = 0
local bw = require("gge包围盒")(0,0,240,20)
local box = 引擎.画矩形
local sts = {"单 价","数 量","积 分"}
local tos = 引擎.取摊位金钱颜色
local mouseb = 引擎.鼠标弹起

function 场景类_wst积分商店类:初始化(根)
    self.ID = 214
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
    self.数量 = 1
    self.窗口时间 = 0
    self.控件类 = require("ggeui/加载类")()
    local 总控件 = self.控件类:创建控件('商店总控件')
    总控件:置可视(true,true)
    self.输入框 = 总控件:创建输入("wst积分商店数量输入",0,0,100,14,根,根.字体表.华康14)
    self.输入框:置可视(false,false)
    self.输入框:置限制字数(3)
    self.输入框:置数字模式()
    self.输入框:屏蔽快捷键(true)
    self.输入框:置光标颜色(-16777216)
    self.输入框:置文字颜色(-16777216)
    -- self.输入框:置文本("")
    tp = 根
    zts = 根.字体表.普通字体
end

function 场景类_wst积分商店类:刷新积分(内容)
    self.积分 = 内容
end

function 场景类_wst积分商店类:打开(内容)
    if self.可视 then
        self.资源组=nil
        self.可视=false
        self.加入=nil
        self.道具=nil
        self.输入框:置焦点(false)
        self.输入框:置可视(false,false)
        return
    else
        self.选中 = 0
        if self.资源组==nil then
            local 资源 = tp.资源
            local 按钮 = tp._按钮
            local 自适应 = tp._自适应
            self.资源组 = {
                [1] = 自适应.创建(0,1,272,434,3,9),
                [2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
                [3] = 按钮.创建(自适应.创建(12,4,78,22,1,3),0,0,4,true,true,"确认兑换"),
                [4] = 资源:载入('org.rpk',"网易WDF动画",0x1000394),
                [5] = 自适应.创建(3,1,94,19,1,3),
                [6] = 按钮.创建(自适应.创建(12,4,58,22,1,3),0,0,4,true,true,"上一页"),
                [7] = 按钮.创建(自适应.创建(12,4,58,22,1,3),0,0,4,true,true,"下一页"),
                [11] = 自适应.创建(3,1,35,19,1,3),
                [12] = 自适应.创建(4,1,249,300,3,nil),
                [13] = 自适应.创建(7,1,113,22,1,3,nil,18),
            }
            for n=2,3 do
                self.资源组[n]:绑定窗口_(self.ID)
            end
            self.资源组[6]:绑定窗口_(self.ID)
            self.资源组[7]:绑定窗口_(self.ID)
        end
        self.积分 = 内容.积分
        self.加入=0
        self.道具=nil
        self.商品={}
        local 物品格子 = tp._物品格子
        for an=1,950 do
            self.商品[an] = 物品格子(0,an,an,"wst宝石商店")
        end
        for an=1,950 do
            self.商品[an]:置物品(内容.道具[an])
        end
        insert(tp.窗口_,self)
        tp.运行时间 = tp.运行时间 + 1
        self.窗口时间 = tp.运行时间
        self.可视 = true
        self.输入框:置可视(true,true)
        self.输入框:置文本(1)
    end
end

function 场景类_wst积分商店类:显示(dt,x,y)
    --------------------
    self.焦点 = false
    self.资源组[1]:显示(self.x,self.y)
    tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
    引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"积分商店")
    zts:置颜色(4294967295)
    for i=0,2 do
        self.资源组[13]:显示(self.x+101,self.y+291+i*28)
        zts:显示(self.x+58,self.y+295+i*28,sts[i+1])
    end
    self.资源组[3]:更新(x,y)
    self.资源组[6]:更新(x,y)
    self.资源组[7]:更新(x,y)
    self.资源组[3]:显示(self.x+100,self.y+387)
    self.资源组[4]:显示(self.x+9,self.y+28)
    self.资源组[6]:显示(self.x+17,self.y+387)
    self.资源组[7]:显示(self.x+198,self.y+387)
    if self.资源组[3]:事件判断() then
        if not 判定数字合法(self.输入框:取文本()) then return  引擎.场景.常规提示:打开("请重新填写输入框") end
        if self.道具==nil or self.选中==0 or self.商品[self.选中]==nil then
            tp.常规提示:打开("#Y/请选择一样道具")
        else
            发送数据(3907,{数量=self.输入框:取文本(),选中=self.选中})
        end
    elseif self.资源组[6]:事件判断() then
        self.加入=0
        self:清除选中()
    elseif self.资源组[7]:事件判断() then
        self.加入=25
        self:清除选中()
    end
    self:显示_商品(dt,x,y)
    self.输入框:置坐标(self.x + 107,self.y + 323)
    self.控件类:更新(dt,x,y)
    if self.输入框._已碰撞 then
        self.焦点 = true
    end
    self.控件类:显示(x,y)
    zts:置颜色(白色)
end

function 场景类_wst积分商店类:清除选中()
    self.选中=0
    self.道具 = nil
    for an=1,#self.商品 do
        if self.商品[an]~=nil then
            self.商品[an].确定 = false
        end
    end
end

function 场景类_wst积分商店类:显示_商品(dt,x,y)
    zts:置颜色(黑色)
    local xx = 0
    local yy = 0
    for i=1,25 do
        self.商品[i+self.加入]:置坐标(self.x + xx * 51 + 10,self.y + yy * 51 + 26)
        self.商品[i+self.加入]:显示(dt,x,y,self.鼠标)
        if self.商品[i+self.加入].物品 ~= nil and self.商品[i+self.加入].焦点 then
            tp.提示:道具行囊(x,y,self.商品[i+self.加入].物品,true)
            if mouseb(0) then
                self:清除选中()
                if self.道具 == nil then
                    if self.商品[self.选中+self.加入]~= nil then
                        self.商品[self.选中+self.加入].确定 = false
                    end
                    self.商品[i+self.加入].确定 = true
                    self.选中 = i+self.加入
                    self.道具 = self.商品[i+self.加入].物品
                    self.单价 = tostring(self.道具.价格)
                else
                    if self.选中 == i+self.加入 then
                    else
                        if self.商品[self.选中+self.加入]~= nil then
                            self.商品[self.选中+self.加入].确定 = false
                        end
                        self.商品[i+self.加入].确定 = true
                        self.选中 = i+self.加入
                        self.道具 = self.商品[i+self.加入].物品
                        self.单价 = tostring(self.道具.价格)
                    end
                end
                self.输入框:置文本(self.数量)
            end
        end
        xx = xx + 1
        if xx == 5 then
            xx = 0
            yy = yy + 1
        end
    end
    if self.道具~=nil then
        zts:显示(self.x+107,self.y+294,self.单价)
    end
    zts:显示(self.x+107,self.y+351,self.积分)

end

function 场景类_wst积分商店类:检查点(x,y)
    if self.资源组[1]:是否选中(x,y)  then
        return true
    end
end

function 场景类_wst积分商店类:初始移动(x,y)
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

function 场景类_wst积分商店类:开始移动(x,y)
    if self.鼠标 then
        self.x = x - self.xx
        self.y = y - self.yy

    end
end

return 场景类_wst积分商店类