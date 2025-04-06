local tp,zts,zts1
local insert = table.insert
local 活跃奖励 = class()

function 活跃奖励:初始化(根)
	self.ID = 9016
	self.x = 152
	self.y = 70
	self.xx = 0
	self.yy = 0
	self.注释 = "活跃奖励"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	self.窗口时间 = 0
	self.当前活跃度 = 0
	self.今日活跃度 = 0
	zts = tp.字体表.常用字体14
	zts1 = tp.字体表.猫猫字体2
end

function 活跃奖励:加载资源()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.资源组 = {
		[1] = 资源:载入('nice.rpk',"网易WDF动画",527683842),
		[2] = 按钮.创建(pwd("5"),0,0,4,true,true),
		[3] = 按钮.创建(资源:载入('nice.rpk',"网易WDF动画",0x81DD40D4),0,0,3,true,true,"活跃抽奖"),
	}
end

function 活跃奖励:打开(内容)
	if self.可视 then
		self.可视 = false
		self.资源组=nil
		return
	else
		insert(tp.窗口_,self)
		self:加载资源()
		self.当前活跃度 = 内容.当前
		self.今日活跃度 = 内容.总活跃
	    tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 活跃奖励:显示(dt,x,y)
	self.焦点= false
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y)
	self.资源组[3]:置偏移(10,2)
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x+20,self.y+30)
	self.资源组[3]:显示(self.x+135,self.y+86)
	zts:置颜色(白色):显示(self.x+100,self.y+3,"活跃奖励")
	zts1:置颜色(白色):显示(self.x+138,self.y+41,"当前活跃度：")
	zts1:置颜色(黄色):显示(self.x+138+80,self.y+41,self.当前活跃度)
	zts1:置颜色(白色):显示(self.x+138,self.y+65,"今日活跃度：")
	zts1:置颜色(黄色):显示(self.x+138+80,self.y+65,self.今日活跃度)
    if self.资源组[2]:事件判断() then
		发送数据(43)
	elseif self.资源组[3]:事件判断() then
		发送数据(48)
	end
end


function 活跃奖励:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	else
		return false
	end
end

function 活跃奖励:初始移动(x,y)
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

function 活跃奖励:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 活跃奖励