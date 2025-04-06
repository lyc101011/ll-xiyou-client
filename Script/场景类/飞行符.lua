-- @Author: baidwwy
-- @Date:   2024-04-03 22:06:51
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-04-07 23:38:26
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2023-05-13 11:28:35
--======================================================================--
local 场景类_飞行符 = class()

local tp
local insert = table.insert

function 场景类_飞行符:初始化(根)
	self.ID = 56
	self.x = 150
	self.y = 176
	self.xx = 0
	self.yy = 0
	self.注释 = "飞行符"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	self.资源组 = {
		[1] = 资源:载入('wzife.wdf',"网易WDF动画",0x516749F4),
		[2] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xDB61AD29),0,0,1,true,true),
		[3] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x3D561594),0,0,1,true,true),
		[4] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x6BD8F1C8),0,0,1,true,true),
		[5] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xC5C5FE46),0,0,1,true,true),
		[6] = 按钮.创建(资源:载入('wzife.wd1',"网易WDF动画",0x29622DDB),0,0,1,true,true),
		[7] = 按钮.创建(资源:载入('wzife.wd2',"网易WDF动画",0x491E6B4C),0,0,1,true,true),
		[8] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x549B2B83),0,0,1,true,true),
	}
	for i=2,8 do
		self.资源组[i]:绑定窗口_(self.ID)
	end
	tp = 根
	self.窗口时间 = 0
	self.坐标 = {[1]={x=70,y=140},[2]={x=195,y=140},[3]={x=320,y=140},[4]={x=70,y=290},[5]={x=195,y=290},[6]={x=320,y=290}}
	self.飞行传送点={
		[1]=1001,
		[2]=1001,
		[3]=1501,
		[4]=1092,
		[5]=1070,
		[6]=1040,
		[7]=1226,
		[8]=1208,
	}
end

function 场景类_飞行符:打开(新春)
	if self.可视 then
		self.新春=nil
		self.可视 = false
	else
		insert(tp.窗口_,self)
		self.新春=新春
	    tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 场景类_飞行符:显示(dt,x,y)
	for i=2,8 do
	   self.资源组[i]:更新(x,y)

	   if self.鼠标 then
	     if self.资源组[i]:事件判断() then
	     	if self.新春 then
			引擎.场景.窗口.新春飞行符:打开(self.飞行传送点[i])
	     	else
	     		发送数据(3706,{序列=i})
	     	end
		self:打开()
	        end

	     end
	end
	self.焦点 = false

	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x + 378,self.y + 83,true)
	self.资源组[3]:显示(self.x + 425,self.y + 191,true)
	self.资源组[4]:显示(self.x + 574,self.y + 244,true)
	self.资源组[5]:显示(self.x + 208,self.y + 17,true)
	self.资源组[6]:显示(self.x + 203,self.y + 85,true)
	self.资源组[7]:显示(self.x + 186,self.y + 161,true)
	self.资源组[8]:显示(self.x + 249,self.y + 224,true)
	--if tp.按钮
end

function 场景类_飞行符:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_飞行符:初始移动(x,y)
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

function 场景类_飞行符:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_飞行符