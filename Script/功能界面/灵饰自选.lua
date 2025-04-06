-- @Author: baidwwy
-- @Date:   2024-08-21 19:28:51
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-10-29 03:38:59
local 灵饰自选 = class()
local zts,zts1,zts2
local 灵饰正常属性={}
local 灵饰附加属性={}
function 灵饰自选:初始化(根)
	self.ID = 92
	self.x = 152
	self.y = 88
	self.xx = 0
	self.yy = 0
	self.注释 = "灵饰自选"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	zts = require("gge文字类").创建(nil,16,true,false,true)
	zts1 = require("gge文字类").创建(nil,14,true,false,true)
	zts2 = require("gge文字类").创建(nil,13,true,false,true)
	tp = 根
	self.介绍文本 = 根._丰富文本(130,90)
end

function 灵饰自选:取名称(名称)
	if  名称=="120灵饰自选-戒指" then--140灵饰自选-手镯
		灵饰正常属性={"伤害","防御"}
		灵饰附加属性={"固定伤害","法术伤害","伤害","封印命中等级","法术暴击等级","物理暴击等级","狂暴等级","穿刺等级","法术伤害结果","治疗能力","速度"}
		return "悦碧水"
	elseif 名称=="140灵饰自选-戒指" then
		灵饰正常属性={"伤害","防御"}
		灵饰附加属性={"固定伤害","法术伤害","伤害","封印命中等级","法术暴击等级","物理暴击等级","狂暴等级","穿刺等级","法术伤害结果","治疗能力","速度"}
		return "九曜光华"
	elseif 名称=="120灵饰自选-手镯" then
		灵饰正常属性={"封印命中等级","抵抗封印等级"}
		灵饰附加属性={"气血","气血回复效果","防御","抵抗封印等级","抗法术暴击等级","格挡值","法术防御","抗物理暴击等级"}
		return "花映月"
	elseif 名称=="140灵饰自选-手镯" then
		灵饰正常属性={"封印命中等级","抵抗封印等级"}
		灵饰附加属性={"气血","气血回复效果","防御","抵抗封印等级","抗法术暴击等级","格挡值","法术防御","抗物理暴击等级"}
		return "金水菩提"
	elseif 名称=="120灵饰自选-佩饰" then
		灵饰正常属性={"速度"}
		灵饰附加属性={"气血","气血回复效果","防御","抵抗封印等级","抗法术暴击等级","格挡值","法术防御","抗物理暴击等级"}
		return "相思染"
	elseif 名称=="140灵饰自选-佩饰" then
		灵饰正常属性={"速度"}
		灵饰附加属性={"气血","气血回复效果","防御","抵抗封印等级","抗法术暴击等级","格挡值","法术防御","抗物理暴击等级"}
		return "玄龙苍珀"
	elseif 名称=="120灵饰自选-耳饰" then
		灵饰正常属性={"法术伤害","法术防御"}
		灵饰附加属性={"固定伤害","法术伤害","伤害","封印命中等级","法术暴击等级","物理暴击等级","狂暴等级","穿刺等级","法术伤害结果","治疗能力","速度"}
		return "点星芒"
	elseif 名称=="140灵饰自选-耳饰" then
		灵饰正常属性={"法术伤害","法术防御"}
		灵饰附加属性={"固定伤害","法术伤害","伤害","封印命中等级","法术暴击等级","物理暴击等级","狂暴等级","穿刺等级","法术伤害结果","治疗能力","速度"}
		return "凤羽流苏"

	-- elseif  名称=="100级灵饰戒指礼包" then
	-- 	灵饰正常属性={"伤害","防御"}
	-- 	灵饰附加属性={"固定伤害","法术伤害","伤害","封印命中等级","法术暴击等级","物理暴击等级","狂暴等级","穿刺等级","法术伤害结果","治疗能力","速度"}
	-- 	return "金麟绕"
	-- elseif 名称=="80级灵饰戒指礼包" then
	-- 	灵饰正常属性={"伤害","防御"}
	-- 	灵饰附加属性={"固定伤害","法术伤害","伤害","封印命中等级","法术暴击等级","物理暴击等级","狂暴等级","穿刺等级","法术伤害结果","治疗能力","速度"}
	-- 	return "芙蓉戒"
	-- elseif 名称=="100级灵饰手镯礼包" then
	-- 	灵饰正常属性={"封印命中等级","抵抗封印等级"}
	-- 	灵饰附加属性={"气血","气血回复效果","防御","抵抗封印等级","抗法术暴击等级","格挡值","法术防御","抗物理暴击等级"}
	-- 	return "墨影扣"
	-- elseif 名称=="80级灵饰手镯礼包" then
	-- 	灵饰正常属性={"封印命中等级","抵抗封印等级"}
	-- 	灵饰附加属性={"气血","气血回复效果","防御","抵抗封印等级","抗法术暴击等级","格挡值","法术防御","抗物理暴击等级"}
	-- 	return "翡玉镯"
	-- elseif 名称=="100级灵饰佩饰礼包" then
	-- 	灵饰正常属性={"速度"}
	-- 	灵饰附加属性={"气血","气血回复效果","防御","抵抗封印等级","抗法术暴击等级","格挡值","法术防御","抗物理暴击等级"}
	-- 	return "莲音玦"
	-- elseif 名称=="80级灵饰佩饰礼包" then
	-- 	灵饰正常属性={"速度"}
	-- 	灵饰附加属性={"气血","气血回复效果","防御","抵抗封印等级","抗法术暴击等级","格挡值","法术防御","抗物理暴击等级"}
	-- 	return "逸云佩"
	-- elseif 名称=="100级灵饰耳饰礼包" then
	-- 	灵饰正常属性={"法术伤害","法术防御"}
	-- 	灵饰附加属性={"固定伤害","法术伤害","伤害","封印命中等级","法术暴击等级","物理暴击等级","狂暴等级","穿刺等级","法术伤害结果","治疗能力","速度"}
	-- 	return "玉蝶翩"
	-- elseif 名称=="80级灵饰耳饰礼包" then
	-- 	灵饰正常属性={"法术伤害","法术防御"}
	-- 	灵饰附加属性={"固定伤害","法术伤害","伤害","封印命中等级","法术暴击等级","物理暴击等级","狂暴等级","穿刺等级","法术伤害结果","治疗能力","速度"}
	-- 	return "明月珰"
	end
end

function 灵饰自选:打开(类型)
	if self.可视 then
	   self.可视 = false
	else
		local item_mc = self:取名称(类型.类型)
		local dj = 引擎.取物品(item_mc)
		self.道具 = {名称=item_mc,介绍=dj[1],幻化属性={附加={},基础={}}}
		self.灵饰类型 = 类型.类型
		self.道具.大模型 = tp.资源:载入(dj[11],"网易WDF动画",dj[13])
		table.insert(tp.窗口_,self)
		local 按钮 = tp._按钮
		local 自适应 = tp._自适应
		local 资源 = tp.资源
		self.资源组 = {
			[1] = 自适应.创建(0,1,290,405,3,9), --背景
			[2] = 按钮.创建(自适应.创建(12,4,55,22,1,1),0,0,4,92,true,"提交"),
			[3] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,92,true),
		}
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.介绍文本:清空()
	    self.介绍文本:添加文本(self.道具.介绍)
		for i=1,4 do
			self.资源组[#self.资源组+1]=按钮.创建(自适应.创建(25,4,19,19,4,3),0,0,4,92,true)
		end
		self.基础属性 = 按钮.创建(自适应.创建(25,4,19,19,4,3),0,0,4,92,true)
		self.选中行数 =1
	end
end

function 灵饰自选:更新(dt)end

function 灵饰自选:设置附加(类型)
	if self.选中行数 > 4 then
		self.选中行数 = 1
	end
	self.道具.幻化属性.附加[self.选中行数] = {类型=类型}
	self.选中行数=1
end

function 灵饰自选:设置基础(类型)
	self.道具.幻化属性.基础 = {类型=类型}
	self.选中行数=1
end

function 灵饰自选:取数值(名称,类型,基础)
	if  名称=="120灵饰自选-戒指" then
		if (类型 == "伤害" or 类型 == "防御") and 基础 ~= nil then
			return 35
		else
			return 30
		end
	elseif 名称=="140灵饰自选-戒指" then
		if (类型 == "伤害" or 类型 == "防御") and 基础 ~= nil then
			return 50
		else
			return 40
		end
	elseif 名称=="120灵饰自选-手镯" then
		if 类型 == "封印命中等级" or 类型 == "抵抗封印等级" then
			return 35
		elseif 类型 == "气血" then
			return 120
		else
			return  30
		end
	elseif 名称=="140灵饰自选-手镯" then
		if 类型 == "封印命中等级" or 类型 == "抵抗封印等级" then
			return 50
		elseif 类型 == "气血" then
			return 150
		else
			return 40
		end
	elseif 名称=="120灵饰自选-佩饰" then
		if 类型 == "速度" then
			return 35
		elseif 类型 == "气血" then
			return 120
		else
			return  30
		end
	elseif 名称=="140灵饰自选-佩饰" then
		if 类型 == "速度" then
			return 50
		elseif 类型 == "气血" then
			return 150
		else
			return 40
		end
	elseif 名称=="120灵饰自选-耳饰" then
		if (类型 == "法术伤害" or 类型 == "法术防御") and 基础 ~= nil then
			return 35
		else
			return 30
		end
	elseif 名称=="140灵饰自选-耳饰" then
		if (类型 == "法术伤害" or 类型 == "法术防御") and 基础 ~= nil then
			return 50
		else
			return 40
		end
	-- elseif  名称=="100级灵饰戒指礼包" then
	-- 	if (类型 == "伤害" or 类型 == "防御") and 基础 ~= nil then
	-- 		return 35
	-- 	else
	-- 		return 30
	-- 	end
	-- elseif 名称=="80级灵饰戒指礼包" then
	-- 	if (类型 == "伤害" or 类型 == "防御") and 基础 ~= nil then
	-- 		return 50
	-- 	else
	-- 		return 40
	-- 	end
	-- elseif 名称=="100级灵饰手镯礼包" then
	-- 	if 类型 == "封印命中等级" or 类型 == "抵抗封印等级" then
	-- 		return 35
	-- 	elseif 类型 == "气血" then
	-- 		return 120
	-- 	else
	-- 		return  30
	-- 	end
	-- elseif 名称=="80级灵饰手镯礼包" then
	-- 	if 类型 == "封印命中等级" or 类型 == "抵抗封印等级" then
	-- 		return 50
	-- 	elseif 类型 == "气血" then
	-- 		return 150
	-- 	else
	-- 		return 40
	-- 	end
	-- elseif 名称=="100级灵饰佩饰礼包" then
	-- 	if 类型 == "速度" then
	-- 		return 35
	-- 	elseif 类型 == "气血" then
	-- 		return 120
	-- 	else
	-- 		return  30
	-- 	end
	-- elseif 名称=="80级灵饰佩饰礼包" then
	-- 	if 类型 == "速度" then
	-- 		return 50
	-- 	elseif 类型 == "气血" then
	-- 		return 150
	-- 	else
	-- 		return 40
	-- 	end
	-- elseif 名称=="100级灵饰耳饰礼包" then
	-- 	if (类型 == "法术伤害" or 类型 == "法术防御") and 基础 ~= nil then
	-- 		return 35
	-- 	else
	-- 		return 30
	-- 	end
	-- elseif 名称=="80级灵饰耳饰礼包" then
	-- 	if (类型 == "法术伤害" or 类型 == "法术防御") and 基础 ~= nil then
	-- 		return 50
	-- 	else
	-- 		return 40
	-- 	end
	end
	return {0,0}
end

function 灵饰自选:显示(dt,x,y)
	self.焦点=false
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y)
	self.基础属性:更新(x,y)
	if self.基础属性:事件判断() then
		tp.窗口.对话栏:文本("女人_万圣公主","灵饰基础","请选择灵饰基础属性",灵饰正常属性)
	end
	for i=4,#self.资源组 do
	    self.资源组[i]:更新(x,y,self.道具.幻化属性.基础.类型~=nil and (self.道具.幻化属性.附加[i-4] ~= nil or i == 4) )
	    if self.资源组[i]:事件判断() then
	    	tp.窗口.对话栏:文本("女人_万圣公主","灵饰附加","请选择灵饰附加的属性",灵饰附加属性)
	    	self.选中行数 = i-3
	    end
	end
	if self.资源组[3]:事件判断() then
		self:打开()
	elseif self.资源组[2]:事件判断() then
		if self.道具.幻化属性.基础.类型 == nil then
			tp.提示:写入("#Y/请选择灵饰基础属性")
			return
		elseif #self.道具.幻化属性.附加 < 4 then
			tp.提示:写入("#Y/请选择灵饰附加属性")
			return
		end
		local function 事件()
			发送数据(3778,{幻化属性=self.道具.幻化属性})
			self:打开()
			return
		end
		tp.窗口.文本栏:载入("属性一旦选定无法更改,你确定要提交么?",nil,true,事件)
	end
	self.资源组[1]:显示(self.x,self.y)

	for i=4,#self.资源组 do
	    self.资源组[i]:显示(self.x+240,self.y+155+(i-3)*26)
	end
	self.基础属性:显示(self.x+240,self.y+145)
	self.道具.大模型:显示(self.x+15,self.y+55)
	zts:置颜色(黄色)
	zts:显示(self.x+110,self.y+40,self.道具.名称)
	self.介绍文本:显示(self.x+140,self.y+70)
	if self.道具.幻化属性.基础.类型 ~= nil then
		zts2:置颜色(黄色)
		zts2:显示(self.x+140,self.y+145,self.道具.幻化属性.基础.类型)
	end
	self.资源组[2]:显示(self.x+210,self.y+375)
	self.资源组[3]:显示(self.x+270,self.y+3)
	zts1:置颜色(绿色)
	for i in pairs(self.道具.幻化属性.附加) do
		if self.道具.幻化属性.附加[i] ~= nil then
	    	zts1:显示(self.x+70,self.y+155+i*26,self.道具.幻化属性.附加[i].类型)
	    end
	end
end

function 灵饰自选:初始移动(x,y)
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

function 灵饰自选:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end
function 灵饰自选:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	else
		return false
	end
end
return 灵饰自选