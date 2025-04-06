-- @Author: baidwwy
-- @Date:   2024-09-11 20:07:40
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-09-12 16:33:41
-- @Author: baidwwy
-- @Date:   2024-03-08 00:35:13
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-08-30 21:11:22
local 场景类_剑会商店类 = class()
local tp,zts,zts1
local insert = table.insert
local xxx = 0
local yyy = 0
local bw = require("gge包围盒")(0,0,240,20)
local box = 引擎.画矩形
local sts = {"单价","数量","总额","现金"}
local tos = 引擎.取摊位金钱颜色
local mouseb = 引擎.鼠标弹起

function 场景类_剑会商店类:初始化(根)
	self.ID = 194
	self.x = 364
	self.y = 100
	self.xx = 0
	self.yy = 0
	self.注释 = "商店"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true

	self.商品 = {}
	self.召唤兽 = {}
	local 物品格子 = 根._物品格子
	for i=1,25 do
		self.商品[i] = 物品格子(0,i,n,"商店")
	end
	self.选中 = 0
	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('剑会商店类总控件')
	总控件:置可视(true,true)
	self.输入框 = 总控件:创建输入("剑会商店类数量输入",0,0,100,14)
	self.输入框:置可视(false,false)
	self.输入框:置限制字数(3)
	self.输入框:置数字模式()
	self.输入框:屏蔽快捷键(true)
	self.输入框:置光标颜色(-16777216)
	self.输入框:置文字颜色(-16777216)
	self.输入框:置文本("")
	self.单价 = 0
	self.总价 = 0
	self.数量 = 0
	self.商店类型="物品店"
	self.窗口时间 = 0
	self.环装=false
	tp = 根
	zts = 根.字体表.普通字体
	zts1 = 根.字体表.描边字体
end

function 场景类_剑会商店类:打开(道具组)
	if self.可视 then
		for i=1,25 do
			self.商品[i]:置物品(nil)
		end
		self.页数=1
		self.道具 = nil
		self.单价 = 0
		self.总价 = 0
		self.数量 = 0
		self.环装=false
		self.可视 = false
		self.积分 = 0
		if self.商品[self.选中]~= nil then
			self.商品[self.选中].确定 = false
		end
		self.选中 = 0
		self.输入框:置焦点(false)
		self.输入框:置可视(false,false)
	else
		self.商店类型="物品店"
		if 道具组.类型=="环装店" then
		    self.环装=true
		end
		if self.资源组==nil then
		    local 资源 = tp.资源
			local 按钮 = tp._按钮
			local 自适应 = tp._自适应
			self.资源组 = {
				[1] = 自适应.创建(0,1,272,420,3,9),
				[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
				[3] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"购买"),
				[4] = 资源:载入('org.rpk',"网易WDF动画",0x1000394),
				[5] = 自适应.创建(3,1,94,19,1,3),
				[7] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"上间"),
				[8] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"下间"),
				[9] = 按钮.创建(自适应.创建(12,4,32,22,1,3),0,0,4,true,true,"宠"),
				[10] = 按钮.创建(自适应.创建(12,4,32,22,1,3),0,0,4,true,true,"道"),
				[11] = 自适应.创建(3,1,35,19,1,3),
				[12] = 自适应.创建(4,1,249,300,3,nil),
			}
			for n=2,3 do
				self.资源组[n]:绑定窗口_(self.ID)
			end
			for n=7,10 do
				self.资源组[n]:绑定窗口_(self.ID)
			end
		end
		self.数量 = 0
		self.选中 = 0
		self.店主id=4000501
		self.页数=1
		self.道具数据=道具组.数据
		self.积分 = 道具组.积分 or 0
		insert(tp.窗口_,self)
		for n=1,25 do
			self.商品[n]:置物品(self.道具数据[n])
		end
		self.输入框:置可视(true,true)
		self.输入框:置文本("")
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
		self.商店名称="梦幻商会"
	end
end

function 场景类_剑会商店类:物品店翻页()
	self.选中=0
	if #self.道具数据- ((self.页数-1)*25) > 0 then
		for n=1,25 do
			self.商品[n]:置物品(self.道具数据[n+((self.页数-1)*25)])
		end
	end
end

function 场景类_剑会商店类:刷新数据(数据)
	if 数据.类型 == "召唤兽店" then
		self.输入框:置焦点(false)
		self.输入框:置可视(false,false)
		self.页数=1
		self.选中=0
		self.召唤兽数据 = 数据.数据
		for n=1,12 do
			self.召唤兽[n]=self.召唤兽数据[n+((self.页数-1)*12)]
		end
		self.商店类型="召唤兽店"
	else
    	self.页数=1
		self.选中=0
		self.道具数据=数据.数据
		for n=1,25 do
			self.商品[n]:置物品(self.道具数据[n])
		end
		self.输入框:置可视(true,true)
		self.输入框:置文本("")
		self.商店类型="物品店"
		if 数据.类型=="环装店" then
		    self.环装=true
		end
	end
end

function 场景类_剑会商店类:召唤兽店翻页()
	self.选中=0
	if #self.召唤兽数据- ((self.页数-1)*12) > 0 then
		for n=1,12 do
			self.召唤兽[n]=self.召唤兽数据[n+((self.页数-1)*12)]
		end
	end
end

function 场景类_剑会商店类:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y,self.选中 ~= 0)
	self.资源组[7]:更新(x,y,self.页数 ~= 1)
	self.资源组[8]:更新(x,y,#self.道具数据- (self.页数*25) > 0)
	-- self.资源组[9]:更新(x,y,self.商店类型~="召唤兽店")
	-- self.资源组[10]:更新(x,y,self.商店类型~="物品店")
	if self.资源组[2]:事件判断() then
		self:打开()
	elseif self.资源组[3]:事件判断() then
		self.数量 = math.min(math.max(self.数量,1),99)
		-- if not self.道具数据[self.选中].可叠加 then
		-- 	self.数量 = 1
		-- end
		发送数据(81.9,{类型="购买",数据={数量=self.数量,类型=self.商店类型,页数=self.页数-1,选中=self.选中,环装=self.环装}})
	end
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"剑会商店类")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	self.资源组[3]:显示(self.x+188,self.y+390,true)
	if self.商店类型=="物品店" then
		self:物品店(dt,x,y)
	elseif  self.商店类型=="召唤兽店" then
		self:召唤兽店(dt,x,y)
	end
end

function 场景类_剑会商店类:召唤兽店(dt,x,y)
	self.资源组[7]:更新(x,y,self.页数 ~= 1)
	self.资源组[8]:更新(x,y,#self.召唤兽数据- (self.页数*12) > 0)
	-- self.资源组[9]:更新(x,y,self.商店类型~="召唤兽店")
	-- self.资源组[10]:更新(x,y,self.商店类型~="物品店")
	if self.资源组[7]:事件判断() then
		self.页数=self.页数-1
		self:召唤兽店翻页()
	elseif self.资源组[8]:事件判断() then
		self.页数=self.页数+1
		self:召唤兽店翻页()
	elseif self.资源组[10]:事件判断() then
		-- 发送数据(80,{类型="物品店"})
	end
	self.资源组[7]:显示(self.x+168,self.y+341)
	self.资源组[8]:显示(self.x+168,self.y+365)
	-- self.资源组[9]:显示(self.x+228,self.y+341)
	-- self.资源组[10]:显示(self.x+228,self.y+365)
	self.资源组[12]:显示(self.x+12,self.y+19)
	zts1:显示(self.x+24,self.y+454,self.页数)
	zts1:显示(self.x+190,self.y+22,"价格")
	zts1:显示(self.x+40,self.y+22,"名称")
	for i=1,12 do
		if self.召唤兽[i] ~= nil then
			zts:置颜色(-16777216)
			local jx = self.x+34
			local jy = self.y+35+i*22
			bw:置坐标(jx-22,jy-3)
			if i ~= self.选中 then
				if bw:检查点(x,y) then
					box(jx-22,jy-6,jx+226,jy+15,-3551379)
					self.焦点 = true
					if mouseb(0) and self.鼠标 and not tp.消息栏焦点 then
						self.选中 = i
					end
				end
			else
				local ys = -10790181
				if bw:检查点(x,y) then
					ys = -9670988
					-- self.焦点1 = true
					self.焦点 = true
					if mouseb(1) and self.鼠标 and not tp.消息栏焦点 then
						tp.窗口.召唤兽查看栏:打开(self.召唤兽[i])
					end
				end
				box(jx-22,jy-6,jx+226,jy+15,ys)
			end
			zts:显示(jx,jy-2,self.召唤兽[i].名称)
			zts:显示(jx+160,jy-2,self.召唤兽[i].价格)
		end
	end
end

function 场景类_剑会商店类:物品店(dt,x,y)
	self.资源组[3]:更新(x,y,self.道具 ~= nil)
	self.资源组[7]:更新(x,y,self.页数 ~= 1)
	self.资源组[8]:更新(x,y,#self.道具数据- (self.页数*25) > 0)
	-- self.资源组[9]:更新(x,y,self.商店类型~="召唤兽店")
	-- self.资源组[10]:更新(x,y,self.商店类型~="物品店")
	if self.资源组[7]:事件判断() then
		if self.商品[self.选中]~= nil then
			self.商品[self.选中].确定 = false
		end
		self.页数=self.页数-1
		self:物品店翻页()
	elseif self.资源组[8]:事件判断() then
		if self.商品[self.选中]~= nil then
			self.商品[self.选中].确定 = false
		end
		self.页数=self.页数+1
		self:物品店翻页()
	elseif self.资源组[9]:事件判断() then
		-- 发送数据(80,{类型="召唤兽店"})
	end
	self.资源组[3]:显示(self.x+188,self.y+390,true)
	self.资源组[7]:显示(self.x+168,self.y+341)
	self.资源组[8]:显示(self.x+168,self.y+365)
	-- self.资源组[9]:显示(self.x+228,self.y+341)
	-- self.资源组[10]:显示(self.x+228,self.y+365)
	zts:置颜色(4294967295)
	zts:置字间距(15)
	for i=0,3 do
		self.资源组[5]:显示(self.x+70,self.y+317+i*24)
		zts:显示(self.x+22,self.y+321+i*24,sts[i+1])
	end
	self.资源组[11]:显示(self.x+227,self.y+317)
	zts:显示(self.x+177,self.y+321,"页数")
	zts:置字间距(0)
	self.资源组[4]:显示(self.x+9,self.y+28)
	local xx = 0
	local yy = 0
	for i=1,25 do
		self.商品[i]:置坐标(self.x + xx * 51 + 10,self.y + yy * 51 + 26)
		self.商品[i]:显示(dt,x,y,self.鼠标)
		if self.商品[i].物品 ~= nil and self.商品[i].焦点 then
			tp.提示:道具行囊(x,y,self.商品[i].物品,true)
			if mouseb(0) then
				if self.道具 == nil then
					if self.商品[self.选中]~= nil then
						self.商品[self.选中].确定 = false
					end
					self.商品[i].确定 = true
					self.选中 = i
					self.道具 = self.商品[i].物品
					self.数量 = 1
					self.单价 = self:取单价(i) --tostring(self.道具.价格)
					self.总价 = self:数量取总价(i,self.数量)
				else
					if self.选中 == i then
						self.数量 = self.数量 + 1
						self.单价 = self:取单价(i)
						self.总价 = self:数量取总价(i,self.数量)
					else
						if self.商品[self.选中]~= nil then
							self.商品[self.选中].确定 = false
						end
						self.商品[i].确定 = true
						self.选中 = i
						self.道具 = self.商品[i].物品
						self.数量 = 1
						self.单价 = self:取单价(i) --tostring(self.道具.价格)
						self.总价 = self:数量取总价(i,self.数量)
					end
				end
				self.输入框:置文本(self.数量)
			end
		end
		xx = xx + 1
		if xx == 5 then
			xx = 0
			yy = yy + 1
		end
	end
	if self.道具 ~= nil then
		zts:置颜色(白色):显示(self.x + 22,self.y + 293,"剩余数量：" ..self.道具.剩余数量)
		zts:置颜色(-16777216)
		zts:显示(self.x + 79,self.y + 322,self.单价)
		self.输入框:置坐标(self.x + 80,self.y + 345)
		if self.输入框:取文本() == "" then
			self.输入框:置文本(1)
		end
		if tonumber(self.输入框:取文本()) > 99 then
			self.输入框:置文本(99)
		end
		self.数量 = tonumber(self.输入框:取文本())
		zts:置颜色(tos((self.总价)))
		zts:显示(self.x + 78,self.y + 369,(self.总价))
	end
	zts:置颜色(tos(self.积分))
	zts:显示(self.x + 78,self.y + 393,self.积分)
	zts:显示(self.x + 236,self.y + 322,self.页数)
	self.控件类:更新(dt,x,y)
	if self.输入框._已碰撞 then
		self.焦点 = true
	end
	self.控件类:显示(x,y)
end

function 场景类_剑会商店类:数量取总价(编号,预购) --客户端显示计算
	if self.商品[编号]==nil then return 999999999999999 end
	local 总价 = 0
	local 剩余数量 = self.商品[编号].物品.剩余数量
	if tonumber(预购)~=nil and 预购+0 >= 1 then
		local 单价组={}
		for n=1,预购 do
			if 剩余数量 >= 1 then
				local 单价 = self.商品[编号].物品.基础价格+0
				local gs = math.abs(剩余数量 - self.商品[编号].物品.总数量)/100 --除100就是最大为基础价格的2倍，要加大幅度就把100改更小比如50
				单价 = math.floor(单价*(1+gs))
				剩余数量 = 剩余数量 - 1
				table.insert(单价组,单价)
			else
			   break
			end
		end
		for k,v in ipairs(单价组) do
			总价 = 总价 + v
		end
	end
	return 总价
end

function 场景类_剑会商店类:取单价(编号)
	if self.商品[编号]==nil then return 999999999999999 end
	local 单价 = self.商品[编号].物品.基础价格+0
	local 剩余数量 = self.商品[编号].物品.总数量 + 1 - self.数量
	local gs = math.abs(剩余数量 - self.商品[编号].物品.总数量)/100 --除100就是最大为基础价格的2倍，要加大幅度就把100改更小比如50
	单价 = math.floor(单价*(1+gs))
	return 单价
end


function 场景类_剑会商店类:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_剑会商店类:初始移动(x,y)
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

function 场景类_剑会商店类:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy

	end
end

return 场景类_剑会商店类