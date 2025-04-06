-- @Author: baidwwy
-- @Date:   2024-04-03 22:06:51
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-01 21:50:41
-- @Author: 小神QQ190909219
-- @Date:   2023-08-17 23:38:49
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2023-09-19 17:11:29
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2023-06-06 20:54:40
--======================================================================--
local 场景类_召唤兽资质栏 = class()
local zts,bb,tp,zts1,zjcz
local yx = {{68+4,4},{25+4,28},{111+4,28},{24+4,75},{111+4,75},{68+4,97}}
local insert = table.insert
local bds = {"攻击资质","防御资质","体力资质","法力资质","速度资质","躲闪资质"}
local bds1 = {"寿命","成长","五行"}

function 场景类_召唤兽资质栏:初始化(根)
	self.ID = 14
	self.xx = 0
	self.yy = 0
	self.注释 = "召唤兽资质栏"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,242,454,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮.创建(资源:载入('org.rpk',"网易WDF动画",0x1000381),0,0,4,true,true,"技\n能"),
		[4] = 按钮.创建(资源:载入('org.rpk',"网易WDF动画",0x1000381),0,0,4,true,true,"内\n丹"),
		[5] = 按钮.创建(资源:载入('org.rpk',"网易WDF动画",0x1000381),0,0,4,true,true,"进\n阶"),
		[6] = 资源:载入('org.rpk',"网易WDF动画",0x1000368),
		[7] = 资源:载入('org.rpk',"网易WDF动画",0x1000365),
		[8] = 资源:载入('org.rpk',"网易WDF动画",0x1000367),
		[9] = 资源:载入('org.rpk',"网易WDF动画",0x1000366),
		[10] = 资源:载入('wzife.wd2',"网易WDF动画",0x10E2B4A7),
		[11] = 资源:载入('aaa.wdf',"网易WDF动画",89),--资源:载入('wzife.wd3',"网易WDF动画",0xC361C087),
		[12] = 资源:载入('org.rpk',"网易WDF动画",0x1000373),
		[13] = 自适应.创建(3,1,95,19,1,3),
		[14] = 资源:载入('wzife.wd1',"网易WDF动画",1072608390), --转圈圈
		[15] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x7AB5584C),0,0,4,true,true),--上一页
		[16] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xCB50AB1D),0,0,4,true,true),--下一页
		[19] = 资源:载入('wzife.wdf',"网易WDF动画",0x661470ed),
		[20] = 资源:载入('wzcf.npk',"网易WDF动画","小紫黄标"),
		[21] = 按钮.创建(资源:载入('wzcf.npk',"网易WDF动画","小紫黄标"),0,0,4,true,true),
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
   self.资源组[21]:绑定窗口_(14)
	self.物品 = {}
	local wp = 根._物品格子
	for i=1,3 do
		self.物品[i] = wp(0,0,i,"召唤兽资质物品")
	end
	self.技能 = {}
	self.内丹技能 = {}
	self.技能数量 =0
	self.技能页数 =1
	local jn = 根._技能格子
	for i=1,99 do
		self.技能[i] = jn(0,0,i,"召唤兽资质技能")
	end
	self.认证格子={}
	self.认证格子=jn(0,0,0,"召唤兽资质技能")
	for i=2,5 do
		self.资源组[i]:绑定窗口_(14)
	end
	for i=15,16 do
		 self.资源组[i]:绑定窗口_(14)
	end
	for i=3,5 do
		self.资源组[i]:置偏移(-4,2)
	end
	self.技能数量 =0
	tp = 根
	zts = tp.字体表.猫猫字体3
	zts1 = tp.字体表.普通字体
	self.状态 = 1
	self.窗口时间 = 0
	self.技能下一页 = false
	self.技能下一页1 = false
	self.宝宝序号 = 0
end



function 场景类_召唤兽资质栏:打开(b,序号)
	if self.可视 then
		if b ~= nil and  b ~= bb then
			self.宝宝序号 = 序号
			bb = b
			self.bb = nil
			if bb.进阶~= nil then
				self.bb = bb.进阶
			else
				self.bb = nil
			end
			for i=1,3 do
				self.物品[i]:置物品(bb.装备[i])
			end
			local num = 0

			self.认证格子:置技能(nil)
			for i=1,96 do
				self.技能[i]:置技能(nil)
			end
			-- self:当前图排序()
			-- local bbjn = table.copy(bb.技能)
			for i=1,#bb.技能 do
				if bb.技能[i].名称==bb.法术认证 then
					self.认证格子:置技能(bb.技能[i])
				else
					num = num +1
					local 临时技能=tp._技能.创建()
					临时技能:置对象(bb.技能[i],2)
					self.技能[num]:置技能(bb.技能[i])
				end
			end

			self.技能数量 =#bb.技能
			self.技能页数 = 1

			zjcz=0
			for n = 1,#tp.坐骑列表 do
				if tp.坐骑列表[n].统御召唤兽[1] == bb.认证码 or tp.坐骑列表[n].统御召唤兽[2] == bb.认证码 then
					zjcz = tp.坐骑列表[n].初始成长
				end
			end
			self.内丹技能 = {}
	if bb.内丹 then
			for i=1,bb.内丹.内丹上限 do
				if bb.内丹.格子 ~= nil then
					if bb.内丹.格子[i] ~= nil then
						self.内丹技能[i]=tp._内丹.创建()
						self.内丹技能[i]:置内丹(bb.内丹.格子[i],zjcz,bb)
					end
				end
			end
			self.技能下一页 = false
			self.技能下一页1 = false
			return
		end
	end
		self.内丹技能 = {}
		if tp.窗口._赐福效果小窗.可视 then
		    tp.窗口._赐福效果小窗:关闭()
		end

		self.技能下一页 = false
		self.技能下一页1 = false
		self.技能数量 = 0
		self.宝宝序号 = 0
		self.状态 = nil
		self.可视 = false
	else
		self.技能页数 = 1
		if tp.战斗中 then
			insert(tp.战斗窗口_,self)
		else
			insert(tp.窗口_,self)
		end
		bb = b
		self.宝宝序号 = 序号
		self.bb = nil
		if bb.进阶~= nil then
			self.bb = bb.进阶
		else
			self.bb = nil
		end
		for i=1,3 do
			self.物品[i]:置物品(bb.装备[i])
		end
		local num = 0

		self.认证格子:置技能(nil)
		for i=1,96 do
			self.技能[i]:置技能(nil)
		end
		-- self:当前图排序()
		for i=1,#bb.技能 do
			if bb.技能[i].名称==bb.法术认证 then
				self.认证格子:置技能(bb.技能[i])
			else
				num = num +1
				local 临时技能=tp._技能.创建()
				临时技能:置对象(bb.技能[i],2,"召唤兽")
				self.技能[num]:置技能(bb.技能[i])
			end
		end


		self.技能数量 =#bb.技能

		zjcz=0
		for n = 1,#tp.坐骑列表 do
			if tp.坐骑列表[n].统御召唤兽[1] == bb.认证码 or tp.坐骑列表[n].统御召唤兽[2] == bb.认证码 then
				zjcz = tp.坐骑列表[n].初始成长
			end
		end
		self.内丹技能 = {}
	if bb.内丹 then
		for i=1,bb.内丹.内丹上限 do
			if bb.内丹.格子 ~= nil then
				if bb.内丹.格子[i] ~= nil then
					self.内丹技能[i]=tp._内丹.创建()
					self.内丹技能[i]:置内丹(bb.内丹.格子[i],zjcz,bb)
				end
			end
		end
		self.技能下一页 = false
		self.技能下一页1 = false

		self.状态 = 1
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
	end
end

-- function 场景类_召唤兽资质栏:当前图排序()
-- 	local function 简易排序(a,b)
-- 		return Skillranking[a.名称]<Skillranking[b.名称]
-- 	end
-- 	table.sort(bb.技能,简易排序)
-- end
function 场景类_召唤兽资质栏:更新成长(rzm,cz)
	if bb and bb.认证码==rzm and bb.认证码 == tp.队伍[1].宝宝列表[tp.窗口.道具行囊.选中召唤兽].认证码 then
		bb.成长=cz
	end
end
function 场景类_召唤兽资质栏:更新资质(rzm,zz,um)
	if bb and bb.认证码==rzm and bb.认证码 == tp.队伍[1].宝宝列表[tp.窗口.道具行囊.选中召唤兽].认证码 then
		bb[zz]=um
	end
end

function 场景类_召唤兽资质栏:更新灵性(数据)
	if 数据==nil then
		return
	end

	if bb and  bb.认证码 == 数据.认证码 and 数据.认证码 == tp.队伍[1].宝宝列表[tp.窗口.道具行囊.选中召唤兽].认证码 then
		self.bb=数据.进阶
	end
end

function 场景类_召唤兽资质栏:刷新特性开关(数据)
	self.bb.开启=数据
end

function 场景类_召唤兽资质栏:更新内丹(序号,内丹)
	if 数据==nil then
		return
	end

	if self.宝宝序号 == 序号 then
		for i=1,bb.内丹.内丹上限 do
			if bb.内丹.格子[i] ~= nil then
				if bb.内丹.格子[i].技能==内丹.格子[i].技能 then
					bb.内丹.格子[i].等级=内丹.格子[i].等级
				end
			end
		end
	end
end

function 场景类_召唤兽资质栏:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y,self.状态 ~= 1)
	self.资源组[4]:更新(x,y,self.状态 ~= 2)
	self.资源组[5]:更新(x,y)

	if self.资源组[2]:事件判断() then
		self:打开()
		return false
	elseif self.资源组[3]:事件判断() then
		self.状态 = 1
	elseif self.资源组[4]:事件判断() then
		self.状态 = 2
	elseif self.资源组[5]:事件判断() then
		self.状态 = 3
	end
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-82+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"召唤兽资质")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	self.资源组[12]:显示(self.x+15,self.y+27)
	zts1:置颜色(白色)
	zts1:置字间距(6)
	for i=0,5 do
		zts1:显示(self.x+19,self.y+100+i*23,bds[i+1])
		self.资源组[13]:显示(self.x+124,self.y+96+i*23)
	end
	zts1:置字间距(46)
	zts1:置颜色(-1404907)
	for i=0,2 do
		zts1:显示(self.x+19,self.y+238+i*23,bds1[i+1])
		self.资源组[13]:显示(self.x+124,self.y+234+i*23)
	end
	zts1:置颜色(4294967295)
	zts1:置字间距(0)
	-- self.资源组[3]:显示(self.x+208,self.y+308,true,nil,nil,self.状态 == 1,2)
	-- self.资源组[4]:显示(self.x+208,self.y+354,true,nil,nil,self.状态 == 2,2)
	-- self.资源组[5]:显示(self.x+208,self.y+400,true,nil,nil,self.状态 == 3,2)
	----------------------------------------------------------------------
	self.资源组[3]:显示(self.x+208,self.y+319,true,nil,nil,self.状态 == 1,2)
	self.资源组[4]:显示(self.x+208,self.y+319+43,true,nil,nil,self.状态 == 2,2)
	self.资源组[5]:显示(self.x+208,self.y+319+86,true,nil,nil,self.状态 == 3,2)
	if bb.丸子技能~=nil and bb.丸子技能[1]~=nil then
		self.资源组[21]:更新(x,y)
		self.资源组[21]:显示(self.x+213,self.y+304)
	end
	if self.资源组[21]:是否选中(x,y) then
		if bb ~= nil and tp.窗口._赐福效果小窗.可视 == false then
	    	tp.窗口._赐福效果小窗:打开(bb,self.x,self.y)
	    end
	end
	-----------------------------------------------------------------------
	local xx = 0
	local yy = 0
	if self.状态 == 1 then
		for i=1,12 do
			local jx = self.x+20+(xx*41)
			local jy = self.y+309+(yy*41)
			self.资源组[6]:显示(jx,jy)
			xx = xx + 1
			if xx > 3 then
				xx = 0
				yy = yy + 1
			end
		end
		self.b=0
        if self.技能数量>12 then
            self.显示数量=12
			if self.技能页数==1 then
				self.资源组[16]:更新(x,y)
				self.资源组[16]:显示(self.x+192,self.y+406)
				if self.资源组[16]:事件判断() then
					self.技能页数=self.技能页数+1
				end
		  	elseif self.技能页数==2 and  self.技能数量>24 then
				self.资源组[15]:更新(x,y)
				self.资源组[15]:显示(self.x+192,self.y+326)
				if self.资源组[15]:事件判断() then
					self.技能页数=self.技能页数-1
				end
				self.资源组[16]:更新(x,y)
				self.资源组[16]:显示(self.x+192,self.y+406)
				if self.资源组[16]:事件判断() then
					self.技能页数=self.技能页数+1
				end
			elseif self.技能页数==3 and  self.技能数量>36 then
				self.资源组[15]:更新(x,y)
				self.资源组[15]:显示(self.x+192,self.y+326)
				if self.资源组[15]:事件判断() then
					self.技能页数=self.技能页数-1
				end
				self.资源组[16]:更新(x,y)
				self.资源组[16]:显示(self.x+192,self.y+406)
				if self.资源组[16]:事件判断() then
					self.技能页数=self.技能页数+1
				end
			elseif self.技能页数==4 and  self.技能数量>48 then
				self.资源组[15]:更新(x,y)
				self.资源组[15]:显示(self.x+192,self.y+326)
				if self.资源组[15]:事件判断() then
					self.技能页数=self.技能页数-1
				end
				self.资源组[16]:更新(x,y)
				self.资源组[16]:显示(self.x+192,self.y+406)
				if self.资源组[16]:事件判断() then
					self.技能页数=self.技能页数+1
				end
			elseif self.技能页数==5 and  self.技能数量>60 then
				self.资源组[15]:更新(x,y)
				self.资源组[15]:显示(self.x+192,self.y+326)
				if self.资源组[15]:事件判断() then
					self.技能页数=self.技能页数-1
				end
				self.资源组[16]:更新(x,y)
				self.资源组[16]:显示(self.x+192,self.y+406)
				if self.资源组[16]:事件判断() then
					self.技能页数=self.技能页数+1
				end
			elseif self.技能页数==6 and  self.技能数量>72 then
				self.资源组[15]:更新(x,y)
				self.资源组[15]:显示(self.x+192,self.y+326)
				if self.资源组[15]:事件判断() then
					self.技能页数=self.技能页数-1
				end
				self.资源组[16]:更新(x,y)
				self.资源组[16]:显示(self.x+192,self.y+406)
				if self.资源组[16]:事件判断() then
					self.技能页数=self.技能页数+1
				end
			elseif self.技能页数==7 and  self.技能数量>84 then
				self.资源组[15]:更新(x,y)
				self.资源组[15]:显示(self.x+192,self.y+326)
				if self.资源组[15]:事件判断() then
					self.技能页数=self.技能页数-1
				end
				self.资源组[16]:更新(x,y)
				self.资源组[16]:显示(self.x+192,self.y+406)
				if self.资源组[16]:事件判断() then
					self.技能页数=self.技能页数+1
				end
			elseif self.技能页数==8 and  self.技能数量>96 then
				self.资源组[15]:更新(x,y)
				self.资源组[15]:显示(self.x+192,self.y+326)
				if self.资源组[15]:事件判断() then
					self.技能页数=self.技能页数-1
				end
				self.资源组[16]:更新(x,y)
				self.资源组[16]:显示(self.x+192,self.y+406)
				if self.资源组[16]:事件判断() then
					self.技能页数=self.技能页数+1
				end
		  	else
				self.资源组[15]:更新(x,y)
				self.资源组[15]:显示(self.x+192,self.y+326)
				if self.资源组[15]:事件判断() then
					self.技能页数=self.技能页数-1
				end
			end
        else
            self.显示数量=self.技能数量
        end


        for n=1,self.显示数量 do
            self.a=n/4
         	if(self.a<1)then
                self.a=1
            elseif(self.a>1 and self.a<2)then
                self.a=2
            elseif(self.a>2 and self.a<3)then
                self.a=3
            end
            self.b=self.b+1
            if(self.b==5)then
                self.b=1
            end
            self.显示序列=self.技能页数*12-12+n
            -- if self.显示序列>self.技能数量 then return 0 end
            local jx = self.x+20+(self.b*41-41)
			local jy = self.y+309+(self.a*41-41)
	   	    self.技能[self.显示序列]:置坐标(jx+3,jy+2)
	   	    self.技能[self.显示序列]:显示(x,y,self.鼠标)
	   	    ----------------------------------
	   	    -- if self.技能[self.显示序列].焦点 and self.技能[self.显示序列].技能 ~= nil then
	   	    -- 	tp.提示:技能(x,y,self.技能[self.显示序列].技能)
	   	    -- end
	   	    if self.技能[self.显示序列].焦点 and self.技能[self.显示序列].技能 ~= nil then --超级技能
				if 丸子SFCJ[self.技能[self.显示序列].技能.名称] then
					tp.提示:超级技能(x,y+20,nil,"不显示",self.技能[self.显示序列].技能.名称)
				else
					tp.提示:技能(x,y,self.技能[self.显示序列].技能)
				end
			end
	   	    ----------------------------------
			if self.技能页数==1 and self.显示序列<12 and bb.法术认证~=nil then
				self.认证格子:置坐标(self.x+22+(3*41),self.y+311+(2*41))
				self.认证格子:显示(x,y,self.鼠标)
				--[[if self.认证技能[1].焦点 and self.认证技能[1].技能~=nil then
					tp.提示:技能(x,y,self.认证技能[1].技能)
				end--]]
			elseif self.技能页数==2 and self.显示序列<24 and bb.法术认证~=nil then
				self.认证格子:置坐标(self.x+22+(3*41),self.y+311+(2*41))
				self.认证格子:显示(x,y,self.鼠标)
				--[[if self.认证技能[1].焦点 and self.认证技能[1].技能~=nil then
					tp.提示:技能(x,y,self.认证技能[1].技能)
				end--]]
			end
			    --===============超级技能2.5 大改
				local cjtb=false
				if self.技能[self.显示序列].技能 ~= nil and bb.丸子技能 ~= nil then --超级技能2.8 改
					for k,v in pairs(bb.丸子技能) do
						-----------------超级技能2.8 加
						local qgjjn=取技能是否有高级(bb,v.名称)
						-----------------
						if v.生效 and qgjjn==self.技能[self.显示序列].技能.名称 then --超级技能2.8 改
							cjtb=true
						end
					end
					if cjtb then
						self.资源组[20]:显示(jx+2,jy+2)
					end
				end
				if self.技能[self.显示序列].焦点 and self.技能[self.显示序列].技能 ~= nil and 引擎.按键按住(KEY.ALT) then
					if bb ~= nil and tp.窗口._赐福效果小窗.可视 == false then
						tp.提示:超级技能(x,y+20,self.技能[self.显示序列].技能.名称,cjtb)
				    end
				end
				--===============
		end
	elseif self.状态 == 2 then
		local jx = self.x+20
		local jy = self.y+309
		self.资源组[14]:更新(dt)
		self.资源组[7]:显示(jx,jy)
		if self.资源组[7]:是否选中(x,y) then
			tp.禁止关闭 = true
		end


		if bb.内丹 then

		local v1 = bb.内丹.内丹上限

		for i=1,6 do
			local jxx = jx + yx[i][1]
			local jxy = jy + yx[i][2]
			if i <= v1 then
				-- local go = false
				self.资源组[9]:显示(jxx,jxy)
				if self.内丹技能[i] ~= nil then
					self.内丹技能[i].内丹.模型:显示(jxx,jxy)
					if self.内丹技能[i].内丹.等级 and self.内丹技能[i].内丹.等级<5 then
						-- go = true
						self.资源组[14]:显示(jxx,jxy)
						if self.内丹技能[i].内丹.模型:是否选中(x,y) then
							if 引擎.鼠标弹起(右键) and not tp.战斗中 then
								引擎.场景.窗口.鉴定:打开(nil,self.宝宝序号)
							end
						end
					end
				end
				if self.鼠标 and self.资源组[9]:是否选中(x,y) then
					if self.内丹技能[i] ~= nil then
						tp.提示:内丹提示2(x,y,self.内丹技能[i],go)
					else
						tp.提示:内丹提示(x,y,self.资源组[9],{名称="可用的内丹技能格",介绍="可以学习的内丹技能"})
					end
					self.焦点 = true
				end
			else
				self.资源组[8]:显示(jxx,jxy)
				if self.鼠标 and self.资源组[8]:是否选中(x,y) then
					tp.提示:内丹提示(x,y,self.资源组[8],{名称="不可用内丹技能格",介绍="召唤兽可用内丹格数量与其参战等级相关"})
					self.焦点 = true
				end
			end
		end
	end
	elseif self.状态 == 3 then
		local jx = self.x+20
		local jy = self.y+309
		self.资源组[11]:显示(jx,jy)
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
					zts1:置颜色(0xFFFFFFA4)
					zts1:显示(jx+74,jy+46,self.bb.特性)
				else
					self.进阶[17]:显示(jx+67,jy+34)
					zts1:置颜色(白色)
					zts1:显示(jx+74,jy+46,self.bb.特性)
				end
			end

			if (self.进阶[14]:是否选中(鼠标.x,鼠标.y) or self.进阶[15]:是否选中(鼠标.x,鼠标.y) or self.进阶[17]:是否选中(鼠标.x,鼠标.y)) and self.bb.特性~= "无" then
				tp.提示:特性提示(鼠标.x,鼠标.y,self.bb)
				if (self.进阶[15]:是否选中(鼠标.x,鼠标.y) or self.进阶[17]:是否选中(鼠标.x,鼠标.y)) and 引擎.鼠标弹起(左键) then
					发送数据(5017,{认证码=bb.认证码})
				end
			end
			if self.bb.灵性>0 then
				zts1:置颜色(0xFFFFFFFF)
				zts1:显示(jx+65,jy+115,"灵性:"..self.bb.灵性)
			end

			-- if self.bb.最高灵性显示 then
			-- 	zts1:置颜色(0xFFFFFFFF)
			--   zts1:显示(jx+20,jy+115,"灵性:"..self.bb.灵性)
			-- 	zts1:置颜色(0xFFFFFFFF)
			--  zts1:显示(jx+75,jy+115,"(历史最高值"..self.bb.最高灵性..")")
			-- elseif  self.bb.灵性>0 then
			-- 		zts1:置颜色(0xFFFFFFFF)
			-- zts1:显示(jx+65,jy+115,"灵性:"..self.bb.灵性)
			-- end
		end
	end
	for i=1,3 do
		self.物品[i]:置坐标(self.x + 30 + (i-1) *65,self.y + 33)
		self.物品[i]:显示(dt,x,y,self.鼠标)
		if self.物品[i].物品 ~= nil and self.物品[i].焦点 then
		   tp.提示:道具行囊(x,y,self.物品[i].物品)
		end
	end
	zts:置颜色(0xFF022222)
	zts:显示(self.x+131,self.y+100+1,bb.攻击资质)
	zts:显示(self.x+131,self.y+123+1,bb.防御资质)
	zts:显示(self.x+131,self.y+146+1,bb.体力资质)
	zts:显示(self.x+131,self.y+169+1,bb.法力资质)
	zts:显示(self.x+131,self.y+192+1,bb.速度资质)
	zts:显示(self.x+131,self.y+215+1,bb.躲闪资质)
	if bb.种类=="神兽" then
		zts:显示(self.x+131,self.y+238+1,"★永生★")
	else
		zts:显示(self.x+131,self.y+238+1,bb.寿命)
	end
	zts:显示(self.x+131,self.y+261+1,bb.成长)
	zts:显示(self.x+131,self.y+284+1,bb.五行)
end

function 场景类_召唤兽资质栏:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_召唤兽资质栏:初始移动(x,y)
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

function 场景类_召唤兽资质栏:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_召唤兽资质栏