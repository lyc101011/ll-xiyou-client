-- @Author: baidwwy
-- @Date:   2023-12-11 06:58:28
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-09-12 09:37:03
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2023-09-26 21:38:14
--======================================================================--
local 系统类_队伍格子_剑会 = class()
local bw = require("gge包围盒")
local zts
local qms = 引擎.取模型
local mouseb = 引擎.鼠标弹起
local zqj = 引擎.坐骑库

function 系统类_队伍格子_剑会:初始化(x,y,ID,根)
	self.x = x
	self.y = y+1
	self.ID = ID
	self.物品 = nil
	self.模型 = nil
	self.事件 = false
	self.焦点 = false
	self.禁止 = false
	self.包围盒  = bw(x,y,116,141)
end

function 系统类_队伍格子_剑会:置人物(人物)

	if 人物 ~= nil then

		zts = 引擎.场景.字体表.普通字体
		if 人物~= nil and 人物.名称 ~= nil and 人物.名称 ~= 0 then
			self.武器 = nil
			self.坐骑 = nil
			self.坐骑饰品 = nil
			self.临时方向=4
			local n = qms(人物.模型)
			if 人物.变身数据  and 变身显示 then
          		n = qms(人物.变身数据)
     			self.临时方向=0
 			elseif 人物.锦衣[1] then
 				local wq
				if 人物.装备 ~= nil then
					wq = 人物.装备.子类
				end
 				n = 引擎.取普通锦衣模型(人物.锦衣[1],人物.模型,nil,wq)
 				self.模型 = 引擎.场景.资源:载入(n[3],"网易WDF动画",n[1])
			end
			self.模型 = 引擎.场景.资源:载入(n[3],"网易WDF动画",n[1])
			if  not 人物.变身数据 then
				if 人物.坐骑 ~= nil and 可骑乘坐骑(人物.模型,人物.坐骑.模型) then
					self.临时方向=1
					local 资源组 = zqj(人物.模型,人物.坐骑.模型,人物.坐骑.饰品 or "空",人物.坐骑.饰品2 or "空")
					self.模型 = 引擎.场景.资源:载入(资源组.人物资源,"网易WDF动画",资源组.人物站立)
					self.坐骑 = 引擎.场景.资源:载入(资源组.坐骑资源,"网易WDF动画",资源组.坐骑站立)
					if 资源组.坐骑饰品站立 ~= nil then
						self.坐骑饰品 = 引擎.场景.资源:载入(资源组.坐骑饰品资源,"网易WDF动画",资源组.坐骑饰品站立)
						self.坐骑饰品:置方向(self.临时方向)
					end
					if 人物.坐骑.炫彩 ~= nil then
						self.坐骑:炫彩染色(人物.坐骑.炫彩,人物.坐骑.炫彩组)
					end
					self.坐骑:置方向(self.临时方向)
				elseif 人物.装备 ~= nil then
					n = qms(人物.模型,引擎.场景:取武器子类(人物.装备.子类))
					if 人物.锦衣[1] ~= nil then
						local wq = nil
						if 人物.装备 ~= nil then
							wq = 人物.装备.子类
						end
						n=引擎.取普通锦衣模型(人物.锦衣[1],人物.模型,nil,wq)
					end

					--if 人物.锦衣[1] == nil then
						-- self.模型 = 引擎.场景.资源:载入(n[3],"网易WDF动画",n[1])
					--end
					local m = 引擎.场景:取武器附加名称(人物.装备.子类,人物.装备.级别限制,人物.装备.名称)
					local n = qms(m.."_"..人物.模型)
					self.武器 = 引擎.场景.资源:载入(n[3],"网易WDF动画",n[1])
					self.武器:置方向(self.临时方向)
					self.武器:置差异(self.武器.帧数-self.模型.帧数)
				end
				if 人物.炫彩 ~= nil and 人物.锦衣[1] == nil then
					self.模型:炫彩染色(人物.炫彩,人物.炫彩组)
				else
					if 人物.染色方案 ~= nil and 人物.染色组 and 人物.锦衣[1] == nil then
						self.模型:置染色(人物.染色方案,人物.染色组[1],人物.染色组[2],人物.染色组[3])
					end
				end
			end
			self.模型:置方向(self.临时方向)
			self.人物 = 人物
		end
	else
	    	self.模型 = nil
		self.人物 = nil
	end
end

function 系统类_队伍格子_剑会:显示(dt,x,y,条件,数据,x1,y1)
	self.事件 = false
	self.焦点 = false
	--if self.人物==nil then return 0 end
	if self.模型 ~= nil and self.人物 ~= nil then
		if self.坐骑 ~= nil then
			self.坐骑:更新(dt)
			if self.坐骑饰品 ~= nil then
				self.坐骑饰品:更新(dt)
			end
		end
		if self.武器 ~= nil then
			self.武器:更新(dt)
		end
		self.模型:更新(dt)
	end
	if 条件 and self.包围盒:检查点(x,y) and not 引擎.场景.消息栏焦点 then
		引擎.场景.按钮焦点 = true
		引擎.场景.禁止关闭 = true
		self.焦点 = true
		if self.模型 ~= nil and self.人物 ~= nil then
			if mouseb(0) then
				self.事件 = true
			end
		end
		if not self.禁止 then
			if self.模型 ~= nil then
				self.模型:置高亮()
			end
			-- 引擎.场景.队伍格子焦点_:显示(self.x,self.y)
		end
	else
		if self.模型 ~= nil then
		    self.模型:取消高亮()
		end
	end
	if self.禁止 then
		引擎.场景.火苗:显示(self.x,self.y)
		-- 引擎.场景.队伍格子确定_:显示(self.x,self.y)
	end
	local 人物 = 数据[self.ID]
	if 人物 ~= nil then
		zts:置颜色(-16777216)
		zts:显示(self.x + 18+(x1 or 0),self.y + 152+(y1 or 0),人物.名称)
		zts:显示(self.x + 18+(x1 or 0),self.y + 176+(y1 or 0),人物.门派)
		zts:显示(self.x + 18+(x1 or 0),self.y + 200+(y1 or 0),人物.等级.."级")
	end
	if self.模型 ~= nil and 人物 ~= nil then
		引擎.场景.影子:显示(self.x + 54,self.y + 117)
		if self.坐骑 ~= nil then
			self.坐骑:显示(self.x + 54,self.y + 117)
			if self.坐骑饰品 ~= nil then
				self.坐骑饰品:显示(self.x + 54,self.y + 117)
			end
		end
		self.模型:显示(self.x + 54,self.y + 117)
		if self.武器 ~= nil then
			self.武器:显示(self.x + 54,self.y + 117)
		end
	end
end

function 系统类_队伍格子_剑会:释放()

end

function 系统类_队伍格子_剑会:置坐标(x,y)
	self.x = x
	self.y = y
	self.包围盒:置坐标(x,y)
end

return 系统类_队伍格子_剑会