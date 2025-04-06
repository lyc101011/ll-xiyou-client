-- @Author: baidwwy
-- @Date:   2024-09-11 20:07:40
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-10-28 16:53:49
-- @Author: baidwwy
-- @Date:   2024-09-11 20:07:40
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-09-12 10:29:17

local 战斗命令类 = class()
local 场景类_战斗指令栏 = class()
local random = 引擎.取随机整数
local keyaz = 引擎.按键按住
local keyax = 引擎.按键按下
local keytq = 引擎.按键弹起
local mouse = 引擎.鼠标弹起
local KEY = KEY

function 战斗命令类:初始化(根)
	self.ID = 57
	self.x = 77
	self.y = 68
	self.xx = 0
	self.yy = 0
	self.道具栏 = require("script/战斗类/战斗道具栏").创建(根)
	self.灵宝栏 = require("script/战斗类/战斗灵宝类").创建(根)
	self.注释 = "战斗"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 按钮 = require("script/系统类/按钮")
	self.人物资源组 = {
		[1] = 根.资源:载入('wzife.wdf',"网易WDF动画",0xF5A9A3F5),
		[2] = 按钮.创建(根.资源:载入('wzife.wdf',"网易WDF动画",0x839C6C7D),0,0,4,true),--法术
		[3] = 按钮.创建(根.资源:载入('wzife.wdf',"网易WDF动画",0x2E8F2187),0,0,4,true),--法宝
		[4] = 按钮.创建(根.资源:载入('wzife.wdf',"网易WDF动画",0x389DCCF5),0,0,4,true),--特技
		[5] = 按钮.创建(根.资源:载入('wzife.wdf',"网易WDF动画",0x1587C26E),0,0,4,true),--道具
		[6] = 按钮.创建(根.资源:载入('wzife.wdf',"网易WDF动画",0xA662D44B),0,0,4,true),--防御
		[7] = 按钮.创建(根.资源:载入('wzife.wdf',"网易WDF动画",0x0467A0A8),0,0,4,true),--保护
		-- [8] = 按钮.创建(根.资源:载入('wzife.wdf',"网易WDF动画",0x8A8A21AD),0,0,4,true),
		[9] = 按钮.创建(根.资源:载入('wzife.wdf',"网易WDF动画",0xA2E2DC42),0,0,4,true),--召唤
		-- [10] = 按钮.创建(根.资源:载入('wzife.wdf',"网易WDF动画",0xE1A79F93),0,0,4,true), --召还
		[11] = 按钮.创建(根.资源:载入('wzife.wdf',"网易WDF动画",0xEFB4F757),0,0,4,true),--自动
		[12] = 按钮.创建(根.资源:载入('wzife.wdf',"网易WDF动画",0x2ACB414D),0,0,4,true),--捕捉
		[13] = 按钮.创建(根.资源:载入('wzife.wdf',"网易WDF动画",0x132041E1),0,0,4,true),--逃跑
		[14] = 按钮.创建(根.资源:载入('nx3d6.dll',"网易WDF动画",'灵宝按钮'),0,0,4,true),--灵宝
	}

	self.召唤兽资源组 = {
		[1] = 根.资源:载入('wzife.wdf',"网易WDF动画",0xB5B958DF),
		[2] = 按钮.创建(根.资源:载入('wzife.wdf',"网易WDF动画",0x839C6C7D),0,0,4,true),
		[3] = 按钮.创建(根.资源:载入('wzife.wdf',"网易WDF动画",0x1587C26E),0,0,4,true),
		[4] = 按钮.创建(根.资源:载入('wzife.wdf',"网易WDF动画",0xA662D44B),0,0,4,true),
		[5] = 按钮.创建(根.资源:载入('wzife.wdf',"网易WDF动画",0x0467A0A8),0,0,4,true),
		[6] = 按钮.创建(根.资源:载入('wzife.wdf',"网易WDF动画",0x132041E1),0,0,4,true),
	}
	self.单挑圈圈 = {
	    [2] =根.资源:载入('mgtx.wdf',"网易WDF动画",0xAABBCC10),
	    [3] =根.资源:载入('mgtx.wdf',"网易WDF动画",0xAABBCC10),
	    [4] =根.资源:载入('mgtx.wdf',"网易WDF动画",0xAABBCC11),
	    [5] =根.资源:载入('mgtx.wdf',"网易WDF动画",0xAABBCC11),
	    }
	self.单挑召唤 = nil
	self.召唤位置 = 0

	self.偏移x,self.偏移y=等比例缩放公式(self.人物资源组[1].宽度,self.人物资源组[1].高度-24,self.人物资源组[1].宽度,self.人物资源组[1].高度)
	self.指令 = nil
	self.对象 = nil
	self.队形 = nil
	self.使用 = nil
	self.技能 = nil
	self.特技 = nil
	self.物品 = nil
	self.召唤兽 = nil
	self.物品对象 = nil
	self.窗口时间 = 0
	self.剩余时间 = nil
	self.格子 = nil
	----------------超级敏捷
	self.敏捷对象=0
	self.敏捷执行=0
	----------------
	tp = 根
	self.法术界面= require("script/战斗类/战斗技能栏").创建(根)
	self.召唤界面=require("script/战斗类/战斗召唤栏").创建(根)
	self.法术开关=false
	self.道具开关=false
	self.召唤开关=false
	self.法术名称=""
	self.提示字体=tp.字体表.提示字体
	-- self.操作标志=根.资源:载入('addon.wdf',"网易WDF动画",0x7c2fb1d2)
end

function 战斗命令类:重置命令()
	self.命令类型="攻击"
end

function 战斗命令类:设置指令(编号)
	if self.命令类型=="攻击" and self.参战单位[编号].敌我==1 and keyaz(KEY.CTRL) == false then
		tp.常规提示:打开("#Y/选择友方目标请按住CTRL点击队友")
		return
	elseif self.命令类型=="攻击" and self.参战单位[编号].敌我==1 and keyaz(KEY.CTRL) and 编号 == self.单位编号[self.操作对象] then
		tp.常规提示:打开("#Y/不可以攻击自己")
		return
	end
	if 战斗类.PK战斗 and not 战斗类.单挑模式 then
	    发送数据(5555,{类型=self.命令类型,参数=self.命令参数,位置=self.参战单位[self.单位编号[self.操作对象]].排序位置})
	end
	---------------------------超级敏捷
    if self.单位编号[self.操作对象]~=nil and self.参战单位[self.单位编号[self.操作对象]].超敏记录 then
    	self.参战单位[self.单位编号[self.操作对象]].超敏记录 = nil
    	self.完成指令[self.操作对象].再次操作={类型=self.命令类型,目标=编号,敌我=0,参数=self.命令参数,附加=self.命令附加,id=self.单位id[self.操作对象]}
    else
		self.完成指令[self.操作对象]={类型=self.命令类型,目标=编号,敌我=0,参数=self.命令参数,附加=self.命令附加,id=self.单位id[self.操作对象]}
	end
	---------------------------
	-- self.完成指令[self.操作对象]={类型=self.命令类型,目标=编号,敌我=0,参数=self.命令参数,附加=self.命令附加,id=self.单位id[self.操作对象]}
	-- if self.操作对象+self.敏捷执行 >= self.对象上限+self.敏捷对象 then --超级敏捷
	-- -- if self.操作对象>=self.对象上限 then
	-- 	发送数据(5502,self.完成指令)
	-- 	战斗类.进程="等待"
	-- 	self:重置高亮()
	-- else
	-- 	---------------------------超级敏捷
	-- 	if self.单位编号[self.操作对象]~=nil and self.参战单位[self.单位编号[self.操作对象]].超级敏捷 ==1 then
	-- 		self.参战单位[self.单位编号[self.操作对象]].超级敏捷 = 0
	-- 		self.参战单位[self.单位编号[self.操作对象]].超敏记录=true
	-- 		self.敏捷执行 = self.敏捷执行 + 1
	-- 		self.命令版面=true
	-- 		tp.鼠标.置鼠标("普通")
	-- 		self.命令类型="攻击"
	-- 		self.命令附加=4
	-- 		return
	-- 	else
	-- 	    if self.单位编号[self.操作对象+1]~=nil then
	-- 			self.操作对象=self.操作对象+1
	-- 		end
	-- 	end
	-- 	-------------------------------------
	-- 	-- self.操作对象=self.操作对象+1
	-- 	self:重置高亮()
	-- end
	local 继续 = true
--	print(self.参战单位[self.单位编号[self.操作对象]].门派,self.命令类型,self.参战单位[self.单位编号[self.操作对象]].黎魂,九黎城攻击技能[self.命令参数])
	if self.参战单位[self.单位编号[self.操作对象]].门派 == "九黎城" and self.命令类型 == "法术" and self.参战单位[self.单位编号[self.操作对象]].黎魂 ~= nil and 九黎城攻击技能[self.命令参数] ~= nil then
		if self.九黎多次[self.单位编号[self.操作对象]] == nil then
			self.九黎多次[self.单位编号[self.操作对象]] = {
				{
					self.命令参数,
					编号
				}
			}
			继续 = false
		elseif #self.九黎多次[self.单位编号[self.操作对象]] < self.参战单位[self.单位编号[self.操作对象]].黎魂 - 1 then
			self.九黎多次[self.单位编号[self.操作对象]][#self.九黎多次[self.单位编号[self.操作对象]] + 1] = {
				self.命令参数,
				编号
			}
			继续 = false
		else
			self.九黎多次[self.单位编号[self.操作对象]][#self.九黎多次[self.单位编号[self.操作对象]] + 1] = {
				self.命令参数,
				编号
			}
			self.完成指令[self.操作对象] = {
				敌我 = 0,
				类型 = self.命令类型,
				目标 = 编号,
				参数 = self.九黎多次[self.单位编号[self.操作对象]],
				附加 = self.命令附加
			}
		end
	end
	if 继续 then
		if self.操作对象>=self.对象上限 then
			发送数据(5502,self.完成指令)
			战斗类.进程="等待"
			self:重置高亮()
		else
			self.操作对象=self.操作对象+1
			self:重置高亮()
		end
	end
	self.命令版面=true
	tp.鼠标.置鼠标("普通")
	self.命令类型="攻击"
	self.命令附加=4
end

function 战斗命令类:设置指令1(编号)
	if 战斗类.PK战斗 and not 战斗类.单挑模式 then
		发送数据(5555,{类型=self.命令类型,参数=self.命令参数,位置=self.参战单位[self.单位编号[self.操作对象]].排序位置})
	end
	self.完成指令[self.操作对象]={类型=self.命令类型,目标=编号,敌我=0,参数=self.命令参数,附加=self.命令附加,id=self.单位id[self.操作对象]}
	local 继续 = true
	if self.参战单位[self.单位编号[self.操作对象]].门派 == "九黎城" and self.命令类型 == "法术" and self.参战单位[self.单位编号[self.操作对象]].黎魂 ~= nil and 九黎城攻击技能[self.命令参数] ~= nil then
		if self.九黎多次[self.单位编号[self.操作对象]] == nil then
			self.九黎多次[self.单位编号[self.操作对象]] = {
				{
					self.命令参数,
					编号
				}
			}
			继续 = false
		elseif #self.九黎多次[self.单位编号[self.操作对象]] < self.参战单位[self.单位编号[self.操作对象]].黎魂 - 1 then
			self.九黎多次[self.单位编号[self.操作对象]][#self.九黎多次[self.单位编号[self.操作对象]] + 1] = {
				self.命令参数,
				编号
			}
			继续 = false
		else
			self.九黎多次[self.单位编号[self.操作对象]][#self.九黎多次[self.单位编号[self.操作对象]] + 1] = {
				self.命令参数,
				编号
			}
			self.完成指令[self.操作对象] = {
				敌我 = 0,
				类型 = self.命令类型,
				目标 = 编号,
				参数 = self.九黎多次[self.单位编号[self.操作对象]],
				附加 = self.命令附加
			}
		end
	end
	if 继续 then
	if self.操作对象>=self.对象上限 then
		发送数据(5502,self.完成指令)
		战斗类.进程="等待"
		self:重置高亮()
		if self.法术界面.可视 then
			self.法术界面.可视=false
			self.法术开关=false
		end
	else
		self.操作对象=self.操作对象+1
		self:重置高亮()
		self.命令版面=true
		tp.鼠标.置鼠标("普通")
		self.命令类型="攻击"
		self.命令附加=4
	end
	end
	self.命令版面=true
	tp.鼠标.置鼠标("普通")
end
-- function 战斗命令类:设置指令1(编号)
-- 	--self.完成指令[self.操作对象]={类型=self.命令类型,目标=编号,敌我=0,参数="",附加=""}
-- 	if 战斗类.PK战斗 and not 战斗类.单挑模式 then
-- 	    发送数据(5555,{类型=self.命令类型,参数=self.命令参数,位置=self.参战单位[self.单位编号[self.操作对象]].排序位置})
-- 	end
-- 	---------------------------超级敏捷
--     if self.单位编号[self.操作对象]~=nil and self.参战单位[self.单位编号[self.操作对象]].超敏记录 then
--     	self.参战单位[self.单位编号[self.操作对象]].超敏记录 = nil
--     	self.完成指令[self.操作对象].再次操作={类型=self.命令类型,目标=编号,敌我=0,参数=self.命令参数,附加=self.命令附加,id=self.单位id[self.操作对象]}
--     else
-- 		self.完成指令[self.操作对象]={类型=self.命令类型,目标=编号,敌我=0,参数=self.命令参数,附加=self.命令附加,id=self.单位id[self.操作对象]}
-- 	end
-- 	---------------------------
-- 	-- self.完成指令[self.操作对象]={类型=self.命令类型,目标=编号,敌我=0,参数=self.命令参数,附加=self.命令附加,id=self.单位id[self.操作对象]}
-- 	if self.操作对象+self.敏捷执行 >= self.对象上限+self.敏捷对象 then --超级敏捷
-- 	-- if self.操作对象>=self.对象上限 then
-- 		发送数据(5502,self.完成指令)
-- 		战斗类.进程="等待"
-- 		self:重置高亮()
-- 		if self.法术界面.可视 then -- 发送数据以后关闭战斗技能栏
-- 		    self.法术界面.可视=false
-- 		    self.法术开关=false
-- 		end
-- 	else
-- 		if self.单位编号[self.操作对象]~=nil and self.参战单位[self.单位编号[self.操作对象]].超级敏捷 ==1 then
-- 			self.参战单位[self.单位编号[self.操作对象]].超级敏捷 = 0
-- 			self.参战单位[self.单位编号[self.操作对象]].超敏记录=true
-- 			self.敏捷执行 = self.敏捷执行 + 1
-- 			self.命令版面=true
-- 			tp.鼠标.置鼠标("普通")
-- 			self.命令类型="攻击"
-- 			self.命令附加=4
-- 			return
-- 		else
-- 		    if self.单位编号[self.操作对象+1]~=nil then
-- 				self.操作对象=self.操作对象+1
-- 			end
-- 		end
-- 		-- self.操作对象=self.操作对象+1
-- 		self:重置高亮()
-- 		self.命令版面=true
-- 		tp.鼠标.置鼠标("普通")
-- 		self.命令类型="攻击"
-- 		self.命令附加=4
-- 	end
-- 	self.命令版面=true
-- 	tp.鼠标.置鼠标("普通")
-- end

function 战斗命令类:更新类型(sj)
	local x=全局游戏宽度-50--950
	local y=485
	local xx = 93
	local yy = 297
	if dx == 2 then
		xx = 93
		yy = 128
	end
	self.x = x - xx
	self.y = y - yy
	self.命令版面=true
	self.类型=1
	self.单位编号=sj.mb
	self.单位id=sj.id
	self.操作对象=1
	self.完成指令={mb=sj.mb}
	self.对象上限=#sj.mb
	self.参战单位=战斗类.战斗单位[ljcs]
	self.命令类型="攻击"
	self.命令附加=4
	self.命令参数=""
	self.鼠标更改=true
	self.法术开关=false
	self.道具开关=false
	self.召唤开关=false
	self.九黎多次 = {}
	战斗连击显示 = {}
	战斗连击单位 = 0

	self.测试=1
	for i=1,self.对象上限 do
		self.参战单位[self.单位编号[self.操作对象]+i-1].主动技能 = sj["zdjn"..i]
	end
	for n=1,#sj.mb do
		self.完成指令[n]={}
	end
end
-- function 战斗命令类:更新类型(sj)
-- 	----------------超级敏捷
-- 	self.敏捷对象=0
-- 	self.敏捷执行=0
-- 	----------------
-- 	local x=全局游戏宽度-50--950
-- 	local y=485
-- 	local xx = 93
-- 	local yy = 297
-- 	if dx == 2 then
-- 		xx = 93
-- 		yy = 128
-- 	end
-- 	self.x = x - xx
-- 	self.y = y - yy
-- 	self.命令版面=true
-- 	self.类型=1
-- 	self.单位编号=sj.mb
-- 	self.单位id=sj.id
-- 	self.操作对象=1
-- 	self.完成指令={mb=sj.mb}
-- 	self.对象上限=#sj.mb
-- 	self.参战单位=战斗类.战斗单位[ljcs]
-- 	self.命令类型="攻击"
-- 	self.命令附加=4
-- 	self.命令参数=""
-- 	self.鼠标更改=true
-- 	self.法术开关=false
-- 	self.道具开关=false
-- 	self.召唤开关=false
-- 	self.测试=1
-- 	self.九黎多次 = {}
-- 	战斗连击显示 = {}
-- 	战斗连击单位 = 0
-- 	for i=1,self.对象上限 do
-- 		local xbh = self.单位编号[self.操作对象+i-1]
-- 		self.参战单位[self.单位编号[self.操作对象+i-1]].主动技能 = sj["zdjn"..i]
-- 		---------------------------超级敏捷
-- 		if i== 2 then
-- 			self.参战单位[xbh].超级敏捷 = sj.zccz or 0
-- 			if self.参战单位[xbh].超级敏捷==1 then
-- 				self.参战单位[xbh].超敏记录=false
-- 				self.敏捷对象 = self.敏捷对象 + 1
-- 			end
-- 		end
-- 	end
-- 	for i=1,self.对象上限 do
-- 		self.参战单位[self.单位编号[self.操作对象+i-1]].侵蚀技能 = sj["qsjn"..i]
-- 	end
-- 	for n=1,#sj.mb do
-- 		self.完成指令[n]={}
-- 	end

-- end

function 战斗命令类:设置道具参数(编号,对象)
	self.道具栏:打开()
	self.命令类型="道具"
	self.命令附加=对象
	self.命令参数=编号
	self.命令版面=false
	tp.鼠标.置鼠标("道具")
	if self.命令附加==2 then
		self:设置指令(self.单位编号[self.操作对象])
	end
end

function 战斗命令类:设置灵宝参数(编号,对象)
	self.灵宝栏:打开()
	self.命令类型="道具"
	self.命令附加=对象
	self.命令参数=编号
	self.命令版面=false
	tp.鼠标.置鼠标("道具")
	if self.命令附加==2 then
		self:设置指令(self.单位编号[self.操作对象])
	end
end

function 战斗命令类:设置逃跑(id)
	self.完成指令[self.操作对象]={类型="逃跑",目标=1,敌我=0,参数=self.命令参数,附加=1,id=self.单位id[self.操作对象]}
	if 战斗类.PK战斗 and not 战斗类.单挑模式 then
	    发送数据(5555,{类型="逃跑",参数=self.命令参数,位置=self.参战单位[self.单位编号[self.操作对象]].排序位置})
	end
	if self.操作对象>=self.对象上限 then
		发送数据(5502,self.完成指令)
		战斗类.进程="等待"
		self:重置高亮()
		if self.法术界面.可视 then -- 发送数据以后关闭战斗技能栏
		    self.法术界面.可视=false
		    self.法术开关=false
		end
	else
		self.操作对象=self.操作对象+1
		self:重置高亮()
	end
end

function 战斗命令类:设置召唤(id)
	self.命令类型="召唤"
	if 战斗类.PK战斗 and not 战斗类.单挑模式 then
	    发送数据(5555,{类型=self.命令类型,参数=self.命令参数,位置=self.参战单位[self.单位编号[self.操作对象]].排序位置})
	end
	self.完成指令[self.操作对象]={类型=self.命令类型,目标=id,敌我=0,参数=self.命令参数,附加=self.命令附加,id=self.单位id[self.操作对象],位置=self.召唤位置}
	if self.操作对象>=self.对象上限 then
		发送数据(5502,self.完成指令)
		战斗类.进程="等待"
		self:重置高亮()
		if self.法术界面.可视 then -- 发送数据以后关闭战斗技能栏
		    self.法术界面.可视=false
		    self.法术开关=false
		end
	else
		self:重置命令()
		self.操作对象=self.操作对象+1
		self:重置高亮()
	end
end

function 战斗命令类:设置道具()
	self.道具栏:打开()
end

function 战斗命令类:设置灵宝(数据)
	self.灵宝栏:打开(数据)
end

function 战斗命令类:设置捕捉(法术)
	self.命令类型="捕捉"
	--self.命令参数=法术.技能.名称
	self.命令附加=4
	self.命令版面=false
	self.法术开关=false
	tp.鼠标.置鼠标("捕捉")
end

function 战斗命令类:设置披坚执锐(法术,可选编号)
	if 法术==nil then
		return
	end
	if 战斗类.PK战斗 and not 战斗类.单挑模式 then
	    发送数据(5555,{类型=self.命令类型,参数=self.命令参数,位置=self.参战单位[self.单位编号[self.操作对象]].排序位置})
	end
	self.完成指令[self.操作对象]={类型="披坚执锐",目标=1,敌我=0,参数=法术.名称,附加=可选编号,id=self.单位id[self.操作对象]}
	if self.操作对象>=self.对象上限 then
		发送数据(5502,self.完成指令)
		战斗类.进程="等待"
		self:重置高亮()
	else
		self.操作对象=self.操作对象+1
		self:重置高亮()
	end
end

function 战斗命令类:设置法术参数(法术)
	if 法术==nil then
		return
	end
	self.命令类型="法术"
	self.命令参数=法术.名称
	local 临时种类=引擎.取技能(法术.名称)
	self.法术名称=法术.名称
	self.命令附加=临时种类[3]
	self.命令版面=false
	self.法术开关=false
	tp.鼠标.置鼠标("道具")
	if 法术.名称=="妙手空空" then
		self.命令附加=4
	end
	if self.命令附加==2 then
		self:设置指令(self.单位编号[self.操作对象])
	end
end

function 战斗命令类:设置宠物法术参数(法术)
	if 法术==nil then
		return
	end
	self.命令类型="法术"
	self.命令参数=法术.名称
	local 临时种类=引擎.取技能(法术.名称)
	self.法术名称=法术.名称
	self.命令附加=临时种类[3]
	self.命令版面=false
	self.法术开关=false
	tp.鼠标.置鼠标("道具")
	if 法术.名称=="妙手空空" then
		self.命令附加=4
	end
	-- if self.命令附加==2 then
	-- 	self:设置指令(self.单位编号[self.操作对象])
	-- end
	-- if self.命令附加==3 then
		--self:设置指令(self.单位编号[self.操作对象])
	-- end
end

function 战斗命令类:更新(dt,x,y,类型)
	local  go = false
	if tp.选中战斗窗口==nil or tp.选中战斗窗口==0 then
	    go = true
	end
	if self.道具栏.可视 and go then
		self.道具栏:更新(dt,x,y)
		return
	end
	if self.灵宝栏.可视 and go then
		self.灵宝栏:更新(dt,x,y)
		return
	end

	local js=0
	if self.命令版面 then
		-- self.操作标志:更新(x,y)
		if self.参战单位[self.单位编号[self.操作对象]].单位类型 == "角色" then-------------------人物命令
			self.人物资源组[2]:更新1(x,y)
			self.人物资源组[3]:更新1(x,y)
			self.人物资源组[4]:更新1(x,y)
			self.人物资源组[5]:更新1(x,y)
			self.人物资源组[6]:更新1(x,y)
			self.人物资源组[7]:更新1(x,y)
			-- self.人物资源组[8]:更新1(x,y)
			self.人物资源组[9]:更新1(x,y)
			-- self.人物资源组[10]:更新1(x,y)
			self.人物资源组[11]:更新1(x,y)
			self.人物资源组[12]:更新1(x,y)
			self.人物资源组[13]:更新1(x,y)
			self.人物资源组[14]:更新1(x,y)
			if (keyaz(KEY.ALT) and keyax(KEY.Q)) then

				if 战斗类.战斗快捷键法术~=nil then
					if self.参战单位[self.单位编号[self.操作对象]].主动技能[战斗类.战斗快捷键法术] ~=nil and self.参战单位[self.单位编号[self.操作对象]].主动技能[战斗类.战斗快捷键法术].名称 then
						战斗类.战斗指令:设置法术参数(self.参战单位[self.单位编号[self.操作对象]].主动技能[战斗类.战斗快捷键法术])
					else
						tp.常规提示:打开("#Y/设置快捷技能失败你没有这个技能!自动转为普通攻击...")
						self:设置指令1(0)
					end
				else
					tp.常规提示:打开("#Y/为设置快捷键技能!自动转为普通攻击...")
					self:设置指令1(0)
				end

			elseif (keyaz(KEY.ALT) and keytq(KEY.A)) then
				self.命令类型="攻击"
				self:设置指令1(0)
			elseif (self.人物资源组[7]:事件判断() and go) or (keyaz(KEY.ALT) and keyax(KEY.T)) then --保护
				self.命令版面=false
				self.命令类型="保护"
				tp.鼠标.置鼠标("保护")
			elseif (self.人物资源组[2]:事件判断() and go) or (keyaz(KEY.ALT) and keytq(KEY.W)) then --法术
				self.法术界面:打开(self.参战单位[self.单位编号[self.操作对象]].主动技能,"法术","人物",self.参战单位[self.单位编号[self.操作对象]].追加法术)
				tp.鼠标.置鼠标("普通")
			elseif (self.人物资源组[4]:事件判断() and go) then --特技
				tp.鼠标.置鼠标("普通")
				self.法术界面:打开(self.参战单位[self.单位编号[self.操作对象]].特技技能,"特技","人物")
			elseif self.人物资源组[3]:事件判断() and go then --法宝
				发送数据(5508,{玩家id=self.单位id[self.操作对象]})
			elseif (self.人物资源组[5]:事件判断() and go) or (keyaz(KEY.ALT) and keyax(KEY.E)) then --道具
				发送数据(5504,{类型="角色"})--,{玩家id=self.单位id[self.操作对象]}
			elseif (self.人物资源组[6]:事件判断() and go) or (keyaz(KEY.ALT) and keyax(KEY.D)) then --防御
				self.命令类型="防御"
				self:设置指令1(0)
			elseif self.人物资源组[9]:事件判断() and go then --召唤按钮
				if 战斗类.单挑模式 then
				    self.命令类型="单挑召唤"
				    tp.鼠标.置鼠标("道具")
				    self.单挑召唤=true
				else
					if self.召唤界面.可视 then
						self.召唤界面:打开(tp.队伍[1])
					else
						发送数据(5505,{玩家id=self.单位id[self.操作对象]})
					end
				end

			elseif self.人物资源组[11]:事件判断() and go then --自动
				if 战斗类.自动开关 then
					战斗类.自动开关=false
				else
					战斗类.自动开关=true
				end
			elseif self.人物资源组[12]:事件判断() and go then --捕捉
				self:设置捕捉()
			elseif self.人物资源组[13]:事件判断() and go then --逃跑
				self:设置逃跑()
			elseif self.人物资源组[14]:事件判断() and go then --灵宝
				发送数据(5519,{玩家id=self.单位id[self.操作对象]})
			elseif (keyaz(KEY.ALT) and keyax(KEY.G)) then
				self:设置捕捉(法术)
			end
		else---------------------------召唤兽命令
			self.召唤兽资源组[2]:更新1(x,y)
			self.召唤兽资源组[3]:更新1(x,y)
			self.召唤兽资源组[4]:更新1(x,y)
			self.召唤兽资源组[5]:更新1(x,y)
			self.召唤兽资源组[6]:更新1(x,y)
			if (keyaz(KEY.ALT) and keyax(KEY.Q)) then
				if 战斗类.宠物战斗快捷键法术~=nil and 战斗类.宠物战斗快捷键法术~=0 and self.参战单位~=nil and self.参战单位[self.单位编号[self.操作对象]]~=nil and self.参战单位[self.单位编号[self.操作对象]].主动技能~=nil then
					if self.参战单位[self.单位编号[self.操作对象]].主动技能[战斗类.宠物战斗快捷键法术]~=nil and self.参战单位[self.单位编号[self.操作对象]].主动技能[战斗类.宠物战斗快捷键法术].名称~=nil then
						战斗类.战斗指令:设置宠物法术参数(self.参战单位[self.单位编号[self.操作对象]].主动技能[战斗类.宠物战斗快捷键法术])
					else
						tp.常规提示:打开("#Y/设置快捷技能失败召唤兽没有这个技能!自动转为普通攻击...")
						self:设置指令1(0)
					end
				else
					tp.常规提示:打开("#Y/为设置快捷键技能!自动转为普通攻击...")
					self:设置指令1(0)
				end
			elseif (keyaz(KEY.ALT) and keytq(KEY.A)) then
				self.命令类型="攻击"
				self:设置指令1(0)
			elseif (self.召唤兽资源组[5]:事件判断() and go) or (keyaz(KEY.ALT) and keyax(KEY.T)) then --保护
				self.命令版面=false
				self.命令类型="保护"
				tp.鼠标.置鼠标("保护")
				js=1
			elseif (self.召唤兽资源组[2]:事件判断() and go) or (keyaz(KEY.ALT) and keytq(KEY.W)) then --法术
				tp.鼠标.置鼠标("普通")
				self.法术界面:打开(self.参战单位[self.单位编号[self.操作对象]].主动技能,"法术","宠物")
			elseif (self.召唤兽资源组[3]:事件判断() and go) or (keyaz(KEY.ALT) and keyax(KEY.E)) then --道具
				发送数据(5504,{类型="召唤兽"})--,{玩家id=self.单位id[self.操作对象]}
			elseif (self.召唤兽资源组[4]:事件判断() and go) or (keyaz(KEY.ALT) and keyax(KEY.D)) then --防御
				self.命令类型="防御"
				self:设置指令1(0)
			elseif (self.召唤兽资源组[6]:事件判断() and go) then --逃跑
				self:设置逃跑()
			end
		end
	end
	if 引擎.鼠标弹起(右键) then
		if self.命令类型=="保护" or self.命令类型=="捕捉" or self.命令类型=="法术" or self.命令类型=="道具" or self.命令类型=="单挑召唤" then
			self.命令版面=true
		    self.单挑召唤=nil
		end
		tp.鼠标.置鼠标("普通")
	end
	-- if not self.道具栏.可视  and  not self.灵宝栏.可视 and go then --and not 战斗类.自动栏.鼠标
	-- 	if js~=0 then
	-- 		js=js-0.5
	--     else
	--     	self:选择单位(x,y)
	-- 	end
	-- end

	if not self.道具栏.可视  and  not self.灵宝栏.可视 and go and not 战斗类.助战窗体选中 then --and not 战斗类.自动栏.鼠标
		if js~=0 then
			js=js-0.5
		else
			self:选择单位(x,y)
		end
	end

end

function 战斗命令类:重置高亮(x,y)
	local 单位选中=0
	for n=1,#self.参战单位 do
		if self.参战单位[n].高亮显示 then
			self.参战单位[n]:取消高亮()
			self.参战单位[n].高亮显示=nil
		end
	end
	tp.鼠标.置鼠标("普通")
end

function 战斗命令类:取类型选择(敌我)
	if self.命令类型=="法术" or self.命令类型=="道具" or self.命令类型=="灵宝" then
		if 敌我==2 and  (self.命令附加==4 or self.命令附加==99 ) then
			return true
		elseif 敌我==1 and (self.命令附加==5 or self.命令附加==6 or self.命令附加==3 or self.命令附加==99) then
			return true
		end
	elseif self.命令类型=="攻击" or self.命令类型=="捕捉"  then
		if 敌我==2 then
			return true
		end
	end
	return false
end

function 战斗命令类:界面重叠(x,y)
	if self.法术开关 and self.法术界面:检查点() then
		return true
	end
	return false
end

function 战斗命令类:选择单位(x,y)
	-- local 单位选中=0
	for i=1,#战斗类.敌方头像组 do
		if 战斗类.敌方头像组[i]:是否选中(x,y) and self.法术开关==false and self.召唤开关==false and self.道具开关==false then
			local 允许选择=self:取类型选择(战斗类.敌方头像组[i].敌我)
			if self.命令类型=="攻击" and 允许选择 then
				tp.鼠标.置鼠标("攻击")
			end
			if 允许选择 and 引擎.鼠标弹起(左键) then
				self:设置指令(战斗类.敌方头像组[i].num)
			end
		end
	end
	for i=1,#战斗类.我方头像组 do
		if 战斗类.我方头像组[i]:是否选中(x,y) and self.法术开关==false and self.召唤开关==false and self.道具开关==false then
			local 允许选择=self:取类型选择(战斗类.我方头像组[i].敌我)
			if self.命令类型=="攻击" and 允许选择 then
				tp.鼠标.置鼠标("攻击")
			end
			if 允许选择 and 引擎.鼠标弹起(左键) then
				self:设置指令(战斗类.我方头像组[i].num)
			end
		end
	end
	for n=#self.参战单位,1,-1 do
		if self.参战单位[n]:是否选中(x,y) and self.参战单位[n].不可操作==nil and self:界面重叠()==false and self.法术开关==false and self.召唤开关==false and self.道具开关==false and self.灵宝栏.可视 == false  then--and self:取类型选择(self.参战单位[n].敌我)
			-- 单位选中=n
			self.参战单位[n]:置高亮()
			self.参战单位[n].高亮显示=true
			-- 战斗类.提示=self.参战单位[n].名称
			local 允许选择=false
			-- if self.召唤兽资源组[5]:是否选中(x,y) then
			-- 	self.测试=self.测试+1
			-- end
			if self.命令类型=="攻击" and (self.参战单位[n].敌我==2 or keyaz(KEY.CTRL)) and self:取类型选择(self.参战单位[n].敌我) then
				tp.鼠标.置鼠标("攻击")
				允许选择=true
			elseif self.命令类型=="保护" and self.参战单位[n].敌我==1 and n~=self.操作对象 then
				允许选择=true
			elseif self.命令类型=="法术" and self.参战单位[n].敌我==2 and self:取类型选择(self.参战单位[n].敌我) and (self.法术名称 == "后发制人" or not self:增益技能(self.法术名称) ) and not self:恢复技能(self.法术名称) and (self:减益技能(self.法术名称) or self:封印技能(self.法术名称) or self:法攻技能(self.法术名称) or self:物攻技能(self.法术名称) or self.法术名称 == "后发制人" or self.法术名称 == "偷龙转凤" or self.法术名称 == "妙手空空" or self.法术名称 == "观照万象" ) then--敌方
				允许选择=true
			elseif self.命令类型=="法术" and self.参战单位[n].敌我==1 and (self:增益技能(self.法术名称) or self:恢复技能(self.法术名称) or self.法术名称 == "偷龙转凤") and not self:减益技能(self.法术名称) and not self:封印技能(self.法术名称) and not self:法攻技能(self.法术名称) and not self:物攻技能(self.法术名称) then--友方
				允许选择=true
			elseif self.命令类型=="道具" and self:取类型选择(self.参战单位[n].敌我) then
				允许选择=true
			elseif self.命令类型=="灵宝" and self:取类型选择(self.参战单位[n].敌我) then
				允许选择=true
			elseif self.参战单位[n].敌我==2 and self.命令类型=="捕捉"  and n~=self.操作对象 and self:取类型选择(self.参战单位[n].敌我) then
				允许选择=true
			end
			if 允许选择 and 引擎.鼠标弹起(左键) then
				self:设置指令(n)
			elseif keyaz(KEY.CTRL) and 引擎.鼠标弹起(左键) then
				self.命令类型="攻击"
				self.命令附加= "友伤"
				self:设置指令(n)
			end
		elseif self.参战单位[n].高亮显示 then
			self.参战单位[n]:取消高亮()
			self.参战单位[n].高亮显示=nil
		end
	end
	-- if 单位选中==0 then end  -- 战斗类.提示=nil --这里可以搞状态显示判断
	if self.命令类型=="攻击" and 单位选中==0 then
		tp.鼠标.置鼠标("普通")
	end
end

function 战斗命令类:恢复技能(名称)
	return skill恢复[名称]
end

function 战斗命令类:法攻技能(名称)
	return skill法攻[名称]
end

function 战斗命令类:物攻技能(名称)
	return skill物攻[名称]
end

function 战斗命令类:封印技能(名称)
	return skill封印[名称]
end

function 战斗命令类:减益技能(名称)
	return skill减益[名称]
end

function 战斗命令类:增益技能(名称)
	return skill增益[名称]
end


function 战斗命令类:结束()
	tp.鼠标.置鼠标("普通")
end

function 战斗命令类:单挑显示(dt,x,y,类型)
	if self.命令版面 then
	if self.参战单位[self.单位编号[self.操作对象]].单位类型 == "bb" then
			local bh = self.单位编号[self.操作对象]
			self.单挑圈圈[self.参战单位[bh].排序位置]:更新(dt)
		    self.单挑圈圈[self.参战单位[bh].排序位置]:显示(战斗类.阵型位置.单挑.我方[self.参战单位[bh].排序位置].x-180+(全局游戏宽度/2-400),战斗类.阵型位置.单挑.我方[self.参战单位[bh].排序位置].y-25+(全局游戏高度/2-300))
		end
		if self.单挑召唤 then
		    for i=2,5 do
				self.单挑圈圈[i]:更新(dt)
	    	    self.单挑圈圈[i]:显示(战斗类.阵型位置.单挑.我方[i].x-180+(全局游戏宽度/2-400),战斗类.阵型位置.单挑.我方[i].y-25+(全局游戏高度/2-300))
	    	    if self.单挑圈圈[i]:是否选中(x,y) then
	    	        tp.提示:自定义(x,y,"#Y选择召唤位置")
	    	        if mouse(0) then
	    	            self.召唤位置=i
	    	            发送数据(5505,{玩家id=self.单位id[self.操作对象]})
	    	            tp.鼠标.置鼠标("普通")
	    	            self.单挑召唤=nil
	    	        end
	    	    end
		    end
		end

	end
end

function 战斗命令类:显示(dt,x,y,类型)
	local x坐标,y坐标 = 13,self.y
	if self.命令版面 then
		-- self.操作标志:显示(self.参战单位[self.单位编号[self.操作对象]].显示xy.x+self.参战单位[self.单位编号[self.操作对象]].抖动数据.x,self.参战单位[self.单位编号[self.操作对象]].显示xy.y+self.参战单位[self.单位编号[self.操作对象]].抖动数据.y-self.参战单位[self.单位编号[self.操作对象]].高度/2)
		if self.参战单位[self.单位编号[self.操作对象]].单位类型 == "角色" then
			if self.参战单位[self.单位编号[self.操作对象]].门派 == "九黎城" and self.参战单位[self.单位编号[self.操作对象]].黎魂 ~= nil then
				if self.九黎多次[self.单位编号[self.操作对象]] == nil then
					序列 = 0
				else
					序列 = #self.九黎多次[self.单位编号[self.操作对象]]
				end
				local 序列 = self.参战单位[self.单位编号[self.操作对象]].黎魂 - 序列
				if 序列 > 0 then
					战斗类.法术次数图片[math.min(序列, 5)]:显示(self.x + x坐标 + 60, y坐标 +5)
				end
			end
			self.人物资源组[1]:显示(self.x+10,self.y,self.偏移x,self.偏移y)--,self.偏移x,self.偏移y
			self.人物资源组[2]:显示(self.x + 13,self.y + 4)
			self.人物资源组[3]:显示(self.x + 13,self.y + 4 + 24)
			self.人物资源组[4]:显示(self.x + 13,self.y + 4 + 24 * 2)
			self.人物资源组[5]:显示(self.x + 13,self.y + 4 + 24 * 3)
			self.人物资源组[6]:显示(self.x + 13,self.y + 4 + 24 * 5)
			self.人物资源组[7]:显示(self.x + 13,self.y + 4 + 24 * 6)
			-- self.人物资源组[8]:显示(self.x + 13,self.y + 4 + 24 * 7)
			self.人物资源组[9]:显示(self.x + 13,self.y + 4 + 24 * 7)
			-- self.人物资源组[10]:显示(self.x + 13,self.y + 4 + 24 * 9)
			self.人物资源组[11]:显示(self.x + 13,self.y + 4 + 24 * 8)
			self.人物资源组[12]:显示(self.x + 13,self.y + 4 + 24 * 9)
			self.人物资源组[13]:显示(self.x + 13,self.y + 4 + 24 * 10)
			self.人物资源组[14]:显示(self.x - 53 ,self.y + 8 + 24 *2)
		else
			if 战斗类.单挑模式 then
				local bh = self.单位编号[self.操作对象]
				self.召唤兽资源组[1]:显示(战斗类.阵型位置.单挑.我方[self.参战单位[bh].排序位置].x-160+(全局游戏宽度/2-400),战斗类.阵型位置.单挑.我方[self.参战单位[bh].排序位置].y-80+(全局游戏高度/2-300))
				self.召唤兽资源组[2]:显示(战斗类.阵型位置.单挑.我方[self.参战单位[bh].排序位置].x-157+(全局游戏宽度/2-400),战斗类.阵型位置.单挑.我方[self.参战单位[bh].排序位置].y-76+(全局游戏高度/2-300))
				self.召唤兽资源组[3]:显示(战斗类.阵型位置.单挑.我方[self.参战单位[bh].排序位置].x-157+(全局游戏宽度/2-400),战斗类.阵型位置.单挑.我方[self.参战单位[bh].排序位置].y-76+(全局游戏高度/2-300)+ 24)
				self.召唤兽资源组[4]:显示(战斗类.阵型位置.单挑.我方[self.参战单位[bh].排序位置].x-157+(全局游戏宽度/2-400),战斗类.阵型位置.单挑.我方[self.参战单位[bh].排序位置].y-76+(全局游戏高度/2-300)+ 24*2)
				self.召唤兽资源组[5]:显示(战斗类.阵型位置.单挑.我方[self.参战单位[bh].排序位置].x-157+(全局游戏宽度/2-400),战斗类.阵型位置.单挑.我方[self.参战单位[bh].排序位置].y-76+(全局游戏高度/2-300)+ 24*3)
				self.召唤兽资源组[6]:显示(战斗类.阵型位置.单挑.我方[self.参战单位[bh].排序位置].x-157+(全局游戏宽度/2-400),战斗类.阵型位置.单挑.我方[self.参战单位[bh].排序位置].y-76+(全局游戏高度/2-300)+ 24*4)

			else
				self.召唤兽资源组[1]:显示(self.x+10,self.y)
				self.召唤兽资源组[2]:显示(self.x + 13,self.y + 4)
				self.召唤兽资源组[3]:显示(self.x + 13,self.y + 4 + 24)
				self.召唤兽资源组[4]:显示(self.x + 13,self.y + 4 + 24 * 2)
				self.召唤兽资源组[5]:显示(self.x + 13,self.y + 4 + 24 * 3)
				self.召唤兽资源组[6]:显示(self.x + 13,self.y + 4 + 24 * 4)
				------------------------超级敏捷
                if self.参战单位[self.单位编号[self.操作对象]].超级敏捷==1 and self.参战单位[self.单位编号[self.操作对象]].单位类型=="bb" then
                	self.提示字体:显示(全局游戏宽度-82,self.y -1,"1")
                elseif self.参战单位[self.单位编号[self.操作对象]].超敏记录==true and self.参战单位[self.单位编号[self.操作对象]].单位类型=="bb" then
                	self.提示字体:显示(全局游戏宽度-82,self.y -1,"2")
                end
                ------------------------
			end
		end
		if self.法术开关 then
			self.法术界面:显示(dt,x,y)
		end
		-- if self.单挑召唤 then
		--     for i=2,5 do
		-- 		self.单挑圈圈[i]:更新(dt)
	 --    	    self.单挑圈圈[i]:显示(战斗类.阵型位置.单挑.我方[i].x-69,战斗类.阵型位置.单挑.我方[i].y+58)
	 --    	    if self.单挑圈圈[i]:是否选中(x,y) then
	 --    	        tp.提示:自定义(x,y,"#Y选择召唤位置")
	 --    	        if mouse(0) then
	 --    	            self.召唤位置=i
	 --    	            发送数据(5505,{玩家id=self.单位id[self.操作对象]})
	 --    	            tp.鼠标.置鼠标("普通")
	 --    	            self.单挑召唤=nil
	 --    	        end
	 --    	    end
		--     end
		-- end
		if self.召唤开关 then
			self.召唤界面:更新(dt,x,y)
			self.召唤界面:显示(dt,x,y)
		end
		if self.道具栏.可视 then
			self.道具栏:显示(dt,x,y)
		end
		if self.灵宝栏.可视 then
			self.灵宝栏:显示(dt,x,y)
		end
	end

end

return 战斗命令类

-- function 战斗命令类:更新(dt,x,y,类型)
-- 	if self.道具栏.可视  then
-- 		self.道具栏:更新(dt,x,y)
-- 		return
-- 	end
-- 	if self.灵宝栏.可视  then
-- 		self.灵宝栏:更新(dt,x,y)
-- 		return
-- 	end

-- 	local js=0

-- 	if self.命令版面 then
-- 		-- self.操作标志:更新(x,y)
-- 		if self.参战单位[self.单位编号[self.操作对象]].单位类型 == "角色" then-------------------人物命令
-- 			self.人物资源组[2]:更新1(x,y)
-- 			self.人物资源组[3]:更新1(x,y)
-- 			self.人物资源组[4]:更新1(x,y)
-- 			self.人物资源组[5]:更新1(x,y)
-- 			self.人物资源组[6]:更新1(x,y)
-- 			self.人物资源组[7]:更新1(x,y)
-- 			-- self.人物资源组[8]:更新1(x,y)
-- 			self.人物资源组[9]:更新1(x,y)
-- 			-- self.人物资源组[10]:更新1(x,y)
-- 			self.人物资源组[11]:更新1(x,y)
-- 			self.人物资源组[12]:更新1(x,y)
-- 			self.人物资源组[13]:更新1(x,y)
-- 			self.人物资源组[14]:更新1(x,y)
-- 			if (keyaz(KEY.ALT) and keyax(KEY.Q)) then
-- 				if 战斗类.战斗快捷键法术~=nil then
-- 					if self.参战单位[self.单位编号[self.操作对象]].主动技能[战斗类.战斗快捷键法术] ~=nil and self.参战单位[self.单位编号[self.操作对象]].主动技能[战斗类.战斗快捷键法术].名称 then
-- 						战斗类.战斗指令:设置法术参数(self.参战单位[self.单位编号[self.操作对象]].主动技能[战斗类.战斗快捷键法术])
-- 					else
-- 						tp.常规提示:打开("#Y/设置快捷技能失败你没有这个技能!自动转为普通攻击...")
-- 						self:设置指令1(0)
-- 					end
-- 				else
-- 					tp.常规提示:打开("#Y/为设置快捷键技能!自动转为普通攻击...")
-- 					self:设置指令1(0)
-- 				end
-- 			elseif (keyaz(KEY.ALT) and keytq(KEY.A)) then
-- 				self.命令类型="攻击"
-- 				self:设置指令1(0)
-- 			elseif self.人物资源组[7]:事件判断() or (keyaz(KEY.ALT) and keyax(KEY.T)) then --保护
-- 				self.命令版面=false
-- 				self.命令类型="保护"
-- 				tp.鼠标.置鼠标("保护")
-- 			elseif self.人物资源组[2]:事件判断() or (keyaz(KEY.ALT) and keytq(KEY.W)) then --法术
-- 				self.法术界面:打开(self.参战单位[self.单位编号[self.操作对象]].主动技能,"法术","人物",self.参战单位[self.单位编号[self.操作对象]].追加法术)
-- 				tp.鼠标.置鼠标("普通")
-- 			elseif self.人物资源组[4]:事件判断() then --特技
-- 				tp.鼠标.置鼠标("普通")
-- 				self.法术界面:打开(self.参战单位[self.单位编号[self.操作对象]].特技技能,"特技","人物")
-- 			elseif self.人物资源组[3]:事件判断() then --法宝
-- 				发送数据(5508,{玩家id=self.单位id[self.操作对象]})
-- 			elseif self.人物资源组[5]:事件判断() or (keyaz(KEY.ALT) and keyax(KEY.E)) then --道具
-- 				发送数据(5504)--,{玩家id=self.单位id[self.操作对象]}
-- 			elseif self.人物资源组[6]:事件判断() or (keyaz(KEY.ALT) and keyax(KEY.D)) then --防御
-- 				self.命令类型="防御"
-- 				self:设置指令1(0)
-- 			elseif self.人物资源组[9]:事件判断() then --召唤按钮
-- 				if 战斗类.单挑模式 then
-- 				    self.命令类型="单挑召唤"
-- 				    tp.鼠标.置鼠标("道具")
-- 				    self.单挑召唤=true
-- 				else
-- 					if self.召唤界面.可视 then
-- 						self.召唤界面:打开(tp.队伍[1])
-- 					else
-- 						发送数据(5505,{玩家id=self.单位id[self.操作对象]})
-- 					end
-- 				end

-- 			elseif self.人物资源组[11]:事件判断() then --自动
-- 				if 战斗类.自动开关 then
-- 					战斗类.自动开关=false
-- 				else
-- 					战斗类.自动开关=true
-- 				end
-- 			elseif self.人物资源组[12]:事件判断() then --捕捉
-- 				self:设置捕捉()
-- 			elseif self.人物资源组[13]:事件判断() then --逃跑
-- 				self:设置逃跑()
-- 			elseif self.人物资源组[14]:事件判断() then --灵宝
-- 				发送数据(5519,{玩家id=self.单位id[self.操作对象]})
-- 			elseif (keyaz(KEY.ALT) and keyax(KEY.G)) then
-- 				self:设置捕捉(法术)
-- 			end

-- 		else---------------------------召唤兽命令
-- 			self.召唤兽资源组[2]:更新1(x,y)
-- 			self.召唤兽资源组[3]:更新1(x,y)
-- 			self.召唤兽资源组[4]:更新1(x,y)
-- 			self.召唤兽资源组[5]:更新1(x,y)
-- 			self.召唤兽资源组[6]:更新1(x,y)

-- 			if (keyaz(KEY.ALT) and keyax(KEY.Q)) then
-- 				if 战斗类.宠物战斗快捷键法术~=nil and 战斗类.宠物战斗快捷键法术~=0 and self.参战单位~=nil and self.参战单位[self.单位编号[self.操作对象]]~=nil and self.参战单位[self.单位编号[self.操作对象]].主动技能~=nil then
-- 					if self.参战单位[self.单位编号[self.操作对象]].主动技能[战斗类.宠物战斗快捷键法术]~=nil and self.参战单位[self.单位编号[self.操作对象]].主动技能[战斗类.宠物战斗快捷键法术].名称~=nil then
-- 						战斗类.战斗指令:设置宠物法术参数(self.参战单位[self.单位编号[self.操作对象]].主动技能[战斗类.宠物战斗快捷键法术])
-- 					else
-- 						tp.常规提示:打开("#Y/设置快捷技能失败召唤兽没有这个技能!自动转为普通攻击...")
-- 						self:设置指令1(0)
-- 					end
-- 				else
-- 					tp.常规提示:打开("#Y/为设置快捷键技能!自动转为普通攻击...")
-- 					self:设置指令1(0)
-- 				end
-- 			elseif (keyaz(KEY.ALT) and keytq(KEY.A)) then
-- 				self.命令类型="攻击"
-- 				self:设置指令1(0)
-- 			elseif self.召唤兽资源组[5]:事件判断() or (keyaz(KEY.ALT) and keyax(KEY.T)) then --保护
-- 				self.命令版面=false
-- 				self.命令类型="保护"
-- 				tp.鼠标.置鼠标("保护")
-- 				js=1
-- 			elseif self.召唤兽资源组[2]:事件判断() or (keyaz(KEY.ALT) and keytq(KEY.W)) then --法术
-- 				tp.鼠标.置鼠标("普通")
-- 				self.法术界面:打开(self.参战单位[self.单位编号[self.操作对象]].主动技能,"法术","宠物")
-- 			elseif self.召唤兽资源组[3]:事件判断() or (keyaz(KEY.ALT) and keyax(KEY.E)) then --道具
-- 				发送数据(5504)--,{玩家id=self.单位id[self.操作对象]}
-- 			elseif self.召唤兽资源组[4]:事件判断() or (keyaz(KEY.ALT) and keyax(KEY.D)) then --防御
-- 				self.命令类型="防御"
-- 				self:设置指令1(0)
-- 			elseif self.召唤兽资源组[6]:事件判断() then --逃跑
-- 				self:设置逃跑()
-- 			end
-- 		end
-- 	end
-- 	if 引擎.鼠标弹起(右键) then
-- 		if self.命令类型=="保护" or self.命令类型=="捕捉" or self.命令类型=="法术" or self.命令类型=="道具" or self.命令类型=="单挑召唤" then
-- 			self.命令版面=true
-- 		    self.单挑召唤=nil
-- 		end
-- 		tp.鼠标.置鼠标("普通")
-- 	end

-- 	if not self.道具栏.可视  and  not self.灵宝栏.可视  then
-- 		if js~=0 then
-- 			js=js-0.5
-- 	    else
-- 	    	self:选择单位(x,y)
-- 		end
-- 	end
-- end