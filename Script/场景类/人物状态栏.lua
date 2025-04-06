-- @Author: baidwwy
-- @Date:   2024-06-13 16:59:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-05 18:59:19
local 场景类_人物状态栏 = class()

local bwh = require("gge包围盒")
local bw = bwh(0,0,25,276)
local bw1 = bwh(0,0,120,36)
local bw2 = bwh(0,0,244,20)
local floor = math.floor
local format = string.format
local min = math.min
local box = 引擎.画矩形
local zt = {"人\n物\n属\n性","师\n门\n技\n能","辅\n助\n技\n能","修\n炼\n技\n能","修\n仙\n属\n性"}
local fl = {"人物属性","师门技能","辅助技能","修炼技能","修仙属性"}
local bd = {"体质","魔力","力量","耐力","敏捷"}
local bd1 = {"命中","伤害","防御","速度","法伤","法防"}
local as = {"攻击修炼","防御修炼","法术修炼","抗法修炼","猎术修炼"}
local as1 = {"攻击控制力","防御控制力","法术控制力","抗法控制力"}
local wz = {"名称","","帮派","门派","等级","人气","帮贡","门贡","气血","魔法","愤怒","活力","体力","命中","伤害","防御","速度","法伤","法防","体质","魔力","力量","耐力","敏捷","潜力"}
local tp,mmzt,zts1,zts2,zts3
local mousea = 引擎.鼠标弹起
local insert = table.insert
local tostring = tostring
function 场景类_人物状态栏:刷新属性啊()
	rw = tp.队伍[1]
end
function 场景类_人物状态栏:初始化(根)
	self.ID = 1
	self.x = 全局游戏宽度-300
	self.y = 85
	self.xx = 0
	self.yy = 0
	self.注释 = "人物状态栏"
	self.可视 = false
	self.鼠标 = true
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,293,414,3,9),
		[2] = 资源:载入('pic/xlbj.png',"图片"),--自适应.创建(2,1,130,117,3,9),
		[5] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true), --关闭
		[6] = 按钮.创建(自适应.创建(27,4,25,69,4,3),0,0,5,true,true),
		[7] = 按钮.创建(自适应.创建(27,4,25,69,4,3),0,0,5,true,true),
		[8] = 按钮.创建(自适应.创建(27,4,25,69,4,3),0,0,5,true,true),
		[9] = 按钮.创建(自适应.创建(27,4,25,69,4,3),0,0,5,true,true),
		[10] =  按钮.创建(自适应.创建(12,4,37,22,1,3),0,0,4,true,true,"称谓"),
		[11] =  按钮.创建(自适应.创建(25,4,19,19,4,3),0,0,4,true,true),--+++
		[12] =  按钮.创建(自适应.创建(25,4,19,19,4,3),0,0,4,true,true),
		[13] =  按钮.创建(自适应.创建(25,4,19,19,4,3),0,0,4,true,true),
		[14] =  按钮.创建(自适应.创建(25,4,19,19,4,3),0,0,4,true,true),
		[15] =  按钮.创建(自适应.创建(25,4,19,19,4,3),0,0,4,true,true),
		[16] =  按钮.创建(自适应.创建(26,4,19,19,4,3),0,0,4,true,true),-----
		[17] =  按钮.创建(自适应.创建(26,4,19,19,4,3),0,0,4,true,true),
		[18] =  按钮.创建(自适应.创建(26,4,19,19,4,3),0,0,4,true,true),
		[19] =  按钮.创建(自适应.创建(26,4,19,19,4,3),0,0,4,true,true),
		[20] =  按钮.创建(自适应.创建(26,4,19,19,4,3),0,0,4,true,true),
		[21] =  按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"预览"),
		[22] =  按钮.创建(自适应.创建(12,4,78,22,1,3),0,0,4,true,true,"更多属性"),
		[23] =  按钮.创建(自适应.创建(12,4,78,22,1,3),0,0,4,true,true,"推荐加点"),
		[24] =  按钮.创建(自适应.创建(12,4,78,22,1,3),0,0,4,true,true,"确认加点"),
		[25] =  按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"升级"),
		[26] =  按钮.创建(自适应.创建(12,4,70,22,1,3),0,0,4,true,true,"经脉流派"),
		[27] =  按钮.创建(自适应.创建(12,4,44,22,1,3),0,0,4,true,true,"使用"),
		[28] =  按钮.创建(自适应.创建(12,4,44,22,1,3),0,0,4,true,true,"自动"),
		[29] = 按钮.创建(自适应.创建(17,4,72,22,1,3),0,0,4,true,true,"生活技能"),
		[30] = 按钮.创建(自适应.创建(17,4,72,22,1,3),0,0,4,true,true,"剧情技能"),
		[31] = 按钮.创建(自适应.创建(17,4,72,22,1,3),0,0,4,true,true,"其他技能"),
		[32] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"  烹饪"),
		[33] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"  炼药"),
		[34] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"  使用"),
		[35] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"  摆摊"),
		[36] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"  学习"),
		[37] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"  飞行"),
		[38] = 自适应.创建(3,1,40,19,1,3),
		[39] = 资源:载入('org.rpk',"网易WDF动画",0x1000368),
		[40] = 资源:载入('org.rpk',"网易WDF动画",0x1000368),
		[41] = 资源:载入('org.rpk',"网易WDF动画",0x1000375),
		[42] = 资源:载入('org.rpk',"网易WDF动画",0x1000372),
		--[43] = 自适应.创建(1,1,255,18,1,3,nil,18),
		[44] = 自适应.创建(4,1,155,220,3,nil),
		[45] = 按钮.创建(自适应.创建(12,4,78,22,1,3),0,0,4,true,true,"设为当前"),
		[46] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true),
		[47] = 按钮.创建(自适应.创建(12,4,24,22,1,3),0,0,4,true,true,"<"),
		[48] = 按钮.创建(自适应.创建(12,4,24,22,1,3),0,0,4,true,true,">"),
		[49] = 资源:载入("common/wzife.wdf","网易WDF动画",0x92afddde),
		[50] =  按钮.创建(自适应.创建(12,4,44,22,1,3),0,0,4,true,true,"侵蚀"),
	}
	for i=5,37 do
		self.资源组[i]:绑定窗口_(1)
		if i >= 29 and i <= 31 then
			self.资源组[i]:置偏移(-3,-1)
		end
	end
	self.资源组[10]:置偏移(-3,0)
	self.资源组[47]:置偏移(0,-1)
	self.资源组[48]:置偏移(0,-1)
	self.资源组[29]:置偏移(1,0)
	self.资源组[30]:置偏移(1,0)
	self.资源组[31]:置偏移(1,0)
	-- self.资源组[21]:置偏移(-4,0)
	-- self.资源组[25]:置偏移(-4,0)
	-- self.资源组[27]:置偏移(-4,0)
	-- self.资源组[28]:置偏移(-4,0)
	for i=47,49 do
		if i ~= 49 then
			self.资源组[i]:绑定窗口_(1)
		end
	end
	tp = 根
	mmzt =  tp.字体表.猫猫字体3
	zts1 = tp.字体表.普通字体__
	zts2 = tp.字体表.描边字体
	zts3 = tp.字体表.普通字体__
	zts1:置行间距(2.7)
	self.tszt=tp.字体表.提示字体
	--self.tszt:置颜色(绿色)
	self.生活选中=0
	self.强化选中=0
	self.状态 = 1
	self.子类状态 = 1
	self.师门技能 = {}
	self.师门法术 = {}
	self.特殊技能 = {}
	self.选中师门技能 = 0
	self.选中师门法术 = 0
	self.临时潜力 = {体质=0,魔力=0,力量=0,耐力=0,敏捷=0}
	self.预览属性 = {气血=0,魔法=0,命中=0,伤害=0,速度=0,灵力=0,防御=0,法伤=0,躲避=0}
	self.窗口时间 = 0
	self.辅助技能页数 = 0
end

function 场景类_人物状态栏:打开()
	if self.可视 then
		self.状态 = 1
		self.子类状态 = 1
		self.师门技能 = {}
		self.师门法术 = {}
		self.特殊技能 = {}
		self.选中师门技能 = 0
		self.选中师门法术 = 0
		--tp.队伍[1].潜力 = tp.队伍[1].潜力 + (self.临时潜力.体质+self.临时潜力.魔力+self.临时潜力.力量+self.临时潜力.耐力+self.临时潜力.敏捷)
		self.临时潜力 = {体质=0,魔力=0,力量=0,耐力=0,敏捷=0}
		self.预览属性 = {气血=0,魔法=0,命中=0,伤害=0,速度=0,灵力=0,防御=0,法伤=0,躲避=0}
		tp.队伍[1].临时属性 = {气血=0,魔法=0,命中=0,伤害=0,防御=0,速度=0,躲避=0,灵力=0,法伤=0,法防=0,体质=0,魔力=0,力量=0,耐力=0,敏捷=0}
		self.可视 = false
	else
		self.修炼选中1 = 0
		self.修炼选中2 = 0
		if tp.战斗中 then
		    insert(tp.战斗窗口_,self)
		else
			insert(tp.窗口_,self)
		end
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
		self.生活选中=0
		self.强化选中=0
		self.辅助技能页数 = 0
		self.x = 全局游戏宽度-300
	end
end

function 场景类_人物状态栏:刷新()
	self.师门技能 = {}
	self.师门法术 = {}
	self.选中师门技能 = 0
	self.选中师门法术 = 0
	self.子类状态 = 1
end

function 场景类_人物状态栏:显示(dt,x,y)
	self.焦点 = false
	local 右键点击=false
	-- 变量集合
	local rw = tp.队伍[1]
	-- 显示集合
	self.资源组[5]:更新(x,y)
	self.资源组[36]:更新(x,y)
	if self.资源组[5]:事件判断() then
		self:打开()
		return false
	elseif self.资源组[36]:事件判断() and not tp.战斗中 then
		if self.子类状态==3 then
			if self.强化选中==0 then
			  tp.常规提示:打开("#Y/请先选中要学习的生活技能")
			else
			  发送数据(3712.9,{序列=self.强化选中})
			end
		else
		    if self.生活选中==0 then
			 tp.常规提示:打开("#Y/请先选中要学习的生活技能")
			else
			 发送数据(3712,{序列=self.生活选中})
			end
		end
   elseif self.资源组[32]:事件判断() and not tp.战斗中 then
	  发送数据(3713)
   elseif self.资源组[33]:事件判断() and not tp.战斗中 then
	  发送数据(3714)
	elseif self.资源组[35]:事件判断() and not tp.战斗中 then
	  发送数据(3720)
	elseif self.资源组[37]:事件判断() and not tp.战斗中 then
	  tp.窗口.对话栏:文本("","","请设置你要飞行的快捷键",{"F1","F2","F3","F4","","F5","F6","F7","F8"})
	elseif self.资源组[50]:事件判断() and not tp.战斗中 then
	  发送数据(3820)
	end
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-90+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,fl[self.状态])
	self.资源组[5]:显示(self.x-18+self.资源组[1].宽度,self.y+3)
	local ms = nil
	zts1:置颜色(4294967295)
	for i=1,4 do
		self.资源组[i+5]:更新(x,y,self.状态 ~= i)
		if self.资源组[i+5]:事件判断() then
			self.状态 = i
			self.选中师门技能 = 0
			self.选中师门法术 = 0
			self.辅助技能页数 = 0
			if self.状态 == 3 then
				self.辅助技能 = {}
				local jn = tp._技能格子
				for i=1,#rw.辅助技能 do
					self.辅助技能[i] = jn(0,0,i,"辅助技能")
				end
				self.剧情技能 = {}
				local jn = tp._技能格子
				for i=1,#rw.剧情技能 do
					self.剧情技能[i] = jn(0,0,i,"剧情技能")
				end
				---------------
				self.强化技能 = {}
				local jn = tp._技能格子
				for i=1,#rw.强化技能 do
					self.强化技能[i] = jn(0,0,i,"强化技能")
				end
				---------------
				for i=1,#rw.辅助技能 do
					self.辅助技能[i]:置技能(rw.辅助技能[i],"生活")
					local 临时消耗=生活技能消耗(self.辅助技能[i].技能.等级+1,self.辅助技能[i].技能.名称)
					self.辅助技能[i].技能.原介绍=self.辅助技能[i].技能.介绍
					self.辅助技能[i].技能.介绍=self.辅助技能[i].技能.介绍..'\n'.."#Y/学习消耗："..临时消耗.经验.."点人物经验、"..临时消耗.帮贡.."点帮贡、"..临时消耗.需求.."点需要帮贡、"..临时消耗.金钱.."两银子#R/（>=40级的生活技能必须在加入帮派后才可学习）"
				end
				for i=1,#rw.剧情技能 do
					self.剧情技能[i]:置技能(rw.剧情技能[i],"剧情")
				end
				--------------
				for i=1,#rw.强化技能 do
					self.强化技能[i]:置技能(rw.强化技能[i],"强化")
				end
				--------------
			end
		end
		if self.资源组[i+5].按住 then
			ms = i
		end
		local jx = self.x-23
		local jy = self.y+41+(i-1)*74
		self.资源组[i+5]:显示(jx,jy,nil,nil,nil,self.状态 == i,2)
		zts1:显示(jx+7,jy+8,zt[i])
	end
	-- local jx = self.x-23
	-- local jy = self.y+41+(self.状态-1)*68
	-- self.资源组[self.状态+5]:显示(jx,jy,nil,nil,nil,true,2)
	-- zts1:显示(jx+8,jy+7,zt[self.状态])
	-- if ms ~= nil then
	-- 	local jx = self.x-23
	-- 	local jy = self.y+41+(ms-1)*68
	-- 	self.资源组[ms+5]:显示(jx,jy,nil,nil,nil,true,2)
	-- 	zts1:显示(jx+8,jy+7,zt[ms])
	-- end
	-- 层次逻辑
	if self.状态 == 1 then
		self.资源组[38]:置宽高1(131,19)
		mmzt:置颜色(0xFFFFFFFF)
		for i=0,3 do
			self.资源组[38]:显示(self.x+48,self.y+30+i*23)
			mmzt:显示(self.x+15,self.y+34+i*23,wz[i+1])
		end
		self.资源组[38]:置宽高1(46,19)
		for i=0,3 do
			self.资源组[38]:显示(self.x+227,self.y+30+i*23)
			mmzt:显示(self.x+190,self.y+34+i*23,wz[i+5])
		end
		self.资源组[38]:置宽高1(226,19)
		self.资源组[38]:显示(self.x+49,self.y+129)
		mmzt:显示(self.x+15,self.y+133,wz[9])
		self.资源组[38]:置宽高1(97,19)
		for i=0,1 do
			self.资源组[38]:显示(self.x+48,self.y+153+i*23)
			mmzt:显示(self.x+15,self.y+157+i*23,wz[10+i])
		end
		for i=0,5 do
			self.资源组[38]:显示(self.x+49,self.y+204+i*24)
			mmzt:显示(self.x+15,self.y+207+i*24,wz[14+i])
		end
		self.资源组[38]:置宽高1(84,19)
		for i=0,1 do
			self.资源组[38]:显示(self.x+191,self.y+153+i*23)
			mmzt:显示(self.x+159,self.y+157+i*23,wz[12+i])
		end
		self.资源组[38]:置宽高1(42,19)
		for i=0,5 do
			self.资源组[38]:显示(self.x+192,self.y+204+i*24)
			mmzt:显示(self.x+159,self.y+207+i*24,wz[20+i])
		end
		mmzt:显示(self.x+17,self.y+383,"经验")
		tp.经验背景_:显示(self.x+52,self.y+382)
		local ls = self.临时潜力
		local yl = self.预览属性
		self.资源组[10]:更新(x,y)
		self.资源组[21]:更新(x,y)

		self.资源组[10]:显示(self.x+10,self.y+52,true)
		for i=1,5 do
			self.资源组[10+i]:更新(x,y,rw.潜力 > 0,1)
			if self.资源组[10+i]:事件判断() and not tp.战斗中 then
				ls[bd[i]] = ls[bd[i]] + 1
				rw.潜力 = rw.潜力 - 1
				rw.临时属性[bd[i]]=rw.临时属性[bd[i]]+1
				-- rw:刷新信息()
				rw:刷新临时信息()
			end
			self.资源组[10+i]:显示(self.x+237,self.y+206+((i-1)*24))
			self.资源组[15+i]:更新(x,y,ls[bd[i]] > 0,1)
			if self.资源组[15+i]:事件判断() and not tp.战斗中 then
				ls[bd[i]] = ls[bd[i]] - 1
				rw.潜力 = rw.潜力 + 1
				rw.临时属性[bd[i]]=rw.临时属性[bd[i]]-1
				-- rw:刷新信息()
				rw:刷新临时信息()
			end
			self.资源组[15+i]:显示(self.x+259,self.y+206+((i-1)*24))
		end
		if self.资源组[22]:事件判断() then
			tp.窗口.更多属性:打开()
		end
		self.资源组[21]:显示(self.x+236,self.y+325,true)
		for i=1,3 do
			self.资源组[21+i]:更新(x,y)
			self.资源组[21+i]:显示(self.x+14+(i-1)*93,self.y+351,true)
		end
		if self.资源组[10]:事件判断() and not tp.战斗中 then
			tp.窗口.人物称谓栏:打开()
		elseif self.资源组[24]:事件判断() and not tp.战斗中 then
			if 连点模式 then
				连点模式=false
				tp.常规提示:打开("#Y你关闭了连点模式")
			end
			self.临时潜力 = {体质=0,魔力=0,力量=0,耐力=0,敏捷=0}
			self.预览属性 = {气血=0,魔法=0,命中=0,伤害=0,速度=0,灵力=0,防御=0,法伤=0,躲避=0}
			rw.临时属性 = {气血=0,魔法=0,命中=0,伤害=0,防御=0,速度=0,躲避=0,灵力=0,法伤=0,法防=0,体质=0,魔力=0,力量=0,耐力=0,敏捷=0}
			发送数据(8,ls)
		elseif self.资源组[25]:事件判断() and not tp.战斗中 then
			发送数据(9)
		elseif self.资源组[23]:事件判断() then
			-- 力耐加点
			local zt = 1
			while rw.潜力>0 do
				if rw.门派 == "大唐官府" or rw.门派 == "狮驼岭" or rw.门派 == "五庄观" or rw.门派 == "凌波城" or rw.门派 == "天宫" then
				    if zt == 1 then
						ls.力量  = ls.力量 + 1
						rw.潜力 = rw.潜力 - 1
						rw.临时属性.力量 = rw.临时属性.力量 + 1
						zt = 2
					elseif zt == 2 then
						ls.力量  = ls.力量 + 1
						rw.潜力 = rw.潜力 - 1
						rw.临时属性.力量 = rw.临时属性.力量 + 1
						zt = 3
					elseif zt == 3 then
						ls.力量  = ls.力量 + 1
						rw.潜力 = rw.潜力 - 1
						rw.临时属性.力量 = rw.临时属性.力量 + 1
						zt = 4
					elseif zt == 4 then
						ls.力量  = ls.力量 + 1
						rw.潜力 = rw.潜力 - 1
						rw.临时属性.力量 = rw.临时属性.力量 + 1
						zt = 5
					elseif zt == 5 then
						rw.潜力 = rw.潜力 - 1
						ls.体质  = ls.体质  + 1
						rw.临时属性.体质 = rw.临时属性.体质 + 1
						zt = 1
					end
				elseif rw.门派 == "方寸山" or rw.门派 == "盘丝洞" then
					if zt == 1 then
						ls.敏捷  = ls.敏捷 + 1
						rw.潜力 = rw.潜力 - 1
						rw.临时属性.敏捷 = rw.临时属性.敏捷 + 1
						zt = 2
					elseif zt == 2 then
						ls.敏捷  = ls.敏捷 + 1
						rw.潜力 = rw.潜力 - 1
						rw.临时属性.敏捷 = rw.临时属性.敏捷 + 1
						zt = 3
					elseif zt == 3 then
						ls.敏捷  = ls.敏捷 + 1
						rw.潜力 = rw.潜力 - 1
						rw.临时属性.敏捷 = rw.临时属性.敏捷 + 1
						zt = 4
					elseif zt == 4 then
						ls.耐力  = ls.耐力 + 1
						rw.潜力 = rw.潜力 - 1
						rw.临时属性.耐力 = rw.临时属性.耐力 + 1
						zt = 5
					elseif zt == 5 then
						rw.潜力 = rw.潜力 - 1
						ls.体质  = ls.体质  + 1
						rw.临时属性.体质 = rw.临时属性.体质 + 1
						zt = 1
					end
				elseif rw.门派 == "女儿村" then
					if zt == 1 then
						ls.敏捷  = ls.敏捷 + 1
						rw.潜力 = rw.潜力 - 1
						rw.临时属性.敏捷 = rw.临时属性.敏捷 + 1
						zt = 2
					elseif zt == 2 then
						ls.敏捷  = ls.敏捷 + 1
						rw.潜力 = rw.潜力 - 1
						rw.临时属性.敏捷 = rw.临时属性.敏捷 + 1
						zt = 3
					elseif zt == 3 then
						ls.敏捷  = ls.敏捷 + 1
						rw.潜力 = rw.潜力 - 1
						rw.临时属性.敏捷 = rw.临时属性.敏捷 + 1
						zt = 4
					elseif zt == 4 then
						rw.潜力 = rw.潜力 - 1
						ls.体质  = ls.体质  + 1
						rw.临时属性.体质 = rw.临时属性.体质 + 1
						zt = 5
					elseif zt == 5 then
						rw.潜力 = rw.潜力 - 1
						ls.体质  = ls.体质  + 1
						rw.临时属性.体质 = rw.临时属性.体质 + 1
						zt = 1
					end
				elseif rw.门派 == "龙宫" or rw.门派 == "神木林" or rw.门派 == "魔王寨" then
					if zt == 1 then
						ls.魔力  = ls.魔力 + 1
						rw.潜力 = rw.潜力 - 1
						rw.临时属性.魔力 = rw.临时属性.魔力 + 1
						zt = 2
					elseif zt == 2 then
						ls.魔力  = ls.魔力 + 1
						rw.潜力 = rw.潜力 - 1
						rw.临时属性.魔力 = rw.临时属性.魔力 + 1
						zt = 3
					elseif zt == 3 then
						ls.魔力  = ls.魔力 + 1
						rw.潜力 = rw.潜力 - 1
						rw.临时属性.魔力 = rw.临时属性.魔力 + 1
						zt = 4
					elseif zt == 4 then
						ls.魔力  = ls.魔力 + 1
						rw.潜力 = rw.潜力 - 1
						rw.临时属性.魔力 = rw.临时属性.魔力 + 1
						zt = 5
					elseif zt == 5 then
						rw.潜力 = rw.潜力 - 1
						ls.体质  = ls.体质  + 1
						rw.临时属性.体质 = rw.临时属性.体质 + 1
						zt = 1
					end
				elseif rw.门派 == "普陀山" or rw.门派 == "化生寺" or rw.门派 == "无底洞" or rw.门派 == "阴曹地府" then
					if zt == 1 then
						ls.体质  = ls.体质 + 1
						rw.潜力 = rw.潜力 - 1
						rw.临时属性.体质 = rw.临时属性.体质 + 1
						zt = 2
					elseif zt == 2 then
						ls.体质  = ls.体质 + 1
						rw.潜力 = rw.潜力 - 1
						rw.临时属性.体质 = rw.临时属性.体质 + 1
						zt = 3
					elseif zt == 3 then
						ls.耐力  = ls.耐力 + 1
						rw.潜力 = rw.潜力 - 1
						rw.临时属性.耐力 = rw.临时属性.耐力 + 1
						zt = 4
					elseif zt == 4 then
						ls.耐力  = ls.耐力 + 1
						rw.潜力 = rw.潜力 - 1
						rw.临时属性.耐力 = rw.临时属性.耐力 + 1
						zt = 5
					elseif zt == 5 then
						rw.潜力 = rw.潜力 - 1
						ls.敏捷  = ls.敏捷  + 1
						rw.临时属性.敏捷 = rw.临时属性.敏捷 + 1
						zt = 1
					end
				else
					rw.潜力 = rw.潜力 - 1
					ls.力量 = ls.力量 + 1
					rw.临时属性.力量 = rw.临时属性.力量 + 1
				end
				if rw.潜力 <= 0 then
					rw:刷新临时信息()
					break
				end
			end
		end
		-- 文字
		mmzt:置颜色(-16777216)
		mmzt:显示(self.x + 56,self.y + 35,rw.名称)
		if rw.称谓~=nil then
			tp.称谓=rw.称谓
		end
		mmzt:显示(self.x + 56,self.y + 58,tp.当前称谓)
		if rw.BPMC and rw.BPMC~="无帮派" then
		    mmzt:显示(self.x + 56,self.y + 81,rw.BPMC)
		end

		mmzt:显示(self.x + 56,self.y + 104,rw.门派)
		--mmzt:显示(self.x + 234,self.y + 33,rw.等级)

    	self.资源组[25]:更新(x,y)
		self.资源组[25]:显示(self.x+240-4,self.y+380-2,true)


		mmzt:置颜色(-16777216)
		mmzt:显示(self.x + 234,self.y + 34,rw.等级)

		mmzt:置颜色(-16777216)
		mmzt:显示(self.x + 234,self.y + 57,rw.人气)
		mmzt:显示(self.x + 234,self.y + 79,rw.BG or 0)
		mmzt:显示(self.x + 234,self.y + 102,rw.门贡 or 0)
		if rw.临时属性.气血~=nil and rw.临时属性.气血~=0 and rw.临时属性.气血>0 then
			mmzt:置颜色(-65536)
			mmzt:显示(self.x + 198,self.y + 133," +" ..(rw.临时属性.气血 or ""))
		end
		mmzt:置颜色(-16777216)
		mmzt:显示(self.x + 56,self.y + 133,format("%d/%d/%d",rw.气血,rw.气血上限,rw.最大气血))
		if rw.临时属性.魔法~=nil and rw.临时属性.魔法~=0 and rw.临时属性.魔法>0 then
			mmzt:置颜色(-65536)
			mmzt:显示(self.x + 106,self.y + 157," +" ..(rw.临时属性.魔法 or ""))
		end
		mmzt:置颜色(-16777216)
		mmzt:显示(self.x + 56,self.y + 157,format("%d/%d",rw.魔法,rw.最大魔法,rw.储备魔法))
		mmzt:显示(self.x + 56,self.y + 180,format("%d/150",rw.愤怒))
		for i=1,6 do
			if rw.临时属性[bd1[i]]~=nil and rw.临时属性[bd1[i]]~=0 and rw.临时属性[bd1[i]]>0 then
				mmzt:置颜色(-65536)
				mmzt:显示(self.x + 96,self.y + 208 + ((i-1)*24) ," +"..(rw.临时属性[bd1[i]] or ""))
			end
			mmzt:置颜色(-16777216)
			if bd1[i] =="伤害" and 昼夜==1 and tp.队伍[1].黑夜伤害 then
				mmzt:显示(self.x + 56,self.y + 208 + ((i-1)*24) ,rw[bd1[i]]+tp.队伍[1].黑夜伤害)
			else
			    mmzt:显示(self.x + 56,self.y + 208 + ((i-1)*24) ,rw[bd1[i]])
			end
		end
		mmzt:置颜色(-16777216)
		mmzt:显示(self.x + 198,self.y + 157,format("%d/%d",rw.活力,rw.最大活力))
		mmzt:显示(self.x + 198,self.y + 180,format("%d/%d",rw.体力,rw.最大体力))
		for i=1,5 do
			if rw.临时属性[bd[i]]~=nil and rw.临时属性[bd[i]]~=0 and rw.临时属性[bd[i]]>0 then
				mmzt:置颜色(-65536)
				mmzt:显示(self.x + 213,self.y + 208 + ((i-1)*24) ," +"..(rw.临时属性[bd[i]] or ""))
			end
			mmzt:置颜色(-16777216)
			mmzt:显示(self.x + 198,self.y + 208 + ((i-1)*24) ,rw[bd[i]]+rw.装备属性[bd[i]]+rw.坐骑属性[bd[i]])
			if rw.动物套属性~=nil and rw.动物套属性[bd[i]]~= 0 then
				mmzt:置颜色(红色):显示(self.x + 198+(#tostring(rw[bd[i]])*7)+3,self.y + 207 + ((i-1)*24) ,"+"..rw.动物套属性[bd[i]])
			end
		end
		mmzt:置颜色(-16777216)
		mmzt:显示(self.x + 198,self.y + 328.3,rw.潜力)
		self.资源组[41]:置区域(0,0,min(floor(rw.当前经验 / rw.最大经验 * 173),173),12)
		self.资源组[41]:显示(tp.经验背景_.x+2,tp.经验背景_.y+2)
		local ts = format("%s/%s",rw.当前经验,rw.最大经验)
		zts1:置描边颜色(-16240640)
		zts1:置颜色(4294967295)
		zts1:显示(self.x + ((272-15 - zts1:取宽度(ts))/2)+8,self.y + 384,ts)
		zts1:置描边颜色(-16777216)
	elseif self.状态 == 2 then
		self.资源组[44]:置宽高3(131,302)
		self.资源组[44]:显示(self.x+14,self.y+37)
		self.资源组[44]:显示(self.x+150,self.y+37)
		-- zts2:置字间距(2.5)
		引擎.场景.字体表.标题字体:显示(self.x+58+20,self.y+42,"师门技能")
		引擎.场景.字体表.标题字体:显示(self.x+194+25,self.y+42,"师门法术")
		引擎.场景.字体表.标题字体:显示(self.x+22,self.y+348,"特技")
		zts2:置字间距(0)
		self.资源组[26]:更新(x,y)
		self.资源组[50]:更新(x,y)
		self.资源组[27]:更新(x,y,self.选中师门法术 ~= 0 and (tp.队伍[1].师门技能[self.选中师门技能].包含技能[self.选中师门法术].种类 == 0 or tp.队伍[1].师门技能[self.选中师门技能].包含技能[self.选中师门法术].种类 == 12 ))
		if self.资源组[26]:事件判断() and not tp.战斗中 then
			tp.窗口.经脉流派:打开()
		-- elseif self.资源组[27]:事件判断() and tp.队伍[1].师门技能[self.选中师门技能].包含技能[self.选中师门法术].种类 == 0 then
		-- 	return false
		-- elseif self.资源组[27]:事件判断() and tp.队伍[1].师门技能[self.选中师门技能].包含技能[self.选中师门法术].种类 == 12 then

		end
		self.资源组[28]:更新(x,y)
		self.资源组[26]:显示(self.x+165,self.y+346,true)
		self.资源组[50]:显示(self.x+120,self.y+346,true)
		self.资源组[27]:显示(self.x+235,self.y+346,true)
		self.资源组[28]:显示(self.x+235,self.y+378,true)
		mmzt:置颜色(-16777216)
		if tp.队伍[1].门派 ~= "无" and tp.队伍[1].门派 ~= "无门派" then
			for n=1,7 do
				local sm = tp.队伍[1].师门技能[n]
				if self.师门技能[n] == nil then
					self.师门技能[n] = tp.资源:载入(sm.资源,"网易WDF动画",sm.小模型资源)
				end
				local 缩放1x,缩放1y = nil,nil
				if self.师门技能[n].宽度 > 31 then
		            缩放1x,缩放1y = 等比例缩放公式(31,31,self.师门技能[n].宽度 , self.师门技能[n].高度)
		        end
				local jx = self.x + 24
				local jy = self.y + (n+1) * 38 - 5
				bw1:置坐标(jx-5,jy-4)
				if self.选中师门技能 ~= n then
					if bw1:检查点(x,y) and self.鼠标 then
						box(jx-5,jy-4,jx+117,jy+34,-3551379)
						if mousea(0) and not tp.消息栏焦点 then
							self.选中师门技能 = n
							self.师门法术 = {}
							self.选中师门法术 = 0

						end
						self.焦点 = true
					end
				else
					local ys = -10790181
					if bw1:检查点(x,y) then
						ys = -9670988
						self.焦点 = true
					end
					box(jx-5,jy-4,jx+117,jy+34,ys)
				end
				self.师门技能[n]:显示(jx,jy,缩放1x,缩放1y)
				if self.师门技能[n]:是否选中(x,y) and self.鼠标 then
					tp.提示:技能(x,y,sm,sm.剩余冷却回合)
				end
				if tp.队伍[1].额外法宝等级[sm.名称]~=nil then
					mmzt:置颜色(红色):显示(jx+58,jy+15,"+"..tp.队伍[1].额外法宝等级[sm.名称])
					mmzt:置颜色(-16777216)
				end
				if tp.队伍[1].额外技能等级[sm.名称]~=nil then
					mmzt:置颜色(红色):显示(jx+58,jy+15,"+"..tp.队伍[1].额外技能等级[sm.名称])
					mmzt:置颜色(-16777216)
				end

				mmzt:显示(jx+35,jy,sm.名称)
				mmzt:显示(jx+35,jy+15,sm.等级)
			end
		end
		if self.选中师门技能 ~= 0 then
			local bh = tp.队伍[1].师门技能[self.选中师门技能].包含技能
			local sl=#bh
			if sl>7 then --在这里限制他无限超出边框显示
			    sl=7
			end
			for n=1,sl do
				if self.师门法术[n] == nil then
					self.师门法术[n] = tp.资源:载入(bh[n].资源,"网易WDF动画",bh[n].小模型资源)
					if not bh[n].学会 then
						self.师门法术[n]:灰度级()
						self.师门法术[n].灰度=1
					end
		   		elseif bh[n].学会 and self.师门法术[n].灰度~=nil then
				 	self.师门法术[n].灰度=nil
				  	self.师门法术[n] = tp.资源:载入(bh[n].资源,"网易WDF动画",bh[n].小模型资源)
				end
				local 缩放2x,缩放2y = nil,nil
				if self.师门法术[n].宽度 > 24 then
		            缩放2x,缩放2y = 等比例缩放公式(24,24,self.师门法术[n].宽度 , self.师门法术[n].高度)
		        end
				local jx = self.x + 160
				local jy = self.y + (n+1) * 38 - 5
				bw1:置坐标(jx-5,jy-4)
				if self.选中师门法术 ~= n then
					if bw1:检查点(x,y) and self.鼠标 and not tp.消息栏焦点 then
						box(jx-5,jy-4,jx+117,jy+34,-3551379)
						if mousea(0) and not tp.消息栏焦点 and self.鼠标 and bh[n].学会 then
							self.选中师门法术 = n
							if mousea(0) and not tp.消息栏焦点 then
								self.资源组[46]:置打勾框(tp.队伍[1].招式特效[bh[n].名称])
							end
						end
						self.焦点 = true
					end
				else
					local ys = -10790181
					if bw1:检查点(x,y) then
						ys = -9670988
						self.焦点 = true
					end
					box(jx-5,jy-4,jx+117,jy+34,ys)
				end
				self.师门法术[n]:显示(jx,jy+2,缩放2x,缩放2y)
				if self.师门法术[n]:是否选中(x,y) and self.鼠标 then
					tp.提示:技能(x,y,bh[n],bh[n].剩余冷却回合)
				end
				mmzt:显示(jx+34,jy+4,bh[n].名称)
				if self.师门法术[n]:是否选中(x,y) and bh[n].学会 then
					if 引擎.鼠标弹起(左键) then
						self.拖曳技能={id=n,类型=1,名称=bh[n].名称} -- 1师门  2辅助 3剧情 4其他
						右键点击=true
					end
				--   if self.师门法术[n].跟随==nil then tp.提示:技能(x,y,bh[n],bh[n].剩余冷却回合) end
				end
			end
			if bh[self.选中师门法术] ~= nil then
				if  tp.队伍[1].招式特效 ~= nil and tp.队伍[1].招式特效[bh[self.选中师门法术].名称] ~= nil then
					self.资源组[46]:更新(x,y)
					self.资源组[46]:显示(self.x+42,self.y+343,true,nil,nil,self.资源组[46].打勾框,2)
					mmzt:置颜色(黄色):显示(self.x+68,self.y+349,"招式特效")
					if self.资源组[46]:事件判断() and not tp.战斗中 then
						发送数据(70,{名称=bh[self.选中师门法术].名称})
					end
				end
			end
		end
		for n=1,6 do
			local ts = tp.队伍[1].特殊技能[n]
			local jx = self.x + n * 36 - 18
			local jy = self.y + 374
			self.资源组[42]:显示(jx,jy)
			if ts ~= nil and ts.名称 ~= nil then
				if self.特殊技能[n] == nil then
					local ski    = 引擎.取技能(ts.名称,nil,"特技")
					if ski~=nil and ski[6]~=nil and ski[8]~=nil then
						self.特殊技能[n] = tp.资源:载入(ski[6],"网易WDF动画",ski[8])
					else
						self.特殊技能[n] = tp.资源:载入(ts.资源,"网易WDF动画",ts.小模型资源)
					end
				end
				local 缩放3x,缩放3y = nil,nil
				if self.特殊技能[n].宽度 > 24 then
		            缩放3x,缩放3y = 等比例缩放公式(31,31,self.特殊技能[n].宽度 , self.特殊技能[n].高度)
		        end
				self.特殊技能[n]:显示(jx+1,jy+1,缩放3x,缩放3y)
				if self.特殊技能[n]:是否选中(x,y) and self.鼠标 then
					self.焦点 = true
					tp.提示:技能(x,y,ts)
				end
			end
		end
	elseif self.状态 == 3 then
		for i=1,3 do
			self.资源组[28+i]:更新(x,y,self.子类状态 ~= i)
			if self.资源组[28+i]:事件判断() then
				self.子类状态 = i
				self.辅助技能页数 = 0
			end
			self.资源组[28+i]:显示(self.x + 25 + (i-1)*85,self.y + 40,true,nil,nil,self.子类状态 == i,2)
		end
		local xx = 0
		local yy = 0
		for i=1,6 do
			self.资源组[31+i]:更新(x,y)
			self.资源组[31+i]:显示(self.x + 18 + xx * 93,self.y + 345 + yy * 29,true)
			xx = xx + 1
			if xx > 2 then
				xx = 0
				yy = yy + 1
			end
		end
		xx = 0
		yy = 0
		if self.子类状态 == 1 then
			local 页数 = math.floor(#self.辅助技能/12)
			self.资源组[48]:更新(x,y,self.辅助技能页数 < 页数)
			self.资源组[47]:更新(x,y,self.辅助技能页数 >0 )
			self.资源组[38]:显示(self.x+120,self.y+317)
			self.资源组[47]:显示(self.x+95,self.y+317)
			self.资源组[48]:显示(self.x+166,self.y+317)
			zts2:显示(self.x+135,self.y+320,self.辅助技能页数+1)
			if self.资源组[47]:事件判断() then
				self.辅助技能页数 = self.辅助技能页数 -1
			elseif self.资源组[48]:事件判断() then
				self.辅助技能页数 = self.辅助技能页数 +1
			elseif self.资源组[34]:事件判断() and self.生活选中 ~= 0  and not tp.战斗中 then
				发送数据(72,{名称=self.辅助技能[self.生活选中].技能.名称,等级=self.辅助技能[self.生活选中].技能.等级})
			end
			for n=1,12 do
				n = n+(self.辅助技能页数*12)
				local jx = self.x+xx*60+31
				local jy = self.y+yy*75+90
				self.资源组[40]:显示(jx+2,jy+1)
				self.资源组[38]:显示(jx+2,jy+49)
				if self.辅助技能[n] ~= nil then
					self.辅助技能[n]:置坐标(jx+3,jy+2)
					self.辅助技能[n]:显示(x,y,self.鼠标)
					if self.生活选中==n then
					  self.tszt:显示(jx+3+3,jy+2+20,"学习")
					end
					if self.辅助技能[n].技能 ~= nil then
						mmzt:置颜色(-16777216)
						mmzt:显示(jx+11,jy+53,self.辅助技能[n].技能.等级)
						if self.辅助技能[n].焦点 then
							tp.提示:技能(x,y,self.辅助技能[n].技能)
							if 引擎.鼠标弹起(左键) then self.生活选中=n end
						end
					end
				end
				xx = xx + 1
				if xx > 3 then
					xx = 0
					yy = yy + 1
				end
			end
		elseif self.子类状态 == 2 then
			local 页数 = math.floor(#self.剧情技能/12)
			self.资源组[48]:更新(x,y,self.辅助技能页数 < 页数)
			self.资源组[47]:更新(x,y,self.辅助技能页数 >0 )
			self.资源组[38]:显示(self.x+120,self.y+317)
			self.资源组[47]:显示(self.x+95,self.y+317)
			self.资源组[48]:显示(self.x+166,self.y+317)
			zts2:显示(self.x+135,self.y+320,self.辅助技能页数+1)
			if self.资源组[47]:事件判断() then
				self.辅助技能页数 = self.辅助技能页数 -1
			elseif self.资源组[48]:事件判断() then
				self.辅助技能页数 = self.辅助技能页数 +1
			end
			zts1:显示(self.x+97,self.y+70,"可用剧情点: "..tp.队伍[1].剧情点.当前)
			for n=1,12 do
				local jx = self.x+xx*60+31
				local jy = self.y+yy*75+90
				self.资源组[40]:显示(jx+2,jy+1)
				self.资源组[38]:显示(jx+2,jy+49)
				if self.剧情技能[n] ~= nil then
					if self.剧情技能[n].跟随==nil then
						self.剧情技能[n]:置坐标(jx+3,jy+2)
						self.剧情技能[n]:显示(x,y,self.鼠标)
					else
						--self.剧情技能[n]:置坐标(鼠标.x+10,鼠标.y+10)
						--self.剧情技能[n]:显示(鼠标.x,鼠标.y,self.鼠标)
					end
					if self.剧情技能[n].技能 ~= nil  then
						mmzt:置颜色(-16777216)
						mmzt:显示(jx+11,jy+53,self.剧情技能[n].技能.等级)
						if self.剧情技能[n].焦点 then
							if 引擎.鼠标弹起(左键) and self.剧情技能[n].类型 ~= 108 then
								self.拖曳技能={id=n,类型=3,名称=self.剧情技能[n].技能.名称} -- 1师门  2辅助 3剧情 4其他
								右键点击=true
							end
						   if self.剧情技能[n].跟随==nil then tp.提示:技能(x,y,self.剧情技能[n].技能) end
						end
					end
				end
				xx = xx + 1
				if xx > 3 then
					xx = 0
					yy = yy + 1
				end
			end
		else
			self.资源组[48]:更新(x,y)
			self.资源组[47]:更新(x,y)
			self.资源组[38]:显示(self.x+120,self.y+317)
			self.资源组[47]:显示(self.x+95,self.y+317)
			self.资源组[48]:显示(self.x+166,self.y+317)
			for n=1,12 do
				local jx = self.x+xx*60+31
				local jy = self.y+yy*75+90
				self.资源组[40]:显示(jx+2,jy+1)
				self.资源组[38]:显示(jx+2,jy+49)
				if self.强化技能[n] ~= nil then
					self.强化技能[n]:置坐标(jx+3,jy+2)
					self.强化技能[n]:显示(x,y,self.鼠标)
					if self.强化选中==n then
					  self.tszt:显示(jx+3+3,jy+2+20,"学习")
					end
					if self.强化技能[n].技能 ~= nil then
						mmzt:置颜色(-16777216)
						mmzt:显示(jx+11,jy+53,self.强化技能[n].技能.等级)
						if self.强化技能[n].焦点 then
							tp.提示:技能(x,y,self.强化技能[n].技能)
							if 引擎.鼠标弹起(左键) then self.强化选中=n end
						end
					end
				end
				xx = xx + 1
				if xx > 3 then
					xx = 0
					yy = yy + 1
				end
			end
		end
	elseif self.状态 == 4 then
		-- zts:置字间距(3)
		mmzt:置颜色(白色)
		mmzt:显示(self.x+27,self.y+40-13,"角色自身修炼  当前："..rw.修炼.当前)
		mmzt:显示(self.x+27,self.y+221-13,"召唤兽控制修炼 当前："..rw.bb修炼.当前)
		-- zts:置字间距(0)
		-- self.资源组[2]:置宽高(255,115)
		self.资源组[2]:显示(self.x+17,self.y+77-15-11)
		self.资源组[2]:显示(self.x+17,self.y+258-15-11)
		zts3:置颜色(-16777216)
		for i=0,4 do
			local jx = self.x + 24
			local jy = self.y + 64 + i * 26
			bw2:置坐标(jx-6,jy-7)
			local xz = bw2:检查点(x,y)
			if self.修炼选中1 ~= i+1 then
				if xz then
					box(jx-6,jy-6,jx+252,jy+17,-3551379)
					if mousea(0) then
						self.修炼选中1 = i+1
					end
					self.焦点 = true
				end
			else
				local ys = -10790181
				if xz then
					ys = -9670988
					self.焦点 = true
				end
				box(jx-6,jy-6,jx+252,jy+17,ys)
			end--计算修炼等级经验(等级,上限)
			-- zts3:显示(jx,jy,as[i+1].."   等级:"..rw.修炼[as[i+1]][1].."/"..rw.修炼[as[i+1]][3].."  修炼经验:"..rw.修炼[as[i+1]][2]..[[/]]..计算修炼等级经验(rw.修炼[as[i+1]][1],rw.修炼[as[i+1]][3]))
		    zts3:显示(jx,jy,as[i+1].."   等级:"..rw.修炼[as[i+1]][1].."/"..rw.修炼[as[i+1]][3])
		    zts3:显示(jx+137,jy,"修炼经验 :"..rw.修炼[as[i+1]][2]..[[/]]..计算修炼等级经验(rw.修炼[as[i+1]][1],rw.修炼[as[i+1]][3]))
		end
		for i=0,3 do
			local jx = self.x + 24
			local jy = self.y + 254 + i * 27
			bw2:置坐标(jx-9,jy-7)
			local xz = bw2:检查点(x,y)
			if self.修炼选中2 ~= i+1 then
				if xz then
					box(jx-6,jy-6,jx+252,jy+17,-3551379)
					if mousea(0) then
						self.修炼选中2 = i+1
					end
					self.焦点 = true
				end
			else
				local ys = -10790181
				if xz then
					ys = -9670988
					self.焦点 = true
				end
				box(jx-6,jy-6,jx+252,jy+17,ys)
			end--计算修炼等级经验(等级,上限)
			-- zts3:显示(jx,jy,as1[i+1].."   等级:"..rw.bb修炼[as1[i+1]][1].."/"..rw.bb修炼[as1[i+1]][3].."  修炼经验:"..rw.bb修炼[as1[i+1]][2]..[[/]]..计算修炼等级经验(rw.bb修炼[as1[i+1]][1],rw.bb修炼[as1[i+1]][3]))
			zts3:显示(jx,jy,as1[i+1].." 等级:"..rw.bb修炼[as1[i+1]][1].."/"..rw.bb修炼[as1[i+1]][3])
		    zts3:显示(jx+137,jy,"修炼经验 :"..rw.bb修炼[as1[i+1]][2]..[[/]]..计算修炼等级经验(rw.bb修炼[as1[i+1]][1],rw.bb修炼[as1[i+1]][3]))
		end
		self.资源组[45]:更新(x,y)
		if self.资源组[45]:事件判断() and not tp.战斗中 then
			local 人物修
			local bb修
			if self.修炼选中1~=nil then
				人物修=as[self.修炼选中1]
			end
			if self.修炼选中2~=nil then
				bb修=as1[self.修炼选中2]
			end
			发送数据(14,{人物=人物修,bb=bb修})
		end
		self.资源组[45]:显示(self.x+180,self.y+380)
	end
	--逻辑集合
	if self.拖曳技能~=nil and 右键点击==false and not tp.战斗中 then
		if self.拖曳技能.类型==1 and self.拖曳技能.id~=nil and self.师门法术[self.拖曳技能.id] then
			self.师门法术[self.拖曳技能.id]:显示(x,y,true)
			if 引擎.鼠标弹起(左键) and self.拖曳技能.id~=nil  then
				if tp.快捷技能显示 then
				 	tp.窗口.快捷技能栏:设置技能(self.拖曳技能,x,y)
				 	self.拖曳技能=nil
				end
			end
		elseif self.拖曳技能.类型==2 then

		elseif self.拖曳技能.类型==3 and self.剧情技能[self.拖曳技能.id] then
			self.剧情技能[self.拖曳技能.id]:置坐标(鼠标.x+10,鼠标.y+10)
			self.剧情技能[self.拖曳技能.id]:显示(x,y,true,nil,nil,"小")
			if 引擎.鼠标弹起(左键) and self.拖曳技能.id~=nil  then
				if tp.快捷技能显示 then
				 	tp.窗口.快捷技能栏:设置技能(self.拖曳技能,x,y)
				end
			   	self.拖曳技能=nil
			end
		elseif self.拖曳技能.类型==4 then

		end
		if 引擎.鼠标弹起(右键) then
			self.拖曳技能 = nil
		end
	end
	bw:置坐标(self.x-24,self.y+36)
end

function 场景类_人物状态栏:检查点(x,y)
	if self.资源组[1]:是否选中(x,y) or bw:检查点(x,y)  then
		return true
	end
end

function 场景类_人物状态栏:初始移动(x,y)
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

function 场景类_人物状态栏:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_人物状态栏