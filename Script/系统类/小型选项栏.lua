-- @Author: baidwwy
-- @Date:   2024-11-01 04:10:22
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-13 09:08:16
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2023-05-10 20:19:27
--======================================================================--
local 系统类_小型选项栏 = class()

local zts
local min = math.min
local floor = math.floor
local ceil = math.ceil

function 系统类_小型选项栏:初始化(背景,事件)
	self.背景 = 背景
	self.宽度 = self.背景.宽度
	self.高度 = self.背景.高度
	self.事件 = 事件
	self.可视 = false
end

function 系统类_小型选项栏:打开(选项,背景)
	if self.可视 then
		self.列表:打开()
		self.可视 = false
	else
		zts = 引擎.场景.字体表.普通字体
		if self.列表 == nil then
			self.列表 = 引擎.场景._列表.创建(背景,self.事件,self.背景.宽度,22,self.背景.高度-20)
		end
		if #选项 > self.列表.最大显示量 then
			if self.背景.宽度 ~= self.宽度 then
				self.背景:置宽高(self.宽度,self.高度)
			end
		    	self.上翻 = 引擎.场景._按钮.创建(引擎.场景.资源:载入('common/wzife.wdf',"网易WDF动画",0x335CECBC),0,0,4,true,true)
		    	self.下翻 = 引擎.场景._按钮.创建(引擎.场景.资源:载入('common/wzife.wdf',"网易WDF动画",0xB7F2FF5E),0,0,4,true,true)
		    	self.滑块 = 引擎.场景._滑块.创建(引擎.场景._自适应.创建(11,4,15,40,2,3,nil),1,14,self.高度-2,2)
		    	self.允许加入 = true
		else
			self.背景:置宽高(self.宽度-8,23*#选项)
		    	self.允许加入 = false
		end
		-- tp.运行时间 = tp.运行时间 + 1
		-- self.窗口时间 = tp.运行时间
		self.列表:打开(选项,引擎.场景)
		self.可视 = true
	end
end

function 系统类_小型选项栏:事件判断()
	return self.弹出事件 ~= nil
end

function 系统类_小型选项栏:置选中(选项)
	self.列表:置选中(选项)
	if self.滑块~=nil then
		self.滑块:置起始点(self.滑块:取百分比转换(self.列表.起始,self.列表.最大显示量,#self.列表.选项))
	end
end

function 系统类_小型选项栏:是否选中(x,y)
	return self.背景:是否选中(x,y)
end

function 系统类_小型选项栏:显示(sx,sy,x,y,sb)
	if not self.可视 then
		return
	end
	self.背景:显示(sx,sy+5)
	if self.背景:是否选中(x,y) then
		引擎.场景.按钮焦点 = true
		引擎.场景.选项栏选中 = true
		引擎.场景.第二次删除 = 0
	end
	self.列表:显示(sx,sy+5,x,y,sb)
	if self.允许加入 then
		if(self.背景:是否选中(x,y) or self.滑块:是否选中(x,y)) and 引擎.取鼠标滚轮() ==1 and self.列表.起始 > 0 then--鼠标上滚动
			--self.滑块:置起始点(self.滑块:取百分比转换(self.列表.起始-1,self.列表.最大显示量,#self.列表.选项))
			self.滑块:置起始点(self.滑块:取百分比转换(self.列表.起始-1,self.列表.最大显示量,#self.列表.选项))
		elseif(self.背景:是否选中(x,y) or self.滑块:是否选中(x,y)) and 引擎.取鼠标滚轮() ==-1 and  self.列表.起始 < #self.列表.选项 - self.列表.最大显示量 then--鼠标下滚动
			self.滑块:置起始点(self.滑块:取百分比转换(self.列表.起始+1,self.列表.最大显示量,#self.列表.选项))
		end
		if #self.列表.选项  > self.列表.最大显示量 then
			self.滑块:置高度(min(floor((self.高度-2)/(#self.列表.选项-self.列表.最大显示量)),self.高度-10))
			self.列表.起始 = min(ceil((#self.列表.选项 - self.列表.最大显示量)*self.滑块:取百分比()),#self.列表.选项-self.列表.最大显示量)
			self.滑块:显示(sx+self.背景.宽度-10,sy+6,x,y,sb,true)
		end

	end
	if self.列表.弹出事件 ~= nil then
		self.弹出事件 = self.列表.弹出事件
		self:打开()
		self.列表.弹出事件 = nil
		return
	end
end

return 系统类_小型选项栏