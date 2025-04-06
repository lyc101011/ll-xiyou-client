-- @Author: baidwwy
-- @Date:   2024-06-13 16:59:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-08-01 01:37:35
local 场景类_召唤兽查看栏 = class()
local floor = math.floor
local xslb,bb,lb,tp,字体,zts
local format = string.format
local insert = table.insert
local ani = 引擎.取战斗模型
local yx = {{68+4,4},{25+4,28},{111+4,28},{24+4,75},{111+4,75},{68+4,97}}
local tainfufu = {"最大气血","最大魔法","攻击","防御","速度","灵力"}
function 场景类_召唤兽查看栏:初始化(根)
	self.ID = 12
	self.x = 271
	self.y = 117
	self.xx = 0
	self.yy = 0
	self.注释 = "召唤兽查看栏"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,482,396,3,9),
		[2] = 按钮.创建(根.资源:载入('aaa.wdf',"网易WDF动画",0x1343E13),0,0,4,true,true),
		[3] = 按钮.创建(自适应.创建(12,4,70,22,1,3),0,0,4,true,true,"鉴定宝宝"),
		[4] = 自适应.创建(2,1,165,134,3,9),
		[5] = 自适应.创建(3,1,165,22,1,3),
		[6] = 自适应.创建(3,1,82,22,1,3),
		[7] = 自适应.创建(3,1,46,22,1,3),
		-- [8] = 自适应.创建(3,1,96,22,1,3),
		[9] = 自适应.创建(3,1,58,22,1,3),
		[10] = 自适应.创建(3,1,104,22,1,3),
		[11] = 资源:载入('org.rpk',"网易WDF动画",0x1000368),--技能底图
   		[12] = 资源:载入('wzife.wdf',"网易WDF动画",0x661470ed), --认证格子
		[15] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x7AB5584C),0,0,4,true,true),
		[16] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xCB50AB1D),0,0,4,true,true),
		[17] = 按钮.创建(资源:载入('org.rpk',"网易WDF动画",0x1000381),0,0,4,true,true,"技\n能"),
		[18] = 按钮.创建(资源:载入('org.rpk',"网易WDF动画",0x1000381),0,0,4,true,true,"内\n丹"),
		[19] = 按钮.创建(资源:载入('org.rpk',"网易WDF动画",0x1000381),0,0,4,true,true,"进\n阶"),
		[20] = 资源:载入('org.rpk',"网易WDF动画",0x1000365),--7
		[21] = 资源:载入('org.rpk',"网易WDF动画",0x1000367),--8
		[22] = 资源:载入('org.rpk',"网易WDF动画",0x1000366),--9
		[23] = 资源:载入('aaa.wdf',"网易WDF动画",89),

	}
	self.进阶 ={
 	    [1] = 资源:载入('wzife.wd3',"网易WDF动画",0x4536A03D),--进阶1
		[2] = 资源:载入('wzife.wd3',"网易WDF动画",0x714C3706),--2
		[3] = 资源:载入('wzife.wd3',"网易WDF动画",0xD60014B8),-----3
		[4] = 资源:载入('wzife.wd3',"网易WDF动画",0xF7EBF987), ----4
		[5] = 资源:载入('wzife.wd3',"网易WDF动画",0x11963488),----5
		[6] = 资源:载入('wzife.wd3',"网易WDF动画",0x9A4F1961),--6
		[7] = 资源:载入('wzife.wd3',"网易WDF动画",0x1E7ABB94), --7
		[8] = 资源:载入('wzife.wd3',"网易WDF动画",0xA6C9A76A),--8
		[9] = 资源:载入('wzife.wd3',"网易WDF动画",0x2982E3F7),---9
		[10] = 资源:载入('wzife.wd3',"网易WDF动画",0x1D0717D7),---91
		[11] = 资源:载入('wzife.wd3',"网易WDF动画",0xC44F0602),--94
		[12] = 资源:载入('wzife.wd3',"网易WDF动画",0x9765D0B3),--97
		[13] = 资源:载入('wzife.wd3',"网易WDF动画",0x36A2C1A6),--100
		[14] = 资源:载入('wzife.wd3',"网易WDF动画",0xAFC2E161), --未完成内框
		[15] = 资源:载入('wzife.wd3',"网易WDF动画",0x27E24CFA), --开启
		[16] = 资源:载入('wzife.wd3',"网易WDF动画",0x1094AD16),----进阶界面
		[17] = 资源:载入('wzife.wd3',"网易WDF动画",890425107), --未开启
    }
    self.tsk={
		[1] =自适应.创建(3,1,96,22,1,3),
		[2] =自适应.创建(3,1,96,22,1,3),
		[3] =自适应.创建(3,1,96,22,1,3),
		[4] =自适应.创建(3,1,96,22,1,3),
		[5] =自适应.创建(3,1,96,22,1,3),
		[6] =自适应.创建(3,1,96,22,1,3),
	}
	self.技能 = {}
	self.内丹技能 = {}
	self.技能数量 =0
	self.物品 = {}
	local wp = 根._物品格子
	for i=1,3 do
	    self.物品[i] = wp(0,0,i,"召唤兽资质物品")
	end
	for n=2,3 do
		self.资源组[n]:绑定窗口_(12)
	end
	for n=15,19 do
		self.资源组[n]:绑定窗口_(12)
	end
	for i=17,19 do
	    self.资源组[i]:置偏移(-4,2)
	end
	local gz = 根._技能格子
	for n=1,24 do
	  	self.技能[n] = gz(0,0,n,"技能查看")
	end
	self.认证格子={}
	self.认证格子=gz(0,0,0,"技能查看")
	self.窗口时间 = 0
	tp = 根
	self.技能下一页 = false
	self.技能下一页1 = false
	self.动画 = {}
	字体 = tp.字体表.普通字体
	zts = tp.字体表.猫猫字体1
end

function 场景类_召唤兽查看栏:打开(b)

	if b==nil and self.可视 then
	    self.技能数量 =0
		self.技能下一页 = false
		self.技能下一页1 = false
		bb = nil
		self.bb = nil
		self.内丹技能 = {}
		xslb = nil
		self.状态 = nil
		self.可视 = false
	else
		if tp.战斗中 then
		    insert(tp.战斗窗口_,self) --测试模式 修改战斗中显示窗口时更改
		else
			insert(tp.窗口_,self)
		end
		bb = b

		self.bb = nil
		if bb.进阶~= nil then
			self.bb = bb.进阶
		else
		    self.bb = nil
		end
		self.技能数量 =#bb.技能
		self.认证格子:置技能(nil)
		for i=1,24 do
			self.技能[i]:置技能(nil)
		end
		local num = 0
		local jcjn = DeepCopy(bb.技能)
		local go = false
		for k,v in pairs(bb.技能) do
			if v.名称==nil then
			    go = true --这种是没有技能属性的
			end
		end
		if go then
			table.sort(jcjn,function(a,b) return 宝宝队伍图排序[a]<宝宝队伍图排序[b] end )
			for i=1,#bb.技能 do
				if jcjn[i]==bb.法术认证 then
	             	self.认证格子:置技能(jcjn[i])
	           	else
	           		num = num +1
				    local 临时技能=tp._技能.创建()
				    临时技能:置对象(jcjn[i],2,"sdf")
				    self.技能[num]:置技能(临时技能)
	           	end
			end
		else
			table.sort(jcjn,function(a,b) return 宝宝队伍图排序[a.名称]<宝宝队伍图排序[b.名称] end )
			for i=1,#bb.技能 do
				if jcjn[i].名称==bb.法术认证 then
	             	self.认证格子:置技能(jcjn[i])
	           	else
	           		num = num +1
				    local 临时技能=tp._技能.创建()
				    临时技能:置对象(jcjn[i],2)
				    self.技能[num]:置技能(jcjn[i])
	           	end
			end
		end
		self.内丹技能 = {}
		for i=1,bb.内丹.内丹上限 do
			if bb.内丹.格子 ~= nil then
				if bb.内丹.格子[i] ~= nil then
					self.内丹技能[i]=tp._内丹.创建()
					self.内丹技能[i]:置内丹(bb.内丹.格子[i],2,bb)
				end
			end
		end
		for i=1,3 do
		    self.物品[i]:置物品(bb.装备[i])
		end
		self:置形象()
		self.状态 = 1
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.技能下一页 = false
		self.技能下一页1 = false
	end
end

-- function 场景类_召唤兽查看栏:打开(b)
-- 	if b~=nil and self.可视 then self.可视=false end
-- 	if self.可视 then
-- 		if b ~= nil and bb ~= b then
-- 			bb = b
-- 			self.bb = nil
-- 			if bb.进阶~= nil then
-- 				self.bb = bb.进阶
-- 			else
-- 			    self.bb = nil
-- 			end
-- 			for i=1,3 do
-- 			    self.物品[i]:置物品(bb.装备[i])
-- 			end
-- 			self.技能数量=#bb.技能
-- 			self.认证格子:置技能(nil)
-- 			for i=1,24 do
-- 				self.技能[i]:置技能(nil)
-- 			end
-- 			local num = 0
-- 			local jcjn = DeepCopy(bb.技能)
-- 			local go = false
-- 			for k,v in pairs(bb.技能) do
-- 				if v.名称==nil then
-- 				    go = true --这种是没有技能属性的
-- 				end
-- 			end
-- 			if go then
-- 				table.sort(jcjn,function(a,b) return 宝宝队伍图排序[a]<宝宝队伍图排序[b] end )
-- 				for i=1,#bb.技能 do
-- 					if jcjn[i]==bb.法术认证 then
-- 		             	self.认证格子:置技能(jcjn[i])
-- 		           	else
-- 		           		num = num +1
-- 					    local 临时技能=tp._技能.创建()
-- 					    临时技能:置对象(jcjn[i],2,"sdf")
-- 					    self.技能[num]:置技能(临时技能)
-- 		           	end
-- 				end
-- 			else
-- 				table.sort(jcjn,function(a,b) return 宝宝队伍图排序[a.名称]<宝宝队伍图排序[b.名称] end )
-- 				for i=1,#bb.技能 do
-- 					if jcjn[i].名称==bb.法术认证 then
-- 		             	self.认证格子:置技能(jcjn[i])
-- 		           	else
-- 		           		num = num +1
-- 					    local 临时技能=tp._技能.创建()
-- 					    临时技能:置对象(jcjn[i],2)
-- 					    self.技能[num]:置技能(jcjn[i])
-- 		           	end
-- 				end
-- 			end
-- 			self.内丹技能 = {}
-- 			for i=1,bb.内丹.内丹上限 do
-- 				if bb.内丹.格子 ~= nil then
-- 					if bb.内丹.格子[i] ~= nil then
-- 						self.内丹技能[i]=tp._内丹.创建()
-- 						self.内丹技能[i]:置内丹(bb.内丹.格子[i],2,bb)
-- 					end
-- 				end
-- 			end

-- 			tp.运行时间 = tp.运行时间 + 1
-- 		    self.窗口时间 = tp.运行时间
-- 		    return false
-- 		end
-- 		self.技能数量 =0
-- 		self.技能下一页 = false
-- 		self.技能下一页1 = false
-- 		bb = nil
-- 		self.bb = nil
-- 		self.内丹技能 = {}
-- 		xslb = nil
-- 		self.状态 = nil
-- 		self.可视 = false
-- 	else

-- 		insert(tp.窗口_,self)
-- 		if tp.战斗中 then
-- 		    insert(tp.战斗窗口_,self) --测试模式 修改战斗中显示窗口时更改
-- 		end
-- 		bb = b
-- 		self.bb = nil
-- 		if bb.进阶~= nil then
-- 			self.bb = bb.进阶
-- 		else
-- 		    self.bb = nil
-- 		end
-- 		self.技能数量 =#bb.技能
-- 		self.认证格子:置技能(nil)
-- 		for i=1,24 do
-- 			self.技能[i]:置技能(nil)
-- 		end
-- 		local num = 0
-- 		local jcjn = DeepCopy(bb.技能)
-- 		local go = false
-- 		for k,v in pairs(bb.技能) do
-- 			if v.名称==nil then
-- 			    go = true --这种是没有技能属性的
-- 			end
-- 		end
-- 		if go then
-- 			table.sort(jcjn,function(a,b) return 宝宝队伍图排序[a]<宝宝队伍图排序[b] end )
-- 			for i=1,#bb.技能 do
-- 				if jcjn[i]==bb.法术认证 then
-- 	             	self.认证格子:置技能(jcjn[i])
-- 	           	else
-- 	           		num = num +1
-- 				    local 临时技能=tp._技能.创建()
-- 				    临时技能:置对象(jcjn[i],2,"sdf")
-- 				    self.技能[num]:置技能(临时技能)
-- 	           	end
-- 			end
-- 		else
-- 			table.sort(jcjn,function(a,b) return 宝宝队伍图排序[a.名称]<宝宝队伍图排序[b.名称] end )
-- 			for i=1,#bb.技能 do
-- 				if jcjn[i].名称==bb.法术认证 then
-- 	             	self.认证格子:置技能(jcjn[i])
-- 	           	else
-- 	           		num = num +1
-- 				    local 临时技能=tp._技能.创建()
-- 				    临时技能:置对象(jcjn[i],2)
-- 				    self.技能[num]:置技能(jcjn[i])
-- 	           	end
-- 			end
-- 		end
-- 		self.内丹技能 = {}
-- 		for i=1,bb.内丹.内丹上限 do
-- 			if bb.内丹.格子 ~= nil then
-- 				if bb.内丹.格子[i] ~= nil then
-- 					self.内丹技能[i]=tp._内丹.创建()
-- 					self.内丹技能[i]:置内丹(bb.内丹.格子[i],2,bb)
-- 				end
-- 			end
-- 		end

-- 		for i=1,3 do
-- 		    self.物品[i]:置物品(bb.装备[i])
-- 		end
-- 		self:置形象()
-- 		self.状态 = 1
-- 		tp.运行时间 = tp.运行时间 + 1
-- 	    self.窗口时间 = tp.运行时间
-- 	    self.可视 = true
-- 	    self.技能下一页 = false
-- 		self.技能下一页1 = false
-- 	end
-- end

function 场景类_召唤兽查看栏:置形象()
	if bb ~= nil then
		self.动画 = {}
		local n = ani(bb.模型)
		self.动画.主体 = tp.资源:载入(n[10],"网易WDF动画",n[6])
		self.动画.主体:置方向(0)
		n = ani(bb.模型.."_身体")
		if n[6] ~= nil then
			self.动画.身体 = tp.资源:载入(n[10],"网易WDF动画",n[6])
			self.动画.身体:置方向(0)
		end
		if bb.饰品 ~= nil then
			n = ani(bb.模型.."_饰品")
			if n[6] ~= nil then
				self.动画.饰品 = tp.资源:载入(n[10],"网易WDF动画",n[6])

				if bb.饰品颜色 then
				    self.动画.饰品:置颜色(bb.饰品颜色,-1)
				end
				self.动画.饰品:置方向(0)
			end
		else
			n = ani(bb.模型.."_装饰")
			if n[6] ~= nil then
				self.动画.饰品 = tp.资源:载入(n[10],"网易WDF动画",n[6])
				self.动画.饰品:置方向(0)
			end
		end
		if bb.炫彩 ~= nil then
			self.动画.主体:炫彩染色(bb.炫彩,bb.炫彩组)
			if self.动画.身体 ~= nil then
				self.动画.身体:炫彩染色(bb.炫彩,bb.炫彩组)
			end
		else
			if bb.染色方案 ~= nil and bb.染色组~=nil then
				self.动画.主体:置染色(bb.染色方案,bb.染色组[1],bb.染色组[2],bb.染色组[3])
				self.动画.主体:置方向(0)
				if self.动画.身体 ~= nil then
					self.动画.身体:置染色(bb.染色方案,bb.染色组[1],bb.染色组[2],bb.染色组[3])
					self.动画.身体:置方向(0)
				end
			end
		end
	end
end

function 场景类_召唤兽查看栏:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[17]:更新(x,y,self.状态 ~= 1)
	self.资源组[18]:更新(x,y,self.状态 ~= 2)
	self.资源组[19]:更新(x,y)

	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	self.资源组[4]:显示(self.x+15,self.y+51)
	self.资源组[5]:显示(self.x+15,self.y+190)
	self.资源组[6]:显示(self.x+77,self.y+216)
	self.资源组[7]:显示(self.x+200,self.y+216)
	self.资源组[17]:显示(self.x+208+239,self.y+308-62,true,nil,nil,self.状态 == 1,2)
	self.资源组[18]:显示(self.x+208+239,self.y+354-62,true,nil,nil,self.状态 == 2,2)
	self.资源组[19]:显示(self.x+208+239,self.y+400-62,true,nil,nil,self.状态 == 3,2)

	for i=1,6 do
		-- self.资源组[8]:显示(self.x+49,self.y+241-24+23*i)
		self.tsk[i]:显示(self.x+49,self.y+241-24+23*i)
		self.资源组[9]:显示(self.x+187,self.y+241-24+23*i)
	end
	for i=1,9 do
		self.资源组[10]:显示(self.x+364,self.y+8+23*i)
	end
	-- self.资源组[15]:显示(self.x + 436,self.y + 278)
	-- self.资源组[16]:显示(self.x + 436,self.y + 312)

	self.资源组[3]:更新(x,y)
	self.资源组[3]:显示(self.x + 6,self.y,true)

	if self.鼠标 then
		if self.资源组[2]:事件判断() then
			self:打开()
			return false
		elseif self.资源组[3] ~= nil and self.资源组[3]:事件判断() then
			if xslb == nil then
				xslb = true
				if bb~=nil then
					if  bb.元宵~=nil then
				    tp.常规提示:打开("#Y/这只召唤兽还可以用喂食#G"..bb.元宵.可用.."#Y个元宵，#G"..bb.元宵.炼兽真经.."#Y本炼兽珍经，#G"..bb.元宵.如意丹.."#Y个如意丹，#G"..bb.元宵.千金露.."#Y个千金露，#G"..bb.元宵.水晶糕.."#Y个水晶糕。")
				end
				end
				self.资源组[3]:置文字("显示类型")
			else
				xslb = nil
				self.资源组[3]:置文字("鉴定宝宝")
			end
		elseif self.资源组[17]:事件判断() then --3
			self.状态 = 1
		elseif self.资源组[18]:事件判断() then -- 4
			self.状态 = 2
		elseif self.资源组[19]:事件判断() then --5
			self.状态 = 3
		end
	end
	if self.动画.主体 ~= nil then
		tp.影子:显示(self.x + 100,self.y+152)
		self.动画.主体:更新()
		self.动画.主体:显示(self.x + 100,self.y+152)
		if self.动画.身体 ~= nil then
			self.动画.身体:更新()
			self.动画.身体:显示(self.x + 100,self.y+152)
		end
		if self.动画.饰品 ~= nil then
			self.动画.饰品:更新()
			self.动画.饰品:显示(self.x + 100,self.y+152)
		end
	end

	-- local v = ""
	if xslb then
		-- 字体:置颜色(绿色)
		字体:置颜色(绿色):显示(self.x + 16,self.y + 33,bb.种类 or "未知")
	else
		-- 字体:置颜色(白色)
		-- 字体:置颜色(白色):显示(self.x + 16,self.y + 33,bb.模型)
		if bb.原造型 then
		    字体:置颜色(白色):显示(self.x + 14,self.y + 31,bb.模型)
		    -- local cd=string.len(bb.模型)
		    zts:置颜色(黄色):显示(self.x + 14+字体:取宽度(bb.模型),self.y + 33,"（原造型:"..bb.原造型.."）")
		else
		    字体:置颜色(白色):显示(self.x + 14,self.y + 31,bb.模型)
		end
	end

	字体:置颜色(-16777216)
	字体:显示(self.x + 25,self.y + 181+13,bb.名称)
	字体:显示(self.x + 95,self.y + 209+11,bb.参战等级)
	字体:显示(self.x + 214,self.y + 209+11,bb.等级)
    local weizhi
	local shux=""
	if bb.天赋符 then
		weizhi=bb.天赋符.khdwz
		shux=bb.天赋符.lx
		if self.tsk[weizhi]:是否选中(x,y) then
		    tp.提示:自定义(x-42,y+27,"#Y天赋符效果：#G"..tainfufu[weizhi].."+"..bb.天赋符.zhi)
		end
	end
    if shux=="最大气血" then
    	字体:置颜色(0xffCC0033):显示(self.x + 62,self.y +241-20+23*1,format("%d/%d",bb.气血,bb.最大气血))
    else
    	字体:置颜色(-16777216):显示(self.x + 62,self.y +241-20+23*1,format("%d/%d",bb.气血,bb.最大气血))
    end
	if shux=="伤害" then
    	字体:置颜色(0xffCC0033):显示(self.x + 62,self.y +241-20+23*3,bb.伤害)
    else
    	字体:置颜色(-16777216):显示(self.x + 62,self.y +241-20+23*3,bb.伤害)
    end
	if shux=="防御" then
    	字体:置颜色(0xffCC0033):显示(self.x + 62,self.y +241-20+23*4,bb.防御)
    else
    	字体:置颜色(-16777216):显示(self.x + 62,self.y +241-20+23*4,bb.防御)
    end
	if shux=="速度" then
    	字体:置颜色(0xffCC0033):显示(self.x + 62,self.y +241-20+23*5,bb.速度)
    else
    	字体:置颜色(-16777216):显示(self.x + 62,self.y +241-20+23*5,bb.速度)
    end
	if shux=="灵力" then
    	字体:置颜色(0xffCC0033):显示(self.x + 62,self.y +241-20+23*6,bb.灵力)
    else
    	字体:置颜色(-16777216):显示(self.x + 62,self.y +241-20+23*6,bb.灵力)
    end

if bb.特性五维 ~=nil then

    local wwsx = {体质=bb.体质+bb.特性五维.体质,魔力=bb.魔力+bb.特性五维.魔力,力量=bb.力量+bb.特性五维.力量,耐力=bb.耐力+bb.特性五维.耐力,敏捷=bb.敏捷+bb.特性五维.敏捷}
	字体:置颜色(-16777216)
	字体:显示(self.x + 62,self.y +241-20+23*2,format("%d/%d",bb.魔法,bb.最大魔法))
	字体:显示(self.x + 195,self.y +241-20+23*1,wwsx.体质)
	字体:显示(self.x + 195,self.y +241-20+23*2,wwsx.魔力)
	字体:显示(self.x + 195,self.y +241-20+23*3,wwsx.力量)
	字体:显示(self.x + 195,self.y +241-20+23*4,wwsx.耐力)
	字体:显示(self.x + 195,self.y +241-20+23*5,wwsx.敏捷)
else

	字体:置颜色(-16777216)
	字体:显示(self.x + 62,self.y +241-20+23*2,format("%d/%d",bb.魔法,bb.最大魔法))
	字体:显示(self.x + 195,self.y +241-20+23*1)
	字体:显示(self.x + 195,self.y +241-20+23*2)
	字体:显示(self.x + 195,self.y +241-20+23*3)
	字体:显示(self.x + 195,self.y +241-20+23*4)
	字体:显示(self.x + 195,self.y +241-20+23*5)
	tp.字体表.普通字体:显示(self.x + 206,self.y + 232+10,bb.体质)
	tp.字体表.普通字体:显示(self.x + 206,self.y + 257+10,bb.魔力)
	tp.字体表.普通字体:显示(self.x + 206,self.y + 280+10,bb.力量)
	tp.字体表.普通字体:显示(self.x + 206,self.y + 305+10,bb.耐力)
	tp.字体表.普通字体:显示(self.x + 206,self.y + 328+10,bb.敏捷)
	--tp.字体表.普通字体:显示(self.x + 206,self.y + 352,0)
		end
	字体:显示(self.x + 195,self.y +241-20+23*6,bb.潜力)
	字体:显示(self.x + 374,self.y +12+23*1,bb.攻击资质)
	字体:显示(self.x + 374,self.y +12+23*2,bb.防御资质)
	字体:显示(self.x + 374,self.y +12+23*3,bb.体力资质)
	字体:显示(self.x + 374,self.y +12+23*4,bb.法力资质)
	字体:显示(self.x + 374,self.y +12+23*5,bb.速度资质)
	字体:显示(self.x + 374,self.y +12+23*6,bb.躲闪资质)

	if bb.种类=="神兽" then
		字体:显示(self.x + 374,self.y +12+23*7,"★永生★")
	else
		字体:显示(self.x + 374,self.y +12+23*7,bb.寿命)
	end
	字体:显示(self.x + 374,self.y +12+23*8,bb.成长)
	字体:显示(self.x + 374,self.y +12+23*9,bb.五行)
	字体:置颜色(白色)
	-- 字体:显示(self.x + 16,self.y + 33,bb.模型..v)
	字体:显示(self.x + 16,self.y + 209+11,"参战等级")
	字体:显示(self.x + 166,self.y + 209+11,"等级")
	字体:显示(self.x + 16,self.y +241-20+23*1,"气血")
	字体:显示(self.x + 16,self.y +241-20+23*2,"魔法")
	字体:显示(self.x + 16,self.y +241-20+23*3,"攻击")
	字体:显示(self.x + 16,self.y +241-20+23*4,"防御")
	字体:显示(self.x + 16,self.y +241-20+23*5,"速度")
	字体:显示(self.x + 16,self.y +241-20+23*6,"灵力")
	字体:显示(self.x + 153,self.y +241-20+23*1,"体质")
	字体:显示(self.x + 153,self.y +241-20+23*2,"法力")
	字体:显示(self.x + 153,self.y +241-20+23*3,"力量")
	字体:显示(self.x + 153,self.y +241-20+23*4,"耐力")
	字体:显示(self.x + 153,self.y +241-20+23*5,"敏捷")
	字体:置颜色(-1404907)
	字体:显示(self.x + 153,self.y +241-20+23*6,"潜能")
	字体:置颜色(白色)
	字体:置字间距(10)
	字体:显示(self.x + 261,self.y +12+23*1,"攻击资质")
	字体:显示(self.x + 261,self.y +12+23*2,"防御资质")
	字体:显示(self.x + 261,self.y +12+23*3,"体力资质")
	字体:显示(self.x + 261,self.y +12+23*4,"法力资质")
	字体:显示(self.x + 261,self.y +12+23*5,"速度资质")
	字体:显示(self.x + 261,self.y +12+23*6,"躲闪资质")
	字体:置字间距(58)
	字体:置颜色(-1404907)
	字体:显示(self.x + 261,self.y +12+23*7,"寿命")
	字体:显示(self.x + 261,self.y +12+23*8,"成长")
	字体:显示(self.x + 261,self.y +12+23*9,"五行")
	字体:置字间距(0)
    if self.状态 == 1 then
		local xx = 0
		local yy = 0
		if self.技能下一页 == false then
			if self.技能数量>12 then
				self.资源组[16]:更新(x,y)
				self.资源组[16]:显示(self.x+436,self.y+354) --下一页
				if self.资源组[16]:事件判断() then
					self.技能下一页 = true
					self.技能下一页1 = false
				end
			end
			for n=1,12 do
				self.资源组[11]:显示(self.x+266+(xx*42),self.y+240+11+(yy*42))
				if self.技能[n].技能 ~= nil then
					self.技能[n]:置坐标(self.x+266+(xx*42),self.y+240+11+(yy*42))
					self.技能[n]:显示(x,y,"技能查看")
					if self.技能[n].焦点 then
						tp.提示:技能(x,y,self.技能[n].技能)
					end
				end
				if bb.法术认证 ~= nil and n ==12 then
					-- if #bb.技能 <12 then
					-- 	self.资源组[12]:显示(self.x+393,self.y+336)
					-- end
					if #bb.技能 <=12 then --法术认证也算是技能的
						self.认证格子:置坐标(self.x+266+(xx*42),self.y+240+11+(yy*42))
						self.认证格子:显示(x,y,"技能查看")
						self.资源组[12]:显示(self.x+392,self.y+336)
						if self.认证格子.焦点 and self.认证格子.技能 ~= nil then
			   	    	 	tp.提示:技能(x,y,self.认证格子.技能)
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
			self.资源组[15]:更新(x,y)
			self.资源组[15]:显示(self.x+436,self.y+332-19-60)
			if self.资源组[15]:事件判断() then
				self.技能下一页 = false
				self.技能下一页1 = true
			end
			if self.技能下一页1 == false then
				for n=13,24 do
					self.资源组[11]:显示(self.x+266+(xx*42),self.y+240+11+(yy*42))
					if self.技能[n].技能 ~= nil then
						self.技能[n]:置坐标(self.x+266+(xx*42),self.y+240+11+(yy*42))
						self.技能[n]:显示(x,y,"技能查看")
						if self.技能[n].焦点 then
							tp.提示:技能(x,y,self.技能[n].技能)
						end
					end
					if bb.法术认证 ~= nil and n ==24 then
						-- if #bb.技能 >12 then
						-- 	self.资源组[12]:显示(self.x+392,self.y+336)
						-- end
						self.认证格子:置坐标(self.x+266+(xx*42),self.y+240+11+(yy*42))
						self.认证格子:显示(x,y,self.鼠标)
						self.资源组[12]:显示(self.x+392,self.y+336)
						if self.认证格子.焦点 and self.认证格子.技能 ~= nil then
			   	    	 	tp.提示:技能(x,y,self.认证格子.技能)
			   	     	end
					end
					xx = xx + 1
					if xx > 3 then
						xx = 0
						yy = yy + 1
					end
				end
			end
		end
	elseif self.状态==2 then
		local jx = self.x+261
		local jy = self.y+247
		self.资源组[20]:显示(jx,jy)
		local v1 = bb.内丹.内丹上限
		for i=1,6 do
			local jxx = jx + yx[i][1]
			local jxy = jy + yx[i][2]
			if i <= v1 then
				-- local go = false
				self.资源组[22]:显示(jxx,jxy)
				if self.内丹技能[i] ~= nil then
					self.内丹技能[i].内丹.模型:显示(jxx,jxy)
				end
				if self.鼠标 and self.资源组[22]:是否选中(x,y) then
					if self.内丹技能[i] ~= nil then
						tp.提示:内丹提示2(x,y,self.内丹技能[i],go)
					else
						tp.提示:内丹提示(x,y,self.资源组[22],{名称="可用的内丹技能格",介绍="可以学习的内丹技能"})
					end
					self.焦点 = true
				end
			else
				self.资源组[21]:显示(jxx,jxy)
				if self.鼠标 and self.资源组[21]:是否选中(x,y) then
					tp.提示:内丹提示(x,y,self.资源组[21],{名称="不可用内丹技能格",介绍="召唤兽可用内丹格数量与其参战等级相关"})
					self.焦点 = true
				end
			end
		end
	elseif self.状态==3 then
		local jx = self.x+261
		local jy = self.y+247
		self.资源组[23]:显示(jx,jy)
		self.进阶[16]:显示(jx+40,jy+7)
		if self.进阶[16]:是否选中(鼠标.x,鼠标.y) then
			tp.提示:自定义(鼠标.x,鼠标.y,"#W/使用#Y/易经丹#W/可以提升该召唤兽灵性,当灵性到达到50可以获得新的造型")
		end
		if self.bb~= nil and self.bb.灵性 ~= nil then
			if self.bb.灵性>0 and self.bb.灵性<0 then
		    elseif self.bb.灵性>0 and self.bb.灵性<= 10 then
		    	self.进阶[1]:显示(jx+39,jy+7)
		    elseif self.bb.灵性>10 and self.bb.灵性<= 20 then
		    	self.进阶[2]:显示(jx+39,jy+7)
		    elseif self.bb.灵性>20 and self.bb.灵性<= 30 then
		    	self.进阶[3]:显示(jx+39,jy+7)
		    elseif self.bb.灵性>30 and self.bb.灵性<= 40 then
		    	self.进阶[4]:显示(jx+39,jy+7)
		    elseif self.bb.灵性>40 and self.bb.灵性<= 50 then
		    	self.进阶[5]:显示(jx+39,jy+7)
		    elseif self.bb.灵性>50 and self.bb.灵性<= 60 then
		    	self.进阶[6]:显示(jx+39,jy+7)
		    elseif self.bb.灵性>60 and self.bb.灵性<= 70 then
		    	self.进阶[7]:显示(jx+39,jy+7)
		    elseif self.bb.灵性>70 and self.bb.灵性<= 80 then
		    	self.进阶[8]:显示(jx+39,jy+7)
		    elseif self.bb.灵性>80 and self.bb.灵性<= 90 then
		        self.进阶[9]:显示(jx+39,jy+7)
		    elseif self.bb.灵性>90 and self.bb.灵性<= 91 then
		    	self.进阶[10]:显示(jx+39,jy+7)
		    elseif self.bb.灵性>91 and self.bb.灵性<= 93 then
		    	self.进阶[11]:显示(jx+39,jy+7)
		    elseif self.bb.灵性>93 and self.bb.灵性<= 97 then
		        self.进阶[12]:显示(jx+39,jy+7)
		    elseif self.bb.灵性>=98  then
		        self.进阶[13]:显示(jx+39,jy+7)
			end
			if self.bb.灵性>80 and self.bb.特性=="无" then
				self.进阶[14]:显示(jx+51,jy+30)
			elseif self.bb.灵性>80 and self.bb.特性~="无" then
				if self.bb.开启 then
					self.进阶[15]:显示(jx+67,jy+36)
					字体:置颜色(0xFFFFFFA4)
					字体:显示(jx+74,jy+46,self.bb.特性)
				else
				    self.进阶[17]:显示(jx+67,jy+34)
				    字体:置颜色(白色)
					字体:显示(jx+74,jy+46,self.bb.特性)
				end
			end
		    if (self.进阶[14]:是否选中(鼠标.x,鼠标.y) or self.进阶[15]:是否选中(鼠标.x,鼠标.y) or self.进阶[17]:是否选中(鼠标.x,鼠标.y)) and self.bb.特性~= "无" then
				tp.提示:特性提示(鼠标.x,鼠标.y,self.bb)
			end
			if self.bb.灵性>0 then
				字体:置颜色(0xFFFFFFFF)
				字体:显示(jx+65,jy+115,"灵性:"..self.bb.灵性)
			end
		end
	end
	tp.宝宝装备背景[1]:显示(self.x+193,self.y+33)
	tp.宝宝装备背景[2]:显示(self.x+193,self.y+33+63)
	tp.宝宝装备背景[3]:显示(self.x+193,self.y+33+63+63)

	for i=1,3 do
	    self.物品[i]:置坐标(self.x + 195 ,self.y + 33+63*(i-1))
	    self.物品[i]:显示(dt,x,y,self.鼠标)
	    if self.物品[i].物品 ~= nil and self.物品[i].焦点 then
		   tp.提示:道具行囊(x,y,self.物品[i].物品)
		end
	end
end

function 场景类_召唤兽查看栏:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_召唤兽查看栏:初始移动(x,y)
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

function 场景类_召唤兽查看栏:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_召唤兽查看栏