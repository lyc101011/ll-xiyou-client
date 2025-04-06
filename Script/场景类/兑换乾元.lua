-- @Author: baidwwy
-- @Date:   2024-05-23 06:05:09
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-07-12 20:12:21

local 场景类_乾元丹兑换 = class()
local floor = math.floor
local insert = table.insert
local random = 引擎.取随机整数
local mouseb = 引擎.鼠标弹起
local 取金钱颜色 = 引擎.取金钱颜色
local floor = math.floor
local zts,tp
local remove = table.remove
local sm1  = "为师近来窥一法门，可贯通奇经八脉，修得上乘妙法。欲习得此法"
local sm2  = "需等级达到一定条件，消耗经验与金钱炼化"
local sm3  = "乾元丹的修行方式方式可由修炼之人自行组合搭配，每次"
local sm4  = "需消耗一定的体力和活力。"
local xh = {"炼化所需经验","可用经验","炼化所需金钱","可用现金","存  款","储 备 金","炼化乾元丹所需等级","剩余可炼化乾元丹"}
local 消耗 = {"消耗经验","当前经验","消耗金钱","银子"}

function 场景类_乾元丹兑换:初始化(根)
    self.ID = 6
    self.x = 233
    self.y = 100
    self.xx = 0
    self.yy = 0
    self.注释 = "乾元丹兑换"
    self.可视 = false
    self.鼠标 = false
    self.焦点 = false
    self.可移动 = true
    local 按钮 = 根._按钮
    local 资源 = 根.资源
    local 自适应 = 根._自适应
    self.资源组 = {
            [1] = 自适应.创建(0,1,443,332,3,9),
            [2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
            [3] = 自适应.创建(104,1,105,22,1,3),
            [11] = 按钮.创建(自适应.创建(12,4,99,22,1,3),0,0,4,true,true," 炼化乾元丹"),
            [12] = 按钮.创建(自适应.创建(12,4,84,22,1,3),0,0,4,true,true,"切换方案"),
            [13] = 按钮.创建(自适应.创建(12,4,84,22,1,3),0,0,4,true,true,"  查 看"),
            [14] = 资源:载入('pic/qyd.png',"图片"),

            }
    for i=11,13 do
        self.资源组[i]:绑定窗口_(6)
    end
    self.资源组[12]:置偏移(5,0)
    self.资源组[13]:置偏移(1,0)
    tp = 根
    self.窗口时间 = 0
    zts = tp.字体表.普通字体
end

function 场景类_乾元丹兑换:打开(助战)
    if self.可视 then
       self.可视 = false
    else
        self.主角=nil
        self.助战id=nil
        if 助战 then
            self.主角=助战
            self.角色类型="助战乾元丹"
            self.助战id=助战.助战id
        else
            self.主角=角色信息
            self.角色类型="乾元丹"
        end
        insert(tp.窗口_,self)
        tp.运行时间 = tp.运行时间 + 1
        self.窗口时间 = tp.运行时间
        self.可视 = true
    end
end

function 场景类_乾元丹兑换:显示(dt,x,y)
    self.焦点 = false
    local 行数 = 0
    local 列数 = 1
    local 行数1 = 0
    local 列数1 = 1
    self.资源组[1]:显示(self.x,self.y)
    tp.窗口标题背景_:显示(self.x-90+self.资源组[1].宽度/2,self.y)--标准
    引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"乾元丹")--标准
    self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)--标准
    self.资源组[2]:更新(x,y)
    if self.资源组[2]:事件判断() then
        self:打开()
        return false
    end
    self.资源组[11]:更新(x,y)
    self.资源组[12]:更新(x,y)
    self.资源组[13]:更新(x,y)
    self.资源组[11]:显示(self.x+252,self.y+216)
    self.资源组[12]:显示(self.x+250,self.y+297)
    self.资源组[13]:显示(self.x+340,self.y+297)
    self.资源组[14]:显示(self.x+16,self.y+76)
    self.资源组[3]:显示(self.x+130,self.y+91)
    self.资源组[3]:显示(self.x+130,self.y+123)

    for i=1,8 do
        行数=行数+1
        zts:显示(self.x + 行数 * 215 - 178,self.y + 64 + 列数 * 31,xh[i])
        if 行数 >= 2 then
          行数 = 0
          列数 = 列数 + 1
        end
    end

    zts:置字间距(2)
    zts:显示(self.x +37 ,self.y + 219,"当前已炼化乾元丹")
    zts:置字间距(0)
    zts:显示(self.x+17,self.y+37,sm1)
    zts:显示(self.x+17,self.y+57,sm2)
    zts:置颜色(黄色):显示(self.x+284,self.y+57,"乾元丹")
    zts:置颜色(白色):显示(self.x+326,self.y+57,"而领悟。")
    zts:显示(self.x+17,self.y+263,sm3)
    zts:置颜色(绿色):显示(self.x+367,self.y+263,"重置")
    zts:置颜色(白色):显示(self.x+395,self.y+263,"乾元")
    zts:置颜色(白色):显示(self.x+17,self.y+283,"丹需要消耗一定体力和活力。")
    local ls=self:兑换消耗()
    zts:置颜色(黑色):显示(self.x + 139,self.y + 95,ls.经验)
    zts:置颜色(取金钱颜色(ls.金钱)):显示(self.x + 139,self.y +126,ls.金钱)
    zts:置颜色(黄色)
    zts:显示(self.x  + 317,self.y +95,tp.队伍[1].当前经验)
    zts:显示(self.x  + 317,self.y +126,tp.金钱)
    zts:显示(self.x  + 317,self.y +157,tp.储备)
    zts:显示(self.x  + 139,self.y +157,tp.存银)
    zts:显示(self.x  + 173,self.y +188,"69") --炼化乾元丹所需等级
    zts:显示(self.x  + 371,self.y +188,tp.队伍[1].QYD.可换乾元丹)
    zts:显示(self.x  + 173,self.y +219,tp.队伍[1].QYD.已换乾元丹+tp.队伍[1].QYD.额外乾元丹)

    if self.资源组[2]:事件判断() then
        self.可视= false
        return
    elseif self.资源组[12]:事件判断() or self.资源组[13]:事件判断() then
        -- tp.窗口.经脉流派:打开()
        if not self.助战id then
            tp.窗口.经脉流派:打开()
        end
    end

    if self.资源组[11]:事件判断() then --兑换 服务器是炼化乾元丹
        if tp.队伍[1].QYD.可换乾元丹>0 then
            发送数据(34)
        else
            tp.常规提示:打开("#Y/当前等级可兑换的乾元丹已达上限！")
            return
        end
    end

end

function 场景类_乾元丹兑换:兑换消耗()
	local dj = tp.队伍[1].QYD.已换乾元丹 +1
	local fhz = {}
	if dj == 1 then
        fhz.经验 = 22340000
        fhz.金钱 = 5800000
    elseif dj == 2 then
        fhz.经验 = 27850000
        fhz.金钱 = 8000000
    elseif dj == 3 then
        fhz.经验 = 34350000
        fhz.金钱 = 10500000
    elseif dj == 4 then
        fhz.经验 = 42520000
        fhz.金钱 = 12500000
    elseif dj == 5 then
        fhz.经验 = 51920000
        fhz.金钱 = 13500000
    elseif dj == 6 then
        fhz.经验 = 62850000
        fhz.金钱 = 14500000
    elseif dj == 7 then
        fhz.经验 = 75420000
        fhz.金钱 = 15500000
    elseif dj == 8 then
        fhz.经验 = 75980000
        fhz.金钱 = 15500000
    elseif dj == 9 then
        fhz.经验 = 72200000
        fhz.金钱 = 15500000
    end
	return fhz
end


function 场景类_乾元丹兑换:检查点(x,y)
    if self.资源组[1]:是否选中(x,y) then
        return true
    end
end

function 场景类_乾元丹兑换:初始移动(x,y)
    tp.运行时间 = tp.运行时间 + 1
    if not tp.消息栏焦点 then
        self.窗口时间 = tp.运行时间
    end
    if not self.焦点 then
        tp.移动窗口 = true
    end
    if self.鼠标 and not self.焦点 then
        self.xx = x - self.x
        self.yy = y - self.y
    end
end

function 场景类_乾元丹兑换:开始移动(x,y)
    if self.鼠标 then
        self.x = x - self.xx
        self.y = y - self.yy
    end
end


return 场景类_乾元丹兑换