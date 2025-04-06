-- @Author: baidwwy
-- @Date:   2024-06-13 16:59:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-12-27 22:20:08
local 系统类_底图框 = class()
local 矩阵 = require("gge包围盒")(650,587,350,35)
local tp;
local keyaz = 引擎.按键按住
local keyax = 引擎.按键按下
local keytq = 引擎.按键弹起
local KEY = KEY

function 系统类_底图框:初始化(根)
	local 按钮 = 根._按钮
	local 资源 = 根.资源
	self.UI_攻击 = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x6BBC42FA),0,0,4,true)
	self.UI_道具 = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x0E53F705),0,0,4,true)
	self.UI_给予 = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x7E4DE3DE),0,0,4,true)
	self.UI_交易 = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xCAB0B8B4),0,0,4,true)
	self.UI_队伍 = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x0D3EA20B),0,0,4,true)
	self.UI_宠物 = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x187ABFC8),0,0,4,true)
	self.UI_任务 = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xA15292B2),0,0,4,true)
	self.UI_帮派 = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xC35B2EC3),0,0,4,true)
	self.UI_快捷 = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xBB6E607E),0,0,4,true)
	self.UI_好友 = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x7C7A64D9),0,0,4,true)
	self.UI_成就 = 按钮.创建(资源:载入('wzife.wd2',"网易WDF动画",0x8B3AADDA),0,0,4,true)
	self.UI_动作 = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x548156A0),0,0,4,true)
	self.UI_系统 = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x5116F7DF),0,0,4,true)
	self.UI_体验状态 = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",2161957867),0,0,4,true)
	self.好友闪烁 = 资源:载入('wzife.wdf',"网易WDF动画",0x6A062464) --723023243  1831469208
	self.申请闪烁 = 资源:载入('wzife.wdf',"网易WDF动画",0XD3EA20B)
	self.临时背包 = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x237d38da),0,0,4,true)
	self.背包闪烁 = 资源:载入('wzife.wdf',"网易WDF动画",0x237d38da)
    self.商城按钮=按钮.创建(资源:载入('nvdi1.wdf',"网易WDF动画",0xDA67C3CA),0,0,1,true)  --商城图标
    self.测试按钮=按钮.创建(资源:载入('nvdi1.wdf',"网易WDF动画",0xDA67C3CA),0,0,1,true)  --仅测试打开使用

    self.一键强化符按钮=按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x4A5DD98C),0,0,1,true)  --一键一键强化符图标

	tp = 根
	self.临时背包闪烁=false
	self:qiehuan(全局界面风格)
end
function 系统类_底图框:qiehuan(风格)
	local 按钮 = tp._按钮
	local 资源 = tp.资源
	if  风格=="国韵" then
		self.UI_底图 = 资源:载入('common/uigy.wdf',"网易WDF动画",0x3D1FA249)
	elseif  风格=="水晶" then
		self.UI_底图 = 资源:载入('common/uisj.wdf',"网易WDF动画",0x3D1FA249)
	else
		self.UI_底图 = 资源:载入('wzife.wd2',"网易WDF动画",0x3D1FA249)
	end
end
function 系统类_底图框:显示(dt,x,y)
	self.UI_快捷:更新(x,y)
	--self.UI_体验状态:更新(x,y,not tp.战斗中)
	-- self.商城按钮:更新(x,y,not tp.战斗中)
	self.UI_攻击:更新(x,y,not tp.战斗中)
	self.UI_道具:更新(x,y,not tp.战斗中)
	self.UI_给予:更新(x,y,not tp.战斗中)
	self.UI_交易:更新(x,y,not tp.战斗中)
	self.UI_队伍:更新(x,y,not tp.战斗中)
	self.UI_宠物:更新(x,y,not tp.战斗中)
	self.UI_任务:更新(x,y,not tp.战斗中)
	self.UI_帮派:更新(x,y,not tp.战斗中)
	self.UI_好友:更新(x,y)
	self.UI_成就:更新(x,y,not tp.战斗中)
	self.UI_动作:更新(x,y,not tp.战斗中)
	self.UI_系统:更新(x,y)
	if (keyaz(KEY.ALT) and keyax(KEY.F4)) then
		错误关闭数=100
		引擎关闭开始()
	elseif self.UI_系统:事件判断() or (keyaz(KEY.ALT) and keyax(KEY.S)) and not tp.消息栏焦点  then
		tp.窗口.系统设置:打开()
	elseif self.UI_系统:事件判断() or (keyaz(KEY.ALT) and keyax(KEY.Z)) and not tp.消息栏焦点  then  --ALT+Z  自动战斗快捷键
		发送数据(15)
	end
	if not tp.战斗中 then
		if keytq(KEY.F9) then
			玩家屏蔽 = not 玩家屏蔽
		end
		self.商城按钮:更新(x,y)
		self.测试按钮:更新(x,y)
		self.一键强化符按钮:更新(x,y)
		self.测试按钮:显示(全局游戏宽度-59,全局游戏高度-56)
		self.一键强化符按钮:显示(全局游戏宽度-147,全局游戏高度-710)
		if not tp.武神坛角色 then
			self.商城按钮:显示(全局游戏宽度-55,全局游戏高度-116)
		end
		if 引擎.场景.队伍[1].体验状态 then
		    self.UI_体验状态:更新(x,y)
		    self.UI_体验状态:显示(全局游戏宽度/2,全局游戏高度-216)
		    if self.UI_体验状态:事件判断() then
		        tp.窗口.对话栏:文本("","体验状态","您的帐号目前处于体验状态，在以下的时间里，您将以“体验状态”进行游戏，在线消除“体验状态”，请点击“消除体验状态”，祝您游戏愉快！",{"什么是体验状态","消除体验状态","关闭"})
		    end
		end

        if (keyaz(KEY.ALT) and keyax(KEY.U)) then
			tp.窗口.坐骑属性栏:打开()
		elseif self.UI_攻击:事件判断() or (keyaz(KEY.ALT) and keytq(KEY.A))  then
			-- tp.窗口.装备开运:打开(0.2)
			-- 发送数据(33,{序列=0})
			tp.鼠标.置鼠标("平时攻击")
		elseif self.测试按钮:事件判断() or (keyaz(KEY.ALT) and keyax(KEY.H)) and not tp.消息栏焦点 then











		elseif ( self.一键强化符按钮:事件判断() and not tp.消息栏焦点 ) or (  self.一键强化符按钮:是否选中(x,y) and 引擎.鼠标弹起(右键) and not tp.消息栏焦点 ) then
				发送数据(6587.1)
		elseif self.商城按钮:事件判断() or (keyaz(KEY.ALT) and keyax(KEY.D)) and not tp.消息栏焦点 and not tp.武神坛角色 then
			 if tp.窗口.商城类.可视 then
			    tp.窗口.商城类:打开()
			else
				发送数据(29)
				tp.窗口.商城类:打开()
			end
		elseif self.UI_道具:事件判断() or (keyaz(KEY.ALT) and keyax(KEY.E)) and not tp.消息栏焦点  then
			if tp.窗口.道具行囊.可视 then
				tp.窗口.道具行囊:打开()
			else
				发送数据(3699)
			end
		elseif (keyaz(KEY.ALT) and keytq(KEY.W)) and not tp.消息栏焦点  then
			if tp.窗口.人物状态栏.可视==false then
				发送数据(7)
			else
				tp.窗口.人物状态栏:打开()
			end
		elseif self.UI_宠物:事件判断() or ( keyaz(KEY.ALT) and keyax(KEY.P)) and not tp.消息栏焦点 then
			if tp.窗口.宠物状态栏.可视==false then
				发送数据(5006)
			else
				tp.窗口.宠物状态栏:打开()
			end
		elseif (keyaz(KEY.ALT) and keyax(KEY.O)) and not tp.消息栏焦点  then
			if tp.窗口.召唤兽属性栏.可视==false then
				发送数据(5001)
			else
				tp.窗口.召唤兽属性栏:打开()
			end
		elseif self.UI_帮派:事件判断() or (keyaz(KEY.ALT) and keyax(KEY.B)) and not tp.消息栏焦点  then
			if tp.窗口.帮派界面.可视==false then
				发送数据(36)
			else
				tp.窗口.帮派界面:打开()
			end
		elseif self.UI_快捷:事件判断() or (keyaz(KEY.ALT) and keyax(KEY.C)) and not tp.消息栏焦点  then
			if tp.快捷技能显示 then
				tp.快捷技能显示 = not tp.快捷技能显示
			elseif not tp.快捷技能显示 then
				local xsf = false
				for i=1,8 do
					if tp.窗口.快捷技能栏.技能格子~=nil and tp.窗口.快捷技能栏.技能格子[i]~=nil and tp.窗口.快捷技能栏.技能格子[i].技能~=nil then
						xsf = true
					end
				end
				if not xsf then
					发送数据(28)
				end
				tp.快捷技能显示 = not tp.快捷技能显示
			end
		elseif self.UI_任务:事件判断() or (keyaz(KEY.ALT) and keyax(KEY.Q)) and not tp.消息栏焦点  then
			if tp.窗口.任务栏.可视==false then
				发送数据(10)
			else
				tp.窗口.任务栏:打开()
			end
		elseif self.UI_给予:事件判断() or (keyaz(KEY.ALT) and keyax(KEY.G)) and not tp.消息栏焦点  then
			tp.鼠标.置鼠标("给予")
		elseif self.UI_交易:事件判断() or (keyaz(KEY.ALT) and keyax(KEY.X)) and not tp.消息栏焦点  then
			 tp.鼠标.置鼠标("交易")
		elseif (self.好友闪烁:是否选中(x,y) and self.UI_好友:是否选中(x,y) and 引擎.鼠标弹起(0)) or self.UI_好友:事件判断() or( keyaz(KEY.ALT) and keyax(KEY.F)) and not tp.消息栏焦点  then
			-- 引擎.场景.常规提示:打开("#Y/好友系统正在调试中，暂时关闭。")
			if tp.窗口.好友列表.可视 then
				tp.窗口.好友列表:打开()
			else
				发送数据(6956)
			end
		elseif (self.申请闪烁:是否选中(x,y) and self.UI_队伍:是否选中(x,y) and 引擎.鼠标弹起(0)) or self.UI_队伍:事件判断() or (keyaz(KEY.ALT) and keyax(KEY.T)) and not tp.消息栏焦点  then
			if tp.窗口.队伍栏.可视==false then
			   发送数据(4001)
			else
			  tp.窗口.队伍栏:打开()
			end
			申请队伍=false
		end
	else
		if self.UI_快捷:事件判断() or (keyaz(KEY.ALT) and keyax(KEY.C)) and not tp.消息栏焦点  then
			发送数据(12)
		end
	end
	self.UI_底图:显示(全局游戏宽度-350,全局游戏高度-63)
	self.UI_攻击:显示(全局游戏宽度-346,全局游戏高度-34,true)
	self.UI_道具:显示(全局游戏宽度-320,全局游戏高度-34,true)
	self.UI_给予:显示(全局游戏宽度-294,全局游戏高度-34,true)
	self.UI_交易:显示(全局游戏宽度-269,全局游戏高度-34,true)
	self.UI_队伍:显示(全局游戏宽度-243,全局游戏高度-34,true)
	self.UI_宠物:显示(全局游戏宽度-218,全局游戏高度-34,true)
	self.UI_任务:显示(全局游戏宽度-191,全局游戏高度-34,true)
	self.UI_帮派:显示(全局游戏宽度-164,全局游戏高度-34,true)
	self.UI_快捷:显示(全局游戏宽度-137,全局游戏高度-34,true)
	self.UI_好友:显示(全局游戏宽度-110,全局游戏高度-34,true)
	if not tp.战斗中 and 消息闪烁 then
		self.好友闪烁:更新(dt)
	    self.好友闪烁:显示(全局游戏宽度-110,全局游戏高度-34)
	end
	if not tp.战斗中 and self.临时背包闪烁 then
		self.临时背包:更新(x,y,not tp.战斗中)
		self.临时背包:显示(全局游戏宽度-380,全局游戏高度-86)
		self.背包闪烁:更新(dt)
		self.背包闪烁:显示(全局游戏宽度-380,全局游戏高度-86)
		if self.临时背包:事件判断() then
			发送数据(3749,{方式="索取"})
		end
	end
	if not tp.战斗中 and 申请队伍 then
		self.申请闪烁:更新(dt)
		self.申请闪烁:显示(全局游戏宽度-243,全局游戏高度-34)
	end
	self.UI_成就:显示(全局游戏宽度-81,全局游戏高度-31,true)
	self.UI_动作:显示(全局游戏宽度-53,全局游戏高度-34,true)
	self.UI_系统:显示(全局游戏宽度-26,全局游戏高度-34,true)
	if self:检查点(x,y) then
		tp.按钮焦点 = true
	end
	if self.UI_攻击:是否选中(x,y) then
		tp.提示:自定义(x-50,y+15,"快捷键:ALT+A")
	elseif self.商城按钮:是否选中(x,y)  then
		tp.提示:自定义(x-50,y+15,"商城:ALT+D")
	elseif self.UI_道具:是否选中(x,y)  then
		tp.提示:自定义(x-50,y+15,"快捷键:ALT+E")
	elseif self.UI_给予:是否选中(x,y)  then
		tp.提示:自定义(x-50,y+15,"快捷键:ALT+G")
	elseif self.UI_交易:是否选中(x,y)  then
		tp.提示:自定义(x-50,y+15,"快捷键:ALT+X")
	elseif self.UI_队伍:是否选中(x,y) then
		tp.提示:自定义(x-50,y+15,"快捷键:ALT+T")
	elseif self.UI_宠物:是否选中(x,y)  then
		tp.提示:自定义(x-50,y+15,"快捷键:ALT+P")
	elseif self.UI_任务:是否选中(x,y)  then
		tp.提示:自定义(x-50,y+15,"快捷键:ALT+Q")
	elseif self.UI_帮派:是否选中(x,y)  then
		tp.提示:自定义(x-50,y+15,"快捷键:ALT+B")
	elseif self.UI_快捷:是否选中(x,y)  then
		tp.提示:自定义(x-50,y+15,"快捷键:ALT+C")
	elseif self.UI_好友:是否选中(x,y) then
		tp.提示:自定义(x-50,y+15,"快捷键:ALT+F")
	elseif self.UI_成就:是否选中(x,y)  then
		tp.提示:自定义(x-50,y+15,"成就快捷键:未知")
	elseif self.UI_动作:是否选中(x,y)  then
		tp.提示:自定义(x-50,y+15,"快捷键:ALT+D")
	elseif self.UI_系统:是否选中(x,y)  then
		tp.提示:自定义(x-50,y+15,"快捷键:ALT+S")
	elseif self.一键强化符按钮:是否选中(x,y)  then
         tp.提示:自定义(x-50,y+25,"一键强化符")

	end
end

function 系统类_底图框:检查点(x,y)
	return 矩阵:检查点(x,y)
end

return 系统类_底图框