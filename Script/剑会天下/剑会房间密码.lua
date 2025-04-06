-- @Author: baidwwy
-- @Date:   2024-03-03 22:16:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-03-06 10:59:04
local tp,jhzts
local insert = table.insert

local 场景类_剑会房间密码 = class()
function 场景类_剑会房间密码:初始化(根)
	self.ID = 191
	self.x = 0
	self.y = 0
	self.xx = 0
	self.yy = 0
	self.注释 = "剑会房间密码"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	tp = 根
	jhzts = tp.字体表.普通字体
	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('剑会房间密码总控件')
	总控件:置可视(true,true)
	self.输入框={}
	self.输入框 = 总控件:创建输入("剑会房间密码",0,0,200,14)
	self.输入框:置可视(false,false)
	self.输入框:置限制字数(8)
	self.输入框:置文本("")
	self.输入框:置光标颜色(-16777216)
	self.输入框:置文字颜色(-16777216)
end

function 场景类_剑会房间密码:关闭()
	self.输入框:置可视(false,false)
	self.资源组=nil
	self.房间 = nil
	self.可视 = false
	return
end

function 场景类_剑会房间密码:打开(内容,x,y) --此页为：进入房间需要输入的密码
	if self.可视 then
		self:关闭()
		return
	else
		local 按钮 = tp._按钮
		local 自适应 = tp._自适应
		local 资源 = tp.资源
		insert(tp.窗口_,self)
        self.资源组 = {
        	[1] = 自适应.创建(0,1,310,100,3,9),
        	[2] = 自适应.创建(40,1,118,19,1,3), --输入框底
        	[3] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"加入房间"),
        }
        self.输入框:置可视(true,true)
        self.房间 = 内容
		self.x = x + 100
		self.y = y + 200
	    tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 场景类_剑会房间密码:显示(dt,x,y)
	---------------------
	-- 素材位置调整()
	-- ax=AFCHX
	-- ay=AFCHY
	-- self.资源组[1] = tp._自适应.创建(0,1,ax,ay,3,9)
	---------------------
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	jhzts:置颜色(黄色):显示(self.x+152,self.y+4,"房间密码输入")
	jhzts:置颜色(白色):显示(self.x+10,self.y+32,"加入" ..self.房间.名称 .."的房间需要密码，请输入密码")
	jhzts:显示(self.x+10,self.y+62,"房间密码：")
	self.资源组[3]:更新(x,y)
	self.资源组[2]:显示(self.x+76,self.y+59)
	self.资源组[3]:显示(self.x+214,self.y+58)
	self.输入框:置坐标(self.x+84,self.y+62)
	if self.资源组[3]:事件判断() then
		发送数据(400,{操作="加入房间",房间编号=self.房间.房间编号,房间密码=self.输入框:取文本()})
	end
	self.控件类:更新(dt,x,y)
	self.控件类:显示(x,y)
end

function 场景类_剑会房间密码:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y) then
		return true
	end
end

function 场景类_剑会房间密码:初始移动(x,y)
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

function 场景类_剑会房间密码:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_剑会房间密码