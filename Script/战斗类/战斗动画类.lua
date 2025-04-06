-- @Author: baidwwy
-- @Date:   2024-11-01 04:10:22
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-09 22:32:09
-- @Author: baidwwy
-- @Date:   2023-09-25 12:05:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-09 22:24:51

local 战斗动画类 = class()
local qmsx = 引擎.取战斗模型
local zdjy = 引擎.取战斗锦衣模型
local 动作={"待战","跑去","防御","攻击","攻击2","挨打","返回","死亡","施法"}

function 战斗动画类:初始化()

end

function 战斗动画类:创建动画(模型,类型,染色方案,染色组,变异,武器,变身,显示饰品,饰品颜色,炫彩,炫彩组,锦衣,副武器)
	self.动画={}
	self.身体 = nil
	self.动作特效 = {}
	self.新特效 = {}
	self.武器=nil
	self.怪物饰品=nil
	self.副武器 = nil
	local 动画资源 = 引擎.场景.资源
	local 模型 = 模型
	local jingyi=false
	if 变身~=nil  and tp.显示变身卡造型 then
		类型=1
		模型=变身
	elseif 锦衣 and 锦衣[1] ~= nil then
		jingyi=true
		if 锦衣[1].名称=="斗战胜佛"  then
		 武器=nil
		end
	end
	local djs
	local zl = 0
	local oldzy = qmsx(模型)

	if 类型=="角色" or 类型=="系统角色" then
        if 武器 ~= nil then
            if 武器.名称 == "龙鸣寒水" or 武器.名称 == "非攻" then
                zl = "弓弩1"
            else
                zl = 引擎.场景:取武器子类(武器.子类)
            end
        elseif 副武器 then
            zl = 引擎.场景:取武器子类(副武器.子类)
        end
		local n
		if jingyi then
			if 武器 then
			    n = zdjy(锦衣[1].名称,模型,nil,武器.子类)
			else
				n = zdjy(锦衣[1].名称,模型,nil)
			end
		else
			n = qmsx(模型)
			if zl ~= 0 and zl ~= true then
				n = qmsx(模型,zl)
			end
		end

		self.行为 = "待战"
		self.状态行为 = "待战"
		self.动画 = {}
		self.动作特效 = {}
		local 动画资源 = 引擎.场景.资源
		local zy = n[10]
		self.动画.待战 = 动画资源:载入(zy,"网易WDF动画",n[6])
		self.动画.跑去 = 动画资源:载入(zy,"网易WDF动画",n[8]) ---武器
		self.动画.防御 = 动画资源:载入(zy,"网易WDF动画",n[4])
		self.动画.攻击 = 动画资源:载入(zy,"网易WDF动画",n[1])
		self.动画.攻击2 = 动画资源:载入(zy,"网易WDF动画",n[2])
		self.动画.挨打 = 动画资源:载入(zy,"网易WDF动画",n[9])
		self.动画.返回 = 动画资源:载入(zy,"网易WDF动画",n[8])
		self.动画.施法 = 动画资源:载入(zy,"网易WDF动画",n[7])
		self.动画.静立 = 动画资源:载入(zy,"网易WDF动画",n[6])
		if jingyi then
			-- self.动画.挨打 = 动画资源:载入(zy,"网易WDF动画",n[8]) ---武器--动画资源:载入(zy,"网易WDF动画",n[9])
			self.动画.死亡 = 动画资源:载入(oldzy[10],"网易WDF动画",oldzy[3])
		else
			-- self.动画.挨打 = 动画资源:载入(zy,"网易WDF动画",n[9])
			self.动画.死亡 = 动画资源:载入(zy,"网易WDF动画",n[3])  --原
		end
		-- local w = qmsx(模型.."_身体")
		-- if w[1]~=nil and w[2]~=nil and w[3]~=nil and w[4]~=nil and w[6]~=nil and w[7]~=nil and w[8]~=nil and w[9]~=nil then
		-- 	local zy = w[10]
		-- 	self.身体={}
		-- 	self.身体["待战"] = 动画资源:载入(zy,"网易WDF动画",w[6])
		-- 	self.身体["跑去"] = 动画资源:载入(zy,"网易WDF动画",w[8])
		-- 	self.身体["防御"] = 动画资源:载入(zy,"网易WDF动画",w[4])
		-- 	self.身体["攻击"] = 动画资源:载入(zy,"网易WDF动画",w[1])
		-- 	self.身体["攻击2"] = 动画资源:载入(zy,"网易WDF动画",w[2])
		-- 	self.身体["挨打"] = 动画资源:载入(zy,"网易WDF动画",w[9])
		-- 	self.身体["返回"] = 动画资源:载入(zy,"网易WDF动画",w[8])
		-- 	if w[3] ~= 0 then
		-- 		self.身体["死亡"] = 动画资源:载入(zy,"网易WDF动画",w[3])
		-- 	end
		-- 	self.身体["施法"] = 动画资源:载入(zy,"网易WDF动画",w[7])
		-- end

		if 武器~= nil and 武器.级别限制 ~= nil then
			local txzl = "1"
			if 武器.级别限制  >= 90 then
			 	txzl = "2"
			end
			local qsj = 引擎.模型特效库(模型.."攻击",zl..txzl)
			if  #qsj >=2 then
				self.动作特效.攻击 = 动画资源:载入(qsj[2],"网易WDF动画",qsj[1])
			end
			qsj = 引擎.模型特效库(模型.."攻击2",zl..txzl)
			if  #qsj >=2 then
				self.动作特效.攻击2 = 动画资源:载入(qsj[2],"网易WDF动画",qsj[1])
			end
			qsj = 引擎.模型特效库(模型.."施法",zl..txzl)
			if  #qsj >=2 then
				self.动作特效.施法 = 动画资源:载入(qsj[2],"网易WDF动画",qsj[1])
			end
		end


		if 变身 == nil or  tp.显示变身卡造型==false then
			if not jingyi then
			    if 炫彩 ~= nil then
					for n=1,#动作 do
					   self.动画[动作[n]]:炫彩染色(炫彩,炫彩组)
					end
				else
					if 染色方案~=0 and 染色组~=0 and 染色组~=nil and #染色组>0 then
						for n=1,#动作 do
							self.动画[动作[n]]:置染色(染色方案,染色组[1],染色组[2],染色组[3])
						end
					end
				end
			end
			if 锦衣 and 锦衣[6] ~= nil then
				local qsj = 引擎.取新特效(锦衣[6].名称)
				if  #qsj >=2 then
					self.新特效.施法 = 动画资源:载入(qsj[2],"网易WDF动画",qsj[1])
					if 锦衣[6].名称=="耀炎麒麟白" or 锦衣[6].名称=="耀炎麒麟黑" or 锦衣[6].名称=="耀炎麒麟金" or 锦衣[6].名称=="牛气冲天" then
						self.新特效.施法:置提速(0.7)
					end
				end
			end
            if 副武器 then
                self.副武器 = {}
                local 副武器资源 = qmsx(副武器.名称.."_"..模型)
                self.副武器.待战 = 动画资源:载入(副武器资源[10],"网易WDF动画",副武器资源[6])
                self.副武器.跑去 = 动画资源:载入(副武器资源[10],"网易WDF动画",副武器资源[8])
                self.副武器.防御 = 动画资源:载入(副武器资源[10],"网易WDF动画",副武器资源[4])
                self.副武器.攻击 = 动画资源:载入(副武器资源[10],"网易WDF动画",副武器资源[1])
                self.副武器.攻击2 = 动画资源:载入(副武器资源[10],"网易WDF动画",副武器资源[2])
                self.副武器.挨打 = 动画资源:载入(副武器资源[10],"网易WDF动画",副武器资源[9])
                self.副武器.返回 = 动画资源:载入(副武器资源[10],"网易WDF动画",副武器资源[8])
                self.副武器.施法 = 动画资源:载入(副武器资源[10],"网易WDF动画",副武器资源[7])
                self.副武器.静立 = 动画资源:载入(副武器资源[10],"网易WDF动画",副武器资源[6])
                self.副武器.连击1 = 动画资源:载入(副武器资源[10], "网易WDF动画", 副武器资源[11])
                self.副武器.连击2 = 动画资源:载入(副武器资源[10], "网易WDF动画", 副武器资源[12])
                self.副武器.连击3 = 动画资源:载入(副武器资源[10], "网易WDF动画", 副武器资源[13])
                self.副武器.原始染色 = {}
            end
			if 武器 ~= nil then
				self.武器={}
				local m = 引擎.场景:取武器附加名称(武器.子类,武器.级别限制,武器.名称)
				local w = qmsx(m.."_"..模型)
				self.音效模型 = 模型.."_"..zl
				if zl == "弓弩" or zl == "弓弩1" then
					self.攻击方式 = 1
				end
				local nw = 引擎.取模型(m.."_"..模型)
				if w[10] ~= nil then
					zy = w[10]
					self.武器.跑去 = 动画资源:载入(zy,"网易WDF动画",w[8])
					self.武器.攻击 = 动画资源:载入(zy,"网易WDF动画",w[1])
					self.武器.攻击2 = 动画资源:载入(zy,"网易WDF动画",w[2])
					if jingyi then
						self.武器.待战 = 动画资源:载入(nw[3],"网易WDF动画",nw[1])
						self.武器.挨打 = 动画资源:载入(nw[3],"网易WDF动画",nw[1])
						self.武器.返回 = 动画资源:载入(nw[3],"网易WDF动画",nw[2])
						self.武器.防御 = 动画资源:载入(nw[3],"网易WDF动画",nw[1])
					else
						self.武器.防御 = 动画资源:载入(zy,"网易WDF动画",w[4])
						self.武器.待战 = 动画资源:载入(zy,"网易WDF动画",w[6])
						self.武器.挨打 = 动画资源:载入(zy,"网易WDF动画",w[9])
						self.武器.返回 = 动画资源:载入(zy,"网易WDF动画",w[8])
					end
					pysa = math.floor(self.武器.攻击:取宽度()/20)
					if 模型 == "鬼潇潇" then
						pysa = -15
					elseif 模型 == "偃无师" or 模型 == "桃夭夭" or 模型 == "狐美人" then
						pysa = 2
						pysy = 18
					elseif 模型 == "玄彩娥" then
						if zl == "飘带" then
							pysa = -2
						else
							pysa = 18
						end
					elseif 模型 == "舞天姬" then
						pysa = 9
					elseif 模型 == "虎头怪" or 模型 == "真陀护法" then
						pysa = 15
					elseif  模型 == "神天兵" or 模型 == "骨精灵"then
						if zl == "枪矛" then
							pysa = 40
						else
							pysa = 20
						end
					elseif  模型 == "巨魔王" then
						pysa = 12
					elseif  模型 == "杀破狼" or 模型 == "巫蛮儿" then
						pysa = 7
					elseif 模型 == "逍遥生"  then
						pysa = 15
						pysy = 32
					elseif 模型 == "剑侠客"  then
						if zl == "刀" then
							pysa = 60
							pysy = 12
						else
							pysa = 25
							self.终结帧 = 1
						end
					elseif 模型 == "英女侠"  then
						pysa = -5
					elseif 模型 == "飞燕女"  then
						pysa = 25
						pysy = 29
					elseif 模型 == "吸血鬼" then
						pysa = -15
					elseif 模型 == "天兵" then
						pysa = 6
						pysy = 10
					end

					if w[3] ~= 0 then
						self.武器.死亡 = 动画资源:载入(zy,"网易WDF动画",w[3])
					end
					self.武器.施法 = 动画资源:载入(zy,"网易WDF动画",w[7])
					if 武器.染色方案 and 武器.染色组 then
						for n=1,#动作 do
							self.武器[动作[n]]:置染色(武器.染色方案,武器.染色组[1],武器.染色组[2],0)
						end
					end

				end
			else
				local w = qmsx(模型.."_身体")
				if w[1]~=nil and w[2]~=nil and w[3]~=nil and w[4]~=nil and w[6]~=nil and w[7]~=nil and w[8]~=nil and w[9]~=nil then
					local zy = w[10]
					self.身体={}
					self.身体["待战"] = 动画资源:载入(zy,"网易WDF动画",w[6])
					self.身体["跑去"] = 动画资源:载入(zy,"网易WDF动画",w[8])
					self.身体["防御"] = 动画资源:载入(zy,"网易WDF动画",w[4])
					self.身体["攻击"] = 动画资源:载入(zy,"网易WDF动画",w[1])
					self.身体["攻击2"] = 动画资源:载入(zy,"网易WDF动画",w[2])
					self.身体["挨打"] = 动画资源:载入(zy,"网易WDF动画",w[9])
					self.身体["返回"] = 动画资源:载入(zy,"网易WDF动画",w[8])
					if w[3] ~= 0 then
						self.身体["死亡"] = 动画资源:载入(zy,"网易WDF动画",w[3])
					end
					self.身体["施法"] = 动画资源:载入(zy,"网易WDF动画",w[7])
				end
				local w = qmsx(模型.."_装饰")
				if w[1]~=nil and w[2]~=nil and w[3]~=nil and w[4]~=nil and w[6]~=nil and w[7]~=nil and w[8]~=nil and w[9]~=nil then
					local zy = w[10]
					self.怪物饰品={}
					self.怪物饰品["待战"] = 动画资源:载入(zy,"网易WDF动画",w[6])
					self.怪物饰品["跑去"] = 动画资源:载入(zy,"网易WDF动画",w[8])
					self.怪物饰品["防御"] = 动画资源:载入(zy,"网易WDF动画",w[4])
					self.怪物饰品["攻击"] = 动画资源:载入(zy,"网易WDF动画",w[1])
					self.怪物饰品["攻击2"] = 动画资源:载入(zy,"网易WDF动画",w[2])
					self.怪物饰品["挨打"] = 动画资源:载入(zy,"网易WDF动画",w[9])
					self.怪物饰品["返回"] = 动画资源:载入(zy,"网易WDF动画",w[8])
					if w[3] ~= 0 then
						self.怪物饰品["死亡"] = 动画资源:载入(zy,"网易WDF动画",w[3])
					end
					self.怪物饰品["施法"] = 动画资源:载入(zy,"网易WDF动画",w[7])
				end
				local qsj = 引擎.模型特效库(模型.."攻击")
				if  #qsj > 0 then
					self.动作特效.攻击 = 动画资源:载入(qsj[2],"网易WDF动画",qsj[1])
				end
				qsj = 引擎.模型特效库(模型.."攻击2")
				if  #qsj > 0 then
					self.动作特效.攻击2 = 动画资源:载入(qsj[2],"网易WDF动画",qsj[1])
				end
				qsj = 引擎.模型特效库(模型.."施法")
				if  #qsj > 0 then
					self.动作特效.施法 = 动画资源:载入(qsj[2],"网易WDF动画",qsj[1])
				end
			end
		end
	else --宝宝

		local n = qmsx(模型)
		if zl ~= 0 and zl ~= true then
			n = qmsx(模型,zl)
		end
	   -- self.信息 = 角色信息
		self.行为 = "待战"
		self.状态行为 = "待战"
		self.动画 = {}
		self.动作特效 = {}
		local 动画资源 = 引擎.场景.资源
		local zy = n[10]

		self.动画.待战 = 动画资源:载入(zy,"网易WDF动画",n[6])
		self.动画.静立 = 动画资源:载入(zy,"网易WDF动画",n[6])
		--self.动画.待战:置染色(20306,1,1,0)
		self.动画.跑去 = 动画资源:载入(zy,"网易WDF动画",n[8])
		self.动画.防御 = 动画资源:载入(zy,"网易WDF动画",n[4])
		self.动画.攻击 = 动画资源:载入(zy,"网易WDF动画",n[1])
		self.动画.攻击2 = 动画资源:载入(zy,"网易WDF动画",n[2])
		self.动画.挨打 = 动画资源:载入(zy,"网易WDF动画",n[9])
		self.动画.返回 = 动画资源:载入(zy,"网易WDF动画",n[8])
		self.动画.死亡 = 动画资源:载入(zy,"网易WDF动画",n[3])
		self.动画.施法 = 动画资源:载入(zy,"网易WDF动画",n[7])
		if n[11]~=nil then
		    self.动画.攻击3 = 动画资源:载入(zy,"网易WDF动画",n[11])
		end
		local w = qmsx(模型.."_身体")
		if w[1]~=nil and w[2]~=nil and w[3]~=nil and w[4]~=nil and w[6]~=nil and w[7]~=nil and w[8]~=nil and w[9]~=nil then
			local zy = w[10]
			self.身体={}
			self.身体["待战"] = 动画资源:载入(zy,"网易WDF动画",w[6])
			self.身体["跑去"] = 动画资源:载入(zy,"网易WDF动画",w[8])
			self.身体["防御"] = 动画资源:载入(zy,"网易WDF动画",w[4])
			self.身体["攻击"] = 动画资源:载入(zy,"网易WDF动画",w[1])
			self.身体["攻击2"] = 动画资源:载入(zy,"网易WDF动画",w[2])
			self.身体["挨打"] = 动画资源:载入(zy,"网易WDF动画",w[9])
			self.身体["返回"] = 动画资源:载入(zy,"网易WDF动画",w[8])
			if w[3] ~= 0 then
				self.身体["死亡"] = 动画资源:载入(zy,"网易WDF动画",w[3])
			end
			self.身体["施法"] = 动画资源:载入(zy,"网易WDF动画",w[7])
		end
		local w = qmsx(模型.."_装饰")
		if w[1]~=nil and w[2]~=nil and w[3]~=nil and w[4]~=nil and w[6]~=nil and w[7]~=nil and w[8]~=nil and w[9]~=nil then
			local zy = w[10]
			self.怪物饰品={}
			self.怪物饰品["待战"] = 动画资源:载入(zy,"网易WDF动画",w[6])
			self.怪物饰品["跑去"] = 动画资源:载入(zy,"网易WDF动画",w[8])
			self.怪物饰品["防御"] = 动画资源:载入(zy,"网易WDF动画",w[4])
			self.怪物饰品["攻击"] = 动画资源:载入(zy,"网易WDF动画",w[1])
			self.怪物饰品["攻击2"] = 动画资源:载入(zy,"网易WDF动画",w[2])
			self.怪物饰品["挨打"] = 动画资源:载入(zy,"网易WDF动画",w[9])
			self.怪物饰品["返回"] = 动画资源:载入(zy,"网易WDF动画",w[8])
			if w[3] ~= 0 then
				self.怪物饰品["死亡"] = 动画资源:载入(zy,"网易WDF动画",w[3])
			end
			self.怪物饰品["施法"] = 动画资源:载入(zy,"网易WDF动画",w[7])
		end
		local qsj = 引擎.模型特效库(模型.."攻击")
		if  #qsj > 0 then
			self.动作特效.攻击 = 动画资源:载入(qsj[2],"网易WDF动画",qsj[1])
		end
		qsj = 引擎.模型特效库(模型.."攻击2")
		if  #qsj > 0 then
			self.动作特效.攻击2 = 动画资源:载入(qsj[2],"网易WDF动画",qsj[1])
		end
		qsj = 引擎.模型特效库(模型.."施法")
		if  #qsj > 0 then
			self.动作特效.施法 = 动画资源:载入(qsj[2],"网易WDF动画",qsj[1])
		end
		--变异=true
		if 变身 == nil or tp.显示变身卡造型==false then
			if 炫彩 ~= nil then
				for n=1,#动作 do
				   self.动画[动作[n]]:炫彩染色(炫彩,炫彩组)
				end
			elseif 染色方案~=0 and 染色组~=0 and 染色组~=nil and #染色组>0 then
				for n=1,#动作 do
					self.动画[动作[n]]:置染色(染色方案,染色组[1],染色组[2],染色组[3])
				end
			else
				if 变异 then
					for n=1,#动作 do
						if 染色信息[模型]~=nil then
							self.动画[动作[n]]:置染色(染色信息[模型].id,染色信息[模型].方案[1],染色信息[模型].方案[2],染色信息[模型].方案[3])
					    end
					end
				end
			end
			if 显示饰品 then
				local w = qmsx(模型.."_饰品")
				if w[1]~=nil and w[2]~=nil and w[3]~=nil and w[4]~=nil and w[6]~=nil and w[7]~=nil and w[8]~=nil and w[9]~=nil then
					local zy = w[10]
					self.怪物饰品={}
					self.怪物饰品["待战"] = 动画资源:载入(zy,"网易WDF动画",w[6])
					self.怪物饰品["跑去"] = 动画资源:载入(zy,"网易WDF动画",w[8])
					self.怪物饰品["防御"] = 动画资源:载入(zy,"网易WDF动画",w[4])
					self.怪物饰品["攻击"] = 动画资源:载入(zy,"网易WDF动画",w[1])
					self.怪物饰品["攻击2"] = 动画资源:载入(zy,"网易WDF动画",w[2])
					self.怪物饰品["挨打"] = 动画资源:载入(zy,"网易WDF动画",w[9])
					self.怪物饰品["返回"] = 动画资源:载入(zy,"网易WDF动画",w[8])
					if w[3] ~= 0 then
						self.怪物饰品["死亡"] = 动画资源:载入(zy,"网易WDF动画",w[3])
					end
					self.怪物饰品["施法"] = 动画资源:载入(zy,"网易WDF动画",w[7])
					if 饰品颜色 ~= nil then
						self.怪物饰品["待战"]:置颜色(饰品颜色,-1)
						self.怪物饰品["跑去"]:置颜色(饰品颜色,-1)
						self.怪物饰品["防御"]:置颜色(饰品颜色,-1)
						self.怪物饰品["攻击"]:置颜色(饰品颜色,-1)
						self.怪物饰品["攻击2"]:置颜色(饰品颜色,-1)
						self.怪物饰品["挨打"]:置颜色(饰品颜色,-1)
						self.怪物饰品["返回"]:置颜色(饰品颜色,-1)
						self.怪物饰品["死亡"]:置颜色(饰品颜色,-1)
						self.怪物饰品["施法"]:置颜色(饰品颜色,-1)
						--self.怪物饰品["行走"]:置颜色(饰品颜色,-1)
					end
				end
			else
				local w = qmsx(模型.."_装饰")
				if w[1]~=nil and w[2]~=nil and w[3]~=nil and w[4]~=nil and w[6]~=nil and w[7]~=nil and w[8]~=nil and w[9]~=nil then
					local zy = w[10]
					self.怪物饰品={}
					self.怪物饰品["待战"] = 动画资源:载入(zy,"网易WDF动画",w[6])
					self.怪物饰品["跑去"] = 动画资源:载入(zy,"网易WDF动画",w[8])
					self.怪物饰品["防御"] = 动画资源:载入(zy,"网易WDF动画",w[4])
					self.怪物饰品["攻击"] = 动画资源:载入(zy,"网易WDF动画",w[1])
					self.怪物饰品["攻击2"] = 动画资源:载入(zy,"网易WDF动画",w[2])
					self.怪物饰品["挨打"] = 动画资源:载入(zy,"网易WDF动画",w[9])
					self.怪物饰品["返回"] = 动画资源:载入(zy,"网易WDF动画",w[8])
					if w[3] ~= 0 then
						self.怪物饰品["死亡"] = 动画资源:载入(zy,"网易WDF动画",w[3])
					end
					self.怪物饰品["施法"] = 动画资源:载入(zy,"网易WDF动画",w[7])
				end
			end
		end
	end
   -- self.影子=动画资源:载入('shape.wdf',"网易WDF动画",0xDCE4B562)
   self.初始化结束 = true
end

function 战斗动画类:置方向(方向,动作)
	self.动画[动作]:置方向(方向)
	self.动画[动作]:换帧更新()
	if self.动作特效[动作] ~= nil then
		self.动作特效[动作]:置方向(方向)
		self.动作特效[动作]:换帧更新()
	end
	if self.新特效[动作] ~= nil then
		self.新特效[动作]:置方向(方向)
		self.新特效[动作]:换帧更新()
	end
	if self.武器~=nil and self.武器[动作]~=nil  then
		self.武器[动作]:置方向(方向)
		self.武器[动作]:换帧更新()
	end
    if self.副武器 and self.副武器[动作] then
        self.副武器[动作]:置方向(方向)
        self.副武器[动作]:换帧更新()
    end
	if self.身体~=nil and self.身体[动作]~=nil  then
		self.身体[动作]:置方向(方向)
		self.身体[动作]:换帧更新()
	end
	if self.怪物饰品~=nil and self.怪物饰品[动作]~=nil  then
		self.怪物饰品[动作]:置方向(方向)
		self.怪物饰品[动作]:换帧更新()
	end
end

function 战斗动画类:置帧率(动作,帧率)
	-- if 动作=="死亡" then
	--     帧率=0.16
	-- end
	-- self.动画[动作].帧率=帧率
	-- if self.动作特效[动作] ~= nil then
	-- 	self.动作特效[动作].帧率=帧率
	-- end
	-- if self.新特效[动作] ~= nil then
	-- 	self.新特效[动作].帧率=帧率
	-- end
	-- if self.武器~=nil and self.武器[动作]~=nil  then
	-- 	self.武器[动作].帧率=帧率
	-- end
 --    if self.副武器 and self.副武器[动作] then
 --        self.副武器[动作].帧率=帧率
 --    end
	-- if self.身体~=nil and self.身体[动作]~=nil  then
	-- 	self.身体[动作].帧率=帧率
	-- end
	-- if self.怪物饰品~=nil and self.怪物饰品[动作]~=nil  then
	-- 	self.怪物饰品[动作].帧率=帧率
	-- end
    if self.动画[动作] then
        self.动画[动作].帧率=帧率
        if self.动作特效[动作] ~= nil then
            self.动作特效[动作].帧率=帧率
        end
        if self.武器~=nil and self.武器[动作]~=nil  then
            self.武器[动作].帧率=帧率
        end
        if self.副武器 and self.副武器[动作] then
            self.副武器[动作].帧率=帧率
        end
        if self.身体~=nil and self.身体[动作]~=nil  then
            self.身体[动作].帧率=帧率
        end
        if self.怪物饰品~=nil and self.怪物饰品[动作]~=nil  then
            self.怪物饰品[动作].帧率=帧率
        end
    end
end

function 战斗动画类:置颜色(颜色,动作)
    if self.动画[动作] then
        self.动画[动作]:置颜色(颜色)
    --self.动画[动作]:换帧更新()
        if self.武器~=nil and self.武器[动作]~=nil  then
            self.武器[动作]:置颜色(颜色)
            --  self.武器[动作]:换帧更新()
        end
        if self.副武器 and self.副武器[动作] then
            self.副武器[动作]:置颜色(颜色)
        end
        if self.身体~=nil and self.身体[动作]~=nil  then
            self.身体[动作]:置颜色(颜色)
        end
        if self.怪物饰品~=nil and self.怪物饰品[动作]~=nil  then
            self.怪物饰品[动作]:置颜色(颜色)
        end
    end
end

function 战斗动画类:取当前帧(动作)
	if self.动画[动作] == nil then return 1 end
	return self.动画[动作]:取当前帧()
end

function 战斗动画类:取结束帧(动作)
	if self.动画[动作] == nil then return 1 end
	return self.动画[动作]:取结束帧()
end

function 战斗动画类:取开始帧(动作)
	if self.动画[动作] == nil then return 1 end
	return self.动画[动作]:取开始帧()
end

function 战斗动画类:更新(dt,动作)
	if self.动画[动作]~=nil then
		self.动画[动作]:更新(dt)
		if self.动作特效[动作] ~= nil then
			self.动作特效[动作]:更新(dt)
		end

		if self.新特效[动作] ~= nil then
			self.新特效[动作]:更新(dt)
		end
		if self.武器~=nil and self.武器[动作]~=nil  then
			self.武器[动作]:更新(dt)
		end
        if self.副武器 and self.副武器[动作] then
            self.副武器[动作]:更新(dt)
        end
		if self.身体~=nil and self.身体[动作]~=nil  then
			self.身体[动作]:更新(dt)
		end
		if self.怪物饰品~=nil and self.怪物饰品[动作]~=nil  then
			self.怪物饰品[动作]:更新(dt)
		end
	end
end

function 战斗动画类:临时染色(染色, 编号)
    临时染色列表[编号] = 1
    local aa = {"待战","攻击","攻击2","挨打","连击1","连击2","连击3"}
    for i = 1, #aa do
        self:置颜色(0xffff0000, aa[i])
    end
end

function 战斗动画类:还原染色()
    local aa = {"待战","攻击","攻击2","挨打","连击1","连击2","连击3"}
    for i = 1, #aa do
        if self.动画[aa[i]] then
            self.动画[aa[i]]:取消高亮(true)
            if self.武器~=nil and self.武器[aa[i]]~=nil then
                self.武器[aa[i]]:取消高亮(true)
            end
            if self.副武器~=nil and self.副武器[aa[i]]~=nil then
                self.副武器[aa[i]]:取消高亮(true)
            end
            if self.身体~=nil and self.身体[aa[i]]~=nil then
                self.身体[aa[i]]:取消高亮(true)
            end
            if self.怪物饰品~=nil and self.怪物饰品[aa[i]]~=nil then
                self.怪物饰品[aa[i]]:取消高亮(true)
            end
        end
    end
end

function 战斗动画类:显示(x,y,动作)
	--self.影子:显示(x,y)
	引擎.场景.影子:显示(x,y)
	self.动画[动作]:显示(x,y)
	if self.动作特效[动作] ~= nil then
		self.动作特效[动作]:显示(x,y)
	end
	if self.新特效[动作] ~= nil then
		self.新特效[动作]:显示(x,y)
	end
	if self.武器~=nil and self.武器[动作]~=nil  then
		self.武器[动作]:显示(x,y)
	end
    if self.副武器 and self.副武器[动作] then
        self.副武器[动作]:显示(x,y)
    end
	if self.身体~=nil and self.身体[动作]~=nil  then
		self.身体[动作]:显示(x,y)
	end
	if self.怪物饰品~=nil and self.怪物饰品[动作]~=nil  then
		self.怪物饰品[动作]:显示(x,y)
	end
end

function 战斗动画类:释放()
 for i=1,#动作 do
	self.动画[动作[i]]:释放()
	if self.武器~=nil and self.武器[动作[i]]~=nil  then
		self.武器[动作[i]]:释放()
	end
	if self.怪物饰品~=nil and self.怪物饰品[动作[i]]~=nil  then
		self.怪物饰品[动作[i]]:释放()
	end
 end
end

return 战斗动画类