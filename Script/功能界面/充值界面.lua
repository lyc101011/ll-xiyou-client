-- @Author: baidwwy
-- @Date:   2023-03-10 11:49:57
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-12-13 16:09:48
local 系统类_充值系统 = class()
local floor = math.floor
local tp,zts,zt
local format = string.format
local insert = table.insert

function 系统类_充值系统:初始化(根)
	self.x = 280
	self.y = 170
	self.xx = 0
	self.yy = 0
	self.注释 = "充 值 系 统"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	self.窗口时间 = 0
	zts = tp.字体表.道具字体
	zt = tp.字体表.描边字体
	self.进程=1

	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('序号控件')
	总控件:置可视(true,true)
	self.输入框 = 总控件:创建输入("卡号输入",0,0,180,14)
	self.输入框:置可视(false,false)
	self.输入框:置限制字数(50)
	--self.输入框:屏蔽快捷键(true)
	self.输入框:置光标颜色(-16777216)
	self.输入框:置文字颜色(-16777216)

	self.数量框 = 总控件:创建输入("数量输入",0,0,180,14)
	self.数量框:置可视(false,false)
	self.数量框:置限制字数(20)
	self.数量框:置数字模式()
	--self.数量框:屏蔽快捷键(true)
	self.数量框:置光标颜色(-16777216)
	self.数量框:置文字颜色(-16777216)

end

function 系统类_充值系统:打开(数据)
	if self.可视 then
		self.可视 = false
		self.输入框:置可视(false,false)
		self.数量框:置可视(false,false)
		self.资源组 = nil
		return
	else
		insert(tp.窗口_,self)
		local 资源 = tp.资源
		local 按钮 = tp._按钮
		local 自适应 = tp._自适应
		self.资源组 = {
			[1] = 资源:载入('登陆资源.wdf',"网易WDF动画",0x8027BD41),
			[2] = 资源:载入('登陆资源.wdf',"网易WDF动画",0x2436C9A1),
			[7] = 资源:载入('登陆资源.wdf',"网易WDF动画",0x2DA9D4EC),
			[8] = 资源:载入('登陆资源.wdf',"网易WDF动画",0x479E857C),
		}
		self.资源组[65] = 按钮.创建(tp.资源:载入('登陆资源.wdf',"网易WDF动画",0x48D2590A),0,0,4,true,true,"确定充值")
		self.资源组[66] = 按钮.创建(tp.资源:载入('登陆资源.wdf',"网易WDF动画",0x48D2590A),0,0,4,true,true,"充值网站")

		self.数据=数据
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.输入框:置可视(true,true)
		self.数量框:置可视(true,true)
		self.数量框:置文本("")
	end
end

function 系统类_充值系统:刷新(数据)
	self.数据.点卡 = 数据.点卡
end

function 系统类_充值系统:显示(dt,x,y)
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x + 85+14,self.y+7)
	self.资源组[65]:更新(x,y)
	self.资源组[66]:更新(x,y)

	--self.资源组[66]:更新(x,y)
	self.资源组[65]:显示(self.x + 545-180+12,self.y +33+50)
	self.资源组[66]:显示(self.x + 545-180+12,self.y +33+75)
	--self.资源组[66]:显示(self.x + 545-180+12,self.y +73+50)
	--self.资源组[8]:显示(self.x+315-180+12,self.y+73+50)
	self.资源组[8]:显示(self.x+315-180+12,self.y+33+50)
	self.控件类:更新(dt,x,y)
	self.控件类:显示(x,y)
	self.输入框:置坐标(self.x+317-180+12,self.y+36+50)
	self.数量框:置坐标(self.x+317-180+12,self.y+76+50)
	zts:置颜色(黄色)
	zts:显示(self.x+210-180+12,self.y+30+50,"输入卡号")
	zts:显示(self.x+183,self.y+15,self.注释)

	if self.资源组[65]:事件判断() then
		if self.输入框:取文本() == "" then
			tp.提示:写入("#Y/请输入正确的卡号")
			return
		end
		发送数据(121.7,{卡号=self.输入框:取文本()})
	elseif self.资源组[66]:事件判断() then
		引擎.运行("http://www.baidu.com")
	end
end

function 系统类_充值系统:检查点(x,y)
	if self.资源组 ~= nil and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 系统类_充值系统:初始移动(x,y)
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

function 系统类_充值系统:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 系统类_充值系统