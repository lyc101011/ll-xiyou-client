-- @Author: baidwwy
-- @Date:   2024-11-01 04:10:22
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-01 15:43:48
local 场景类_注册 = class()
local tp
local mouseb = 引擎.鼠标按下
function 场景类_注册:初始化(根)
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 滑块 = 根._滑块
	local 自适应 = 根._自适应
	self.右键关闭=1
	self.标题背景 = 资源:载入('wzife.wd5',"网易WDF动画",0x00010020)
	self.上一步 = 按钮(资源:载入('org.rpk',"网易WDF动画",0x1000255),0,0,3,true,true)
	self.确定注册 = 按钮(资源:载入('org.rpk',"网易WDF动画",0x1000246),0,0,3,true,true)
	tp = 根
	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('创建控件')
	总控件:置可视(true,true)
	self.账号输入框 = 总控件:创建输入("账号输入",0,0,240,18,根)
	self.账号输入框:置可视(true,true)
	self.账号输入框:置限制字数(12)
	self.账号输入框:置光标颜色(4294967295)
	self.账号输入框:置文字颜色(4294967295)
	self.密码输入框 = 总控件:创建输入("密码输入",0,0,200,18,根)
	self.密码输入框:置可视(true,true)
	self.密码输入框:置限制字数(12)
	self.密码输入框:置光标颜色(4294967295)
	self.密码输入框:置文字颜色(4294967295)
	self.密码输入框:置密码模式()
	self.确定密码输入框 = 总控件:创建输入("密码确定",0,0,200,18,根)
	self.确定密码输入框:置可视(true,true)
	self.确定密码输入框:置限制字数(12)
	self.确定密码输入框:置光标颜色(4294967295)
	self.确定密码输入框:置文字颜色(4294967295)
	self.确定密码输入框:置密码模式()
	self.事件 = false
	self.焦点 = false
	self.开启 = false
	self.编号 = 编号
	self.双击 = nil
	self.时间 = 0
	self.账号输入焦点 = false
	self.密码输入焦点 = false
	self.置坐标 = false
end

function 场景类_注册:显示(dt,x,y)
	引擎.置标题(__game.."- 注册")
	self.标题背景:显示(200,全局游戏高度/2-180-92+30)
	self.账号输入框:置坐标(310,全局游戏高度/2-130+45-92+30)
	self.密码输入框:置坐标(310,全局游戏高度/2-104+50+18-92+30)
	self.确定密码输入框:置坐标(310,全局游戏高度/2-78+50+42-92+30)
	self.控件类:更新(dt,x,y)
	self.控件类:显示(x,y)
	self.上一步:更新(x,y)
	self.确定注册:更新(x,y)
	if 引擎.按键弹起(键盘符号.tab) then
		if self.账号输入焦点 then
		  self.账号输入框:置焦点(false)
		  self.密码输入框:置焦点(true)
		  self.确定密码输入框:置焦点(false)
		  self.账号输入焦点 = false
		  self.密码输入焦点 = true
		  self.确定密码输入焦点 = false
		elseif self.密码输入焦点 then
		  self.密码输入框:置焦点(false)
		  self.确定密码输入框:置焦点(true)
		  self.账号输入框:置焦点(false)
		  self.账号输入焦点 = false
		  self.密码输入焦点 = false
		  self.确定密码输入焦点 = true
		elseif self.确定密码输入焦点 then
		  self.密码输入框:置焦点(false)
		  self.确定密码输入框:置焦点(false)
		  self.账号输入框:置焦点(true)
		  self.账号输入焦点 = true
		  self.密码输入焦点 = false
		  self.确定密码输入焦点 = false
		else
		  self.账号输入框:置焦点(true)
		  self.账号输入焦点 = true
		end
	  end
	if self.上一步:事件判断() then
		tp.进程 = 1
	elseif self.确定注册:事件判断() then
		if self.账号输入框:取文本()=="" or self.密码输入框:取文本()=="" or self.确定密码输入框:取文本()=="" then
			tp.提示:写入("#Y/请先输入账号或密码或确认密码")
			return 0
		elseif #self.账号输入框:取文本() <6 or #self.密码输入框:取文本() <6 or #self.确定密码输入框:取文本() <6  then
			tp.提示:写入("#Y/账号或密码或确认密码格式不正确")
			return 0
		elseif self.密码输入框:取文本() ~= self.确定密码输入框:取文本() then
			tp.提示:写入("#Y/请检查密码与确认密码是否一致")
			return 0
		-- elseif not 判定数字合法(self.账号输入框:取文本(),"银两") then
		-- 	tp.提示:写入("#Y/请输入正确格式的账号密码")
		--   	return 0
		else
			系统参数.账号=self.账号输入框:取文本()
			系统参数.密码=self.密码输入框:取文本()
			f函数.写配置(程序目录.."config.ini","mhxy","账号",系统参数.账号)
			f函数.写配置(程序目录.."config.ini","mhxy","密码",系统参数.密码)
			客户端:发送数据(1.1,版本号..fgc..系统参数.账号..fgc..系统参数.密码..fgc..f函数.取硬盘序列号())
		end
	end
	self.确定注册:显示(200+148,全局游戏高度/2+50+18-92+30)
end

return 场景类_注册