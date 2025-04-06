-- @Author: 作者QQ1647205458
-- @Date:   2023-02-07 22:11:08
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-12-23 06:30:29
-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2021-04-08 12:55:43
-- @最后修改来自: baidwwy
-- @Last Modified time: 2023-02-07 22:14:59
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-12-20 13:27:58
--============================,==========================================--
local 修业系统 = class()

local qmx = 引擎.取模型
local zts,zts1,tp
local insert = table.insert

local txs = 引擎.取头像
local ani = 引擎.取战斗模型
local insert = table.insert
--local tp = nil
local tonumber = tonumber
local pairs = pairs
local 临时资源
local 临时资源包
local tx = 引擎.取头像


function 修业系统:初始化(根)
    self.ID = 14
    self.x = 285
    self.y = 100
    self.xx = 0
    self.yy = 0
    self.注释 = "成就系统栏"
    self.可视 = false
    self.鼠标 = false
    self.焦点 = false
    self.可移动 = true
    self.窗口时间 = 0
    self.页数=1
    tp = 根
    zts = tp.字体表.猫猫字体
    zts1 = tp.字体表.道具字体


end

function 修业系统:打开(内容)
    if self.可视 then
        self.可视 = false
        self.资源组=nil
        return
    else

        self.数据 = 内容
        insert(tp.窗口_,self)
        local 资源 = tp.资源
    local 按钮 = tp._按钮
    local 自适应 = tp._自适应
    local 信息 =  tp.成就
    self.资源组 = {
        [1] = 自适应.创建(0,1,430,435,3,9),
        [2] = 自适应.创建(2,1,400,320,3,9),
        [3] = 资源:载入('sucai.wdf',"网易WDF动画",0x00000084),
        [4] = 自适应.创建(1,1,281,18,1,3,nil,18),
        -- [5] = 资源:载入('wzife.wd6',"网易WDF动画",0x8eb165d0),----组合上面的 无用
        -- [6] = 资源:载入('wzife.wd6',"网易WDF动画",0xa19aee01),----云
        [7] = 自适应.创建(9,1,380,65,3,9),
        -- [8] = 资源:载入('wzife.wd6',"网易WDF动画",0xa765c907),----猪
        [9] = 资源:载入('wzife.wdf',"网易WDF动画",0xC9A4A309),----组合
        [10] = 资源:载入('common/wzife.wdf',"网易WDF动画",0xAB50A1CD),--人物光
        [11] = 资源:载入('common/wzife.wdf',"网易WDF动画",0xB8123C37),--宝宝光
        [12] =资源:载入('wzife.wd1',"网易WDF动画",0xE6490543),
    --  按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"一键出售")
        [13] = 按钮.创建(自适应.创建(12,4,72,20,1,3),0,0,4,true,true,"修业技能"),
        [14] = 按钮.创建(自适应.创建(12,4,72,20,1,3),0,0,4,true,true,"修业界面"),
        [15] = 按钮.创建(自适应.创建(12,4,72,20,1,3),0,0,4,true,true,"升级修业"),
        [16] = 自适应.创建(9,1,200,120,3,9),
        [17] = 按钮.创建(自适应.创建(12,4,72,20,1,3),0,0,4,true,true,"重置技能"),
        [18] = 按钮.创建(自适应.创建(12,4,72,20,1,3),0,0,4,true,true,"开启修业"),
        [19] = 资源:载入('wzife.wdf',"网易WDF动画",0x91ADB567),
        [20] = 资源:载入('wzife.wdf',"网易WDF动画",0xFF47550C),  ---0xFF47550C  --0x014A3BA9
        [21] = 资源:载入('wzife.wdf',"网易WDF动画",0xBEE2CC16),
        [22] = 资源:载入('wzife.wdf',"网易WDF动画",0x8B146166), ---关闭
        [23] = 资源:载入('common/wzife.wdf',"网易WDF动画",0x3CCAF9CF),---开启  0x3D19507A  0x3CCAF9CF

    }
    -- for i = 1,4 do
    --     self.资源组[100+i] = tp._按钮(tp._自适应.创建(17,4,22,22,1,3),0,0,4,true,true,i)
    -- end
    self.当前页面 = 1
    self.助战编号 = 0
        self.人物头像背景 = {}
      local s =  tx(self.数据.模型)
      self.人物头像背景[1] = tp.资源:载入(s[7],"网易WDF动画",s[2])
      if self.数据.参战宝宝 ~= "无" then
    local cz = 引擎.取头像(self.数据.参战宝宝.模型)
    self.宝宝头像背景 = 按钮.创建(资源:载入(cz[7],"网易WDF动画",cz[1]),0,0,1)
    end
    self.技能背景 = {}
    for n = 1,20 do
        self.技能背景[n] = 资源:载入('wzife.wd1',"网易WDF动画",0x68D384BD)
    end
    self.技能名称 = {"暴起","千手","傀儡","辉耀","雷伤"
                    ,"疗愈","陷足","沸血","灵涌","残忍"
                    ,"暴戾","返照","相胜","激励","破体"
                    ,"爆裂","祈胜","附体","御盾","破伤"}
    self.名称背景 = {}
    for n = 1,20 do
        self.名称背景[n] = 自适应.创建(3,1,40,18,1,3)
    end
        self:置形象()
        tp.运行时间 = tp.运行时间 + 1
        self.窗口时间 = tp.运行时间
        self.可视 = true
        self.页数=1
    -- table.print(self.数据)
    end
end

function 修业系统:取技能图标(名称)
    local 图标数据={}
    if 名称=="暴起" then        --青蓝色 0x630ce9c2
        图标数据[1]=0x83A054A5
        图标数据[2]="wzife.wdf"
    elseif 名称=="千手" then--蓝
        图标数据[1]=0x03B593E3
        图标数据[2]="wzife.wdf"
    elseif 名称=="傀儡" then--绿
        图标数据[1]=0x7C23B1B8
        图标数据[2]="wzife.wdf"
    elseif 名称=="辉耀" then--红
        图标数据[1]=0x085CAE13
        图标数据[2]="wzife.wdf"
    elseif 名称=="雷伤" then --青蓝色
        图标数据[1]=0x6A4612D6
        图标数据[2]="wzife.wdf"
    elseif 名称=="疗愈" then--蓝
        图标数据[1]=0x20D43900
        图标数据[2]="wzife.wdf"
    elseif 名称=="陷足" then--绿
        图标数据[1]=0x26F78E1F
        图标数据[2]="wzife.wdf"
    elseif 名称=="沸血" then--红
        图标数据[1]=0x1079CE8A
        图标数据[2]="wzife.wdf"
    elseif 名称=="灵涌" then--青蓝色
        图标数据[1]=0xD1EBF7E3
        图标数据[2]="wzife.wdf"
    elseif 名称=="残忍" then--蓝
        图标数据[1]=0x61197BD5
        图标数据[2]="wzife.wdf"
    elseif 名称=="暴戾" then--绿
        图标数据[1]=0x2E440020  ------------
        图标数据[2]="wzife.wdf"
    elseif 名称=="返照" then--红
        图标数据[1]=0x1618C7AD
        图标数据[2]="wzife.wdf"
    elseif 名称=="相胜" then--青蓝色
        图标数据[1]=0x2D685412
        图标数据[2]="wzife.wdf"
    elseif 名称=="激励" then--蓝
        图标数据[1]=0x6AAEF804
        图标数据[2]="wzife.wdf"
    elseif 名称=="破体" then--绿
        图标数据[1]=0x37E0D423
        图标数据[2]="wzife.wdf"
    elseif 名称=="爆裂" then--红
        图标数据[1]=0x19396997
        图标数据[2]="wzife.wdf"
    elseif 名称=="祈胜" then--青蓝色
        图标数据[1]=0x3FC666BA
        图标数据[2]="wzife.wdf"
    elseif 名称=="附体" then--蓝
        图标数据[1]=0x87040366
        图标数据[2]="wzife.wdf"
    elseif 名称=="御盾" then--绿
        图标数据[1]=0x488BFA97
        图标数据[2]="wzife.wdf"
    elseif 名称=="破伤" then--红
        图标数据[1]=0x1A1DE0D4
        图标数据[2]="wzife.wdf"
    end
    return 图标数据

end

function 修业系统:刷新(内容)

    self.数据 = 内容
    self:置形象()
      local s =  tx(self.数据.模型)
      self.人物头像背景[1] = tp.资源:载入(s[7],"网易WDF动画",s[2])
      if self.数据.参战宝宝 ~= "无" then
    local cz = 引擎.取头像(self.数据.参战宝宝.模型)
    self.宝宝头像背景 =  tp._按钮.创建(tp.资源:载入(cz[7],"网易WDF动画",cz[1]),0,0,1)
    end

end


function 修业系统:置形象()
    self.资源组[24] = nil
    self.资源组[25] = nil
    self.资源组[40] = nil
   if self.数据.参战宝宝  ~= "无" then
        local n = 引擎.取战斗模型(self.数据.参战宝宝.模型)
        self.资源组[24] = tp.资源:载入(n[10],"网易WDF动画",n[6])
        if self.数据.参战宝宝.染色方案 ~= nil then
            self.资源组[24]:置染色(self.数据.参战宝宝.染色方案,self.数据.参战宝宝.染色组[1],self.数据.参战宝宝.染色组[2],self.数据.参战宝宝.染色组[3])
            if self.资源组[25] then
               self.资源组[25]:置染色(self.数据.参战宝宝.染色方案,self.数据.参战宝宝.染色组[1],self.数据.参战宝宝.染色组[2],self.数据.参战宝宝.染色组[3])
            end
            self.资源组[24]:置方向(0)
        end
    end
end
function 修业系统:置方向()
    if self.资源组[202]~=nil then
        self.资源组[202]["静立"]:置方向(4)
    end
    if self.资源组[203]~=nil then
        self.资源组[203]["武器_静立"]:置方向(4)
    end
end

function 修业系统:显示(dt,x,y)
    local cj = tp.成就
    self.焦点 = false

    local 修业技能介绍={
暴起="#G暴起\n#W进入战斗后，宠物将\n额外增加5%的伤害",
千手="#G千手\n#W召唤兽所造成的物理伤害\n将拥有80%~150%的波动",
傀儡="#G傀儡\n受到伤害影响的物理技能，伤害基础基数将上升20%",
辉耀="#G辉耀\n你的召唤兽极力的想在主人面前表现自己\n在回合开始时将使自己\n的气血提高30%，并\n使首次出手后对其主目标造成1.3倍伤害(此技能与鬼魂术不可共同存在)",
雷伤="#G雷伤\n#W进入战斗后，宠物将\n额外增加5%的灵力",
疗愈="#G疗愈\n进入战斗的后，宠物的最大\n气血将在120%~150%之间波动",
陷足="#G陷足\n受到灵力影响的法术技能，伤害基础基数将上升20%",
沸血="#G沸血\n召唤兽受到修业的激发，热血不断沸腾\n进入战斗时，将舍弃自己70%的气血与防御，只为了更好的表现，其余的属性\n将获得30%提升",
灵涌="#G灵涌\n进入战斗后，宠物将\n额外增加5%的气血",
残忍="#G残忍\n召唤兽所造成的法术伤害\n将拥有80%~150%的波动",
暴戾="#G暴戾\n额外增加召唤兽\n20%的最大气血",
返照="#G返照\n召唤兽经历了重重历练，不再那么轻易\n的会在战斗中失利\n召唤兽神佑基础几率额外提升30%\n（需拥有神佑、高神或超级神柚复生）",
相胜="#G相胜\n进入战斗后，宠物将\n额外增加5%的速度",
激励="#G激励\n进入战斗的后，宠物的速度\n将在120%~150%之间波动",
破体="#G破体\n额外增加召唤兽20%的速度",
爆裂="#G爆裂\n狂暴的修业涌入召唤兽的身体内，进入\n战斗时将自身气血降低为1点\n使主人在2回合内，\n获得额外30%的属性",
祈胜="#G祈胜\n进入战斗后，宠物将\n额外增加5%的防御",
附体="#G附体\n进入战斗的后，宠物的防御\n将在120%~150%之间波动",
御盾="#G御盾\n额外增加召唤兽20%的防御",
破伤="#G破伤\n坚不可摧的修业附加在召唤兽与角色上\n召唤兽付出被掠夺90%属性的代价\n换取角色\n进入战斗的前2个回合\n所受的伤害为50%"
}





    if  self.当前页面 == 1 then
    self.资源组[10]:更新(dt)
    self.资源组[11]:更新(dt)
    self.资源组[13]:更新(x,y)
    self.资源组[15]:更新(x,y)
    self.资源组[17]:更新(x,y)
    self.资源组[18]:更新(x,y)
    self.资源组[19]:更新(dt)
       --  for i = 1,4 do
       --  self.资源组[100+i]:更新(x,y)
       --      if  self.资源组[100+i]:事件判断() then
       --          发送数据(200,{序号1=1,助战编号=i})
       --           self.助战编号=i
       --      end
       -- end
    -- self.资源组[25]:更新(dt)
    -- self.资源组[26]:更新(dt)
    -- self.资源组[27]:更新(dt)
    -- self.资源组[28]:更新(x,y)
    if self.数据.参战宝宝 ~= "无" then
    self.宝宝头像背景:更新(x,y)
    end
    self.资源组[1]:显示(self.x,self.y)
    self.资源组[2]:显示(self.x+14,self.y+49)
    self.资源组[20]:显示(self.x+4,self.y+49)
    self.资源组[20]:显示(self.x+4,self.y+22)

    -- self.资源组[3]:显示(self.x+106,self.y)
    -- self.资源组[5]:显示(self.x+346,self.y+77)
    self.资源组[9]:显示(self.x+329,self.y+165)
    self.资源组[7]:显示(self.x+24,self.y+70)
    self.资源组[7]:显示(self.x+24,self.y+142)
    self.资源组[16]:显示(self.x+24,self.y+214)

       --  for i = 1,4 do
       --  self.资源组[100+i]:显示(self.x+300+((i-1)*30),self.y+25)
       -- end

--  self.资源组[12]:显示(self.x+50,self.y+241+95)
    self.资源组[12]:显示(self.x+50,self.y+241+95)
    self.资源组[12]:显示(self.x+50+71,self.y+241+95)
    self.资源组[12]:显示(self.x+50+71+71,self.y+241+95)
    self.资源组[12]:显示(self.x+50+71+71+71,self.y+241+95)
    self.资源组[12]:显示(self.x+50+71+71+71+71,self.y+241+95)

    self.资源组[13]:显示(self.x+342,self.y+407)

    self.资源组[18]:显示(self.x+12,self.y+407)
    self.资源组[15]:显示(self.x+98+18+5,self.y+407)
    self.资源组[17]:显示(self.x+184+49,self.y+407)
        if self.资源组[24]~=nil then
            self.资源组[24]:更新(dt)
            self.资源组[24]:显示(self.x+300,self.y+320)
        end
        if self.资源组[25] ~= nil then
            self.资源组[25]:更新(dt)
            self.资源组[25]:显示(self.x+300,self.y+320)
        end
        if self.资源组[40] ~= nil then
            self.资源组[40]:更新(dt)
            self.资源组[40]:显示(self.x+300,self.y+320)
        end
    if self.数据.等级 > 35 and  self.数据.等级 < 70 then
    self.资源组[19]:显示(self.x+100+160,self.y+190)
    elseif self.数据.等级 >= 70 and  self.数据.等级 < 105 then
    self.资源组[19]:显示(self.x+100+160,self.y+190)
    self.资源组[19]:显示(self.x+130+160,self.y+190)
    elseif self.数据.等级 >= 105 and  self.数据.等级 < 140 then
    self.资源组[19]:显示(self.x+100+160,self.y+190)
    self.资源组[19]:显示(self.x+130+160,self.y+190)
    self.资源组[19]:显示(self.x+160+160,self.y+190)
    elseif self.数据.等级 >= 140 and  self.数据.等级 < 175 then
    self.资源组[19]:显示(self.x+100+160,self.y+190)
    self.资源组[19]:显示(self.x+130+160,self.y+190)
    self.资源组[19]:显示(self.x+160+160,self.y+190)
    self.资源组[19]:显示(self.x+190+160,self.y+190)
    elseif self.数据.等级 >= 175  then
    self.资源组[19]:显示(self.x+100+160,self.y+190)
    self.资源组[19]:显示(self.x+130+160,self.y+190)
    self.资源组[19]:显示(self.x+160+160,self.y+190)
    self.资源组[19]:显示(self.x+190+160,self.y+190)
    self.资源组[19]:显示(self.x+220+160,self.y+190)
    end
    local 修业开启 = "未开启"  ---0x8B146166  0x3CCAF9CF
    if self.数据.开启 == true then
        修业开启 = "已开启"  --0x3CCAF9CF
    end
    if 修业开启=="未开启" then
        self.资源组[22]:显示(self.x+285,self.y+107)---关闭
    else
        self.资源组[23]:显示(self.x+285+15,self.y+107+22)---开启
    end

    zts:置颜色(0xFFFFFFFF):显示(self.x+274-97,self.y+3,"修 业 系 统")
    zts:置颜色(0xFFFFFFFF):显示(self.x+274-187,self.y+80,"名称："..self.数据.名称)
    zts:置颜色(0xFFFFFFFF):显示(self.x+274-187,self.y+110-11,"人物等级："..self.数据.人物等级)
    zts:置颜色(0xFFFFFFFF):显示(self.x+274-187,self.y+110+7,"修业点数："..self.数据.修业点)
    zts:置颜色(0xFFFFFFFF):显示(self.x+274-57,self.y+80,"修业等级："..self.数据.等级)
    -- zts:置颜色(0xFFFFFFFF):显示(self.x+274-57,self.y+110,"修业系统："..修业开启)
    zts:置颜色(0xFFFFFFFF):显示(self.x+274-57,self.y+110,"修业系统：")


    -- zts:置颜色(0xFFFFFF00):显示(self.x+274-187,self.y+110+75,"觉醒次数：")



    tp.人物头像背景_:显示(self.x+29,self.y+76)
    tp.宠物头像背景_:显示(self.x+29,self.y+146)
    self.人物头像背景[1]:显示(self.x+33,self.y+80)
    -- self.宝宝头像背景:显示(self.x+33,self.y+150)
    self.资源组[10]:显示(self.x+53,self.y+101)
    self.资源组[11]:显示(self.x+19,self.y+120)
    if self.数据.参战宝宝 ~= "无" and self.数据.参战宝宝.名称 then
    self.宝宝头像背景:显示(self.x+33,self.y+150)
    zts:置颜色(0xFFFFFF00):显示(self.x+274-187,self.y+80+70,"名称："..self.数据.参战宝宝.名称)
    zts:置颜色(0xFFFFFF00):显示(self.x+274-187,self.y+80+70+30,"等级："..self.数据.参战宝宝.等级)
    else
        local 宝宝名称 = "无"
        local 宝宝等级 = 0
    zts:置颜色(0xFFFFFF00):显示(self.x+274-187,self.y+80+70,"名称：无")
    zts:置颜色(0xFFFFFF00):显示(self.x+274-187,self.y+110+55,"等级：0")
    end
    zts:置颜色(0xFFFF1493):显示(self.x+274-57,self.y+80+70,"技能组合：\n【 "..self.数据.组合.." 】")
    zts:置颜色(4294901760):显示(self.x+274-187-50,self.y+80+70+70,"人物加成：")
    zts:置颜色(0xFFFFFF00):显示(self.x+274-187-50,self.y+80+70+70+18,"气血：  "..self.数据.等级*8)
    zts:置颜色(0xFFFFFF00):显示(self.x+274-187-50,self.y+80+70+70+36,"伤害：  "..self.数据.等级*3)
    zts:置颜色(0xFFFFFF00):显示(self.x+274-187-50,self.y+80+70+70+54,"法伤：  "..self.数据.等级*10)
    zts:置颜色(0xFFFFFF00):显示(self.x+274-187-50,self.y+80+70+70+72,"固伤：  "..self.数据.等级*10)
    -- zts:置颜色(0xFFFFFF00):显示(self.x+274-187-50,self.y+80+70+70+72,"灵力：  "..self.数据.等级*5)
    zts:置颜色(0xFFFFFF00):显示(self.x+274-187-50,self.y+80+70+70+72+18,"速度：  "..self.数据.等级*2)
    zts:置颜色(0xFFFFFFFF)

            if self.资源组[18]:是否选中(x,y) then
            -- tp.提示:自定义(x-42,y+27,"#Y/【开启条件】\n#G/四修总等级#R/>60级\n#G/人物#R/50E#G/经验")
           elseif self.资源组[17]:是否选中(x,y) then
            tp.提示:自定义(x-42,y+27,"#G/降低35修业等级为代价，取消当前技能")

          end
    if self.资源组[9]:是否选中(x,y) then
        if self.数据.组合 == "无" then
            -- tp.提示:自定义(x-42,y+27,"当前技能组合无特殊加成（需五技能）")
            tp.提示:自定义(x-42,y+27,"#G当前技能组合无特殊加成（需五技能）\n\n#Y暴起+相胜+千手+暴戾+辉耀 = 陆地王者\n#S雷伤+祈胜+残忍+御盾+沸血 = 远古蛮妖\n#Y灵涌+祈胜+激励+破体+破伤 = 鲲鹏之躯\n#S祈胜+暴起+附体+傀儡+爆裂 = 灵狐之附\n#Y相胜+雷伤+疗愈+陷足+返照 = 雷云之雀\n\n#G（组合技能可用“四象天罡印”重置）")

        elseif  self.数据.组合 == "陆地王者" then
            tp.提示:自定义(x-42,y+27,"当前技能组合【陆地王者】\n将额外触发效果：增加人物10%伤害")
        elseif  self.数据.组合 == "远古蛮妖" then
            tp.提示:自定义(x-42,y+27,"当前技能组合【远古蛮妖】\n将额外触发效果：增加人物10%灵力")
        elseif  self.数据.组合 == "鲲鹏之躯" then
            tp.提示:自定义(x-42,y+27,"当前技能组合【鲲鹏之躯】\n将额外触发效果：增加人物10%防御")
        elseif  self.数据.组合 == "灵狐之附" then
            tp.提示:自定义(x-42,y+27,"当前技能组合【灵狐之附】\n将额外触发效果：增加人物10%速度")
        elseif  self.数据.组合 == "雷云之雀" then
            tp.提示:自定义(x-42,y+27,"当前技能组合【雷云之雀】\n将额外触发效果：增加人物10%气血")
        end
        if self.资源组[9]:是否选中(x,y) and 引擎.鼠标弹起(左键) then
            发送数据(200,{序号1=5})
        end
    end


        local 银子 =   1
        local 经验 =   1
        local 需修业点 = 1
        if self.数据.等级 <= 70 then
            银子 = 500000
            经验 = 5000000
            需修业点 = 250 --17500 --70个等级
        elseif self.数据.等级 > 70 and  self.数据.等级 <= 105  then
            银子 = 10000000
            经验 = 20000000
            需修业点 = 500 --17500
        elseif self.数据.等级 > 105 and  self.数据.等级 <= 140  then
            银子 = 12000000
            经验 = 22000000
            需修业点 = 750 --26250
        else
            银子 = 15000000
            经验 = 25000000
            需修业点 = 1000 --35000 ---合计需修业点96250
        end



    if self.资源组[15]:是否选中(x,y) then
            tp.提示:自定义(x-70,y+127,"当前升级需求：\n银子："..银子.."\n经验："..经验.."\n修业点："..需修业点)
    end

    if self.资源组[13]:事件判断() then
            self.当前页面 = 2
    elseif  self.资源组[15]:事件判断() then
           if self.助战编号~=0 then
            发送数据(200,{序号1=3,助战编号=self.助战编号})
           else
            发送数据(200,{序号1=3})
           end
            -- 客户端:发送数据(1,600063,143,"9",1)
    elseif  self.资源组[17]:事件判断() then -- 重置
           if self.助战编号~=0 then
            发送数据(200,{序号1=4,助战编号=self.助战编号})
            self:打开()
            return
           else
            发送数据(200,{序号1=4})
            self:打开()
            return
           end
            -- 客户端:发送数据(1,600064,143,"9",1)
    elseif  self.资源组[18]:事件判断() then -- 重置
           if self.助战编号~=0 then
            发送数据(200,{序号1=2,助战编号=self.助战编号})

           else
            发送数据(200,{序号1=2})
           end
            -- 客户端:发送数据(1,600062,143,"9",1)
    end
    if  self.数据.一号 ~= "无" then
        local 修业技能1图标数据=self:取技能图标(self.数据.一号)
        self.修业技能1=tp.资源:载入(修业技能1图标数据[2],"网易WDF动画",修业技能1图标数据[1])
        self.修业技能1:显示(self.x+55,self.y+341)
        if self.修业技能1:是否选中(x,y) then
        local 技能名称=self.数据.一号
        local 提示信息=修业技能介绍[技能名称]
        tp.提示:自定义(x,y,""..提示信息.."")
        end
    end
    if      self.数据.二号 ~= "无" then
        local 修业技能2图标数据=self:取技能图标(self.数据.二号)
        self.修业技能2=tp.资源:载入(修业技能2图标数据[2],"网易WDF动画",修业技能2图标数据[1])
        self.修业技能2:显示(self.x+55+71,self.y+341)
        if self.修业技能2:是否选中(x,y) then
        local 技能名称=self.数据.二号
        local 提示信息=修业技能介绍[技能名称]
        tp.提示:自定义(x,y,""..提示信息.."")
        end
    end
    if      self.数据.三号 ~= "无" then
        local 修业技能3图标数据=self:取技能图标(self.数据.三号)
        self.修业技能3=tp.资源:载入(修业技能3图标数据[2],"网易WDF动画",修业技能3图标数据[1])
        self.修业技能3:显示(self.x+55+71+71,self.y+341)
        if self.修业技能3:是否选中(x,y) then
        local 技能名称=self.数据.三号
        local 提示信息=修业技能介绍[技能名称]
        tp.提示:自定义(x,y,""..提示信息.."")
        end
    end
    if      self.数据.四号 ~= "无" then
        local 修业技能4图标数据=self:取技能图标(self.数据.四号)
        self.修业技能4=tp.资源:载入(修业技能4图标数据[2],"网易WDF动画",修业技能4图标数据[1])
        self.修业技能4:显示(self.x+55+71+71+71,self.y+341)
        if self.修业技能4:是否选中(x,y) then
        local 技能名称=self.数据.四号
        local 提示信息=修业技能介绍[技能名称]
        tp.提示:自定义(x,y,""..提示信息.."")
        end
    end
    if      self.数据.五号 ~= "无" then

        local 修业技能5图标数据=self:取技能图标(self.数据.五号)
        self.修业技能5=tp.资源:载入(修业技能5图标数据[2],"网易WDF动画",修业技能5图标数据[1])
        self.修业技能5:显示(self.x+55+71+71+71+71,self.y+341)
        if self.修业技能5:是否选中(x,y) then
        local 技能名称=self.数据.五号
        local 提示信息=修业技能介绍[技能名称]
        tp.提示:自定义(x,y,""..提示信息.."")
        end
    end




    elseif  self.当前页面 == 2  then

    self.资源组[1]:显示(self.x,self.y)
    self.资源组[2]:显示(self.x+14,self.y+49)
    -- self.资源组[3]:显示(self.x+106,self.y)
    self.资源组[14]:更新(x,y)
    self.资源组[14]:显示(self.x+342,self.y+407)
    zts:置颜色(0xFFFFFFFF):显示(self.x+274-97,self.y+3,"修 业 技 能")
    self.修业技能2={}
   local l=0
    for i = 1,5 do
        for o = 1,4 do
            l=l+1
        self.技能背景[l]:显示(self.x + 48+(i-1)*71 ,self.y + 73+(o-1) * 80)
        self.名称背景[l]:显示(self.x + 50+(i-1)*71 ,self.y + 125+(o-1) * 80)

        local 修业技能2图标数据=self:取技能图标(self.技能名称[l])
        self.修业技能2[l]=tp.资源:载入(修业技能2图标数据[2],"网易WDF动画",修业技能2图标数据[1])
        self.修业技能2[l]:显示(self.x + 51+(i-1)*71 ,self.y + 76+(o-1) * 80)

        zts:置颜色(0xFFFF1493):显示(self.x + 56+(i-1)*71 ,self.y + 127+(o-1) * 80,""..self.技能名称[l])
        zts:置颜色(白色)
            if self.修业技能2[l]:是否选中(x,y) then
            local 技能名称=self.技能名称[l]
            local 提示信息=修业技能介绍[技能名称]
            tp.提示:自定义(x,y,""..提示信息.."")
            end
                end
            end
                if self.资源组[14]:事件判断() then
                    self.当前页面 = 1
                end
        end




end

function 修业系统:检查点(x,y)
    if self.可视 and  self.资源组~=nil and self.资源组[1]:是否选中(x,y)  then
        return true
    end
end

function 修业系统:初始移动(x,y)
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

function 修业系统:开始移动(x,y)
    if self.可视 and self.鼠标 then
        self.x = x - self.xx
        self.y = y - self.yy
    end
end

return 修业系统