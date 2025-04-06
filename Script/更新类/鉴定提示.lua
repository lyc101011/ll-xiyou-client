local tp,zts
local insert = table.insert
local 鉴定提示 = class()

function 鉴定提示:初始化(根)
	self.ID = 129
	self.x = 340
	self.y = 300
	self.xx = 0
	self.yy = 0
	self.注释 = "鉴定提示"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.右键关闭 = 1
	tp = 根
	self.窗口时间 = 0

	self.介绍文本 = 根._丰富文本(280,139,根.字体表.普通字体)
end

function 鉴定提示:打开(内容)
	if self.可视 then
		self.介绍文本:清空()
		self.可视 = false
		return
	else
		insert(tp.窗口_,self)
		self.标题=内容.标题
		self.发送内容=内容.鉴定内容
		if self.资源组==nil then
		    self:加载资源()
		end

		self.介绍文本:清空()
		self.介绍文本:添加文本(内容.文本)
	    tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end


function 鉴定提示:加载资源()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,437-96,176-20,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),--关闭
		[3] = 按钮.创建(自适应.创建(12,4,70,22,1,3),0,0,4,true,true,"  确定"),
		[4] = 按钮.创建(自适应.创建(12,4,70,22,1,3),0,0,4,true,true,"  取消"),
	}
	for n=2,4 do
	   self.资源组[n]:绑定窗口_(self.ID)
	end
end

function 鉴定提示:显示(dt,x,y)
	self.焦点= false
	self.资源组[1]:显示(self.x,self.y)
	for i=2,4 do
		self.资源组[i]:更新(x,y)
	end
	tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2+5,self.y+3,self.标题)
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	self.资源组[3]:显示(self.x+71,self.y+116)
	self.资源组[4]:显示(self.x+61+145,self.y+116)
	self.介绍文本:显示(self.x+87-57,self.y+34+9)
	if self.资源组[2]:事件判断() then
        self:打开()
		return
	elseif self.资源组[3]:事件判断() then --确定
		发送数据(3758,self.发送内容)
        self:打开()
		return
	elseif self.资源组[4]:事件判断() then
		发送数据(3738,self.发送内容)
        self:打开()
		return
    end
end


function 鉴定提示:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	else
		return false
	end
end

function 鉴定提示:初始移动(x,y)
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

function 鉴定提示:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 鉴定提示