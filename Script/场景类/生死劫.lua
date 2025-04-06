--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-09-14 16:25:32
--======================================================================--
local 场景类_生死劫 = class()

local floor = math.floor
local tp
local insert = table.insert

function 场景类_生死劫:初始化(根)
	self.ID = 38
	self.x = 370
	self.y = 105
	self.xx = 0
	self.yy = 0
	self.注释 = "生死劫"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	self.资源组 = {
		[1] = 资源:载入('wzife.wdf',"网易WDF动画",0x2299129D),
		[2] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xF11233BB),0,0,4,true,true),
		[3] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xF40562A1),0,0,4,true,true),
		[4] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xF053D954),0,0,4,true,true),
		[5] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xB194CE02),0,0,4,true,true),
		[6] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xC0B16D0B),0,0,4,true,true),
		[7] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xC1C8D265),0,0,4,true,true),
		[8] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x2AD4F244),0,0,4,true,true),
		[9] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x2A04828F),0,0,4,true,true),
		[10] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xC2B7E49E),0,0,4,true,true),
		[11] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x7F3E07A7),0,0,4,true,true),
	}
	for i=2,11 do
	    self.资源组[i]:绑定窗口_(self.ID)
	end
	self.窗口时间 = 0
	tp = 根
end

function 场景类_生死劫:打开()
	if self.可视 then
		self.可视 = false
	else
		insert(tp.窗口_,self)
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 场景类_生死劫:显示(dt,x,y)
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y)
	self.资源组[4]:更新(x,y)
	self.资源组[5]:更新(x,y)
	self.资源组[6]:更新(x,y)
	self.资源组[7]:更新(x,y)
	self.资源组[8]:更新(x,y)
	self.资源组[9]:更新(x,y)
	self.资源组[10]:更新(x,y)
	self.资源组[11]:更新(x,y)
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x+227,self.y+7)
	self.资源组[3]:显示(self.x+137,self.y+349)
	self.资源组[4]:显示(self.x+81,self.y+325)
	self.资源组[5]:显示(self.x+25,self.y+277)
	self.资源组[6]:显示(self.x+101,self.y+265)
	self.资源组[7]:显示(self.x+81,self.y+202)
	self.资源组[8]:显示(self.x+55,self.y+155)
	self.资源组[9]:显示(self.x+112,self.y+128)
	self.资源组[10]:显示(self.x+95,self.y+75)
	self.资源组[11]:显示(self.x+93,self.y+24)
	if self.资源组[3]:事件判断() then--生死劫·止戈
		self:打开()
		发送数据(1511)
	elseif self.资源组[4]:事件判断() then--生死劫·清心
		self:打开()
		发送数据(1512)
	elseif self.资源组[5]:事件判断() then--生死劫·雷霆
		self:打开()
		发送数据(1513)
	elseif self.资源组[6]:事件判断() then--生死劫·惜花
		self:打开()
		发送数据(1514)
	elseif self.资源组[7]:事件判断() then--生死劫·忘情
		self:打开()
		发送数据(1515)
	elseif self.资源组[8]:事件判断() then--生死劫·卧龙
		self:打开()
		发送数据(1516)
	elseif self.资源组[9]:事件判断() then--生死劫·天象
		self:打开()
		发送数据(1517)
	elseif self.资源组[10]:事件判断() then--生死劫·轮回
		self:打开()
		发送数据(1518)
	elseif self.资源组[11]:事件判断() then--生死劫·娑罗
		self:打开()
		发送数据(1519)
	end
end

function 场景类_生死劫:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_生死劫:初始移动(x,y)
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

function 场景类_生死劫:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_生死劫