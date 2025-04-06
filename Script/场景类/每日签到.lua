local 每日签到类 = class()
local insert = table.insert
function 每日签到类:初始化(根)
	tp=根
	self.ID = 35
	self.x = 40
	self.y = 30
	self.xx = 0
	self.yy = 0
	self.注释 = "每日签到"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	self.背景 = 资源:载入('org.rpk',"网易WDF动画",16777539)
	self.签到 = 按钮.创建(资源:载入('common/wzife.wdf',"网易WDF动画",0xcfc32179),0,0,4,true,true,"签到")
	self.关闭 = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true)
	self.关闭:绑定窗口_(self.ID)
	self.签到:绑定窗口_(self.ID)
	self.签到:置偏移(30,5)
end

function 每日签到类:打开()
	if self.可视 then
		self.可视 =false
	else
	    insert(tp.窗口_,self)
	    tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
	    self.可视 =true
	end

end

function 每日签到类:显示(dt,x,y)
	self.背景:显示(self.x,self.y)
	self.签到:更新(x,y)
	self.关闭:更新(x,y)
	self.签到:显示(self.x+501,self.y+385)
	self.关闭:显示(self.x+614,self.y+8)
	if self.二维码 ~= nil then
		self.二维码:显示(self.x+0,self.y+0)
	end
	if self.关闭:事件判断() then
		self:打开()
		self.本类开关 = false
		return false
	elseif self.签到:事件判断() then
		发送数据(58)
	end
end

function 每日签到类:检查点(x,y)
	if self.可视 and self.背景:是否选中(x,y) then
		return true
	else
		return false
	end
end

function 每日签到类:初始移动(x,y)
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

function 每日签到类:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end


return 每日签到类