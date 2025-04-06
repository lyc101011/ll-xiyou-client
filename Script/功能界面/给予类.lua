-- @Author: baidwwy
-- @Date:   2024-11-01 04:10:22
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-10 23:48:53
local 给予类 = class()
local tp,zts,zts1,字体
local insert = table.insert
local xxx = 0
local yyy = 0
local sts = {"单价","数量","总额","现金"}
local tos = 引擎.取金钱颜色
local mouseb = 引擎.鼠标弹起

function 给予类:初始化(根)
   self.ID = 94
	self.x = 366
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
		[1] = 按钮.创建(自适应.创建(12,4,100,22,1,3),0,0,4,true,true,"  给 予"),
		[2] = 自适应.创建(0,1,270,438,3,9),
		[3] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true), --关闭
		[5] = 自适应.创建(7,1,53,22,1,3,nil,18),
		[6] = 自适应.创建(7,1,88,22,1,3,nil,18),
	}
	self.资源组[1]:绑定窗口_(self.ID)
	self.资源组[3]:绑定窗口_(self.ID)

	local 格子 = require("script/系统类/队伍_格子")

	self.选中类型 = "道具"
	self.窗口时间 = 0
	tp = 根
	self.物品={}
	for i=1,20 do
		self.物品[i] = 根._物品格子.创建(0,0,i,"给予_物品")
	end
  	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('给予总控件')
	总控件:置可视(true,true)
	self.输入框 = 总控件:创建输入("给予银两输入",0,0,100,14,根,根.字体表.华康14)
	self.输入框:置可视(false,false)
	self.输入框:置限制字数(11)
	self.输入框:置数字模式()
	self.输入框:屏蔽快捷键(true)
	self.输入框:置光标颜色(-16777216)
	self.输入框:置文字颜色(-16777216)
	self.道具输入框 = {
		[1]=总控件:创建输入("给予道具输入框1",0,0,30,14,根,根.字体表.华康14),
		[2]=总控件:创建输入("给予道具输入框2",0,0,30,14,根,根.字体表.华康14),
		[3]=总控件:创建输入("给予道具输入框3",0,0,30,14,根,根.字体表.华康14)
	}
	self.道具输入框[1]:置可视(false,false)
	self.道具输入框[1]:置限制字数(3)
	self.道具输入框[1]:置数字模式()
	self.道具输入框[1]:屏蔽快捷键(true)
	self.道具输入框[1]:置光标颜色(-16777216)
	self.道具输入框[1]:置文字颜色(-16777216)

	self.道具输入框[2]:置可视(false,false)
	self.道具输入框[2]:置限制字数(3)
	self.道具输入框[2]:置数字模式()
	self.道具输入框[2]:屏蔽快捷键(true)
	self.道具输入框[2]:置光标颜色(-16777216)
	self.道具输入框[2]:置文字颜色(-16777216)

	self.道具输入框[3]:置可视(false,false)
	self.道具输入框[3]:置限制字数(3)
	self.道具输入框[3]:置数字模式()
	self.道具输入框[3]:屏蔽快捷键(true)
	self.道具输入框[3]:置光标颜色(-16777216)
	self.道具输入框[3]:置文字颜色(-16777216)
	字体 = tp.字体表.普通字体
end

function 给予类:打开(数据,名称,等级,类型)
	if self.可视 then
		self.可视 = false
		self.选中类型 = "道具"
		self.输入框:置可视(false,false)
		for n=1,3 do
	    	self.道具输入框[n]:置可视(false,false)
	    end
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
		self.对象等级=等级
		self.对象类型=类型
		self.格子={}
		self.输入框:置可视(true,true)
		self.输入框:置文本("0")
		for n=1,3 do
	    	self.道具输入框[n]:置可视(false,false)
     		self.道具输入框[n]:置文本("0")
	    end
	end
end
function 给予类:更新(dt) end

function 给予类:设置物品(id)
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

		if self.物品[self.格子[编号]].物品.可叠加 and self.物品[self.格子[编号]].物品.数量~=nil and self.物品[self.格子[编号]].物品.数量~=0 then
			self.道具输入框[编号]:置文本(tonumber(self.物品[self.格子[编号]].物品.数量))
		else
		self.道具输入框[编号]:置文本("1")
		end

		self.物品[self.格子[编号]].格子=1
	end
end

function 给予类:显示(dt,x,y)
	self.焦点=false
	self.资源组[2]:显示(self.x,self.y)
	self.资源组[1]:显示(self.x+87,self.y+408)
	self.资源组[1]:更新(x,y)
	self.资源组[3]:更新(x,y)
	tp.物品界面背景_:显示(self.x+8,self.y+30)
	tp.物品格子背景_:显示(self.x+33,self.y+249)
	tp.物品格子背景_:显示(self.x+33+78,self.y+249)
	tp.物品格子背景_:显示(self.x+33+78+78,self.y+249)
	tp.窗口标题背景_:显示(self.x-88+self.资源组[2].宽度/2,self.y)
	self.资源组[3]:显示(self.x-18+self.资源组[2].宽度,self.y+2)
	字体:置颜色(白色):显示(self.x+self.资源组[2].宽度/2-50+38,self.y+3,"给 予")
	self.资源组[5]:显示(self.x+33,self.y+249+62)
	self.资源组[5]:显示(self.x+33+78,self.y+249+62)
	self.资源组[5]:显示(self.x+33+78+78,self.y+249+62)
	self.资源组[6]:显示(self.x+176,self.y+345)
	字体:置颜色(白色)
	字体:显示(self.x + 12,self.y + 348+1,"现金")
	字体:显示(self.x + 12+130,self.y + 348+1,"银两")
	字体:显示(self.x + 12+130,self.y + 348+30+1,"等级")
  	字体:置颜色(引擎.取金钱颜色(tp.金钱))
	字体:显示(self.x + 12+37,self.y + 348+1,tp.金钱)
	字体:置颜色(黄色)
	字体:显示(self.x + 185,self.y + 348+30+1,self.对象等级)
	字体:显示(self.x + 12,self.y + 348+30+1,self.对象类型.."："..self.对象名称)
	self.输入框:置坐标(self.x + 190-6,self.y + 348+1)
	if self.资源组[3]:事件判断() then --关闭
		self:打开()
	elseif self.资源组[1]:事件判断() then
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
	end
	-- self.资源组[2]:显示(355+self.x,263+self.y)
	local xx = 0
	local yy = 0
	for i=1,20 do
		if self.物品[i].格子==nil then
			self.物品[i]:置坐标(self.x + xx * 51 + 10,self.y + yy * 51 + 35-7)
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

    for n=1,3 do
		if self.物品[self.格子[n]]~=nil and self.物品[self.格子[n]].格子 then
			if self.道具输入框[n]:取文本() == nil or self.道具输入框[n]:取文本() == "" then
				-- self.道具输入框[n]:置文本(0)
			elseif (tonumber(self.道具输入框[n]:取文本())>1 and tonumber(self.道具输入框[n]:取文本()) < 100) or tonumber(self.道具输入框[n]:取文本())==0 then
				if self.物品[self.格子[n]].物品.可叠加 and self.物品[self.格子[n]].物品.数量~=nil and self.物品[self.格子[n]].物品.数量~=0 then
					if tonumber(self.道具输入框[n]:取文本()) > self.物品[self.格子[n]].物品.数量 then
						self.道具输入框[n]:置文本(tonumber(self.物品[self.格子[n]].物品.数量))
					end
				else
					self.道具输入框[n]:置文本(1)
				end
			elseif tonumber(self.道具输入框[n]:取文本()) > 99 then
				if self.物品[self.格子[n]].物品.可叠加 and self.物品[self.格子[n]].物品.数量~=nil and self.物品[self.格子[n]].物品.数量~=0 then
					if tonumber(self.道具输入框[n]:取文本()) > self.物品[self.格子[n]].物品.数量 then
						self.道具输入框[n]:置文本(tonumber(self.物品[self.格子[n]].物品.数量))
					else
						self.道具输入框[n]:置文本(99)
					end
				else
					self.道具输入框[n]:置文本(1)
				end
			end
		end
	end

	self.控件类:更新(dt,x,y)
	if self.输入框._已碰撞 then
		self.焦点 = true
	end
	self.控件类:显示(x,y)

	self.道具输入框[1]:置坐标(self.x + 48+2,self.y + 333-20+1)
	self.道具输入框[2]:置坐标(self.x + 129+2,self.y + 333-20+1)
	self.道具输入框[3]:置坐标(self.x + 206+2,self.y + 333-20+1)
	for n=1,3 do
		if self.格子[n]~=nil then
			self.物品[self.格子[n]]:置坐标(self.x + n*79-81+32+4 ,self.y + 275-27)
			if self.道具输入框[n]._已碰撞 then
				self.焦点 = true
			end
			self.物品[self.格子[n]]:显示(dt,x,y,self.鼠标)
			if self.物品[self.格子[n]].焦点 and not tp.消息栏焦点 then
				if self.物品[self.格子[n]].物品 ~= nil then
					tp.提示:道具行囊(x,y,self.物品[self.格子[n]].物品)
					if 引擎.鼠标弹起(左键) then
						self.物品[self.格子[n]].格子=nil
						self.格子[n]=nil
						self.道具输入框[n]:置可视(false,false)
						self.道具输入框[n]:置文本()
					end
				end
				self.焦点 = true
			end
		end
	end
end

function 给予类:检查点(x,y)
	if self.可视 and self.资源组[2]:是否选中(x,y)  then
		return true
	else
		return false
	end
end

function 给予类:初始移动(x,y)
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

function 给予类:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 给予类