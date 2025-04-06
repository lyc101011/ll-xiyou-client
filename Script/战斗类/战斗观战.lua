-- @Author: baidwwy
-- @Date:   2024-08-04 20:56:39
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-08-11 16:17:06
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2022-10-05 19:49:08
--======================================================================--
local 场景类_战斗观战 = class()
local 状态 = "取消"
local 开启自动 = false
local format = string.format
local tp

function 场景类_战斗观战:初始化(根)
	self.ID = 60
	self.x = 370
	self.y = 2
	self.xx = 0
	self.yy = 0
	self.注释 = "战斗"
	self.可视 = false
	self.可视化 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	self.资源组 = {
		[1] = 根._自适应.创建(6,1,180,44,3,9),
		[2] = 按钮.创建(根._自适应.创建(12,4,75,22,1,3),0,0,4,true,true,"退出观战")
	}
	tp = 根
	self.第一次 = false
end

function 场景类_战斗观战:打开()
	if self.可视化 then
		self.可视化 = false
	else
		self.可视化 = true
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
	end
end

function 场景类_战斗观战:显示(dt,x,y)
	--if not self.可视化 then
	--	return
	--end
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:更新1(x,y)
	引擎.场景.字体表.标题字体:显示(self.x+45,self.y+14,"观战模式")
	if self.资源组[2]:事件判断() then
      发送数据(5520)
	end
	self.资源组[2]:显示(self.x+90,self.y+10)
	if tp.按钮焦点 then
		self.焦点 = true
	end
	if 引擎.鼠标弹起(1)  and not tp.禁止关闭 and self.鼠标 then
		self:打开()
	end
end

function 场景类_战斗观战:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
	  self.鼠标=true
	 --local xy={x=x-self.x,y=y-self.y}
	 --self.x,self.y=x,y
		return true
	end
end

function 场景类_战斗观战:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not self.第一次 then
		tp.运行时间 = tp.运行时间 + 2
		self.第一次 = true
	end
	if not 引擎.场景.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.场景.战斗.移动窗口 = true
	end
	if self.可视化 and self.鼠标 and not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_战斗观战:开始移动(x,y)
	if self.可视化 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_战斗观战