-- @Author: baidwwy
-- @Date:   2024-04-03 22:06:52
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-07 06:50:47
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2024-04-08 23:31:05
--======================================================================--
local 系统类_技能格子 = class()
local mouse = 引擎.鼠标弹起

function 系统类_技能格子:初始化(x,y,ID,注释)
	self.x = x
	self.y = y
	self.注释 = 注释
	self.技能 = nil
	self.事件 = false
	self.焦点 = false
end

function 系统类_技能格子:置技能(技能,类型,灰色)
	if 技能 ~= nil and 技能.名称 ~= nil then
		self.技能 = 技能
		self.剩余冷却回合 = 技能.剩余冷却回合
		local 临时技能
		if 类型 then
			临时技能=引擎.取技能(技能.名称,类型)
		else
			临时技能=引擎.取技能(技能.名称,技能.门派)
		end

		if #临时技能~=0 then
			self.技能.类型=临时技能[3]
			if 临时技能[10]  then
				self.技能.图片=1
				self.技能.模型 = 引擎.场景.资源:载入("pic/"..技能.名称..".png","图片")
				--self.技能.模型 = 引擎.场景.资源:载入(临时技能[6],"网易WDF动画",临时技能[7])
				self.技能.小模型 =  引擎.场景.资源:载入("pic/"..技能.名称..".png","图片")
			else
				self.技能.模型 = 引擎.场景.资源:载入(临时技能[6],"网易WDF动画",临时技能[7])
				self.技能.小模型 = 引擎.场景.资源:载入(临时技能[6],"网易WDF动画",临时技能[8])
			end
			-- self.技能.模型 = 引擎.场景.资源:载入(临时技能[6],"网易WDF动画",临时技能[7])
			-- self.技能.小模型 = 引擎.场景.资源:载入(临时技能[6],"网易WDF动画",临时技能[8])

			tsjn = string.find(self.技能.名称,"特色")
			if tsjn then
				self.技能.模型:置染色(1,ARGB(255,255,255,255))
			end

			self.技能.介绍=临时技能[1]
			self.技能.消耗说明=临时技能[4]
			self.技能.使用条件=临时技能[5]
			self.技能.冷却=临时技能[12]
			if 灰色 then
			    self.技能.灰色模型 = 引擎.场景.资源:载入(临时技能[6],"网易WDF动画",临时技能[7])
			    self.技能.灰色模型:灰度级()
			end



		end

		-- if 大模型 == nil then
		-- 	self.技能.模型 = 引擎.场景.资源:载入(技能.资源,"网易WDF动画",技能.大模型资源)
		-- end
		-- if 小模型 == nil and 技能.小模型 ~= nil then
		-- 	self.技能.小模型 = 引擎.场景.资源:载入(技能.资源,"网易WDF动画",技能.小模型资源)
		-- end
	else
		self.技能 = nil
	end
end

function 系统类_技能格子:置经脉(流派,技能)
	if 技能 ~= nil and 技能.名称 ~= nil then
		self.技能 = 技能
		self.剩余冷却回合 = 技能.剩余冷却回合
		local 临时技能=引擎.取经脉(流派,技能.名称)

		if #临时技能~=0 then
			self.技能.类型=临时技能[3]
			self.技能.图片=临时技能[10]
			if 临时技能[10]~=nil then
			    self.技能.模型 = 引擎.场景.资源:载入('wdf/audio/jmk/'..tp.队伍[1].门派.."/"..技能.名称..".jpg","图片")
				-- self.技能.小模型 = 引擎.场景.资源:载入(临时技能[6],"网易WDF动画",临时技能[8])
			else
				self.技能.模型 = 引擎.场景.资源:载入(临时技能[6],"网易WDF动画",临时技能[7])
				-- self.技能.小模型 = 引擎.场景.资源:载入(临时技能[6],"网易WDF动画",临时技能[8])
			end
			self.技能.介绍=临时技能[1]
			self.技能.消耗说明=临时技能[4]
			self.技能.使用条件=临时技能[5]
			self.技能.冷却=临时技能[12]
		end

	else
		self.技能 = nil
	end

end

function 判断是否赐福技能(赐福技能组,原技能)
	if not 原技能 then
		return
	end
	local 技能名称=原技能.名称 or 原技能
	if 赐福技能组 then
		for k,v in pairs(赐福技能组) do
			if v==技能名称 then
				return 技能名称
			end
		end
	end
end


function 系统类_技能格子:显示(x,y,条件,xw,xy,类型,灰色)

	if self.技能 == nil then
		return
	end
	self.事件 = false
	self.焦点 = false
	if 灰色 then
	    if 条件 and self.技能.灰色模型:是否选中(x,y) then
			引擎.场景.按钮焦点 = true
			引擎.场景.禁止关闭 = true
			self.焦点 = true
			self.技能.灰色模型:置高亮()
			if mouse(0) then
				self.事件 = true
			end
		else
			self.技能.灰色模型:取消高亮()
		end
		if 类型 == "小" and self.技能.小模型 ~= nil  then
			self.技能.小模型:显示(self.x,self.y,xw,xy)
		else
			self.技能.灰色模型:显示(self.x,self.y,xw,xy)
		end
	else
		if self.技能.模型==nil or self.技能.模型==0 then
				table.print(self.技能)
				print("搜我寻找------------------------------------------------------------------------")
		end
		if 条件 and self.技能.模型:是否选中(x,y) then
			引擎.场景.按钮焦点 = true
			引擎.场景.禁止关闭 = true
			self.焦点 = true
			if self.技能.图片~=nil then
				self.技能.模型:置混合(1):置颜色(-13158601)
			else
				self.技能.模型:置高亮()
			end
			if mouse(0) then
				self.事件 = true
			end
		else
			if self.技能.图片~=nil then
				self.技能.模型:置混合(0):置颜色(4294967295)
			else
				self.技能.模型:取消高亮()
			end
		end
		if 类型 == "小" and self.技能.小模型 ~= nil  then
			self.技能.小模型:显示(self.x,self.y,xw,xy)
		else
		    self.技能.模型:显示(self.x,self.y,xw,xy)
		end
	end

	if self.剩余冷却回合 ~= nil then
		local 序列=self.剩余冷却回合+1
		self.技能.模型:灰度级()
		if 序列<=10 and self.技能.如意神通==nil then
		    战斗类.法宝图片[序列]:显示(self.x+12,self.y+12)
		end

	end
end

function 系统类_技能格子:置坐标(x,y)
	self.x = x
	self.y = y
end

return 系统类_技能格子