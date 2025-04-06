
local 场景类_装备点化 = class()
local mousea = 引擎.鼠标弹起
local format = string.format
local min = math.min
local insert = table.insert
local floor = math.floor
local min = math.min
local js = {"所需现金","现有现金","所需体力","现有体力"}
local mouseb = 引擎.鼠标弹起
local tp
local qjq = 引擎.取金钱颜色
function 场景类_装备点化:初始化(根)
    self.ID = 44
    self.x = 193
    self.y = 81
    self.xx = 0
    self.yy = 0
    self.注释 = "装备开运"
    self.可视 = false
    self.鼠标 = false
    self.焦点 = false
    self.可移动 = true
    local 资源 = 根.资源
    local 按钮 = 根._按钮
    local 自适应 = 根._自适应
local 按钮 = require("script/系统类/按钮")
        self.资源组 = {
        [1] = 自适应.创建(0,1,301,401,3,9), -- 297
        [2] = 资源:载入('common/wzife.wdf',"网易WDF动画",0x284B91F0),
        [3] = 自适应.创建(3,1,120,19,1,3),
        [4] = 资源:载入('wzife.wdf',"网易WDF动画",0xCE137B78),
        [6] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xF11233BB),0,0,4,true,true), --关闭按钮
        [10] = 按钮(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"点化"),
        }
    self.资源组[10]:绑定窗口_(self.ID)
    tp = 根
    zts = tp.字体表.普通字体
    zts1 = tp.字体表.描边字体
    local 格子 = 根._物品格子
    self.材料 = {}
    self.材料[1] = 格子(self.x+4,self.y,2,"打造材料")
    self.物品 = {}
    for i=1,20 do
        self.物品[i] = 格子.创建(0,0,i,"道具类")
    end
    self.材料1位置 = nil
    self.总价 = 0
end
function 场景类_装备点化:打开()
    if self.可视 then
        --self.状态 = 1
        self.窗口 = nil
        self.可视 = false
        self.开始 = 1
        self.结束 = 20
        self.可视 = false
        if self.材料[1].物品 ~= nil then
        tp.道具列表[self.材料1位置] = self.材料[1].物品
        tp.窗口.道具行囊.物品[self.材料1位置]:置物品(tp.道具列表[self.材料1位置])
        刷新道具逻辑(tp.道具列表[self.材料1位置],self.材料1位置,true)
        end
    else
        insert(tp.窗口_,self)
        self.开始 = 1
        self.结束 = 20
        for q=self.开始,self.结束 do
            self.物品[q]:置物品(tp.道具列表[q])
        end
        tp.运行时间 = tp.运行时间 + 1
        self.窗口时间 = tp.运行时间
        self.可视 = true

    end

end

function 场景类_装备点化:刷新道具(ss)
    self.开始 = 1
    self.结束 = 20
    for i=self.开始,self.结束 do
        self.物品[i]:置物品(ss[i])
    end
    for i=1,#self.材料 do
        self.材料[i]:置物品(nil)
    end
end

function 场景类_装备点化:显示(dt,x,y)
    self.焦点 = false
    self.资源组[1]:显示(self.x,self.y)
    self.资源组[10]:更新(x,y,self.材料[1].物品 ~= nil)
    self.资源组[6]:更新(x,y)
    tp.窗口标题背景_:显示(self.x-76+self.资源组[1].宽度/2,self.y)
    引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"装备点化")
    self.资源组[6]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
 --   self.资源组[5]:显示(self.x+5,self.y+2)
    self.资源组[6]:显示(self.x+277,self.y+4)
    self.资源组[2]:显示(self.x+20,self.y+50)
    for i =1,4 do
       self.资源组[3]:显示(self.x+170,self.y+i*30)
       zts:置颜色(0xFFFFFFFF)
       zts:显示(self.x+100,self.y+i*30,js[i])
       zts:显示(self.x+30,self.y+32,"装备")
       zts:置颜色(qjq(tp.金钱))
       zts:显示(self.x+180,self.y+62,tp.金钱)
       zts:置颜色(qjq(self.总价))
       zts:显示(self.x+180,self.y+32,self.总价)
    end
    self.资源组[4]:显示(self.x+24,self.y+157)
    self.资源组[10]:显示(self.x+18,self.y+100)
    if self.鼠标 then
        if self.资源组[10]:事件判断() then
            发送数据(3743,{格子 = self.材料1位置})
            self.材料[1]:置物品(nil)
            self.材料1位置 = nil
        end
    end

    local o = self.开始 - 1
    for h=1,4 do
        for l=1,5 do
            o = o + 1
            self.物品[o]:置坐标(l * 51 - 29 + self.x+4,h * 51 + 106 + self.y)
            self.物品[o]:显示(dt,x,y,self.鼠标,{2})
            if self.物品[o].物品 ~= nil and self.物品[o].焦点 then
                tp.提示:道具行囊(x,y,self.物品[o].物品)
                if self.物品[o].事件 and self.物品[o].物品.总类 == 2 and self.鼠标 then
                    if self.物品[o].物品.鉴定 == true then
                        if self.物品[o].物品.总类 == 2 then
                            zl = self.物品[o].物品.级别限制
                        end
                        if self.材料[1].物品 == nil then
                            if self.物品[o].物品.开运孔数.当前 == self.物品[o].物品.开运孔数.上限 then
                                self.材料[1]:置物品(self.物品[o].物品)
                                if zl ~= nil then
                                    self.总价 = ((self.物品[o].物品.级别限制/10-5)*300000)+1800000
                                end
                                self.材料1位置 = o
                                self.物品[o]:置物品(nil)
                            else
                                tp.常规提示:打开("#Y/装备开运没有到达最大")
                            end
                        else
                            tp.常规提示:打开("#Y/请先卸下道具")
                        end
                    else
                        tp.常规提示:打开("#Y/未鉴定物品无法点化")
                    end
                    刷新道具逻辑(self.物品[o].物品,o,true)
                end
            end
        end
    end
    self.材料[1]:置坐标(self.x+18 ,self.y+50)
    self.材料[1]:显示(dt,x,y,self.鼠标,false)
    if self.材料[1].物品 ~= nil and self.材料[1].焦点 then
            tp.提示:道具行囊(x,y,self.材料[1].物品)
            if mouseb(0) and self.鼠标 then
                if 取物品数量() < 20 then
                        self.物品[self.材料1位置]:置物品(self.材料[1].物品)
                        self.总价 = 0
                    self.材料[1]:置物品(nil)
                else
                    tp.常规提示:打开("#Y/包裹已满。请及时清理")
                end
            end
    end
    if self.资源组[6]:事件判断() then
        self.可视 = false
    end

end
function 场景类_装备点化:打造成功()
    self.材料[1]:置物品(nil)
end
function 场景类_装备点化:检查点(x,y)
    if self.可视 and self.资源组[1]:是否选中(x,y)  then
        return true
    end
end

function 场景类_装备点化:初始移动(x,y)
    tp.运行时间 = tp.运行时间 + 1
    if not tp.消息栏焦点 then
        self.窗口时间 = tp.运行时间
    end
    if not self.焦点 then
        tp.移动窗口 = false
    end
    if self.可视 and self.鼠标 and  not self.焦点 then
        self.xx = x - self.x
        self.yy = y - self.y
    end
end

function 场景类_装备点化:开始移动(x,y)
    if self.可视 and self.鼠标 then
        self.x = x - self.xx
        self.y = y - self.yy
    end
end


return 场景类_装备点化