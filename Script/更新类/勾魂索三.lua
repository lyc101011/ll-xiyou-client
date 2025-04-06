-- @Author: baidwwy
-- @Date:   2024-10-15 01:51:34
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-10-17 03:18:33
--======================================================================--
local 勾魂索三 = class()
local tp,zts
local tx = 引擎.取头像
local mousea = 引擎.鼠标弹起
-- local 按钮 = require("script/系统类/按钮")
local insert = table.insert
function 勾魂索三:初始化(根)
	self.ID = 126
	self.x = 324
	self.y = 119
	self.xx = 0
	self.yy = 0
	self.注释 = "勾魂索三"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	-- self.右键关闭 = 1
	self.可移动 = true
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 资源 = 根.资源
	self.资源组 = {
		[1] = 自适应.创建(0,1,474,384,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮.创建(自适应.创建(12,4,70,22,1,3),0,0,4,true,true,"  添加"),
		[4] = 按钮.创建(自适应.创建(12,4,70,22,1,3),0,0,4,true,true,"  删除"),
		[5] = 自适应.创建(37,1,447,309,3,nil),
		-- [6] = 资源:载入('pic/fenge.png',"图片"), --分割条
	}

	for i=2,4 do
		self.资源组[i]:绑定窗口_(self.ID)
	end
	tp = 根

	self.窗口时间 = 0
	zts = tp.字体表.普通字体
end

function 勾魂索三:打开(内容)
	if self.可视 then
		self.名单={}
		self.可视 = false
	else
		insert(tp.窗口_,self)
		self.名单=内容
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end
function 勾魂索三:显示(dt,x,y)
	self.焦点 = false
    self.资源组[1]:显示(self.x,self.y)
    self.资源组[2]:更新(x,y)
    self.资源组[3]:更新(x,y)
    self.资源组[4]:更新(x,y)
    if self.资源组[2]:事件判断() then
        self:打开()
		return
    end
    tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2+5,self.y+3,"追杀名单")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	self.资源组[5]:显示(self.x+13,self.y+33)
	zts:置颜色(白色)
	zts:显示(self.x+31,self.y+38,"追杀对象")
	zts:显示(self.x+163,self.y+38,"ID")
	zts:显示(self.x+266,self.y+38,"门派")
	zts:显示(self.x+380,self.y+38,"等级")
	zts:置颜色(0xFF222222)
	for i=1,#self.名单 do
		zts:显示(self.x+31,self.y+38+i*28,self.名单[i].名称)
		zts:显示(self.x+163,self.y+38+i*28,self.名单[i].id)
		zts:显示(self.x+266,self.y+38+i*28,self.名单[i].门派)
		zts:显示(self.x+380,self.y+38+i*28,self.名单[i].等级)
	end
	self.资源组[3]:显示(self.x+152,self.y+354)
	self.资源组[4]:显示(self.x+270,self.y+354)
	if self.资源组[3]:事件判断() then
	    tp.窗口.组合输入框:打开("勾魂索",{"请输入玩家ID："})
	end






end



function 勾魂索三:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 勾魂索三:初始移动(x,y)
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

function 勾魂索三:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 勾魂索三