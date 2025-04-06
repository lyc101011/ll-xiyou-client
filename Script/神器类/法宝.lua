-- @Author: baidwwy
-- @Date:   2023-08-31 22:54:45
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-10 09:23:37
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2023-07-03 02:47:34
--======================================================================--
local 场景类_法宝 = class()

local floor = math.floor
local tp,zts1,zts,sqzt
local insert = table.insert
local min = math.min
local max = math.max
local ceil = math.ceil
local mousea = 引擎.鼠标弹起

local 神器大图与坐标 = {
		大唐官府 = {0x01AC0090,320,100,0x01AC0046},化生寺 = {0x01AC0092,330,120,0x01AC0052},方寸山 = {0x01AC0091,320,100,0x01AC0057},女儿村 = {0x01AC0093,300,70,0x01AC0055},
		天宫 = {0x01AC0099,310,90,0x01AC0059},普陀山 = {0x01AC0104,305,85,0x01AC0058},龙宫 = {0x01AC0102,310,90,0x01AC0051},五庄观 = {0x01AC0100,320,100,0x01AC0047},
		魔王寨 = {0x01AC0096,310,100,0x01AC0053},狮驼岭 = {0x01AC0097,325,105,0x01AC0050},盘丝洞 = {0x01AC0098,310,95,0x01AC0056},阴曹地府 = {0x01AC0095,310,90,0x01AC0049},
		神木林 = {0x01AC0094,300,75,0x01AC0045},凌波城 = {0x01AC0101,300,95,0x01AC0048},无底洞 = {0x01AC0103,320,100,0x01AC0054},花果山 = {0x0C000015,320,100,0x01AC0054},九黎城 = {0x01AC0090,320,100,0x01AC0046}
	}
-- local 神器大图与坐标 = {
-- 		大唐官府 = {201326594,320,100,0x01AC0046},化生寺 = {201326601,330,120,0x01AC0052},方寸山 = {201326612,320,100,0x01AC0057},女儿村 = {201326610,300,70,0x01AC0055},
-- 		天宫 = {201326614,310,90,0x01AC0059},普陀山 = {201326611,305,85,0x01AC0058},龙宫 = {201326599,310,90,0x01AC0051},五庄观 = {201326595,320,100,0x01AC0047},
-- 		魔王寨 = {201326600,310,100,0x01AC0053},狮驼岭 = {201326597,325,105,0x01AC0050},盘丝洞 = {201326609,310,95,0x01AC0056},阴曹地府 = {201326598,310,90,0x01AC0049},
-- 		神木林 = {201326593,300,75,0x01AC0045},凌波城 = {201326596,300,95,0x01AC0048},无底洞 = {201326608,320,100,0x01AC0054},花果山 = {201326613,320,100,0x01AC0054}
-- 	}
local 神器属性 = {
		大唐官府 = {"伤　　害","物理暴击"},化生寺 = {"防　　御","治疗能力"},方寸山 = {"封印命中","法术伤害"},女儿村 = {"封印命中","固定伤害"},天宫 = {"法术伤害","封印命中"},
		普陀山 = {"固定伤害","治疗能力"},龙宫 = {"法术伤害","法术暴击"},五庄观 = {"伤　　害","封印命中"},魔王寨 = {"法术伤害","法术暴击"},狮驼岭 = {"伤　　害","物理暴击"},
		盘丝洞 = {"封印命中","法术防御"},阴曹地府 = {"伤　　害","法术防御"},神木林 = {"法术伤害","法术暴击"},凌波城 = {"伤　　害","物理暴击"},无底洞 = {"封印命中","治疗能力"},
		花果山 = {"伤害","物理暴击"},九黎城 = {"伤害","物理暴击"}
	}

local 神器技能 = {
		藏锋敛锐 = {[1]= "横扫千军消耗的气血有50%的几率转化为等量护盾。",[2]="横扫千军消耗的气血有100%的几率转化为等量护盾。"},
		惊锋     = {[1]= "每次攻击提升自身10点伤害，最多叠加12层，死亡后清零。",[2]="每次攻击提升自身20点伤害，最多叠加12层，死亡后清零。"},
		披坚执锐 = {[1]= "遭受攻击时，有4%的几率免受90%的伤害。",[2]="遭受攻击时，有8%的几率免受90%的伤害。"},
		金汤之固 = {[1]= "气血小于30%时，提升240点抗封等级。",[2]="气血小于30%时，提升480点抗封等级。"},
		风起云墨 = {[1]= "受到你治疗的首目标本回合内受到的所有伤害降低4%。",[2]="受到你治疗的首目标本回合内受到的所有伤害降低8%。"},
		挥毫     = {[1]= "受到你的治疗时，目标每带有一个增益状态，额外恢复25点气血。",[2]="受到你的治疗时，目标每带有一个增益状态，额外恢复50点气血。"},
		盏中晴雪 = {[1]= "若你的速度高于施法者，提升速度差×0.5的抗封等级。",[2]="若你的速度高于施法者，提升速度差×1的抗封等级。"},
		泪光盈盈 = {[1]= "笑里藏刀额外减少目标6点愤怒。",[2]="笑里藏刀额外减少目标12点愤怒。"},
		凭虚御风 = {[1]= "每点被消耗的风灵增加40点法术伤害结果，最多叠加三层，死亡后清零。",[2]="每点被消耗的风灵增加80点法术伤害结果，最多叠加三层，死亡后清零。"},
		钟灵     = {[1]= "被使用3级药是有一定几率获得1层风灵。",[2]="被使用3级药是有较大几率获得1层风灵。"},
		亡灵泣语 = {[1]= "你的锢魂术会使得目标额外受到8%的物法伤害。",[2]="你的锢魂术会使得目标额外受到10%的物法伤害。"},
		魂魇     = {[1]= "被你的物理伤害攻击的单位在当回合内的法术伤害结果减少100点。",[2]="被你的物理伤害攻击的单位在当回合内的法术伤害结果减少200点。"},
		业焰明光 = {[1]= "你的单体法术有50%的几率造成额外25%的伤害。",[2]="你的单体法术有50%的几率造成额外50%的伤害。"},
		流火     = {[1]= "攻击气血百分比小于你的单位时，增加8%的伤害。",[2]="攻击气血百分比小于你的单位时，增加16%的伤害。"},
		蛮血     = {[1]= "增加（1-自身气血/气血上限）×8%的狂暴几率。",[2]="增加（1-自身气血/气血上限）×16%的狂暴几率。"},
		狂战     = {[1]= "每有一个己方召唤兽被击飞，增加30点伤害力，可叠加4层，死亡后消失。",[2]="每有一个己方召唤兽被击飞，增加60点伤害力，可叠加4层，死亡后消失。"},
		镜花水月 = {[1]= "受到治疗时，有8%的几率获得一个等额度的护盾。",[2]="受到治疗时，有16%的几率获得一个等额度的护盾。"},
		澄明     = {[1]= "每回合结束时，增加3点抵抗封印等级。",[2]="每回合结束时，增加6点抵抗封印等级。"},
		情思悠悠 = {[1]= "地涌金莲的目标获得治疗量10%的护盾。",[2]="地涌金莲的目标获得治疗量20%的护盾。"},
		相思     = {[1]= "偶数回合结束时，增加3点速度。",[2]="每个回合结束时，增加3点速度。"},
		弦外之音 = {[1]= "回合结束时，每个主动法宝效果会增加你3点愤怒。",[2]="回合结束时，每个主动法宝效果会增加你6点愤怒。"},
		裂帛     = {[1]= "伤害性法术首目标伤害增加8%。",[2]="伤害性法术首目标伤害增加16%。"},
		定风波   = {[1]= "受到的法术暴击伤害降低30%。",[2]="受到的法术暴击伤害降低60%。"},
		沧浪赋   = {[1]= "攻击气血小于30%的目标时，额外提升120点的法术伤害。",[2]="攻击气血小于30%的目标时，额外提升240点的法术伤害。"},
		斗转参横 = {[1]= "带有状态生命之泉时，日月乾坤命中率增加3%。",[2]="带有状态生命之泉时，日月乾坤命中率增加8%。"},
		静笃     = {[1]= "每次击杀敌方单位，增加60点伤害。",[2]= "每次击杀敌方单位，增加120点伤害。"},
		玉魄     = {[1]= "消耗愤怒的100%转化为下一次释放恢复性技能时的治疗能力。",[2]="消耗愤怒的200%转化为下一次释放恢复性技能时的治疗能力。"},
		璇华     = {[1]= "五行法术克制目标五行时，增加10%的伤害。",[2]="五行法术克制目标五行时，增加20%的伤害。"},
		威服天下 = {[1]= "暴击伤害增加12%。",[2]="暴击伤害增加24%。"},
		酣战     = {[1]= "每点消耗的战意，会提升20点物理暴击等级，可叠加6次，死亡后清零。",[2]="每点消耗的战意，会提升40点物理暴击等级，可叠加6次，死亡后清零。"},
		万物滋长 = {[1]= "使用特技时将会获得（消耗愤怒值×等级×5%）的护盾和气血回复。",[2]="使用特技时将会获得（消耗愤怒值×等级×10%）的护盾和气血回复。"},
		开辟     = {[1]= "每次使用如意神通，提升20点自身伤害，最多叠加6层，死亡后清零。",[2]="每次使用如意神通，提升40点自身伤害，最多叠加6层，死亡后清零。"},
		鸣空     = {[1]= "每当令目标浮空时，你获得12点狂暴等级并且造成的物理伤害结果提高2%，最多叠加6层，阵亡后清零",[2]="每当令目标浮空时，你获得24点狂暴等级并且造成的物理伤害结果提高2%，最多叠加6层，阵亡后清零"},
		骇神     = {[1]= "受到物理伤害时，若攻击者物理伤害低于你，伤害结果降低10%",[2]="受到物理伤害时，若攻击者物理伤害低于你，伤害结果降低20%"},
	}
local 门派神器名称 = {
	    大唐官府 = "轩辕剑",化生寺 = "墨魂笔",方寸山 = "黄金甲",女儿村 = "泪痕碗",天宫 = "独弦琴",
	    普陀山 = "华光玉",龙宫 = "清泽谱",五庄观 = "星斗盘",魔王寨 = "明火珠",狮驼岭 = "噬魂齿",
	    盘丝洞 = "昆仑镜",阴曹地府 = "四神鼎",神木林 = "月光草",凌波城 = "天罡印",无底洞 = "玲珑结",
	    花果山 = "鸿蒙石",九黎城 = "魔息角"
	}

function 场景类_法宝:初始化(根)
	self.ID = 36
	self.x = 209
	self.y = 114
	self.xx = 0
	self.yy = 0
	self.注释 = "锦衣"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
    self.是否有神器 = false
    self.神器属性 = {}
	self.物品 = {}
	self.法宝佩戴 = {}
	self.灵宝佩戴 = {}
	self.灵宝物品 = {}
	local 格子 = 根._物品格子
	for i=1,4 do
		self.法宝佩戴[i] = 格子.创建(0,0,i,"法宝佩戴_法宝")
	end
	for i=1,2 do
		self.灵宝佩戴[i] = 格子.创建(0,0,i,"法宝佩戴_灵宝")
	end
	for i=1,100 do
		self.物品[i] = 格子(0,0,i,"法宝背包_法宝")
	end
	for i=1,20 do
		self.灵宝物品[i] = 格子(0,0,i,"法宝背包_灵宝")
	end
	tp = 根
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
	self.窗口时间 = 0
	self.开始 = 1
	self.结束 = 100
	self.加入 = 0

end

function 场景类_法宝:加载资源()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.资源组 = {
		[1] = 资源:载入('aaa.wdf',"网易WDF动画",0x1F73D091), -- 背景
		[2] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x81DD40D3),0,0,3,true,true),
		[3] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"使用"),
		[4] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"修炼"),
		[5] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"补充灵气"),
		[6] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"法宝"),
		[7] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"神器"),
		[8] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"灵宝"),
		[9] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"装备"),
		[10] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"修复"),
		[11] = 按钮.创建(自适应.创建(17,4,80,22,1,3),0,0,4,true,true," 道具"),
		[12] = 按钮.创建(自适应.创建(17,4,80,22,1,3),0,0,4,true,true," 行囊"),
		[13] = 按钮.创建(自适应.创建(17,4,30,22,1,3),0,0,4,true,true,"1"),
		[14] = 按钮.创建(自适应.创建(17,4,30,22,1,3),0,0,4,true,true,"2"),
		[15] = 按钮.创建(自适应.创建(17,4,30,22,1,3),0,0,4,true,true,"3"),
		[16] = 按钮.创建(自适应.创建(17,4,30,22,1,3),0,0,4,true,true,"看"),
		-- [17] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),--上滚动
		-- [18] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),--下滚动
		[19] =  tp._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),1,14,179,2),
		[20] = 资源:载入('aaa.wdf',"网易WDF动画",0x1F73D097),
		[21] = 资源:载入('aaa.wdf',"网易WDF动画",0x1F73D096),
		[22] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"切换技能"),
	}
	self.shenqizu={
		[12] = 资源:载入('Resource.ft',"网易WDF动画",0x01AC0041),
		[13] = 资源:载入('Resource.ft',"网易WDF动画",0x01AC0042),
		[14] = 资源:载入('Resource.ft',"网易WDF动画",0x01AC0043),
		[15] = 资源:载入('Resource.ft',"网易WDF动画",0x01AC0044),
		}
	for i=13,15 do
		self.资源组[i]:置偏移(3,0)
	end
	self.资源组[16]:置偏移(2,0)
	self.资源组[11]:置偏移(5,0)
	self.资源组[12]:置偏移(5,0)
	self.物品格子背景 = 自适应.创建(34,1,272,212,3,9)
	for n=2,16 do
		self.资源组[n]:绑定窗口_(self.ID)
	end
	for n=2,10 do
		if n ~= 5 then self.资源组[n]:置偏移(13,0) end
	end
	self.sq = {}
	local zy=引擎.取物品(门派神器名称[tp.队伍[1].门派])
	self.sq.小动画 = 资源:载入(zy[11],"网易WDF动画",zy[12])
	self.sq.大动画 = 资源:载入(zy[11],"网易WDF动画",zy[13])
	self.sq.说明 = zy[1]
	self.介绍文本 = tp._丰富文本(100,300)
end

function 场景类_法宝:重新载入()
    self.资源组=nil
end

function 场景类_法宝:打开()
	if self.可视 then
		for i=1,100 do
			self.物品[i]:置物品(nil)
		end
		tp.场景.抓取神器=nil
		self.神器格子=nil
		self.资源组[19]:置起始点(0)
		self.加入 = 0
		self.可视 = false
	else
		insert(tp.窗口_,self)
		if self.资源组==nil then
		    self:加载资源()
		end
		tp.场景.抓取神器=nil
		self.开始 = 1
		self.结束 = 100
		self.加入 = 0
		self.点击类型="法宝"
		self.窗口="法宝"
		self.法宝选中=0
		self.灵宝选中=0
		self.法宝数量 = 0
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end

function 场景类_法宝:刷新(神器是否有,神器是否佩戴,位置)
	for q=self.开始,self.结束 do
		self.物品[q]:置物品(tp.法宝列表[q])
		if self.物品[q].物品 ~= nil then
		    self.法宝数量 = self.法宝数量 + 1
		end
	end
	self.法宝选中=0
	for i=1,4 do
		self.法宝佩戴[i]:置物品(tp.法宝佩戴[i])
	end
	self.是否有神器 = 神器是否有
    self.是否佩戴神器 = 神器是否佩戴
    self.神器格子 = 位置
	for q=1,20 do
		self.灵宝物品[q]:置物品(tp.灵宝列表[q])
	end
	self.灵宝选中=0
	for i=1,2 do
		self.灵宝佩戴[i]:置物品(tp.灵宝佩戴[i])
	end
end

function 场景类_法宝:佩戴神器(内容)
    self.是否佩戴神器 = 内容.是否
    self.神器格子=内容.格子
end

function 场景类_法宝:神器刷新(数据)
	self.神器图片集 = tp.资源:载入('Resource.ft',"网易WDF动画",神器大图与坐标[tp.队伍[1].门派][1])
	self.神器文字集 = tp.资源:载入('Resource.ft',"网易WDF动画",神器大图与坐标[tp.队伍[1].门派][4])
	self.是否有神器 = true
    -- self.是否佩戴神器 = 数据.是否佩戴神器
	self.神器属性 = 数据
	self.属性数值 = {速度=0,气血=0,抵抗封印=0}
	for n=1,2 do
	    if 神器属性[tp.队伍[1].门派][n] == "伤　　害" then
	    	self.属性数值.伤害 = 0
	    elseif 神器属性[tp.队伍[1].门派][n] == "防　　御" then
	    	self.属性数值.防御 = 0
	    else
	        self.属性数值[神器属性[tp.队伍[1].门派][n]] = 0
	    end
	end

	self.介绍文本:添加文本(神器技能[self.神器属性.神器技能.name][self.神器属性.神器技能.lv])
	for k,v in pairs(self.神器属性.神器解锁) do
	    for n=1,#v.神器五行属性 do
	    	if self.属性数值[v.神器五行属性[n]] then
	    	    self.属性数值[v.神器五行属性[n]] = self.属性数值[v.神器五行属性[n]] + v.神器五行数值[n]
	    	end

	    end
	end
	self.miaoshu={}
	self.miaoshu["速度"]={"速　　度",177}
	self.miaoshu["气血"]={"气　　血",202}
	self.miaoshu["伤害"]={"伤　　害",227}
	self.miaoshu["防御"]={"防    御",227}
	self.miaoshu["封印命中"]={"封印命中",227}
	self.miaoshu["法术伤害"]={"法术伤害",227}
	self.miaoshu["固定伤害"]={"固定伤害",227}
	self.miaoshu["物理暴击"]={"物理暴击",252}
	self.miaoshu["治疗能力"]={"治疗能力",252}
	self.miaoshu["法术暴击"]={"法术暴击",252}
	self.miaoshu["法术防御"]={"法术防御",252}
	self.miaoshu["抵抗封印"]={"抵抗封印",277}
	self.点击类型 ="神器"
	self.窗口 ="神器"
end

function 场景类_法宝:更新神器属性(数据)
	self.神器属性 = 数据
	self.属性数值 = {速度=0,气血=0,抵抗封印=0}
	for n=1,2 do
	    if 神器属性[tp.队伍[1].门派][n] == "伤　　害" then
	    	self.属性数值.伤害 = 0
	    elseif 神器属性[tp.队伍[1].门派][n] == "防　　御" then
	    	self.属性数值.防御 = 0
	    else
	        self.属性数值[神器属性[tp.队伍[1].门派][n]] = 0
	    end
	end
	for k,v in pairs(self.神器属性.神器解锁) do
	    for n=1,#v.神器五行属性 do
	        self.属性数值[v.神器五行属性[n]] = self.属性数值[v.神器五行属性[n]] + v.神器五行数值[n]
	    end
	end
end

function 场景类_法宝:更新法宝经验(数据)
	if self.物品[数据.id]~=nil and self.物品[数据.id].物品~=nil then
		self.物品[数据.id].物品.当前经验=数据.当前经验
		self.物品[数据.id].物品.升级经验=数据.升级经验
		self.物品[数据.id].物品.气血=数据.境界
		self.物品[数据.id].物品.魔法=数据.灵气
	end
end

function 场景类_法宝:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[6]:更新(x,y,self.窗口~="法宝")
	self.资源组[7]:更新(x,y,self.窗口~="神器")
	self.资源组[8]:更新(x,y,self.窗口~="灵宝")
	self.资源组[13]:更新(x,y)
	self.资源组[14]:更新(x,y)
	self.资源组[15]:更新(x,y)
	self.资源组[16]:更新(x,y)

	if self.资源组[6]:事件判断() then
		self.法宝选中 = 0
		self.灵宝选中 = 0
		self.窗口 ="法宝"
	elseif self.资源组[7]:事件判断() then --打开神器经脉
		self.法宝选中 = 0
		self.灵宝选中 = 0
        if self.是否有神器 then
		    发送数据(6203)
		    self.介绍文本:清空()
		else
			tp.常规提示:打开("#Y/您当前没有神器！")
		end
	elseif self.资源组[8]:事件判断() then --打开神器经脉
		self.法宝选中 = 0
		self.灵宝选中 = 0
		self.点击类型="灵宝"
		self.窗口 ="灵宝"
	elseif self.资源组[2]:事件判断() then
		self:打开()
	end

	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x+519,self.y+10)
	-- tp.窗口标题背景_:置区域(0,0,40,20)
	-- tp.窗口标题背景_:显示(self.x+237,self.y+1)
	self.资源组[6]:显示(self.x+265,self.y+32+15,nil,nil,nil,self.窗口=="法宝",2)
	-- if self.是否有神器 then
		self.资源组[7]:显示(self.x+265+88,self.y+32+15,nil,nil,nil,self.窗口=="神器",2)
	-- end
	self.资源组[8]:显示(self.x+265+88*2,self.y+32+15,nil,nil,nil,self.窗口=="灵宝",2)
	self.资源组[13]:显示(self.x+92,self.y+32+15)
	self.资源组[14]:显示(self.x+92+36,self.y+32+15)
	self.资源组[15]:显示(self.x+92+36*2,self.y+32+15)
	self.资源组[16]:显示(self.x+92+36*3,self.y+32+15)
	zts:显示(self.x+17,self.y+33+18,"已装备法宝")
	for h=1,4 do
		self.资源组[20]:显示(self.x+14+(h*58-58),self.y+62+15)
		self.法宝佩戴[h]:置坐标(self.x+16+(h*58-58),self.y+62+15)
		self.法宝佩戴[h]:显示(dt,x,y,self.鼠标)
		if self.法宝佩戴[h].焦点 and not tp.消息栏焦点 then
			if self.法宝佩戴[h].物品 ~= nil then
				tp.提示:道具行囊(x,y,self.法宝佩戴[h].物品)
			end
			if self.窗口 =="法宝" then
			    if 引擎.鼠标弹起(右键) then
					发送数据(3734,{序列=h})
				elseif tp.场景.抓取物品ID~=nil and 引擎.鼠标弹起(左键) then
					发送数据(3735,{序列=tp.场景.抓取物品ID,序列1=h})
					tp.场景.抓取物品 = nil
					tp.场景.抓取物品ID = nil
					tp.场景.抓取物品注释 = nil
					self.物品[self.法宝选中].确定=false
					self.物品[self.法宝选中]:置物品(tp.法宝列表[self.法宝选中])
				end
			elseif self.窗口 =="神器" then
				if tp.场景.抓取神器 then
				    if 引擎.鼠标弹起(左键) then
						发送数据(3735,{序列="神器",序列1=h}) --pd
						tp.场景.抓取神器=nil
					end
				end
			end
		end
	end
	if self.是否佩戴神器 and self.是否有神器 and self.神器格子 then
		if tp.队伍[1].门派=="花果山" then
		    self.sq.小动画:显示(self.x+18+(self.神器格子*58-58),self.y+62+24)
		else
			self.sq.小动画:显示(self.x+13+(self.神器格子*58-58),self.y+62+12)
		end
		if self.sq.小动画:是否选中(x,y) then
			tp.提示:商城提示(self.x+70,self.y-50,门派神器名称[tp.队伍[1].门派],self.sq.说明,self.sq.大动画)
			if 引擎.鼠标弹起(右键) then
				发送数据(3734,{序列=self.神器格子,神器=true}) --xx
			end
		end
	end
	if self.窗口 =="法宝" then
		引擎.场景.字体表.标题字体:显示(self.x+269,self.y+16,"法 宝")
		self.物品格子背景:显示(self.x+260-4,self.y+75-11+15)
		for h=1,4 do
			for l=1,5 do
				self.资源组[20]:显示(l * 51+ self.x+260-53,h * 51+ self.y+68-51+15) --物品单格子
			end
		end
		zts:置颜色(0xFFFFFFFF)
		self.资源组[3]:更新(x,y,not(self.法宝选中==0),2)
		self.资源组[4]:更新(x,y,not(self.法宝选中==0),2)
		self.资源组[5]:更新(x,y,not(self.法宝选中==0),2)
		self.资源组[11]:更新(x,y)
		self.资源组[12]:更新(x,y)
		-- self.资源组[17]:更新(x,y,self.加入 > 1)
		-- self.资源组[18]:更新(x,y,self.加入 < self.结束 - 20)

		if self.资源组[3]:事件判断() then
			if self.法宝选中==0 then
				tp.常规提示:打开("#Y/请先选中要使用的法宝")
				return
			elseif self.物品[self.法宝选中]~=nil and self.物品[self.法宝选中].物品~=nil then
				发送数据(3736,{序列=self.法宝选中})
			end
		elseif self.资源组[4]:事件判断() then
			if self.法宝选中==0 then
				tp.常规提示:打开("#Y/请先选中要修炼的法宝")
				return
			elseif self.物品[self.法宝选中]~=nil and self.物品[self.法宝选中].物品~=nil and self.物品[self.法宝选中].物品.当前经验~=nil then
				发送数据(3733,{序列=self.法宝选中})
			else
				tp.常规提示:打开("#Y/你没有这样的法宝")
			end
		elseif self.资源组[5]:事件判断() then--补充灵气
			if self.法宝选中==0 then
				tp.常规提示:打开("#Y/请先选中要补充灵气的法宝")
				return
			elseif self.物品[self.法宝选中]~=nil and self.物品[self.法宝选中].物品~=nil and self.物品[self.法宝选中].物品.当前经验~=nil then
				发送数据(3733.1,{序列=self.法宝选中})
			else
				tp.常规提示:打开("#Y/你没有这样的法宝")
			end
		elseif self.资源组[11]:事件判断() and  tp.场景.抓取物品 and tp.场景.抓取物品ID == self.法宝选中 and tp.场景.抓取物品注释  == "法宝背包_法宝" then
			发送数据(3746,{序列=self.法宝选中,放置类型="道具",抓取类型="法宝",})
			tp.场景.抓取物品 = nil
			tp.场景.抓取物品ID = nil
			tp.场景.抓取物品注释 = nil
		elseif self.资源组[12]:事件判断() and  tp.场景.抓取物品 and tp.场景.抓取物品ID == self.法宝选中 and tp.场景.抓取物品注释  == "法宝背包_法宝" then
			发送数据(3746,{序列=self.法宝选中,放置类型="行囊",抓取类型="法宝",})
			tp.场景.抓取物品 = nil
			tp.场景.抓取物品ID = nil
			tp.场景.抓取物品注释 = nil
		end
		self.资源组[3]:显示(self.x+18,self.y+289+15)
		self.资源组[4]:显示(self.x+18+77,self.y+289+15)
		self.资源组[5]:显示(self.x+18+77*2,self.y+289+15)
		self.资源组[11]:显示(self.x+356,self.y+289+15)
		self.资源组[12]:显示(self.x+450,self.y+289+15)
		self.资源组[21]:显示(self.x+80,self.y+158+15)
		self.资源组[21]:显示(self.x+80,self.y+158+40+15)
		self.资源组[21]:显示(self.x+80,self.y+158+40*2+15)
		-- self.资源组[17]:显示(self.x+517,self.y+68)
		-- self.资源组[18]:显示(self.x+517,self.y+260)
		zts:显示(self.x+19,self.y+159+20,"法宝名称")
		zts:显示(self.x+19,self.y+159+40+20,"升级经验")
		zts:显示(self.x+19,self.y+159+40*2+20,"修炼经验")
		zts:显示(self.x+261,self.y+292+16,"把法宝移动至")
		self.加入 = min(ceil((self.结束-20)*self.资源组[19]:取百分比()),self.结束-25)
		-- if self.资源组[17]:事件判断() then--上滚动
		-- 	self.资源组[19]:置起始点(self.资源组[19]:取百分比转换(self.加入-5,20,self.结束))
		-- elseif self.资源组[18]:事件判断() then--下滚动
		-- 	self.资源组[19]:置起始点(self.资源组[19]:取百分比转换(self.加入+5,20,self.结束))
		-- if self.资源组[1]:是否选中(x,y) and 引擎.取鼠标滚轮() ==1 and self.加入 > 0 then--鼠标上滚动
		-- 	self.资源组[19]:置起始点(self.资源组[19]:取百分比转换(self.加入-5,20,self.结束))
		-- elseif self.资源组[1]:是否选中(x,y)  and 引擎.取鼠标滚轮() ==-1 and self.加入 < self.结束 - 25 then--鼠标下滚动
		-- 	self.资源组[19]:置起始点(self.资源组[19]:取百分比转换(self.加入+5,20,self.结束))
		-- end
		self.资源组[19]:显示(self.x+518,self.y+82,x,y,self.鼠标)
		zts:置颜色(0xFFFFFF00)
		zts:显示(self.x+259,self.y+320+16,"左键抓取，右键确定")
		zts:置颜色(绿色):显示(self.x+452,self.y+320+16,"法宝总数："..self.法宝数量)
		--zts:显示(self.x+440,self.y+320,"法宝总数："..#tp.法宝列表 )
		local o = self.开始-1
		if self.法宝选中~=0 then
			if self.物品[self.法宝选中]~=nil and self.物品[self.法宝选中].物品~=nil and self.物品[self.法宝选中].物品.当前经验~=nil then
			   zts:置颜色(白色)
			   zts:显示(self.x+92,self.y+162+17,self.物品[self.法宝选中].物品.名称)
			   zts:显示(self.x+92,self.y+162+40+17,self.物品[self.法宝选中].物品.升级经验)
			   zts:显示(self.x+92,self.y+162+40*2+17,self.物品[self.法宝选中].物品.当前经验)
			end
		end
		for h=1,4 do
			for l=1,5 do
				o = o + 1
				self.物品[o+self.加入]:置坐标(l * 51+ self.x+260-51,h * 51+ self.y+68-51+15)
				self.物品[o+self.加入]:显示(dt,x,y,self.鼠标)
				if self.物品[o+self.加入].焦点 and not tp.消息栏焦点 then
					if self.物品[o+self.加入].物品 ~= nil then
						tp.提示:道具行囊(x,y,self.物品[o+self.加入].物品)
					end
					self.焦点 = true
				end
				if tp.场景.地图.抓取物品 == nil and self.物品[o+self.加入].焦点 and self.物品[o+self.加入].物品 ~= nil  then
					if mousea(1) then
						if self.物品[self.法宝选中]~=nil then
						  self.物品[self.法宝选中].选中=nil
						end
						if self.法宝选中~=o+self.加入 then
						 self.法宝选中=o+self.加入
						 self.物品[o+self.加入].选中=true
						end
					end
				end
				if self.物品[o+self.加入].事件 then
					if tp.场景.抓取物品 == nil and self.物品[o+self.加入].物品 ~= nil and 引擎.鼠标弹起(0x00) then
						self.法宝选中=o+self.加入
						tp.场景.抓取物品 = self.物品[o+self.加入].物品
						tp.场景.抓取物品ID = o+self.加入
						tp.场景.抓取物品注释 = self.物品[o+self.加入].注释
						self.物品[tp.场景.抓取物品ID].确定 = true
						self.物品[o+self.加入]:置物品(nil)
						self.抓取类型=self.点击类型
					elseif tp.场景.抓取物品 ~= nil and self.物品[o+self.加入].物品 == nil and tp.场景.抓取物品ID ~= o+self.加入 and tp.场景.抓取物品注释 == "法宝背包_法宝" then
						发送数据(3701,{抓取id=tp.场景.抓取物品ID,放置id=o+self.加入,放置类型=self.点击类型,抓取类型=self.抓取类型})
						self.物品[tp.场景.抓取物品ID].确定 = false
						tp.场景.抓取物品 = nil
						tp.场景.抓取物品ID = nil
						tp.场景.抓取物品注释 = nil
					elseif tp.场景.抓取物品 ~= nil and self.物品[o+self.加入].物品 ~= nil and tp.场景.抓取物品注释 == "法宝背包_法宝"  then
						local jy = self.物品[o].物品
						local jy1 = tp.场景.抓取物品
						local jy2 = tp.场景.抓取物品ID
						发送数据(3701,{抓取id=tp.场景.抓取物品ID,放置id=o+self.加入,放置类型=self.点击类型,抓取类型=self.抓取类型})
						self.物品[tp.场景.抓取物品ID].确定 = false
						tp.场景.抓取物品 = nil
						tp.场景.抓取物品ID = nil
						tp.场景.抓取物品注释 = nil
					elseif tp.场景.抓取物品 ~= nil and self.物品[o+self.加入].物品 == nil and tp.场景.抓取物品ID == o+self.加入 and tp.场景.抓取物品注释 == "法宝背包_法宝" then
						self.物品[tp.场景.抓取物品ID]:置物品(tp.场景.抓取物品)
						self.物品[tp.场景.抓取物品ID].确定 = false
						tp.场景.抓取物品 = nil
						tp.场景.抓取物品ID = nil
						tp.场景.抓取物品注释 = nil
					end
				end
			end
		end
	elseif self.窗口 =="灵宝" then
		zts:置颜色(0xFFFFFFFF)
		引擎.场景.字体表.标题字体:显示(self.x+269,self.y+16,"灵 宝")
		self.资源组[4]:更新(x,y,not(self.灵宝选中==0),2)
		self.资源组[5]:更新(x,y,not(self.灵宝选中==0),2)
		self.资源组[4]:显示(self.x+18,self.y+317)
		self.资源组[5]:显示(self.x+175,self.y+317)
		self.资源组[21]:显示(self.x+80,self.y+225)
		self.资源组[21]:显示(self.x+80,self.y+225+32)
		self.资源组[21]:显示(self.x+80,self.y+225+32*2)
		zts:显示(self.x+19,self.y+143,"已装备灵宝")
		zts:显示(self.x+19,self.y+231,"灵宝名称")
		zts:显示(self.x+19,self.y+231+32,"升级经验")
		zts:显示(self.x+19,self.y+231+32*2,"修炼经验")
		zts:置颜色(0xFFFFFF00)
		zts:显示(self.x+259,self.y+320,"左键抓取，右键确定")
		zts:置颜色(0xFF00FF00)
		--zts:显示(self.x+440,self.y+320,"灵宝总数："..#tp.灵宝列表)
		if self.资源组[4]:事件判断() then
			if self.灵宝选中==0 then
				tp.常规提示:打开("#Y/请先选中要修炼的法宝")
				return
			elseif self.灵宝物品[self.灵宝选中]~=nil and self.灵宝物品[self.灵宝选中].物品~=nil and self.灵宝物品[self.灵宝选中].物品.当前经验~=nil then
				发送数据(3752,{序列=self.灵宝选中})
			else
				tp.常规提示:打开("#Y/你没有这样的法宝")
			end
		end
		if self.灵宝选中~=0 then
			if self.灵宝物品[self.灵宝选中]~=nil and self.灵宝物品[self.灵宝选中].物品~=nil and self.灵宝物品[self.灵宝选中].物品.当前经验~=nil then
			   zts:置颜色(-16777216)
			   zts:显示(self.x+92,self.y+232,self.灵宝物品[self.灵宝选中].物品.名称)
			   zts:显示(self.x+92,self.y+232+32,self.灵宝物品[self.灵宝选中].物品.升级经验)
			   zts:显示(self.x+92,self.y+232+32*2,self.灵宝物品[self.灵宝选中].物品.当前经验)
			end
		end
		for h=1,4 do
			for l=1,5 do
				self.资源组[20]:显示(l * 51+ self.x+260-53,h * 51+ self.y+68-51)
			end
		end
		for h=1,2 do
			self.资源组[20]:显示(self.x+14+(h*58-58),self.y+160)
			self.灵宝佩戴[h]:置坐标(self.x+16+(h*58-58),self.y+160)
			self.灵宝佩戴[h]:显示(dt,x,y,self.鼠标)
			 if self.灵宝佩戴[h].焦点 and not tp.消息栏焦点 then
				if self.灵宝佩戴[h].物品 ~= nil then
					tp.提示:道具行囊(x,y,self.灵宝佩戴[h].物品)
				end
				if 引擎.鼠标弹起(右键) and self.窗口 =="灵宝" then
					发送数据(3753,{序列=h})
				elseif tp.场景.抓取物品ID~=nil and 引擎.鼠标弹起(左键) and self.窗口 =="灵宝" then
					发送数据(3754,{序列=tp.场景.抓取物品ID,序列1=h})
					tp.场景.抓取物品 = nil
					tp.场景.抓取物品ID = nil
					tp.场景.抓取物品注释 = nil
					self.灵宝物品[self.灵宝选中].确定=false
					self.灵宝物品[self.灵宝选中]:置物品(tp.法宝列表[self.灵宝选中])
				end
			end
		end
		local o = 0
		for h=1,4 do
			for l=1,5 do
				o = o + 1
				self.灵宝物品[o+self.加入]:置坐标(l * 51+ self.x+260-51,h * 51+ self.y+68-51)
				self.灵宝物品[o+self.加入]:显示(dt,x,y,self.鼠标)
				if self.灵宝物品[o+self.加入].焦点 and not tp.消息栏焦点 then
					if self.灵宝物品[o+self.加入].物品 ~= nil then
						tp.提示:道具行囊(x,y,self.灵宝物品[o+self.加入].物品)
					end
					self.焦点 = true
				end
				if tp.场景.地图.抓取物品 == nil and self.灵宝物品[o+self.加入].焦点 and self.灵宝物品[o+self.加入].物品 ~= nil  then
					if mousea(1) then
						if self.灵宝物品[self.灵宝选中]~=nil then
						  	self.灵宝物品[self.灵宝选中].选中=nil
						end
						if self.灵宝选中~=o+self.加入 then
						 	self.灵宝选中=o+self.加入
						 	self.灵宝物品[o+self.加入].选中=true
						end
					end
				end
				if self.灵宝物品[o+self.加入].事件 then
					if tp.场景.抓取物品 == nil and self.灵宝物品[o+self.加入].物品 ~= nil and 引擎.鼠标弹起(0x00) then
						self.灵宝选中=o+self.加入
						tp.场景.抓取物品 = self.灵宝物品[o+self.加入].物品
						tp.场景.抓取物品ID = o+self.加入
						tp.场景.抓取物品注释 = self.灵宝物品[o+self.加入].注释
						self.灵宝物品[tp.场景.抓取物品ID].确定 = true
						self.灵宝物品[o+self.加入]:置物品(nil)
						self.抓取类型=self.点击类型
					elseif tp.场景.抓取物品 ~= nil and self.灵宝物品[o+self.加入].物品 == nil and tp.场景.抓取物品ID ~= o+self.加入 and tp.场景.抓取物品注释 == "法宝背包_灵宝" then
						发送数据(3701,{抓取id=tp.场景.抓取物品ID,放置id=o+self.加入,放置类型=self.点击类型,抓取类型=self.抓取类型})
						self.灵宝物品[tp.场景.抓取物品ID].确定 = false
						tp.场景.抓取物品 = nil
						tp.场景.抓取物品ID = nil
						tp.场景.抓取物品注释 = nil
					elseif tp.场景.抓取物品 ~= nil and self.灵宝物品[o+self.加入].物品 ~= nil and tp.场景.抓取物品注释 == "法宝背包_灵宝"  then
						local jy = self.灵宝物品[o].物品
						local jy1 = tp.场景.抓取物品
						local jy2 = tp.场景.抓取物品ID
						发送数据(3701,{抓取id=tp.场景.抓取物品ID,放置id=o+self.加入,放置类型=self.点击类型,抓取类型=self.抓取类型})
						self.灵宝物品[tp.场景.抓取物品ID].确定 = false
						tp.场景.抓取物品 = nil
						tp.场景.抓取物品ID = nil
						tp.场景.抓取物品注释 = nil
					elseif tp.场景.抓取物品 ~= nil and self.灵宝物品[o+self.加入].物品 == nil and tp.场景.抓取物品ID == o+self.加入 and tp.场景.抓取物品注释 == "法宝背包_灵宝" then
						self.灵宝物品[tp.场景.抓取物品ID]:置物品(tp.场景.抓取物品)
						self.灵宝物品[tp.场景.抓取物品ID].确定 = false
						tp.场景.抓取物品 = nil
						tp.场景.抓取物品ID = nil
						tp.场景.抓取物品注释 = nil
					end
				end
			end
		end
	elseif self.窗口 =="神器" then
		引擎.场景.字体表.标题字体:显示(self.x+269,self.y+16,"神 器")
		if self.是否佩戴神器 then
			self.资源组[9]:置文字("卸下")
		else
			self.资源组[9]:置文字("装备")
		end
		self.资源组[9]:更新(x,y) --装备
		self.资源组[10]:更新(x,y) --修复
		self.资源组[5]:更新(x,y) --补充灵气
		self.资源组[9]:显示(self.x + 265,self.y + 328)
		self.资源组[10]:显示(self.x + 365,self.y + 328)
		self.资源组[5]:显示(self.x + 465,self.y + 328)
		self.资源组[22]:更新(x,y)
		self.资源组[22]:显示(self.x+10,self.y+308)
		self.shenqizu[12]:显示(self.x + 265,self.y + 80)
		self.shenqizu[13]:显示(self.x + 30,self.y + 145)
		self.shenqizu[14]:显示(self.x + 145,self.y + 145)
		self.shenqizu[15]:显示(self.x + 140,self.y + 195)
		self.神器图片集:显示(self.x + 神器大图与坐标[tp.队伍[1].门派][2],self.y + 神器大图与坐标[tp.队伍[1].门派][3])
		self.神器文字集:显示(self.x + 280,self.y + 100)
		for k,v in pairs(self.属性数值) do
			if v>0 then
				zts:置颜色(白色):显示(self.x + 30, self.y + self.miaoshu[k][2],self.miaoshu[k][1].." +"..v)
			else
			    zts:置颜色(ARGB(255,125,125,125)):显示(self.x + 30, self.y + self.miaoshu[k][2],self.miaoshu[k][1].." +0")
			end
		end
		zts:置颜色(白色):显示(self.x + 163,self.y + 175,self.神器属性.神器技能.name)
		self.介绍文本:置行距(5):显示(self.x + 135,self.y + 205)
		zts:置颜色(0xffffcc66):显示(self.x + 30,self.y + 335,"点击右侧装备按钮，装备神器。")
		zts:置颜色(白色):显示(self.x + 415,self.y + 285,"剩余灵气："..self.神器属性.灵气)
		if self.资源组[10]:事件判断() then --修复按钮
		    发送数据(6208)
			self:打开()
			return
		elseif self.资源组[9]:事件判断() then
			if self.是否佩戴神器 and self.神器格子 then
                发送数据(3734,{序列=self.神器格子,神器=true})
			else
			    tp.场景.抓取神器=self.sq
			end
		elseif self.资源组[22]:事件判断() then
			发送数据(3817)

		end
	end
end



function 场景类_法宝:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_法宝:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
		self.窗口时间 = tp.运行时间
	end
	if not self.焦点 and self.资源组[19]:是否选中(x,y) == false then
		tp.移动窗口 = true
	end
	if self.鼠标 and  not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_法宝:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_法宝