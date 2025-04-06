-- @Author: baidwwy
-- @Date:   2023-10-27 01:41:58
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-04-08 23:31:05
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2023-10-23 01:49:44
--======================================================================--
local 积分商店_副本积分商店 = class()
local tp,zts,zts1
local insert = table.insert
local xxx = 0
local yyy = 0
local sts = {"单价","数量","总额","声望"}
local tos = 取金钱颜色
local mouseb = 引擎.鼠标弹起
function 积分商店_副本积分商店:初始化(根)
	self.ID = 21
	self.x = 364
	self.y = 100
	self.xx = 0
	self.yy = 0
	self.注释 = "商店"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,272,400,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮.创建(自适应.创建(12,4,100,22,1,3),0,0,4,true,true,"  确定"),
		-- [4] = 资源:载入('org.rpk',"网易WDF动画",0x1000394),
		--[4] = 资源:载入('wzife.wd1',"网易WDF动画",0xE9C090A3),
		[5] = 自适应.创建(3,1,113,19,1,3,nil,18),
	}
	for n=2,3 do
	   self.资源组[n]:绑定窗口_(21)
	end
	self.商品 = {}
	local 物品格子 = 根._物品格子
	for i=1,20 do
		self.商品[i] = 物品格子(0,i,n,"商店")
	end
	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('商店总控件')
	总控件:置可视(true,true)
	self.输入框 = 总控件:创建输入("商店数量输入",0,0,100,14,根,根.字体表.华康14)
	self.输入框:置可视(false,false)
	self.输入框:置限制字数(2)
	self.输入框:置数字模式()
	self.输入框:屏蔽快捷键(true)
	self.输入框:置光标颜色(-16777216)
	self.输入框:置文字颜色(-16777216)
	self.输入框:置文本("")
	self.单价 = 0
	self.数量 = 0
	self.上一次 = 1
	self.窗口时间 = 0
	self.类型 = "采矿声望"
	tp = 根
	zts = 根.字体表.普通字体
	zts1 = 根.字体表.描边字体
end

function 积分商店_副本积分商店:打开(道具组,名称,类型,采矿声望)
	if self.可视 then
		for i=1,20 do
			self.商品[i]:置物品(nil)
		end
		self.道具 = nil
		self.单价 = 0
		self.数量 = 0
		self.可视 = false
		self.商品[self.上一次].确定 = false
		self.上一次 = 1
		self.类型 = "采矿声望"
		self.输入框:置焦点(false)
		self.输入框:置可视(false,false)
	else
		self.临时道具={}
		self.临时价格={}
		self.临时子类={}
		for n=1,#道具组 do
			self.临时数据=分割文本2(道具组[n],"*")
			self.临时道具[n]=self.临时数据[1]
			self.临时价格[n]=self.临时数据[2]
			if self.临时数据[3] ~= nil then
				self.临时子类[n]=self.临时数据[3]
			end
		end
		insert(tp.窗口_,self)
		local wp = tp._物品
		for n=1,#self.临时道具 do
			local sp = wp()
			sp:置对象(self.临时道具[n])
			if sp.总类 == 2 then
				sp.鉴定 = true
			end
			self.商品[n]:置物品(sp)
			self.商品[n].物品.价格=self.临时价格[n]
			self.商品[n].物品.原始商品=道具组[n]
			if self.临时子类[n] ~= nil then
				self.商品[n].物品.子类 = self.临时子类[n]+0
			end
				if self.商品[n].物品.总类==2 then
					self.商品[n].物品.鉴定=true
					self.商品[n].物品.五行=取五行()
					self.商品[n].物品.开运孔数 = {当前=0,上限=0}
					self.商品[n].物品.符石={}
					self.商品[n].物品.星位={}
					self.商品[n].物品.符石组合 = {符石组合 = {},门派条件 ={},部位条件={},效果说明={}}
					self.商品[n].物品.熔炼效果={}
				end
		end
		if 类型 ~= nil then
			self.类型 = 类型
		end
		-- self.银子 = tp.金钱--银子
		self.输入框:置可视(true,true)
		self.输入框:置文本(1)
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
	self.商店名称=名称
end

function 积分商店_副本积分商店:显示(dt,x,y)
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y,self.道具 ~= nil)
	if self.资源组[2]:事件判断() then
		self:打开()
	elseif self.资源组[3]:事件判断() then
		if not 判定数字合法(self.输入框:取文本()) then return  引擎.场景.常规提示:打开("请重新填写输入框") end
		-- if (self.输入框:取文本()+0) * self.单价 >self.银子 then return 引擎.场景.常规提示:打开("#Y/你没有足够的"..self.类型) end --测试模式
		发送数据(1503.5,{数量=self.输入框:取文本(),商品=self.道具.原始商品,类型=self.类型})
	end
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-88+self.资源组[1].宽度/2,self.y)
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
  	if self.商店名称==nil then
	 	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"购  买")
  	else
	 	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,self.商店名称)
	end
	zts:置颜色(4294967295)
	zts:置字间距(15)
	for i=0,3 do
		self.资源组[5]:显示(self.x+101,self.y+251+i*28)
		zts:显示(self.x+50,self.y+255+i*28,sts[i+1])
	end
	zts:置字间距(0)
	tp.物品界面背景_:显示(self.x+9,self.y+28)
	self.资源组[3]:显示(self.x+86,self.y+367,true)
	local xx = 0
	local yy = 0
	for i=1,20 do
		self.商品[i]:置坐标(self.x + xx * 51 + 10,self.y + yy * 51 + 26)
		self.商品[i]:显示(dt,x,y,self.鼠标)
		if self.商品[i].物品 ~= nil and self.商品[i].焦点 then
			tp.提示:道具行囊(x,y,self.商品[i].物品,true,self.商品[i].物品.子类)
			if mouseb(0) then
				if self.道具 == nil then
					self.商品[self.上一次].确定 = false
					self.商品[i].确定 = true
					self.上一次 = i
					self.道具 = self.商品[i].物品
					self.单价 = tostring(self.道具.价格)
					self.数量 = 1
				else
					if self.上一次 == i then
						self.数量 = self.数量 + 1
					else
						self.商品[self.上一次].确定 = false
						self.商品[i].确定 = true
						self.上一次 = i
						self.道具 = self.商品[i].物品
						self.单价 = tostring(self.道具.价格)
						self.数量 = 1
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
		zts:置颜色(-16777216)
		zts:显示(self.x + 79+73-30-12,self.y + 322-68,self.单价)
		zts:置颜色(黑色)
		zts:显示(self.x + 78+73-30-12,self.y + 370-60,(self.数量 * self.单价))
	end
	zts:置颜色(黑色)
	zts:显示(self.x + 78+73-30-12,self.y + 395-57,tp.采矿声望)
	self.输入框:置坐标(self.x + 80+73-30-12,self.y + 346-64)
	self.控件类:更新(dt,x,y)
	if self.输入框._已碰撞 then
		self.焦点 = true
	end
	self.控件类:显示(x,y)
end

function 积分商店_副本积分商店:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 积分商店_副本积分商店:初始移动(x,y)
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

function 积分商店_副本积分商店:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy

	end
end

return 积分商店_副本积分商店