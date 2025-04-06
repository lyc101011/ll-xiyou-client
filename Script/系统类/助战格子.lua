-- @Author: baidwwy
-- @Date:   2024-08-04 20:56:39
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-08-11 16:17:06
-- @Author: baidwwy
-- @Date:   2024-07-11 20:50:12
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-08-11 16:12:21
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2024-03-11 23:28:22
--======================================================================--
local zhuzhangezi = class()
local zts
local qms = 引擎.取模型
local mouseb = 引擎.鼠标弹起
local zqj = 引擎.坐骑库

function zhuzhangezi:初始化(x,y,ID,根)
	self.x = x
	self.y = y+1
	self.ID = ID
	self.物品 = nil
	self.模型 = nil
	self.事件 = false
	self.焦点 = false
	self.禁止 = false
end
function zhuzhangezi:判断一体坐骑(人物)
	if 人物.坐骑 and 人物.坐骑.模型 and 一体坐骑表[人物.坐骑.模型] then
			self:yitizuoqi(人物.模型,人物.坐骑.模型)
			return true
		end
end

function zhuzhangezi:yitizuoqi(角色,坐骑)
	self.模型 = tp.资源:载入("audio/1921.mp3","网易WDF动画",一体坐骑表[坐骑][角色].站)
	self.模型:置方向(4)

end
function zhuzhangezi:置人物(人物)
	if 人物 ~= nil then
		--zts = 引擎.场景.字体表.普通字体
		if 人物~= nil and 人物.名称 ~= nil and 人物.名称 ~= 0 then
			self.武器 = nil
			self.坐骑 = nil
			self.坐骑饰品 = nil
			self.变身=nil
			self.锦衣=nil
			self.临时方向=4
			local n = qms(人物.模型)
			if 人物.变身数据 then
				n = qms(人物.变身数据)
	     			self.临时方向=0
	     			self.变身=true
     			elseif self:判断一体坐骑(人物) then
				self.人物 = 人物
				return
 			elseif 人物.锦衣[1] then
 				local wq
				if 人物.装备 ~= nil then
					wq = 人物.装备.子类
				end
 				n = 引擎.取普通锦衣模型(人物.锦衣[1],人物.模型,nil,wq)
 				self.锦衣=人物.锦衣[1]
 				-- self.模型 = 引擎.场景.资源:载入(n[3],"网易WDF动画",n[1])
			end
			self.模型 = 引擎.场景.资源:载入(n[3],"网易WDF动画",n[1])
			if  not 人物.变身数据 then
				if 人物.坐骑 ~= nil and 可骑乘坐骑(人物.模型,人物.坐骑.模型) then
					self.临时方向=4
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
					self.装备=人物.装备
					if 人物.锦衣[1] ~= nil then
						local wq = nil
						if 人物.装备 ~= nil then
							wq = 人物.装备.子类
						end
						n=引擎.取普通锦衣模型(人物.锦衣[1],人物.模型,nil,wq)
					end

					--if 人物.锦衣[1] == nil then
						self.模型 = 引擎.场景.资源:载入(n[3],"网易WDF动画",n[1])
					--end
					local m = 引擎.场景:取武器附加名称(人物.装备.子类,人物.装备.级别限制,人物.装备.名称)
					local n = qms(m.."_"..人物.模型)
					self.武器 = 引擎.场景.资源:载入(n[3],"网易WDF动画",n[1])
					self.武器:置方向(self.临时方向)
					-- self.武器:置差异(self.武器.帧数-self.模型.帧数)
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
function zhuzhangezi:刷新武器(武器,角色)
	if not 武器 then
	    self.武器=nil
	    self.装备=nil
	    return
	end
	if self.模型 ~= nil and self.人物 ~= nil and not self.变身 and not self.坐骑 then
		self.临时方向=4
		self.装备=武器
		local n = qms(角色,引擎.场景:取武器子类(武器.子类))
		if self.锦衣 ~= nil then
			local wq = 武器.子类
			n=引擎.取普通锦衣模型(self.锦衣.名称 or self.锦衣 ,角色,nil,wq)
		end
		--if 人物.锦衣[1] == nil then
			self.模型 = 引擎.场景.资源:载入(n[3],"网易WDF动画",n[1])
		--end
		local m = 引擎.场景:取武器附加名称(武器.子类,武器.级别限制,武器.名称)
		n = qms(m.."_"..角色)
		self.武器 = 引擎.场景.资源:载入(n[3],"网易WDF动画",n[1])
		self.模型:置方向(self.临时方向)
		self.武器:置方向(self.临时方向)
		-- self.武器:置差异(self.武器.帧数-self.模型.帧数)
	end
end
function zhuzhangezi:刷新锦衣(锦衣,角色)
	if self.模型 ~= nil and self.人物 ~= nil and not self.变身 and not self.坐骑 then
		self.临时方向=4
		local n = qms(角色)
		local wq
		 if self.装备 then
		 	wq=self.装备.子类
		 end
		if 锦衣 ~= nil then
			n=引擎.取普通锦衣模型(锦衣.名称,角色,nil,wq)
			self.锦衣=锦衣
		end
		self.模型 = 引擎.场景.资源:载入(n[3],"网易WDF动画",n[1])
		if self.装备 then
			local m = 引擎.场景:取武器附加名称(self.装备.子类,self.装备.级别限制,self.装备.名称)
			n = qms(m.."_"..角色)
			self.武器 = 引擎.场景.资源:载入(n[3],"网易WDF动画",n[1])
			self.武器:置方向(self.临时方向)
			-- self.武器:置差异(self.武器.帧数-self.模型.帧数)
		end
		self.模型:置方向(self.临时方向)
	end
end
function zhuzhangezi:显示(dt,x,y)
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
function zhuzhangezi:更新1(dt,x,y)
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
end
function zhuzhangezi:显示1(dt,x,y)
	self.事件 = false
	self.焦点 = false
	--if self.人物==nil then return 0 end
	if self.模型 ~= nil and self.人物 ~= nil then
		if self.坐骑 ~= nil then
			-- self.坐骑:更新(dt)
			if self.坐骑饰品 ~= nil then
				-- self.坐骑饰品:更新(dt)
			end
		end
		if self.武器 ~= nil then
			-- self.武器:更新(dt)
		end
		-- self.模型:更新(dt)
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
function zhuzhangezi:释放()

end

function zhuzhangezi:置坐标(x,y)
	self.x = x
	self.y = y
end

return zhuzhangezi