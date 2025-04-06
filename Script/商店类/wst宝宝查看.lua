-- @Author: baidwwy
-- @Date:   2024-06-25 19:11:04
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-08-11 16:18:26
local wst宝宝查看 = class()
local floor = math.floor
local xslb,bb,lb,tp,fy,gz
local format = string.format
local insert = table.insert

function wst宝宝查看:初始化(根)
    self.ID = 203
    self.x =(全局游戏宽度-360)/2
    self.y =(全局游戏高度-204)/2
    self.xx = 0
    self.yy = 0
    self.注释 = "wst宝宝查看"
    self.可视 = false
    self.鼠标 = false
    self.焦点 = false
    self.可移动 = true
    self.窗口时间 = 0
    tp = 根
end

function wst宝宝查看:打开(b)
    if b~=nil and self.可视 then self.可视=false end
    if self.可视 then
        if b ~= nil and bb ~= b then
            bb = b
            fy = 0
            tp.运行时间 = tp.运行时间 + 1
            self.窗口时间 = tp.运行时间
            return false
        end
        fy = nil
        bb = nil
        xslb = nil
        self.可视 = false
        return
    else
        fy = 0
        bb = b
        self.技能={}
        insert(tp.窗口_,self)
        if not self.资源组 then
           self:加载资源()
        end
        for n=1,#bb.技能 do
            self.技能[n] = gz(0,0,n,"技能查看")
            local 临时技能=tp._技能.创建()
            if bb.技能[n] ~= nil then
               临时技能:置对象(bb.技能[n],2)
               self.技能[n]:置技能(临时技能)
            else
               break
            end
        end
        self.资质={攻击资质=bb.资质[1],防御资质=bb.资质[2],体力资质=bb.资质[3],法力资质=bb.资质[4],速度资质=bb.资质[5],躲闪资质=bb.资质[6],成长=bb.资质[8]}
        tp.运行时间 = tp.运行时间 + 1
        self.窗口时间 = tp.运行时间
        self.可视 = true
    end
end
function wst宝宝查看:加载资源()
    local 资源 = tp.资源
    local 按钮 = tp._按钮
    local 自适应 = tp._自适应
    self.左1=资源:载入('xixige_newmall.gep',"内置png",0x10001074)
    self.左2=资源:载入('xixige_newmall.gep',"内置png",0x10001075)
    self.左3=资源:载入('xixige_newmall.gep',"内置png",0x10001076)
    self.右1=资源:载入('xixige_newmall.gep',"内置png",0x10001077)
    self.右2=资源:载入('xixige_newmall.gep',"内置png",0x10001078)
    self.右3=资源:载入('xixige_newmall.gep',"内置png",0x10001079)
    self.资源组 = {
        [4] =  按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x7AB5584C),0,0,3,true,true),--应该是上
        [5] =  按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0xCB50AB1D),0,0,3,true,true),--应该是下
    }
    self.背景=资源:载入('xixige_newmall.gep',"内置png",0x10001073)
    self.技能 = {}
    gz = tp._技能格子
end

function wst宝宝查看:显示(dt,x,y)
    self.焦点 = false
    self.背景:显示(self.x,self.y)
    if #bb.技能>12 then
      self.左1:显示(self.x + 306,self.y + 169)
      self.右1:显示(self.x + 330,self.y + 169)
    end
    if self.鼠标 then
        if self.左1:是否选中(x,y) then
           self.左2:显示(self.x + 306,self.y + 169)
        elseif self.右1:是否选中(x,y) then
           self.右2:显示(self.x + 330,self.y + 169)
        end
        if self.左2:是否选中(x,y) and 引擎.鼠标按住(左键) then
           self.左3:显示(self.x + 306,self.y + 169)
        elseif self.右2:是否选中(x,y) and 引擎.鼠标按住(左键) then
           self.右3:显示(self.x + 330,self.y + 169)
        end
        if self.左2:是否选中(x,y) and 引擎.鼠标弹起(左键) then
            if fy == 0 then
                tp.常规提示:打开("#Y/当前已是首页技能")
            else
                fy = 0
            end
        elseif self.右2:是否选中(x,y) and 引擎.鼠标弹起(左键) then
            if fy == 12 then
                tp.常规提示:打开("#Y/当前已是末页技能")
            else
                fy = 12
            end
        end
    end
    local 字体 = tp.字体表.普通字体
    字体:置颜色(0xffffffff)
    字体:显示(self.x+105+(147-字体:取宽度(bb.模型))/2,self.y+3,bb.模型)
    字体:显示(self.x+78+(78-字体:取宽度(self.资质.攻击资质))/2,self.y+32,self.资质.攻击资质)
    字体:显示(self.x+78+(78-字体:取宽度(self.资质.防御资质))/2,self.y+60,self.资质.防御资质)
    字体:显示(self.x+78+(78-字体:取宽度(self.资质.体力资质))/2,self.y+116,self.资质.体力资质)
    字体:显示(self.x+78+(78-字体:取宽度(self.资质.法力资质))/2,self.y+88,self.资质.法力资质)
    字体:显示(self.x+78+(78-字体:取宽度(self.资质.速度资质))/2,self.y+144,self.资质.速度资质)
    字体:显示(self.x+78+(78-字体:取宽度(self.资质.躲闪资质))/2,self.y+172,self.资质.躲闪资质)
    字体:显示(self.x+210+(45-字体:取宽度(self.资质.成长))/2,self.y+172,self.资质.成长)
    字体:置颜色(0xffff9d00)
    local xx = 0
    local yy = 0
    for n=1,12 do
        if self.技能[n+fy] ~= nil and self.技能[n+fy].技能 ~= nil then
            self.技能[n+fy]:置坐标(self.x+170+(xx*46),self.y+29+(yy*46))
            self.技能[n+fy]:显示(x,y,self.鼠标)
            if self.技能[n+fy].焦点 then
                tp.提示:技能(x,y,self.技能[n+fy].技能)
            end
            xx = xx + 1
            if xx > 3 then
                xx = 0
                yy = yy + 1
            end
        end
    end
end

function wst宝宝查看:检查点(x,y)
    if self.背景 ~= nil and self.背景:是否选中(x,y)  then
        return true
    end
end

function wst宝宝查看:初始移动(x,y)
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

function wst宝宝查看:开始移动(x,y)
    if self.鼠标 then
        self.x = x - self.xx
        self.y = y - self.yy
    end
end

return wst宝宝查看