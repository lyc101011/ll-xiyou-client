local 兽诀提示 = class()
local tp,zts
local mousea = 引擎.鼠标弹起
local insert = table.insert
function 兽诀提示:初始化(根)
	self.ID = 133
	self.x = 0
	self.y = 0
	self.xx = 0
	self.yy = 0
	self.注释 = "兽诀提示"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 资源 = 根.资源
	self.资源组 = {
		[1] = 自适应.创建(71,1,86,191,3,9),
	}
	self.窗口时间 = 0
	tp = 根
	zts = tp.字体表.华康14
end

function 兽诀提示:打开(选中)
	if self.可视 then
		self.可视 = false
	else
		insert(tp.窗口_,self)

		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end
function 兽诀提示:显示(dt,x,y)
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
end

function 兽诀提示:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 兽诀提示:初始移动(x,y)
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

function 兽诀提示:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 兽诀提示