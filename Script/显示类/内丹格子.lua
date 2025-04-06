-- @Author: baidwwy
-- @Date:   2024-04-03 22:06:52
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-04-08 23:49:53

local 系统类_内丹格子 = class()
local mouse = 引擎.鼠标弹起


function 系统类_内丹格子:初始化(x,y,ID,注释)
	self.x = x
	self.y = y
	self.注释 = 注释
	self.技能 = nil
	self.事件 = false
	self.焦点 = false
end

function 系统类_内丹格子:置内丹(内丹,cz,bb)
	if 内丹 ~= nil and 内丹.技能 ~= nil then
		self.内丹 = 内丹
		item = self:取内丹数据(内丹.技能,内丹.等级,cz,bb)
		self.内丹.说明 = item.说明
		self.内丹.效果 = item.效果
		self.内丹.模型 = 引擎.场景.资源:载入(item.资源,"网易WDF动画",item.模型)
		self.内丹.小模型 = 引擎.场景.资源:载入(item.资源,"网易WDF动画",item.模型)
	else
		self.内丹=nil
	end
	self.外框 = 引擎.场景.资源:载入('wzife.wd1',"网易WDF动画",0x3FEEB486)
end
function 系统类_内丹格子:取内丹数据(wd,s,cz,bb) --名称，内丹等级，坐骑成长，宝宝
	local wds = {}
	local ls3 = 1+(s*0.2)+cz
	if wd == "迅敏" then
		wds.说明 = "提升召唤兽伤害力与速度，提升效果受召唤兽自身等级影响。"
		wds.效果 = "增加"..math.floor(bb.等级 *(0.08*ls3)).."点伤害与"..math.floor(bb.等级 *(0.05*ls3)).."点速度，随内丹等级提升而增加。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0x6FA0B3A8
	elseif wd == "狂怒" then
		wds.说明 = "提升必杀/高级必杀技能触发时造成的伤害，但是受到水、土二系法术攻击时将承受额外的伤害。"
		wds.效果 = "必杀时增加"..math.floor(ls3*80).."点伤害，但是额外受到15%水、土系法术伤害。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0x956BD457
	elseif wd == "阴伤" then
		wds.说明 = "提升连击/高级连击技能第二次攻击造成的伤害，但是受到火、雷二系法术攻击时将承受额外的伤害。"
		wds.效果 = "连击时增加"..math.floor(ls3*50).."点伤害，但是额外受到15%火、雷系法术伤害。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0x3EF0A9BF
	elseif wd == "静岳" then
		wds.说明 = "提升召唤兽灵力与气血，提升效果受召唤兽自身等级影响。"
		wds.效果 = "增加"..math.floor(bb.等级 *(0.04*ls3)).."点灵力与"..math.floor(bb.等级 *(0.4*ls3)).."点气血，随内丹等级提升而增加。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0xF58C6B1D
	elseif wd == "擅咒" then
		wds.说明 = "提升召唤兽对目标的法术伤害。"
		wds.效果 = "法术伤害结果增加"..math.floor(ls3*12).."点。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0x4D74B795
	elseif wd == "灵身" then
		wds.说明 = "提升法术爆击/高级法术爆击触发时的伤害，但是受到携带强力与高级强力技能召唤兽物理攻击时，承受额外的伤害。"
		wds.效果 = "法术暴击伤害增加"..math.floor(ls3*7).."%，但是受到强力、高强力技能额外伤害。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0x55124270
	 elseif wd == "矫健" then
		wds.说明 = "提升召唤兽气血与速度，提升效果受召唤兽自身等级影响。"
		wds.效果 = "增加"..math.floor(bb.等级 *(0.4*ls3)).."点气血与"..math.floor(bb.等级 *(0.05*ls3)).."点速度，随召唤兽等级提升而增加。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0x3877515B
	elseif wd == "深思" then
		wds.说明 = "高冥思的效果得到加强。"
		wds.效果 = "当魔法值小于最大魔法值上限的20%，高级冥思效果增加"..(ls3*20).."%"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0x9912B979
	elseif wd == "钢化" then
		wds.说明 = "拥有防御或高级防御技能的召唤兽能提升防御效果，但在受到除固定伤害外的其他法术攻击时，受到的伤害增加。"
		wds.效果 = "防御、高级防御技能效果增加"..math.floor(bb.等级 *(0.2*ls3)).."点，所受法术伤害增加10%。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0x89C1F027
	elseif wd == "坚甲" then
		wds.说明 = "拥有反震或高级反震技能的召唤兽能提升对敌人造成的反震伤害。"
		wds.效果 = "对敌人所造成的反震伤害增加"..math.floor(ls3*100).."点。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0x2788B6E8
	elseif wd == "慧心" then
		wds.说明 = "提升召唤兽抵抗封印几率。"
		wds.效果 = "增加"..(ls3*6).."%的抗封印几率。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0xB6A27748
	elseif wd == "撞击" then
		wds.说明 = "提升召唤兽物理攻击命中几率，提升效果受召唤兽体质点影响，同时提升一定的伤害结果。"
		wds.效果 = "物理攻击时增加"..(string.format("%.2f", bb.体质/bb.等级*(0.1*ls3))*100).."%命中几率，效果与召唤兽体质点相关，同时增加5点伤害结果。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0xE837F9B1
	elseif wd == "无畏" then
		wds.说明 = "提升对拥有反震/高级反震技能目标的物理伤害。"
		wds.效果 = "对待有反震、高级反震技能的目标造成的物理伤害增加"..(ls3*2).."%。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0xE8FDD3F4
	elseif wd == "愤恨" then
		wds.说明 = "提升召唤兽对拥有幸运/高级幸运技能目标的物理伤害。"
		wds.效果 = "对待有幸运、高级幸运技能的目标造成的物理伤害增加"..(ls3*2).."%。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0x9F97DB7F
	elseif wd == "淬毒" then --没写，写完鬼魂。信仰类技能再写 明天早上起来写这个，先在添加状态那里判断？？
		wds.说明 = "提升毒/高级毒技能的中毒触发几率。"
		wds.效果 = "命中目标后致毒的几率增加"..(ls3*5).."%。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0x4A491950
	elseif wd == "狙刺" then
		wds.说明 = "提升召唤兽对施法选定目标的法术伤害，提升效果受召唤兽等级影响。"
		wds.效果 = "对施法选定目标法术伤害增加"..math.floor(bb.等级 *(0.15*ls3)).."点。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0x9762CCF9
	elseif wd == "连环" then
		wds.说明 = "提升连击/高级连击技能触发连击的几率。"
		wds.效果 = "连击的几率增加"..(ls3*2).."%。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0xE2D19F8F
	elseif wd == "圣洁" then
		wds.说明 = "提升驱鬼/高驱鬼技能对鬼魂召唤兽的法术伤害效果。"
		wds.效果 = "驱鬼的效果在原基础上增加"..(ls3*10).."%。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0x809E53A3
	elseif wd == "灵光" then
		wds.说明 = "提升召唤兽法术伤害，提升效果受召唤兽自身法力点数影响。"
		wds.效果 = "增加"..math.floor(bb.魔力 *(0.02*ls3)).."点法术伤害。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0xC0EAFCA3
	elseif wd == "神机步" then
		wds.说明 = "进入战斗后三回合内提升召唤兽躲避力。"
		wds.效果 = "进入战斗时三回合内的躲避值增加"..(100*ls3).."%。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0x19D18973
	elseif wd == "腾挪劲" then
		wds.说明 = "召唤兽受到物理攻击时，有一定几率化解部分伤害。"
		wds.效果 = "受到物理攻击时有"..math.floor(ls3*4).."%的几率抵挡50%的伤害。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0x06EF9E7B
	elseif wd == "玄武躯" then
		wds.说明 = "提升召唤兽气血，提升效果受召唤兽等级影响，但是将减少召唤兽所有攻击方式造成的伤害。"
		wds.效果 = "增加"..math.floor(bb.等级 *(2*ls3)).."点气血，对目标造成伤害减少50%。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0xC842B66C
	elseif wd == "龙胄铠" then
		wds.说明 = "提升召唤兽防御，提升效果受召唤兽等级影响，但是将减少召唤兽所有攻击方式造成的伤害。"
		wds.效果 = "增加"..math.floor(bb.等级 /(2*ls3)).."点防御，对目标造成伤害减少50%。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0x4E9FBEE0
	elseif wd == "玉砥柱" then
		wds.说明 = "被壁垒击破、力劈华山、善恶有报、死亡召唤、惊心一剑攻击时，降低一定伤害，但自己所有攻击方式造成的伤害也会减少。"
		wds.效果 = "被壁垒击破、力劈华山、善恶有报、死亡召唤、惊心一剑攻击的伤害降低"..math.floor(ls3*7).."%；但是对其他目标造成的伤害减少20%。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0x5DAD21DF
	 elseif wd == "碎甲刃" then
		wds.说明 = "召唤兽普通物理攻击时将有一定几率降低攻击目标的物理防御，效果持续两回合。"
		wds.效果 = "普通物理攻击后减低目标后有30%几率降低目标"..math.floor(5+(bb.力量-bb.等级)*(0.15*ls3)).."点防御，效果受自身力量点影响。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0xCDDAE9FF
	elseif wd == "阴阳护" then --
		wds.说明 = "降低召唤兽保护其他目标时所承受的伤害。"
		wds.效果 = "保护目标时承受的伤害减少"..(ls3*10).."%。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0x9041DD3F
	elseif wd == "凛冽气" then
		wds.说明 = "携带该内丹的召唤兽在场时，可降低本方所有召唤兽的逃跑几率。(包括自身的)"
		wds.效果 = "本方所有召唤兽逃跑的几率减少"..(ls3*10).."%。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0x38808205
	elseif wd == "舍身击" then
		wds.说明 = "提升物理攻击造成的伤害，提升效果受召唤兽自身力量点数影响。"
		wds.效果 = "物理攻击伤害结果增加"..math.floor((bb.力量-bb.等级)*(0.1*ls3)).."点，效果受自身力量点影响。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0x10E2B4A7
	elseif wd == "电魂闪" then
		wds.说明 = "使用单体法术攻击目标时有几率驱散目标随机1种增益状态。"
		wds.效果 = "单体法术命中目标时有"..(ls3*15).."%的概率驱散对方某种增益状态。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0x624D3F68
	elseif wd == "通灵法" then
		wds.说明 = "提升召唤兽忽视目标法术减免效果的能力。"
		wds.效果 = "忽视".. math.floor(ls3*4).."%的法术伤害减免能力。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0xBD739B98
	elseif wd == "双星爆" then
		wds.说明 = "提升法术连击/高级法术连击技能触发第二次法术攻击造成的伤害。"
		wds.效果 = "法术连击第二下伤害增加"..(ls3*16).."%。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0x8AD71FAF
	elseif wd == "催心浪" then
		wds.说明 = "提升法术波动/高级法术波动技能触发时的伤害波动下限。"
		wds.效果 = "法术波动下限提升"..math.floor((ls3*5)).."%。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0x5CEDA8EC
	elseif wd == "隐匿击" then
		wds.说明 = "降低拥有隐身/高级隐身技能的召唤兽在隐身状态下减少的伤害值。"
		wds.效果 = "隐身状态下降低的伤害降低"..math.floor(ls3*2).."%。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0x0A21302B
	elseif wd == "生死决" then
		wds.说明 = "提升召唤兽将自身防御的一部分转化为伤害力的几率，提升效果持续到本回合结束。"
		wds.效果 = "增加"..math.floor(ls3*3).."%的狂暴几率。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0x2AA03A67
	elseif wd == "血债偿" then
		wds.说明 = "本方不带本技能召唤兽每被击飞一次，提升一次拥有本技能召唤兽对目标造成的法术伤害，持续到战斗结束。提升效果最多叠加5次，且受召唤兽自身魔力点数影响，不能与鬼魂和高级鬼魂技能共存。"
		wds.效果 = "本方每被击飞一个不带有此技能的召唤兽，自身对目标造成的法术伤害增加"..math.floor((bb.魔力-bb.等级)*(0.06*ls3)).."点，持续到战斗结束。"
		wds.资源 = "wzife.wd2"
		wds.模型 = 0x97117DEE
	elseif wd == "未知" then
		wds.说明 = ""
		wds.效果 = ""
		wds.资源 = "wzife.wd2"
		wds.模型 = 0x98D169DA
	end
	return  wds
end
function 系统类_内丹格子:显示(x,y,条件,dt)
	if self.内丹 == nil then
		return
	end
	self.右键 = false
	self.事件 = false
	self.焦点 = false
	if 条件 and self.内丹.模型:是否选中(x,y) then
		tp.按钮焦点 = true
		tp.禁止关闭 = true
		self.焦点 = true
		self.内丹.模型:置高亮()
		if mouse(0) then
			self.事件 = true
		elseif 	mouse(1) then
			self.右键 = true
		end
	else
		self.内丹.模型:取消高亮()
	end
	if self.剩余冷却回合 ~= nil then
		self.内丹.模型:灰度级()
	end
	self.内丹.模型:显示(self.x,self.y)
	if self.内丹.等级< 5 then
		self.外框:显示(self.x,self.y)
		self.外框:更新(dt)
	end
end

function 系统类_内丹格子:置坐标(x,y)
	self.x = x
	self.y = y
end


return 系统类_内丹格子