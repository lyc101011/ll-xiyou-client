-- @Author: baidwwy
-- @Date:   2024-08-04 20:56:39
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-10-28 16:52:56
-- @Author: baidwwy
-- @Date:   2024-04-14 22:22:15
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-07-24 22:53:18
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2024-05-03 17:13:09
--======================================================================--
local 系统类_按钮 = class()

local zts1,zts2,ztszdy
local mouse = 引擎.鼠标按住
local mouses = 引擎.鼠标弹起
local yxs = require("Fmod类5")

local function 取偏移(w,h)
	if w == 55 and h == 28 then
		return 4,0
	elseif w == 78 and h == 34 then
		return 0,3
	elseif w == 78 and h == 22 then
		return 3,0
	elseif w == 31 and h == 31 then
		return -6,0
	elseif w == 37 and h == 26 then
		return -4,-1
	elseif w == 37 and h == 20 then
		return -4,-1
	elseif w == 43 and h == 27 then
		return 0,-1
	elseif w == 90 and h == 28 then
		return 8,0
	elseif w == 55 and h == 22 then
		return 5,0
	elseif w == 100 and h == 22 then
		return 13,0
	else
		return 0,0
	end
end

function 系统类_按钮:初始化(文件,宽度,高度,按钮数量,was,窗口按钮,按钮文字,可移动按钮)
	self.按钮 = 文件
	宽度 = 文件.宽度
	高度 = 文件.高度
	self.偏移x,self.偏移y = 取偏移(宽度,高度)
	self.焦点 = 0
	self.按钮数量 = 按钮数量
	self.按钮文字 = 按钮文字
	self.禁止 = false
	self.事件 = false
	self.按住 = false
	self.窗口按钮 = 窗口按钮
	self.文本栏按钮 = false
	self.连点开关=false
	self.连点计时=0
	if 可移动按钮 then
		self.确定按下 = false
	end
end
function 系统类_按钮:置偏移(x,y)
	self.偏移x = x
	self.偏移y = y
end

function 系统类_按钮:置根(根)
	tp = 根
	zts1 = tp.字体表.普通字体
	zts2 = tp.字体表.描边字体
	ztszdy = require("gge文字类")(wdf配置.."/font/simsun.ttc",16,true,true,true)
end
function 系统类_按钮:更新1(x,y,条件) --很有可能是这个

	self.事件 = false
	if (self.按钮:是否选中(x,y) or self.确定按下)  then
		self.焦点 = 1
		if 引擎.鼠标弹起(左键) then
			self.焦点=2
			self.事件=true
		end
	else
		self.焦点=0
	end
end

function 系统类_按钮:更新(x,y,条件,连点) --测试模式 修改战斗中显示窗口时更改

	self.事件 = false
	if (self.按钮:是否选中(x,y) or self.确定按下) and not 引擎.场景.第二窗口移动中 and not 引擎.场景.第一窗口移动中 then
		local ck
		if self.绑定窗口 ~= nil and ((not 引擎.场景.战斗中 and 引擎.场景.选中窗口 ~= 0 and 引擎.场景.窗口_[引擎.场景.选中窗口].ID == self.绑定窗口) or (引擎.场景.战斗中 and 引擎.场景.选中战斗窗口 and 引擎.场景.选中战斗窗口 ~= 0 and 引擎.场景.战斗窗口_[引擎.场景.选中战斗窗口].ID == self.绑定窗口)) then
		-- if self.绑定窗口 ~= nil and ((引擎.场景.选中窗口 ~= 0 and 引擎.场景.窗口_[引擎.场景.选中窗口].ID == self.绑定窗口) or (引擎.场景.选中战斗窗口 and 引擎.场景.选中战斗窗口 ~= 0 and 引擎.场景.战斗窗口_[引擎.场景.选中战斗窗口].ID == self.绑定窗口)) then --测试模式 修改战斗中显示窗口时更改
		-- if ((self.绑定窗口 ~= nil and ((引擎.场景.选中窗口 ~= 0 and 引擎.场景.窗口_[引擎.场景.选中窗口].ID == self.绑定窗口) ))) then--or (引擎.场景.场景.战斗.选中窗口 ~= 0 and 引擎.场景.场景.战斗.窗口_[引擎.场景.场景.战斗.选中窗口].ID == self.绑定窗口)
			引擎.场景.按钮焦点 = true
			ck = true
			if 引擎.场景.消息栏焦点 and not self.文本栏按钮 then
				ck = nil
			end
		end
		-- if ((self.绑定窗口 == nil and (not 引擎.场景.消息栏焦点 or  self.文本栏按钮)  and ((self.窗口按钮 and 引擎.场景.选中窗口 ~= 0) or (self.窗口按钮 == nil and 引擎.场景.选中窗口 == 0))) or ck)  then
		if (self.绑定窗口 == nil and (not 引擎.场景.消息栏焦点 or not self.文本栏按钮)  and ((self.窗口按钮 and 引擎.场景.选中窗口 ~= 0) or (self.窗口按钮 == nil and 引擎.场景.选中窗口 == 0) or (self.窗口按钮 == nil and 引擎.场景.选中战斗窗口 == 0))) or ck  then --测试模式 修改战斗中显示窗口时更改
		-- if ((self.绑定窗口 == nil and (not 引擎.场景.消息栏焦点 or not self.文本栏按钮)  and ((self.窗口按钮 and 引擎.场景.选中窗口 ~= 0) or (self.窗口按钮 == nil and 引擎.场景.选中窗口 == 0))) or ck)  then --测试模式，改的对话栏关闭按钮  self.文本栏按钮
			引擎.场景.按钮焦点 = true
			self.焦点 = 1
			if mouse(0) then--(引擎.在外部 == nil and self.外部按钮 == nil and mouse(0)) or (引擎.在外部 and self.外部按钮 and 引擎.外部.鼠标按住(0)) then
				self.焦点 = 2
				self.按住 = true
				if self.确定按下 ~= nil and not 引擎.场景.按下中 then
					self.确定按下 = true
					引擎.场景.按下中 = true
				end
			end

			if mouses(0) then--(引擎.在外部 == nil and self.外部按钮 == nil and mouses(0)) or (引擎.在外部 and self.外部按钮 and 引擎.外部.弹起事件) then
				if (条件 == nil or 条件) then
					self.焦点 = 0
					self.事件 = true
					引擎.场景:按钮mp()
					--引擎.场景:播放音效类("按钮" )
					-- 引擎.场景:按钮音效()
					if self.确定按下 ~= nil then
						self.确定按下 = false
						引擎.场景.按下中 = false
					end
					-- if self.外部按钮 then
					-- 	引擎.外部.弹起事件 = nil
					-- end
				elseif self.允许再次点击 then
					self.事件 = true
					if self.确定按下 ~= nil then
						self.确定按下 = false
						引擎.场景.按下中 = false
					end
					-- if self.外部按钮 then
					-- 	引擎.外部.弹起事件 = nil
					-- end
				end
			end
		end
	else
		if self.确定按下 ~= nil then
			self.确定按下 = false
			引擎.场景.按下中 = false
		end
		self.按住 = false
		self.焦点 = 0
	end
	if (条件 ~= nil and not 条件) then
		self.焦点 = 3
	end
	if 连点模式 then
		if self.连点开关==false then
			if self.焦点 == 2 then
				if self.连点计时==0 then
					self.连点计时=时间
				end
			end
			if 时间-self.连点计时>=2 then
				self.连点计时=0
				self.连点开关=true
				self.连点间隔=引擎.取游戏时间()+100
			end
		else
			if self.焦点 ~= 2 then
				self.连点开关=false
			elseif 时间>=self.连点间隔 and self.焦点==2 then
				self.连点间隔=引擎.取游戏时间()+100
				self.事件=true
			end
		end
	end
end

-- function 系统类_按钮:更新(x,y,条件,连点)
-- 	self.事件 = false
-- 	if (self.按钮:是否选中(x,y) or self.确定按下) and not 引擎.场景.第二窗口移动中 and not 引擎.场景.第一窗口移动中 then
-- 		local ck
-- 		if ((self.绑定窗口 ~= nil and ((引擎.场景.选中窗口 ~= 0 and 引擎.场景.窗口_[引擎.场景.选中窗口].ID == self.绑定窗口) ))) then--or (引擎.场景.场景.战斗.选中窗口 ~= 0 and 引擎.场景.场景.战斗.窗口_[引擎.场景.场景.战斗.选中窗口].ID == self.绑定窗口)
-- 			引擎.场景.按钮焦点 = true
-- 			ck = true
-- 			if 引擎.场景.消息栏焦点 and not self.文本栏按钮 then
-- 				ck = nil
-- 			end
-- 		end
-- 		-- if ((self.绑定窗口 == nil and (not 引擎.场景.消息栏焦点 or  self.文本栏按钮)  and ((self.窗口按钮 and 引擎.场景.选中窗口 ~= 0) or (self.窗口按钮 == nil and 引擎.场景.选中窗口 == 0))) or ck)  then
-- 		if ((self.绑定窗口 == nil and (not 引擎.场景.消息栏焦点 or not self.文本栏按钮)  and ((self.窗口按钮 and 引擎.场景.选中窗口 ~= 0) or (self.窗口按钮 == nil and 引擎.场景.选中窗口 == 0))) or ck)  then --测试模式，改的对话栏关闭按钮  self.文本栏按钮
-- 			引擎.场景.按钮焦点 = true
-- 			self.焦点 = 1
-- 			if (引擎.在外部 == nil and self.外部按钮 == nil and mouse(0)) or (引擎.在外部 and self.外部按钮 and 引擎.外部.鼠标按住(0)) then
-- 				self.焦点 = 2
-- 				self.按住 = true
-- 				if self.确定按下 ~= nil and not 引擎.场景.按下中 then
-- 					self.确定按下 = true
-- 					引擎.场景.按下中 = true
-- 				end
-- 			end
-- 			if (引擎.在外部 == nil and self.外部按钮 == nil and mouses(0)) or (引擎.在外部 and self.外部按钮 and 引擎.外部.弹起事件) then
-- 				if (条件 == nil or 条件) then
-- 					self.焦点 = 0
-- 					self.事件 = true
-- 					引擎.场景:播放音效类("按钮" )
-- 					if self.确定按下 ~= nil then
-- 						self.确定按下 = false
-- 						引擎.场景.按下中 = false
-- 					end
-- 					if self.外部按钮 then
-- 						引擎.外部.弹起事件 = nil
-- 					end
-- 				elseif self.允许再次点击 then
-- 					self.事件 = true
-- 					if self.确定按下 ~= nil then
-- 						self.确定按下 = false
-- 						引擎.场景.按下中 = false
-- 					end
-- 					if self.外部按钮 then
-- 						引擎.外部.弹起事件 = nil
-- 					end
-- 				end
-- 			end
-- 		end
-- 	else
-- 		if self.确定按下 ~= nil then
-- 			self.确定按下 = false
-- 			引擎.场景.按下中 = false
-- 		end
-- 		self.按住 = false
-- 		self.焦点 = 0
-- 	end
-- 	if (条件 ~= nil and not 条件) then
-- 		self.焦点 = 3
-- 	end
-- 	if 连点模式 then
-- 		if self.连点开关==false then
-- 			if self.焦点 == 2 then
-- 				if self.连点计时==0 then
-- 					self.连点计时=时间
-- 				end
-- 			end
-- 			if 时间-self.连点计时>=3 then
-- 				self.连点计时=0
-- 				self.连点开关=true
-- 				self.连点间隔=引擎.取游戏时间()+100
-- 			end
-- 		else
-- 			if self.焦点 ~= 2 then
-- 				self.连点开关=false
-- 			elseif 时间>=self.连点间隔 and self.焦点==2 then
-- 				self.连点间隔=引擎.取游戏时间()+100
-- 				self.事件=true
-- 			end
-- 		end
-- 	end
-- end
function 系统类_按钮:绑定窗口_(窗口ID)
	self.绑定窗口 = 窗口ID
end

function 系统类_按钮:文本栏按钮_(判断)
	self.文本栏按钮 = 判断
end

function 系统类_按钮:置文字(文字)
	self.按钮文字 = 文字
end
function 系统类_按钮:取文字()
	return self.按钮文字
end

function 系统类_按钮:置打勾框(v)
	--wzife.wdf 1007823716
	self.打勾框 = v
	-- if v then
		-- self:置文字("√")
	-- else
		-- self:置文字("")
	-- end
end

function 系统类_按钮:是否选中(x,y)
	return self.按钮:是否选中(x,y)
end

function 系统类_按钮:事件判断()
	return self.事件
end

function 系统类_按钮:置混合(b)
	self.按钮:置混合(b)
end

function 系统类_按钮:置颜色(v,i)
	self.按钮:置颜色(v,i)
end
function 系统类_按钮:置翻转(x,y,h)
	self.按钮:置翻转(x,y,h)
end
function 系统类_按钮:置高亮(v)
	 self.按钮:置颜色(ARGB(255,175,175,175))-- -13158601)
end
function 系统类_按钮:描边颜色(zys,mbys)
	ztszdy:置颜色(zys)
	ztszdy:置描边颜色(mbys)
end
function 系统类_按钮:取消高亮(v)
	self.按钮:置颜色(4294967295)
end

function 系统类_按钮:显示(x,y,mf,mb,col,xsdf,zdjd,ab,ac,ad,co)
	local fjx = 0
	local fjy = 0
	if xsdf then
		self.焦点 = zdjd
	end
	if self.按钮数量 == 1 then
		self.按钮.当前帧 = 0
		if self.焦点 == 2 then
			fjx = 1
			fjy = 1
		end
	else
		if self.焦点 == 0 then
			self.按钮.当前帧 = ab or 0
		elseif self.焦点 == 1 then
		 	self.按钮.当前帧 = ac or 2
		elseif self.焦点 == 2 then
		 	self.按钮.当前帧 = ad or 1
		 	fjx = 1
		 	fjy = 1
		elseif self.焦点 == 3 then
		 	self.按钮.当前帧 = ad or 3
		elseif self.焦点 == 4 then
		 	self.按钮.当前帧 = ad or 4
		elseif self.焦点 == 5 then
		 	self.按钮.当前帧 = ad or 5
		end
	end
	self.按钮:更新纹理()
	if self.按钮数量 == 1 or self.按钮数量 == 2 then
		self.按钮:显示(x+fjx,y+fjy)
	else
		self.按钮:显示(x,y)
	end
	if self.按钮文字 ~= nil then
		-- if self.按钮文字=="道具" then
		-- end
		if mb == nil   and co==nil then
			zts1:置颜色(4294967295)
			zts1:显示(x+8+self.偏移x+fjx,y+3.5+self.偏移y+fjy,self.按钮文字)
		-- elseif mb == "自定义" then
		-- 	ztszdy:显示(x+8+self.偏移x+fjx,y+5+self.偏移y+fjy,self.按钮文字)
		elseif mb == "红色" then
			zts2:置颜色(0xFFFF0000)
			zts2:显示(x+8+self.偏移x+fjx,y+5+self.偏移y+fjy,self.按钮文字)
			zts2:置颜色(0xFFFFFFFF)
		elseif mb == "白色" then
			zts2:置颜色(0xFFFFFFFF)
			zts2:显示(x+8+self.偏移x+fjx,y+5+self.偏移y+fjy,self.按钮文字)
		elseif mb == "普通黑色" then
			zts1:置颜色(0xFF000000)
			zts1:显示(x+8+self.偏移x+fjx,y+5+self.偏移y+fjy,self.按钮文字)
		elseif co~=nil and co=="跳色" then
			if self.按钮.当前帧==3 then
			zts1:置颜色(0XFFFFFFFF)
			else
			zts1:置颜色(0XFF000000)
		    end
			zts1:显示(x+8+self.偏移x+fjx,y+4+self.偏移y+fjy,self.按钮文字)
		else --老按钮是这个
			zts2:显示(x+7+self.偏移x+fjx,y+1+self.偏移y+fjy,self.按钮文字)
		end
	end
end

return 系统类_按钮