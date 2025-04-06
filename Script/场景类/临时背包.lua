-- @Author: baidwwy
-- @Date:   2024-06-13 16:59:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-03 09:03:39
local 场景类_临时背包 = class()
local floor = math.floor
local insert = table.insert
local random = 引擎.取随机整数
local mouseb = 引擎.鼠标弹起
local zts,tp,zts1
local tp
local remove = table.remove

function 场景类_临时背包:初始化(根)
	self.ID = 104
	self.x = 210
	self.y = 110
	self.xx = 0
	self.yy = 0
	self.注释 = "临时背包"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 小型选项栏 = 根._小型选项栏
	self.资源组 = {
		[1] = 自适应.创建(0,1,280,283,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮.创建(自适应.创建(12,4,85,22,1,3),0,0,4,true,true," 获得物品"),
		[4] = 按钮.创建(自适应.创建(12,4,85,22,1,3),0,0,4,true,true," 全部清空"),
	}
	local 格子 = 根._物品格子
	self.物品 = {}
	for i=1,20 do
		self.物品[i] = 格子(0,0,"幻化")
	end
	for n=2,4 do
		self.资源组[n]:绑定窗口_(self.ID)
	end
	self.开始 = 1
	self.结束 = 20
	self.窗口时间 = 0
	tp = 根
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
	self.选中编号 = 0
end

function 场景类_临时背包:打开(sj)
	if self.可视 then
		self.可视 = false
	else
		insert(tp.窗口_,self)
		for i=1,20 do
			self.物品[i]:置物品(sj.道具[i])
		end
		tp.运行时间 = tp.运行时间 + 1
	    	self.窗口时间 = tp.运行时间
	    	self.可视 = true
	    	self.选中编号 = 0
	end
end

function 场景类_临时背包:刷新数据(ss)
	self.开始 = 1
	self.结束 = 20
	for i=self.开始,self.结束 do
		self.物品[i]:置物品(ss.道具[i])
	end
end

function 场景类_临时背包:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y)
	self.资源组[4]:更新(x,y)
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-76+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"临时包裹")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	self.资源组[3]:显示(self.x + 49,self.y + 250,true)
	self.资源组[4]:显示(self.x + 143,self.y + 250,true)
	tp.物品界面背景_:显示(self.x+12,self.y+30)
	if self.资源组[3]:事件判断() then
		if self.选中编号 ~= 0 and self.物品[self.选中编号] ~= nil then
			发送数据(3749,{方式="获取",选中 =self.选中编号 })
		else
			tp.常规提示:打开("#W/请先选中一个物品")
		end
	elseif self.资源组[4]:事件判断() then
		发送数据(3749,{方式="清空"})
	elseif self.资源组[2]:事件判断() then
		self:打开()
	end
	local is = self.开始 - 1
	for h=1,4 do
		for l=1,5 do
			is = is + 1
			self.物品[is]:置坐标((l-1)* 51 + self.x+12,(h-1) * 51 + self.y + 28)
			self.物品[is]:显示(dt,x,y,self.鼠标,self.物品限制)
			if self.物品[is].物品 ~= nil and self.物品[is].焦点 then
				tp.提示:道具行囊(x,y,self.物品[is].物品)
				if self.物品[is].事件 and  self.鼠标 then
					if self.物品[self.选中编号]~=nil then
					  	self.物品[self.选中编号].选中=nil
					end
					self.选中编号 = is
					self.物品[self.选中编号].选中=true
				end
			end
			if self.物品[is].焦点 then
				self.焦点 = true
			end
		end
	end
end

function 场景类_临时背包:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_临时背包:初始移动(x,y)
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

function 场景类_临时背包:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_临时背包