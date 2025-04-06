-- @Author: baidwwy
-- @Date:   2024-05-23 06:05:09
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-10-17 03:44:09
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2023-01-12 19:11:42
--======================================================================--
local 场景类_组合输入框 = class()

local floor = math.floor
local zts,tp
local insert = table.insert
function 场景类_组合输入框:初始化(根)
	self.ID = 41
	self.x = 250
	self.y = 246
	self.xx = 0
	self.yy = 0
	self.注释 = "组合输入框"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('改名总控件')
	总控件:置可视(true,true)
	self.输入框 = 总控件:创建输入("输入",0,0,230,16)
	self.输入框:置可视(false,false)
	self.输入框:置光标颜色(-16777216)
	self.输入框:置文字颜色(-16777216)
	self.窗口时间 = 0
	tp = 根
	zts = 根.字体表.普通字体
end

function 场景类_组合输入框:打开(类型,附加,道具id)
	if self.可视 then
		self.回调事件 = nil
		self.类型事件 = nil
		self.输入框:置可视(false,false)
		self.可视 = false
	else
		insert(tp.窗口_,self)
		if 类型 == "改名" then
			self.输入框:置限制字数(12)
		end
		self.输入框:置可视(true,true)
		if self.资源组==nil then
		    local 资源 = tp.资源
			local 按钮 = tp._按钮
			local 自适应 = tp._自适应
			self.资源组 = {
				[1] = 自适应.创建(0,1,340,128,3,9),
				[2] = 按钮.创建(自适应.创建(12,4,75,22,1,3),0,0,4,true,true,"确  定"),
				[3] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true), --关闭
				[4] = 自适应.创建(7,1,245,22,1,3,nil,18),
			}
			for i=2,3 do
			    self.资源组[i]:绑定窗口_(self.ID)
			end
			self.资源组[2]:置偏移(8,0)
		end
		self.回调事件 = 附加
		self.类型事件 = 类型
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.道具id = 道具id
	end
end


function 场景类_组合输入框:显示(dt,x,y)
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	-- zts:置颜色(self.回调事件[2])
	tp.窗口标题背景_:显示(self.x-85+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2+5,self.y+3,self.类型事件)
	self.资源组[3]:显示(self.x-18+self.资源组[1].宽度,self.y+3)
	zts:置颜色(白色):显示(self.x+45,self.y+38,self.回调事件[1])
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y)
	-- self.资源组[4]:更新(x,y)
	if self.资源组[2]:事件判断() then
		if self.类型事件 == "影蛊" then
			if not 判定数字合法(self.输入框:取文本()) then return  tp.常规提示:打开("请重新填写输入框") end
			发送数据(73,{文本=self.输入框:取文本()})
			self:打开()
			return false
		elseif self.类型事件 == "拆分" then
			if not 判定数字合法(self.输入框:取文本()) then return  tp.常规提示:打开("请重新填写输入框") end
			发送数据(3806,{文本=tonumber(self.输入框:取文本()),道具id=self.道具id})
			self:打开()
			return false
		elseif self.类型事件 == "勾魂索" then
			if not 判定数字合法(self.输入框:取文本()) then return  tp.常规提示:打开("请重新填写输入框") end
			发送数据(6567,{文本=self.输入框:取文本()})
			-- 全局勾魂索=self.输入框:取文本()
			self:打开()
			return false



		elseif self.类型事件 == "帮战报名" then
			if not 判定数字合法(self.输入框:取文本()) then return  tp.常规提示:打开("请重新填写输入框") end
			if self.输入框:取文本()+0<500000 then
				tp.常规提示:打开("#Y/最低报名费用不能低于50W")
				return
			end
			发送数据(6550,{文本=self.输入框:取文本()})
			self:打开()
			return false
		elseif self.类型事件 == "请抄写：" then
			if self.输入框:取文本() == "" then
				tp.提示:写入("#Y/请输入您需要抄写的句子！")
			else
				发送数据(88,{文本=self.输入框:取文本()})
				self:打开()
				return false
			end
		elseif self.类型事件 == "更改宝宝造型" then
			发送数据(5013,{文本=self.输入框:取文本()})
			self:打开()
			return false
		end
	elseif self.资源组[3]:事件判断() then
		self:打开()
		return false
	end
	self.资源组[2]:显示(self.x+135,self.y+97)
	self.资源组[4]:显示(self.x+47,self.y+65)
	self.控件类:更新(dt,x,y)
	self.控件类:显示(dt,x,y)
	self.输入框:置坐标(self.x + 53,self.y + 67)
	if self.输入框._已碰撞 then
		self.焦点 = true
	end
end

function 场景类_组合输入框:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_组合输入框:初始移动(x,y)
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

function 场景类_组合输入框:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_组合输入框