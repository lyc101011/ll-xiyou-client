-- @Author: baidwwy
-- @Date:   2023-09-12 12:13:54
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-04-08 23:31:05
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2023-05-26 18:56:58
--======================================================================--
local 快捷技能栏 = class()
local tp,zts1
local mouseb = 引擎.鼠标按下
local keyb   = 引擎.按键弹起
local bw     = require("gge包围盒")(全局游戏宽度-360,全局游戏高度-65,262,31)
local ski    = 引擎.取技能
local gl     = 引擎.置纹理过滤

function 快捷技能栏:初始化(根)
	local 资源 = 根.资源
	tp = 根
	zts1 = 根.字体表.描边字体
	self.图片组 = {}
	self.操作员 = nil
	self.技能格子={}
	local jn = tp._技能格子
	for i=1,8 do
	    self.技能格子[i] = jn(0,0,i,"辅助技能")
	end
	self.格子 = 资源:载入('wzife.wdf',"网易WDF动画",0x0493FA27)
	self:qiehuan(全局界面风格)

end
function 快捷技能栏:qiehuan(风格)

	local 资源 = tp.资源
	if  风格=="国韵" then
		self.格子 = 资源:载入('common/uigy.wdf',"网易WDF动画",0x0493FA27)
	elseif  风格=="水晶" then
		self.格子 = 资源:载入('common/uisj.wdf',"网易WDF动画",0x0493FA27)
	else
		self.格子 = 资源:载入('wzife.wdf',"网易WDF动画",0x0493FA27)
	end
end

function 快捷技能栏:设置技能(参数,x,y) --快捷键
	local 选中编号=0
	for i=1,8 do
		self.格子:显示(全局游戏宽度-360+i*33,全局游戏高度-65)
		if self.格子:是否选中(x,y) then
			选中编号=i
		end
	end
	if 选中编号==0 then
		return
	end
	发送数据(11,{位置=选中编号,名称=参数.名称,类型=参数.类型})
end

function 快捷技能栏:刷新(数据,禁止)
	if 禁止==nil then
		tp.快捷技能显示 = not tp.快捷技能显示
	end
	--local 数据={{名称="仙灵店铺"},{名称="横扫千军"},{名称="火眼金睛"},{名称="打坐"},{名称="调息"}}
	if tp.快捷技能显示 then
		for i=1,8 do
			self.技能格子[i]:置技能(数据[i])
			self.技能格子[i].ww,self.技能格子[i].hh=nil,nil
			if self.技能格子[i].技能~=nil then
				self.技能格子[i].技能.模型=self.技能格子[i].技能.小模型
				if self.技能格子[i].技能.模型.宽度>24 then
					self.技能格子[i].ww,self.技能格子[i].hh=等比例缩放公式(24,24,self.技能格子[i].技能.模型.宽度 , self.技能格子[i].技能.模型.高度)
				end

			end
		end
	end
end

function 快捷技能栏:显示(dt,x,y)
	self.鼠标=false
	if not tp.快捷技能显示 then
		return
	end
	-- local kj = (self.操作员 or tp.队伍[1]).快捷技能
	-- kj={名称={"横扫千军"},{名称="破釜沉舟"}}
	for i=1,8 do
		self.格子:显示(全局游戏宽度-360+i*33,全局游戏高度-65)
		if self.格子:是否选中(x,y) then
			self.鼠标=true
		end
		self.技能格子[i]:置坐标(全局游戏宽度-356+i*33,全局游戏高度-61)
		self.技能格子[i]:显示(x,y,self.鼠标,self.技能格子[i].ww,self.技能格子[i].hh)
		zts1:显示(全局游戏宽度-352+i*33,全局游戏高度-81,"F"..i)
		if self.技能格子[i].焦点 and tp.选中窗口 == 0 then
			tp.提示:技能(x,y,self.技能格子[i].技能)
			if 引擎.鼠标弹起(右键)  then
				if tp.战斗中==false then
					发送数据(13,{序列=i})
				elseif self.技能格子[i]~=nil and 战斗类.进程=="命令"  and 战斗类.战斗指令.操作对象 == 1 then
					if self:取战斗可用(self.技能格子[i].技能.名称) then
						战斗类.战斗指令:设置法术参数(self.技能格子[i].技能)
					else
						tp.常规提示:打开("#Y/该技能无法在战斗中使用")
					end
				end
			end
		end
	end
	local ax = self:快捷焦点按下()
	if ax~=0 then
		if tp.战斗中==false then
			发送数据(13,{序列=ax})
		elseif self.技能格子[ax]~=nil and 战斗类.进程=="命令" and 战斗类.战斗指令.操作对象 == 1 then
			if self:取战斗可用(self.技能格子[ax].技能.名称) then
				战斗类.战斗指令:设置法术参数(self.技能格子[ax].技能)
			else
				tp.常规提示:打开("#Y/该技能无法在战斗中使用")
			end
		end
	end
end

function 快捷技能栏:取战斗可用(名称)
	if 名称=="妙手空空" then
	   return true
	end
	if skill恢复[名称] or skill法攻[名称] or skill物攻[名称] or skill封印[名称] or skill减益[名称] or skill增益[名称] then
	    return true
	end
	return false
end

function 快捷技能栏:快捷焦点按下()
	if keyb(KEY.F1) then
		return 1
	elseif keyb(KEY.F2) then
		return 2
	elseif keyb(KEY.F3) then
		return 3
	elseif keyb(KEY.F4) then
		return 4
	elseif keyb(KEY.F5) then
		return 5
	elseif keyb(KEY.F6) then
		return 6
	elseif keyb(KEY.F7) then
		return 7
	elseif keyb(KEY.F8) then
		return 8
	end
	return 0
end

function 快捷技能栏:检查点(x,y)
	return tp.快捷技能显示 and bw:检查点(x,y)
end

return 快捷技能栏