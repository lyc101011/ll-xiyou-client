-- @Author: 源梦屋资源网:www.52luntan.cn
-- @Date:   2021-12-11 01:53:00
-- @Last Modified by:    ★〓光唏蜀黍〓★ QQ:29582348      ★〓光唏蜀黍〓★ Q群:902038863
-- @Last Modified time: 2025-01-03 13:13:43
--======================================================================--
local 场景类_装备精炼栏 = class( )
local floor = math.floor
local min = math.min
local format = string.format
local zts,zts1,zts2,zts3,tp
local insert = table.insert
function 场景类_装备精炼栏:初始化(根)
    self.ID = 611
    self.x = 140+(全局游戏宽度-800)/2
    self.y = 40
    self.xx = 0
    self.yy = 0
    self.注释 = "装备精炼栏"
        tp = 根
end
function 场景类_装备精炼栏:加载(根)

    self.鼠标 = false
    self.焦点 = false
    self.可移动 = true
    local 资源 = 根.资源
    local 按钮 = 根._按钮
    local 自适应 = 根._自适应
    self.资源组 = {
      [1] = 资源:载入('zdtb.wdf',"网易WDF动画",0x117),
      [2] = 资源:载入('zdtb.wdf',"网易WDF动画",0x106),
      [3] = 资源:载入('zdtb.wdf',"网易WDF动画",0x110),
      [4] =  资源:载入('zdtb.wdf',"网易WDF动画",0x3906F9F1),
      [5]=资源:载入('zdtb.wdf',"网易WDF动画",0x101),
       [6]=资源:载入('zdtb.wdf',"网易WDF动画",0x103),
       [7]=资源:载入('zdtb.wdf',"网易WDF动画",0x104),
        [8] = 资源:载入('zdtb.wdf',"网易WDF动画",0x96),
        [9] = 资源:载入('zdtb.wdf',"网易WDF动画",0x98),
        [10] = 资源:载入('zdtb.wdf',"网易WDF动画",0x100),
        [11] = 按钮.创建(自适应.创建(12,4,100,22,1,3),0,0,4,true,true,"精 炼"),
        [12] = 按钮.创建(自适应.创建(12,4,100,22,1,3),0,0,4,true,true,"一键精炼"),
        [13] = 资源:载入('zdtb.wdf',"网易WDF动画",0x111),--初级
        [14] = 资源:载入('zdtb.wdf',"网易WDF动画",0x112),--中级
        [15] = 资源:载入('zdtb.wdf',"网易WDF动画",0x113),--高级
        [16] = 资源:载入('zdtb.wdf',"网易WDF动画",0x114),--超级
        [17] = 资源:载入('zdtb.wdf',"网易WDF动画",0x115),--终极
        [18] = 资源:载入('zdtb.wdf',"网易WDF动画",0x108),--选择
        [19] = 资源:载入('zdtb.wdf',"网易WDF动画",0x107),--对钩
        [20] = 资源:载入('zdtb.wdf',"网易WDF动画",0x108),--选择
        [21] = 资源:载入('zdtb.wdf',"网易WDF动画",0x107),--对钩
        [22] = 按钮.创建(自适应.创建(12,4,100,22,1,3),0,0,4,true,true,"套装属性"),
        [23] = 按钮.创建(自适应.创建(12,4,120,22,1,3),0,0,4,true,true,"合成精炼之锤中"),
        [24] = 按钮.创建(自适应.创建(12,4,120,22,1,3),0,0,4,true,true,"合成精炼之锤高"),
             文字2=tp.字体表.描边字体
    }

    self.窗口时间 = 0
    self.资源组[11]:绑定窗口_(611)
    self.资源组[12]:绑定窗口_(611)
    self.资源组[22]:绑定窗口_(611)
      self.资源组[23]:绑定窗口_(611)
        self.资源组[24]:绑定窗口_(611)
    local 选中 = nil
    local 选中1 = nil
    self.人物装备 = {}
    self.精炼数据 = {}
    local 格子 = 根._物品格子
    for i=1,6 do
        self.人物装备[i] = 格子.创建(0,0,i,"道具行囊_人物装备",nil)
    end
    for i=1,3 do
        self.精炼数据[i] =格子.创建(0,0,i,"道具行囊_人物装备",nil)
    end
    self.人物装备[1]:置根(根)
    zts = tp.字体表.普通字体
    zts1 = tp.字体表.普通字体
    zts2 = tp.字体表.普通字体
    zts3 = tp.字体表.普通字体
end

function 场景类_装备精炼栏:打开(数据)
    if self.可视 then
        进程 = 1
        self.可视 = false
        for i=1,6 do
            self.人物装备[i]:置物品(nil)
        end
        for i=1,3 do
            self.精炼数据[i]:置物品(nil)
        end
    else
    if  self.x > 全局游戏宽度 then
       self.x = 260+(全局游戏宽度-800)/2
    end
    self.装备数据 = 数据
    self:加载(tp)
        insert(tp.窗口_,self)

        tp.运行时间 = tp.运行时间 + 1
        self.窗口时间 = tp.运行时间
        self.可视 = true
    end
end

function 场景类_装备精炼栏:刷新数据(数据)
self.装备数据 = 数据
end


function 场景类_装备精炼栏:显示(dt,x,y)
    local 低级数量 = 0
    local 中级数量 = 0
    local 高级数量 = 0
    self.焦点 = false
    self.资源组[1]:显示(self.x,self.y)
    self.资源组[8]:更新(x,y)
    self.资源组[9]:更新(x,y)
    self.资源组[10]:更新(x,y)
    self.资源组[11]:更新(x,y)
    self.资源组[12]:更新(x,y)
    self.资源组[13]:更新(x,y)
    self.资源组[14]:更新(x,y)
    self.资源组[15]:更新(x,y)
    self.资源组[16]:更新(x,y)
    self.资源组[17]:更新(x,y)
    self.资源组[18]:更新(x,y)
    self.资源组[19]:更新(x,y)
    self.资源组[22]:更新(x,y)
    self.资源组[23]:更新(x,y)
    self.资源组[24]:更新(x,y)
    if self.装备数据.低级精炼 ~= nil then
        低级数量 = self.装备数据.低级精炼
    end
    if self.装备数据.中级精炼 ~= nil then
        中级数量 = self.装备数据.中级精炼
    end
    if self.装备数据.高级精炼 ~= nil then
        高级数量 = self.装备数据.高级精炼
    end
    for i=1,6 do
        self.人物装备[i]:置物品(self.装备数据[i+0])
    end
    for i=1,3 do
        self.精炼数据[i]:置物品(nil)
    end
    for i=1,6 do
       self.资源组[2]:显示(self.x+45+((i-1)*65),self.y+45)
    end
    self.资源组[2]:显示(self.x+45,self.y+115)
    for i=1,8 do
       self.资源组[3]:显示(self.x+115+((i-1)*30),self.y+155)
    end
    self.资源组[5]:显示(self.x+55,self.y+353)
    self.资源组[6]:显示(self.x+120,self.y+353)
    self.资源组[7]:显示(self.x+185,self.y+353)
    self.资源组[8]:显示(self.x+57,self.y+357)
    self.资源组[9]:显示(self.x+123,self.y+357)
    self.资源组[10]:显示(self.x+190,self.y+356)
    self.资源组[11]:显示(self.x+120,self.y+420)
    self.资源组[12]:显示(self.x+260,self.y+420)
    self.资源组[23]:显示(self.x+260,self.y+350)
    self.资源组[24]:显示(self.x+260,self.y+380)
    self.资源组[22]:显示(self.x+315,self.y+115)
    zts:置颜色(0xFF4d6969)
    zts:显示(self.x + 125,self.y + 186,"[精炼效果跟随人物,装备更换后仍有效果]")
    zts:置颜色(0xFFff1212)
    zts:显示(self.x + 55,self.y + 206,"每级成功精炼都将提升10%的装备基础属性")
     zts:显示(self.x + 125,self.y + 285,"备注：精炼之前把材料放进系统仓库储存")
    for i=1,3 do
        self.精炼数据[i]:置坐标(self.x+61+((i-1)*65),self.y+356)
        self.精炼数据[i]:显示(dt,x,y,self.鼠标)
        if self.精炼数据[i].焦点 then
            self.焦点 = true
        end
        if not tp.消息栏焦点 then
        if self.精炼数据[i].事件 then
              选中1 = i
        end
        if 选中1 == nil  then
              选中1 = 2
        end
        end
    end
    if self.资源组[22]:事件判断() then
       发送数据(3782)
    end
            if self.资源组[23]:事件判断() then
     发送数据(3779,{物品="精炼之锤低"})
    end
            if self.资源组[24]:事件判断() then
           发送数据(3779,{物品="精炼之锤中"})
    end
    for i=1,6 do
        self.人物装备[i]:置坐标(self.x+52+((i-1)*65),self.y+48)
        self.人物装备[i]:显示(dt,x,y,self.鼠标)
        if self.人物装备[i].物品 ~= nil and self.人物装备[i].焦点 then
            tp.提示:道具行囊(x,y,self.人物装备[i].物品,self.装备数据.精炼等级)
        end
        if self.人物装备[i].焦点 then
            self.焦点 = true
        end
        if not tp.消息栏焦点 then
        if self.人物装备[i].事件 then
            if self.人物装备[i].物品 ~= nil then
              选中 = i
            end
        end
        if 选中 == nil  then
            if self.人物装备[i].物品 ~= nil then
              选中 = 3
            end
        end
        end
    end
    if 选中1 ~= nil then
        self.资源组[18]:显示(self.x+50+((选中1-1)*65),self.y+346)
        self.资源组[19]:显示(self.x+62+((选中1-1)*65),self.y+363)
    end
    if 选中~=nil then
     local 所需数量 = 0
     local 所需祝福 = 0
     local 祝福值 = 0
     local 低级祝福 = 0
     local 中级祝福 = 0
     local 高级祝福 = 0
     local 低级成功率 = 0
     local 中级成功率 = 0
     local 高级成功率 = 0
     if self.装备数据[选中+0]~=nil then
        if self.装备数据.所需数量[选中+0] ~= nil then
            所需数量 = self.装备数据.所需数量[选中+0]
            所需祝福 = self.装备数据.需要祝福[选中+0]
            祝福值 = self.装备数据.祝福值
            低级祝福 = self.装备数据.低级祝福[选中+0]
            中级祝福 = self.装备数据.中级祝福[选中+0]
            高级祝福 = self.装备数据.高级祝福[选中+0]
            低级成功率 = self.装备数据.低级成功率[选中+0]
            中级成功率 = self.装备数据.中级成功率[选中+0]
            高级成功率 = self.装备数据.高级成功率[选中+0]
        end
        if self.装备数据.精炼等级[选中+0] <= 8 and self.装备数据.精炼等级[选中+0] > 0 then
           for i=1,self.装备数据.精炼等级[选中+0] do
              self.资源组[13]:显示(self.x+115+((i-1)*30),self.y+155)
           end
        elseif self.装备数据.精炼等级[选中+0] <= 16 and self.装备数据.精炼等级[选中+0] > 8 then
           for i=1,self.装备数据.精炼等级[选中+0]-8 do
              self.资源组[14]:显示(self.x+115+((i-1)*30),self.y+155)
           end
        elseif self.装备数据.精炼等级[选中+0] <= 24 and self.装备数据.精炼等级[选中+0] > 16 then
           for i=1,self.装备数据.精炼等级[选中+0]-16 do
              self.资源组[15]:显示(self.x+115+((i-1)*30),self.y+155)
           end
        elseif self.装备数据.精炼等级[选中+0] <= 32 and self.装备数据.精炼等级[选中+0] > 24 then
           for i=1,self.装备数据.精炼等级[选中+0]-24 do
              self.资源组[16]:显示(self.x+115+((i-1)*30),self.y+155)
           end
        elseif self.装备数据.精炼等级[选中+0] <= 40 and self.装备数据.精炼等级[选中+0] > 32 then
           for i=1,self.装备数据.精炼等级[选中+0]-32 do
              self.资源组[17]:显示(self.x+115+((i-1)*30),self.y+155)
           end
        end
        if self.资源组[11]:事件判断() then
            发送数据(3780, {选择=选中,选择1=选中1,文本="精炼"})
        elseif self.资源组[12]:事件判断() then
             发送数据(3781, {选择=选中,选择1=选中1,文本="一件精炼"})
        end
        self.资源组[18]:显示(self.x+41+((选中-1)*65),self.y+42)
        self.资源组[19]:显示(self.x+53+((选中-1)*65),self.y+60)
        self.人物装备[选中]:置坐标(self.x+52,self.y+118)
        self.人物装备[选中]:显示(dt,x,y,self.鼠标)
        self.资源组[4]:置区域(0,0,min(floor(祝福值 / 所需祝福 * 373),373),self.资源组[4].高度-5)
        self.资源组[4]:显示(self.x+56,self.y+305)
        local ts = format("%d/%d",祝福值,所需祝福)
        zts2:置描边颜色(-16240640)
        zts2:置颜色(4294967295)
        zts2:显示(self.x + ((472 - zts2:取宽度(ts))/2)+8,self.y + 303,祝福值.."/"..所需祝福)
        zts2:置描边颜色(-16777216)
        local ts1 = format("%d/%d",低级数量,所需数量)
        zts2:置描边颜色(-16240640)
        zts2:置颜色(4294967295)
        zts2:显示(self.x + ((125 - zts2:取宽度(ts1))/2)+8,self.y + 395,低级数量.."/"..所需数量)
        zts2:置描边颜色(-16777216)
        local ts1 = format("%d/%d",中级数量,"0")
        zts2:置描边颜色(-16240640)
        zts2:置颜色(4294967295)
        zts2:显示(self.x + ((255 - zts2:取宽度(ts1))/2)+8,self.y + 395,中级数量.."/"..所需数量)
        zts2:置描边颜色(-16777216)
        local ts1 = format("%d/%d",高级数量,"0")
        zts2:置描边颜色(-16240640)
        zts2:置颜色(4294967295)
        zts2:显示(self.x + ((387 - zts2:取宽度(ts1))/2)+8,self.y + 395,高级数量.."/"..所需数量)
        zts2:置描边颜色(-16777216)
        if self.人物装备[选中].物品 ~= nil and self.人物装备[选中].焦点 then
            tp.提示:道具行囊(x,y,self.人物装备[选中].物品,self.装备数据.精炼等级)
        end
        zts3:置描边颜色(-16240640)
        zts3:置颜色(0xFFFFFF00)
        zts3:显示(self.x + 115,self.y + 125,self.装备数据[选中+0].名称)
        zts3:置描边颜色(-16777216)
        if 选中1 == 1 then
           zts:置颜色(0xFFff1212)
           zts:显示(self.x + 120,self.y + 325,"成功率"..低级成功率.."%")
           zts:置颜色(0xFF4d6969)
           zts:显示(self.x + 220,self.y + 325,"失败后祝福 + "..低级祝福)
        elseif 选中1 == 2 then
           zts:置颜色(0xFFff1212)
           zts:显示(self.x + 120,self.y + 325,"成功率"..中级成功率.."%")
           zts:置颜色(0xFF4d6969)
           zts:显示(self.x + 220,self.y + 325,"失败后祝福 + "..中级祝福)
        elseif 选中1 == 3 then
           zts:置颜色(0xFFff1212)
           zts:显示(self.x + 120,self.y + 325,"成功率"..高级成功率.."%")
           zts:置颜色(0xFF4d6969)
           zts:显示(self.x + 220,self.y + 325,"失败后祝福 + "..高级祝福)
        end
        if 选中 == 1 then
          zts1:置颜色(0xFF4d6969)
          zts1:显示(self.x + 55,self.y + 228,"防御："..math.floor(self.装备数据[选中+0].防御+self.装备数据[选中+0].防御*((self.装备数据.精炼等级[选中+0]-1)*0.1)))
          zts1:显示(self.x + 55,self.y + 253,"魔法："..math.floor(self.装备数据[选中+0].魔法+self.装备数据[选中+0].魔法*((self.装备数据.精炼等级[选中+0]-1)*0.1)))
          zts1:置颜色(0xFF168b16)
          self.资源组.文字2:置描边颜色(0xFF000000):置颜色(0xFF33FF00):显示(self.x + 205,self.y + 228,"→  "..math.floor(self.装备数据[选中+0].防御+(self.装备数据[选中+0].防御*(self.装备数据.精炼等级[选中+0]*0.1))))
          self.资源组.文字2:置描边颜色(0xFF000000):置颜色(0xFF33FF00):显示(self.x + 205,self.y + 253,"→  "..math.floor(self.装备数据[选中+0].魔法+(self.装备数据[选中+0].魔法*(self.装备数据.精炼等级[选中+0]*0.1))))
        elseif 选中 == 2 then
          zts1:置颜色(0xFF4d6969)
          zts1:显示(self.x + 55,self.y + 228,"灵力："..math.floor(self.装备数据[选中+0].灵力+self.装备数据[选中+0].灵力*((self.装备数据.精炼等级[选中+0]-1)*0.1)))
          zts1:置颜色(0xFF168b16)
          self.资源组.文字2:置描边颜色(0xFF000000):置颜色(0xFF33FF00):显示(self.x + 205,self.y + 228,"→  "..math.floor(self.装备数据[选中+0].灵力+(self.装备数据[选中+0].灵力*(self.装备数据.精炼等级[选中+0]*0.1))))
        elseif 选中 == 3 then
          zts1:置颜色(0xFF4d6969)
          zts1:显示(self.x + 55,self.y + 228,"命中："..math.floor(self.装备数据[选中+0].命中+self.装备数据[选中+0].命中*((self.装备数据.精炼等级[选中+0]-1)*0.1)))
          zts1:显示(self.x + 55,self.y + 253,"伤害："..math.floor(self.装备数据[选中+0].伤害+self.装备数据[选中+0].伤害*((self.装备数据.精炼等级[选中+0]-1)*0.1)))
          zts1:置颜色(0xFF168b16)
          self.资源组.文字2:置描边颜色(0xFF000000):置颜色(0xFF33FF00):显示(self.x + 205,self.y + 228,"→  "..math.floor(self.装备数据[选中+0].命中+(self.装备数据[选中+0].命中*(self.装备数据.精炼等级[选中+0]*0.1))))
          self.资源组.文字2:置描边颜色(0xFF000000):置颜色(0xFF33FF00):显示(self.x + 205,self.y + 253,"→  "..math.floor(self.装备数据[选中+0].伤害+(self.装备数据[选中+0].伤害*(self.装备数据.精炼等级[选中+0]*0.1))))
elseif 选中 == 4 then
    local selectedEquipment = self.装备数据[选中 + 0]
    local isKunWeapon = selectedEquipment.名称 == "非天(坤)"

    zts1:置颜色(0xFF4d6969)

    if isKunWeapon then
        -- 如果是非天(坤)武器，则显示命中和伤害
        zts1:显示(self.x + 55, self.y + 223, "命中：" .. math.floor(selectedEquipment.命中 + selectedEquipment.命中 * ((self.装备数据.精炼等级[选中 + 0] - 1) * 0.1)))
        zts1:显示(self.x + 55, self.y + 253, "伤害：" .. math.floor(selectedEquipment.伤害 + selectedEquipment.伤害 * ((self.装备数据.精炼等级[选中 + 0] - 1) * 0.1)))
    else
        -- 如果不是非天(坤)武器，则显示防御
        zts1:显示(self.x + 55, self.y + 228, "防御：" .. math.floor(selectedEquipment.防御 + selectedEquipment.防御 * ((self.装备数据.精炼等级[选中 + 0] - 1) * 0.1)))
    end

    zts1:置颜色(0xFF168b16)

    if isKunWeapon then
        -- 如果是非天(坤)武器，则显示精炼后的命中和伤害
        self.资源组.文字2:置描边颜色(0xFF000000):置颜色(0xFF33FF00):显示(self.x + 205, self.y + 223, "→  " .. math.floor(selectedEquipment.命中 + selectedEquipment.命中 * (self.装备数据.精炼等级[选中 + 0] * 0.1)))
        self.资源组.文字2:置描边颜色(0xFF000000):置颜色(0xFF33FF00):显示(self.x + 205, self.y + 253, "→  " .. math.floor(selectedEquipment.伤害 + selectedEquipment.伤害 * (self.装备数据.精炼等级[选中 + 0] * 0.1)))
    else
        -- 如果不是非天(坤)武器，则不显示精炼后的命中和伤害（但您的原始代码要求显示精炼后的防御，这里我假设您可能不需要）
        -- 如果确实需要显示精炼后的防御，可以取消注释下面的代码
       self.资源组.文字2:置描边颜色(0xFF000000):置颜色(0xFF33FF00):显示(self.x + 205, self.y + 228, "→  " .. math.floor(selectedEquipment.防御 + selectedEquipment.防御 * (self.装备数据.精炼等级[选中 + 0] * 0.1)))
    end


        elseif 选中 == 5 then
          zts1:置颜色(0xFF4d6969)
          zts1:显示(self.x + 55,self.y + 228,"防御："..math.floor(self.装备数据[选中+0].防御+self.装备数据[选中+0].防御*((self.装备数据.精炼等级[选中+0]-1)*0.1)))
          zts1:显示(self.x + 55,self.y + 253,"气血："..math.floor(self.装备数据[选中+0].气血+self.装备数据[选中+0].气血*((self.装备数据.精炼等级[选中+0]-1)*0.1)))
          zts1:置颜色(0xFF168b16)
          self.资源组.文字2:置描边颜色(0xFF000000):置颜色(0xFF33FF00):显示(self.x + 205,self.y + 228,"→  "..math.floor(self.装备数据[选中+0].防御+(self.装备数据[选中+0].防御*(self.装备数据.精炼等级[选中+0]*0.1))))
          self.资源组.文字2:置描边颜色(0xFF000000):置颜色(0xFF33FF00):显示(self.x + 205,self.y + 253,"→  "..math.floor(self.装备数据[选中+0].气血+(self.装备数据[选中+0].气血*(self.装备数据.精炼等级[选中+0]*0.1))))
        elseif 选中 == 6 then
          zts1:置颜色(0xFF4d6969)
          zts1:显示(self.x + 55,self.y + 228,"防御："..math.floor(self.装备数据[选中+0].防御+self.装备数据[选中+0].防御*((self.装备数据.精炼等级[选中+0]-1)*0.1)))
          zts1:显示(self.x + 55,self.y + 253,"敏捷："..math.floor(self.装备数据[选中+0].敏捷+self.装备数据[选中+0].敏捷*((self.装备数据.精炼等级[选中+0]-1)*0.1)))
          zts1:置颜色(0xFF168b16)
          self.资源组.文字2:置描边颜色(0xFF000000):置颜色(0xFF33FF00):显示(self.x + 205,self.y + 228,"→  "..math.floor(self.装备数据[选中+0].防御+(self.装备数据[选中+0].防御*(self.装备数据.精炼等级[选中+0]*0.1))))
          self.资源组.文字2:置描边颜色(0xFF000000):置颜色(0xFF33FF00):显示(self.x + 205,self.y + 253,"→  "..math.floor(self.装备数据[选中+0].敏捷+(self.装备数据[选中+0].敏捷*(self.装备数据.精炼等级[选中+0]*0.1))))
        end
     else
        self.资源组[4]:置区域(0,0,min(floor(0 / 100 * 373),373),self.资源组[4].高度-5)
        self.资源组[4]:显示(self.x+56,self.y+305)
        local ts = format("%d/%d","0","0")
        zts2:置描边颜色(-16240640)
        zts2:置颜色(4294967295)
        zts2:显示(self.x + ((472 - zts2:取宽度(ts))/2)+8,self.y + 303,"0".."/".."0")
        zts2:置描边颜色(-16777216)
        local ts1 = format("%d/%d",0,"0")
        zts2:置描边颜色(-16240640)
        zts2:置颜色(4294967295)
        zts2:显示(self.x + ((125 - zts2:取宽度(ts1))/2)+8,self.y + 395,"0".."/".."0")
        zts2:置描边颜色(-16777216)
        local ts1 = format("%d/%d",0,"0")
        zts2:置描边颜色(-16240640)
        zts2:置颜色(4294967295)
        zts2:显示(self.x + ((255 - zts2:取宽度(ts1))/2)+8,self.y + 395,"0".."/".."0")
        zts2:置描边颜色(-16777216)
        local ts1 = format("%d/%d",0,"0")
        zts2:置描边颜色(-16240640)
        zts2:置颜色(4294967295)
        zts2:显示(self.x + ((387 - zts2:取宽度(ts1))/2)+8,self.y + 395,"0".."/".."0")
        zts2:置描边颜色(-16777216)
      end
    end
end

function 场景类_装备精炼栏:检查点(x,y)
  if self.资源组 ~= nil and self.资源组[1]:是否选中(x,y)  then
    return true
  end
end

function 场景类_装备精炼栏:初始移动(x,y)
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

function 场景类_装备精炼栏:开始移动(x,y)
  if self.鼠标 then
    self.x = x - self.xx
    self.y = y - self.yy
  end
end


return 场景类_装备精炼栏