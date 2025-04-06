local 给予NPC = class()
local tp,zts,zts1
local insert = table.insert
local xxx = 0
local yyy = 0
local sts = {"单价","数量","总额","现金"}
local tos = 引擎.取金钱颜色
local mouseb = 引擎.鼠标弹起

function 给予NPC:初始化(根)
   self.ID = 105
	self.x = 166
	self.y = 78
	self.xx = 0
	self.yy = 0
	self.注释 = "给予类"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 资源 = 根.资源
	self.资源组 = {
		[1] = 自适应.创建(0,1,490,276,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true), --关闭
		[3] = 按钮.创建(自适应.创建(12,4,80,22,1,3),0,0,4,true,true,"确定给予"),
		[4] = 按钮.创建(自适应.创建(12,4,70,22,1,3),0,0,4,true,true,"道 具"),
		[5] = 按钮.创建(自适应.创建(12,4,70,22,1,3),0,0,4,true,true,"任 务"),
		[6] = 自适应.创建(7,1,50,22,1,3,nil,18),
		[7] = 自适应.创建(7,1,122,22,1,3,nil,18),
	}
	for i=2,5 do
		self.资源组[i]:绑定窗口_(self.ID)
	end
	self.选中类型 = "道具"
	self.窗口时间 = 0
	tp = 根
	local 格子 = 根._物品格子
	self.物品={}
	for i=1,20 do
		self.物品[i] = 格子(0,0,"给予_物品")
	end
	self.格子={}
  	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('给予NPC总控件')
	总控件:置可视(true,true)
	self.输入框 = 总控件:创建输入("给予NPC银两输入",0,0,100,14,根,根.字体表.华康14)
	self.输入框:置可视(false,false)
	self.输入框:置限制字数(8)
	self.输入框:置数字模式()
	self.输入框:屏蔽快捷键(true)
	self.输入框:置光标颜色(-16777216)
	self.输入框:置文字颜色(-16777216)
	self.道具输入框 = {
		[1]=总控件:创建输入("给予NPC道具输入框1",0,0,30,14,根,根.字体表.华康14),
		[2]=总控件:创建输入("给予NPC道具输入框2",0,0,30,14,根,根.字体表.华康14),
		[3]=总控件:创建输入("给予NPC道具输入框3",0,0,30,14,根,根.字体表.华康14)
	}
    self.资源组[3]:置偏移(4,0)
    self.资源组[4]:置偏移(10,0)
    self.资源组[5]:置偏移(10,0)
	self.道具输入框[1]:置可视(false,false)
	self.道具输入框[1]:置限制字数(2)
	self.道具输入框[1]:置数字模式()
	self.道具输入框[1]:屏蔽快捷键(true)
	self.道具输入框[1]:置光标颜色(-16777216)
	self.道具输入框[1]:置文字颜色(-16777216)

	self.道具输入框[2]:置可视(false,false)
	self.道具输入框[2]:置限制字数(2)
	self.道具输入框[2]:置数字模式()
	self.道具输入框[2]:屏蔽快捷键(true)
	self.道具输入框[2]:置光标颜色(-16777216)
	self.道具输入框[2]:置文字颜色(-16777216)

	self.道具输入框[3]:置可视(false,false)
	self.道具输入框[3]:置限制字数(2)
	self.道具输入框[3]:置数字模式()
	self.道具输入框[3]:屏蔽快捷键(true)
	self.道具输入框[3]:置光标颜色(-16777216)
	self.道具输入框[3]:置文字颜色(-16777216)
	zts = tp.字体表.普通字体
	-- zts1 = tp.字体表.描边字体
	self.开始 = 1
	self.结束 = 20
end

function 给予NPC:打开(数据,名称,类型)
	if self.可视 then
		self.选中类型 = "道具"
		self.可视 = false
		self.输入框:置可视(false,false)
	else
		insert(tp.窗口_,self)
		local wp = tp._物品
		for q=1,20 do
			--local sp = wp()
			--sp:置对象(tp.道具列表[q])
			self.物品[q]:置物品(tp.道具列表[q])
			self.物品[q].格子=nil
		end
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
		self.选中类型 = "道具"
		self.对象名称=名称
		self.对象类型=类型
		self.格子={}
		self.输入框:置可视(true,true)
		self.输入框:置文本("0")
	end
end

function 给予NPC:设置物品(id)
	local 编号=0
	for n=1,3 do
		if not self.格子[n] and 编号==0 then 编号=n end
	end
	if 编号==0 then
		self.物品[self.格子[1]].格子=nil
		self.格子[1]=id
		self.道具输入框[1]:置可视(true,true)
		self.道具输入框[1]:置文本("1")
		self.物品[self.格子[1]].格子=1
	else
		self.格子[编号]=id
		self.道具输入框[编号]:置可视(true,true)
		self.道具输入框[编号]:置文本("1")
		self.物品[self.格子[编号]].格子=1
	end
end

function 给予NPC:刷新道具(ss)
	for i=self.开始,self.结束 do
		self.物品[i-(self.开始-1)]:置物品(ss[i])
	end
	self.格子={}
	self.道具输入框[1]:置可视(false,false)
	self.道具输入框[2]:置可视(false,false)
	self.道具输入框[3]:置可视(false,false)
end

function 给予NPC:显示(dt,x,y)
	self.焦点=false
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y)
	self.资源组[4]:更新(x,y,self.选中类型 ~= "道具")
	self.资源组[5]:更新(x,y,self.选中类型 ~= "任务包裹")

	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-75+self.资源组[1].宽度/2,self.y)
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+3)
	zts:置颜色(绿色)
	zts:显示(self.x+18,self.y+30,self.对象类型.."："..self.对象名称)
	zts:置颜色(黄色)
	zts:显示(self.x+18,self.y+50,"想给我什么？")
	tp.物品格子背景_:显示(self.x+17,self.y+80)
	tp.物品格子背景_:显示(self.x+87,self.y+80)
	tp.物品格子背景_:显示(self.x+87+70,self.y+80)
	self.资源组[6]:显示(self.x+18,self.y+142)
	self.资源组[6]:显示(self.x+88,self.y+142)
	self.资源组[6]:显示(self.x+88+70,self.y+142)
	zts:显示(self.x+18,self.y+213,"给予银两")
	zts:置颜色(白色)
	zts:显示(self.x+self.资源组[1].宽度/2-20-30,self.y+3,"向NPC给与专用界面")
	zts:显示(self.x+18,self.y+186,"现有银两")
	zts:显示(self.x+18+72,self.y+186,tp.金钱)
	self.资源组[7]:显示(self.x+88,self.y+210)
	self.资源组[3]:显示(self.x+72,self.y+242)
	tp.物品界面背景_:显示(self.x+221,self.y+30)
	self.资源组[4]:显示(self.x+330,self.y+242,true,nil,nil,self.选中类型=="道具",2)
	self.资源组[5]:显示(self.x+408,self.y+242,true,nil,nil,self.选中类型=="任务包裹",2)
	if self.资源组[2]:事件判断() then
		self:打开()
	elseif self.资源组[3]:事件判断() then
		local 数量 = {}
		if not 判定数字合法(self.输入框:取文本(),"银两") then return  引擎.场景.常规提示:打开("请重新填写输入框") end
		for n=1,3 do
			if self.格子[n] ~= nil then
				if not 判定数字合法(self.道具输入框[n]:取文本()) then return  引擎.场景.常规提示:打开("请重新填写输入框") end
				数量[n] = self.道具输入框[n]:取文本()
			end
		end
		发送数据(3715,{格子=self.格子,银子=self.输入框:取文本(),数量=数量,类型=self.选中类型})
		self:打开()
	elseif self.资源组[4]:事件判断() then
		self.开始 = 1
		self.结束 = 20
		self.选中类型 = "道具"
		发送数据(3751,{类型=self.选中类型 })
	elseif self.资源组[5]:事件判断() then
		self.开始 = 41
		self.结束 = 60
		self.选中类型 = "任务包裹"
		发送数据(3751,{类型=self.选中类型 })
	end
	local xx = 0
	local yy = 0
	for i=1,20 do
		if self.物品[i].格子==nil then
			self.物品[i]:置坐标(self.x + xx * 51 + 222,self.y + yy * 51 + 28)
			self.物品[i]:显示(dt,x,y,self.鼠标)
			if self.物品[i].焦点 and not tp.消息栏焦点 then
				if self.物品[i].物品 ~= nil then
					tp.提示:道具行囊(x,y,self.物品[i].物品)
					if 引擎.鼠标弹起(左键) then
						self:设置物品(i)
					end
				end
				self.焦点 = true
			end
		end

		xx = xx + 1
		if xx == 5 then
			xx = 0
			yy = yy + 1
		end
	end
	self.输入框:置坐标(self.x + 92,self.y + 213)
	self.道具输入框[1]:置坐标(self.x + 39,self.y + 145)
	self.道具输入框[2]:置坐标(self.x + 109,self.y + 145)
	self.道具输入框[3]:置坐标(self.x + 179,self.y + 145)
	self.控件类:更新(dt,x,y)
	if self.输入框._已碰撞 then
		self.焦点 = true
	end
	self.控件类:显示(x,y)
	for n=1,3 do
		if self.格子[n]~=nil then
			self.物品[self.格子[n]]:置坐标(self.x + n*70-70+18 ,self.y + 80)
			self.物品[self.格子[n]]:显示(dt,x,y,self.鼠标)
			if self.物品[self.格子[n]].焦点 and not tp.消息栏焦点 then
				if self.物品[self.格子[n]].物品 ~= nil then
					tp.提示:道具行囊(x,y,self.物品[self.格子[n]].物品)
					if 引擎.鼠标弹起(左键) then
						self.物品[self.格子[n]].格子=nil
						self.格子[n]=nil
						self.道具输入框[n]:置可视(false,false)
					end
				end
				self.焦点 = true
			end
		end
	end
end

function 给予NPC:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	else
		return false
	end
end

function 给予NPC:初始移动(x,y)
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

function 给予NPC:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 给予NPC