-- @Author: baidwwy
-- @Date:   2023-10-07 10:40:19
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2023-10-09 13:50:32
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2022-12-31 10:49:03
--======================================================================--
local 场景类_灵饰 = class()

local floor = math.floor
local tp,zts1
local insert = table.insert


function 场景类_灵饰:初始化(根)
	self.ID = 37
	self.xx = 0
	self.yy = 0
	self.注释 = "灵饰"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,129,150,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[4] = 资源:载入('common/wzife.wdf',"网易WDF动画",0x841CBD61),
		[5] = 资源:载入('common/wzife.wdf',"网易WDF动画",0x9912E8B9),
		[6] = 资源:载入('common/wzife.wdf',"网易WDF动画",0x5795605E),
		[7] = 资源:载入('common/wzife.wdf',"网易WDF动画",0xEBD8985D),
		[8] = 资源:载入('common/wzife.wdf',"网易WDF动画",0x21246323),
	}
	self.资源组[2]:绑定窗口_(self.ID)
	self.物品 = {}
	local 格子 = 根._物品格子
	for i=1,4 do
		self.物品[i] = 格子(0,0,i,"道具行囊_灵饰",根.底图)
	end
	tp = 根
	-- zts1 = tp.字体表.描边字体
	self.窗口时间 = 0
end

function 场景类_灵饰:打开(x,y)
	if self.可视 then
		for i=1,4 do
			self.物品[i]:置物品(nil)
		end
		self.可视 = false
	else
		insert(tp.窗口_,self)
		for i=1,4 do
			if tp.队伍[1].灵饰[i] ~= nil and  tp.队伍[1].灵饰[i].名称 ~= nil then
				self.物品[i]:置物品(tp.队伍[1].灵饰[i])
			end
		end
		self.x = x
		self.y = y

		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 场景类_灵饰:刷新()
	for i=1,4 do
		self.物品[i]:置物品(nil)
		if tp.队伍[1].灵饰[i] ~= nil and  tp.队伍[1].灵饰[i].名称 ~= nil then
			self.物品[i]:置物品(tp.队伍[1].灵饰[i],nil,nil,nil,1)
		end
	end
end

function 场景类_灵饰:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	if self.资源组[2]:事件判断() then
		self:打开()
		return false
	end
	if self.x==nil then self.x=310 end
	if self.y==nil then self.y=88 end
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	-- tp.窗口标题背景_:置区域(0,0,40,16)
	-- tp.窗口标题背景_:显示(self.x+37,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+65,self.y+3,"灵饰")

	local xx = 0
	local yy = 1
	-- local xs = 0
	for i=1,4 do
		-- if i == 5 then
		-- 	xs = 27
		-- end
		xx = xx + 1
		self.资源组[3+i]:显示(self.x + xx * 58-49,self.y + yy * 57-31)
		self.物品[i]:置坐标(self.x + xx * 58-47,self.y + yy * 57-31,nil,nil,4,-1)
		self.物品[i]:显示(dt,x,y,self.鼠标,nil,3)
		if self.物品[i].物品 ~= nil and self.物品[i].焦点 then
			tp.提示:道具行囊(x,y,self.物品[i].物品,true)
		end
		if xx >= 2 then
			xx = 0
			yy = yy + 1
		end
		if self.物品[i].事件 then
			if tp.场景.抓取物品 ~= nil and self.物品[i].物品 == nil and self.物品[i].焦点 then

			elseif tp.场景.抓取物品 ~= nil and self.物品[i].物品 ~= nil and self.物品[i].焦点 then

			elseif tp.场景.抓取物品 == nil and self.物品[i].物品 ~= nil and self.物品[i].焦点 then
				--[[tp.场景.抓取物品 = self.物品[i].物品
				tp.场景.抓取物品ID = i
				tp.场景.抓取物品注释 = self.物品[i].注释
				self.物品[i].确定 = true
				tp.队伍[1]:卸下装备(self.物品[i].物品,i+9)
				self.物品[i]:置物品(nil) --]]
				发送数据(3704,{类型=tp.窗口.道具行囊.点击类型,角色="主角",灵饰=true,道具=i})
			end
		elseif self.物品[i].右键 then
			if  self.物品[i].物品 ~= nil then
			    发送数据(3704,{类型=tp.窗口.道具行囊.点击类型,角色="主角",灵饰=true,道具=i})
			end
		end
	end
end

function 场景类_灵饰:可装备(wp,i)
	if wp.总类 == 2 then
		if wp.分类 > 9 then
			if wp.分类-9 == i then
				if tp.队伍[1].等级 >= wp.级别限制 or wp.特效 == "无级别限制" then
					return true
				else
					tp.常规提示:打开("#Y/你的等级不够呀")
				end
			else
				tp.常规提示:打开("#Y/这个物品不可以装备")
			end
		else
			tp.常规提示:打开("#Y/这个物品不可以装备")
		end
	else
		tp.常规提示:打开("#Y/这个物品不可以装备")
	end
	return false
end

function 场景类_灵饰:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_灵饰:初始移动(x,y)
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

function 场景类_灵饰:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_灵饰