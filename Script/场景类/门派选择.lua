-- @Author: baidwwy
-- @Date:   2024-04-03 22:06:51
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-05-04 00:34:17
local 场景类_门派选择 = class()
local qmx = 引擎.取模型
local ceil = math.ceil
local tp
local insert = table.insert

function 场景类_门派选择:初始化(根)
	self.ID = 50
	self.x = 210
	self.y = 210
	self.xx = 0
	self.yy = 0
	self.注释 = "人物炫彩"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.选中 = 0
	self.窗口时间 = 0

	tp = 根
	self.可选门派 = {}
	self.门派师傅 = {}
end

function 场景类_门派选择:打开(sj)
	if self.可视 then
		self.可视 = false
		self.鼠标 = false
		self.焦点 = false
		self.门派图片 = nil
		self.资源组 = nil
		self.选中 = 0
	else
	    insert(tp.窗口_,self)
	    local 按钮 = tp._按钮
		local 自适应 = tp._自适应
		local 资源 = tp.资源

		self.资源组 = {
			[1] = 自适应.创建(0,1,586,332,3,9),
			[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
			[3] = 按钮.创建(自适应.创建(12,4,65,22,1,3),0,0,4,true,true,"传  送"),
			[4] = 按钮.创建(自适应.创建(12,4,65,22,1,3),0,0,4,true,true,"传  送"),
			[5] = 按钮.创建(自适应.创建(12,4,65,22,1,3),0,0,4,true,true,"传  送"),
			[6] = 按钮.创建(自适应.创建(12,4,65,22,1,3),0,0,4,true,true,"传  送"),
			[7] = 按钮.创建(自适应.创建(12,4,65,22,1,3),0,0,4,true,true,"传  送"),
		}
		for i=2,7 do
		  	self.资源组[i]:绑定窗口_(self.ID)
		  	if i~=2 then
		  	    self.资源组[i]:置偏移(3,0)
		  	end
		end

	    self.可选门派 = tp:队伍角色(tp.队伍[1].模型)
	    self.门派图片 ={}
	    for i=1,#self.可选门派.门派 do
	    	local qmx = 引擎.取模型(self.可选门派.门派模型[i])
	    	self.门派师傅[self.可选门派.门派师傅[i]] = tp.资源:载入(qmx[3],"网易WDF动画",qmx[1])
	    	self.门派图片[i] = tp.资源:载入('pic/门派选择/'..self.可选门派.门派[i]..'.png',"图片")
	    end
	    tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 场景类_门派选择:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)

	if self.资源组[2]:事件判断() then
		self:打开()
		return false
	end

	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-76+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"门派选择")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	if tp.队伍[1].种族=="仙" then
		self.资源组[1]:置宽高(640,332)
	    for i=1,#self.可选门派.门派 do
			self.门派图片[i]:显示(self.x+8+(126*(i-1)),self.y+29)
			self.门派师傅[self.可选门派.门派师傅[i]]:更新()
			self.门派师傅[self.可选门派.门派师傅[i]]:显示(self.x+60+(126*(i-1)),self.y+246)
			self.资源组[i+2]:更新(x,y)
			self.资源组[i+2]:显示(self.x+36+(126*(i-1)),self.y+292)
			if self.资源组[i+2]:事件判断() and tp.队伍[1].门派=="无门派" then
				发送数据(57,{门派=self.可选门派.门派[i]})
				self:打开()
				return
			end
		end
	else
		self.资源组[1]:置宽高(515,332)
		for i=1,#self.可选门派.门派 do
			self.门派图片[i]:显示(self.x+8+(126*(i-1)),self.y+29)
			self.门派师傅[self.可选门派.门派师傅[i]]:更新()
			self.门派师傅[self.可选门派.门派师傅[i]]:显示(self.x+60+(126*(i-1)),self.y+246)
			self.资源组[i+2]:更新(x,y)
			self.资源组[i+2]:显示(self.x+36+(126*(i-1)),self.y+292)
			if self.资源组[i+2]:事件判断() and tp.队伍[1].门派=="无门派" then
				发送数据(57,{门派=self.可选门派.门派[i]})
				self:打开()
				return
			end
		end
	end
end

function 场景类_门派选择:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_门派选择:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if self.可视 and self.鼠标 and  not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_门派选择:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return  场景类_门派选择