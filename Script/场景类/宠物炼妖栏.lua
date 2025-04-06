-- @Author: baidwwy
-- @Date:   2024-06-13 16:59:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-08-01 01:37:57
local 场景类_宠物炼妖栏 = class()
local bw = require("gge包围盒")(0,0,120,37)
local box = 引擎.画矩形
local remove = table.remove
local insert = table.insert
local random = 引擎.取随机整数
local floor = math.floor
local min = math.min
local ceil = math.ceil
local cfs = 删除重复
local qmxs = 引擎.取战斗模型
local mouseb = 引擎.鼠标弹起
local tx = 引擎.取头像
local zts,tp,zts1
local insert = table.insert
local qmx = 引擎.取模型

function 场景类_宠物炼妖栏:初始化(根)
	self.ID = 25
	self.x = 289
	self.y = 119
	self.xx = 0
	self.yy = 0
	self.注释 = "宠物炼妖栏"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	local 按钮 = tp._按钮
	local 自适应 = 根._自适应
	local 物品 = tp._物品格子
	self.资源组 = {
		[1] = 自适应.创建(0,1,441,405,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"炼妖"),
		[4] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"洗炼"),
		[5] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"炼化"),
		[6] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"内丹"),
		[7] = 根.资源:载入('common/wzife.wdf',"网易WDF动画",759515494),--根.资源:载入('wzife.wd1',"网易WDF动画",0x62F1C735),
		[9] = 按钮.创建(自适应.创建(22,4,27,20,4,3),0,0,4,true,true),
		[10] = 按钮.创建(自适应.创建(23,4,27,20,4,3),0,0,4,true,true),
		[11] = 自适应.创建(34,1,150,228,3,9),
		[12] = 自适应.创建(2,1,130,117,3,9),
		[13] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"认证"),
		[14] =  根._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),1,14,227,2)
	}
	self.物品 = {}
	for i=1,180 do
		self.物品[i] = 物品.创建(0,0,i,"炼妖物品")
	end
	for n=2,6 do
		self.资源组[n]:绑定窗口_(self.ID)
	end
	for n=9,10 do
		self.资源组[n]:绑定窗口_(self.ID)
	end
	self.资源组[13]:绑定窗口_(self.ID)
	self.资源组[14]:绑定窗口_(self.ID)
	self.头像组 = {}
	self.炼妖物品 = 物品.创建(0,0,0,"炼妖_物品")
	self.加入 = 0
	self.开始 = 1
	self.结束 = 20
	self.窗口时间 = 0
	self.右键关闭=1
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
	self.类型 = "炼妖"
	self.物品限制 = {3}
	    --do
end

function 场景类_宠物炼妖栏:打开(道具,类型)
	if self.可视 then
		self.可视 = false
		self.主动 = nil
		self.副动 = nil
		self.主召唤兽 = nil
		self.副召唤兽 = nil
		self.主点击 = nil
		self.副点击 = nil
		self.资源组[14]:置起始点(0)
	else
		insert(tp.窗口_,self)
		self.开始=1
		self.结束=20
		self.类型 = 类型
		if self.类型 == "炼妖" then
			self.物品限制 = {3}
		elseif self.类型 == "炼化" then
			self.物品限制 = {3}
		elseif self.类型 == "内丹" then
			self.物品限制 = {203}
		end
		for n=self.开始,self.结束 do
			self.物品[n]:置物品(道具[n])
		end
		self.炼妖物品:置物品(nil)
		self.主召唤兽 = nil
		self.副召唤兽 = nil
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end

function 场景类_宠物炼妖栏:刷新道具(道具)
	self.开始=1
	self.结束=20
	for n=self.开始,self.结束 do
	    	self.物品[n]:置物品(nil)
	    	self.物品[n]:置物品(道具[n])
	end
	tp.窗口.召唤兽属性栏:刷新()
	self.炼妖物品:置物品(nil)
	self.主召唤兽 = nil
	self.副召唤兽 = nil
end

function 场景类_宠物炼妖栏:清除()
 	tp.窗口.召唤兽属性栏:刷新()
	self.炼妖物品:置物品(nil)
	self.主召唤兽 = nil
	self.副召唤兽 = nil
end

function 场景类_宠物炼妖栏:主置形象()
	if tp.队伍[1].宝宝列表[self.主召唤兽]  ~= nil and self.主召唤兽 ~= 0 then
		local n = qmxs(tp.队伍[1].宝宝列表[self.主召唤兽].模型)
		self.主动 = tp.资源:载入(n[10],"网易WDF动画",n[6])
		if tp.队伍[1].宝宝列表[self.主召唤兽].饰品 ~= nil then
			n = qmxs(tp.队伍[1].宝宝列表[self.主召唤兽].模型.."_饰品")
			self.资源组[24] = tp.资源:载入(n[10],"网易WDF动画",n[6])
			if tp.队伍[1].宝宝列表[self.主召唤兽].饰品颜色 then
			    self.资源组[24]:置颜色(tp.队伍[1].宝宝列表[self.主召唤兽].饰品颜色,-1)
			end
		end
		if tp.队伍[1].宝宝列表[self.主召唤兽].炫彩 ~= nil then
			self.主动:炫彩染色(tp.队伍[1].宝宝列表[self.主召唤兽].炫彩,tp.队伍[1].宝宝列表[self.主召唤兽].炫彩组)
		else
			if tp.队伍[1].宝宝列表[self.主召唤兽].染色方案 ~= nil then
				self.主动:置染色(tp.队伍[1].宝宝列表[self.主召唤兽].染色方案,tp.队伍[1].宝宝列表[self.主召唤兽].染色组[1],tp.队伍[1].宝宝列表[self.主召唤兽].染色组[2],tp.队伍[1].宝宝列表[self.主召唤兽].染色组[3],tp.队伍[1].宝宝列表[self.主召唤兽].染色组[4])
				self.主动:置方向(0)
			end
		end
	end
end

function 场景类_宠物炼妖栏:副置形象()
	if tp.队伍[1].宝宝列表[self.副召唤兽]  ~= nil and self.副召唤兽 ~= 0 then
		local n = qmxs(tp.队伍[1].宝宝列表[self.副召唤兽].模型)
		self.副动 = tp.资源:载入(n[10],"网易WDF动画",n[6])
		if tp.队伍[1].宝宝列表[self.副召唤兽].饰品 ~= nil then
			n = qmxs(tp.队伍[1].宝宝列表[self.副召唤兽].模型.."_饰品")
			self.资源组[25] = tp.资源:载入(n[10],"网易WDF动画",n[6])
			if tp.队伍[1].宝宝列表[self.副召唤兽].饰品颜色 then
			    self.资源组[25]:置颜色(tp.队伍[1].宝宝列表[self.副召唤兽].饰品颜色,-1)
			end
		end
		if tp.队伍[1].宝宝列表[self.副召唤兽].炫彩 ~= nil then
			self.副动:炫彩染色(tp.队伍[1].宝宝列表[self.副召唤兽].炫彩,tp.队伍[1].宝宝列表[self.副召唤兽].炫彩组)
		else
			if tp.队伍[1].宝宝列表[self.副召唤兽].染色方案 ~= nil then
				self.副动:置染色(tp.队伍[1].宝宝列表[self.副召唤兽].染色方案,tp.队伍[1].宝宝列表[self.副召唤兽].染色组[1],tp.队伍[1].宝宝列表[self.副召唤兽].染色组[2],tp.队伍[1].宝宝列表[self.副召唤兽].染色组[3],tp.队伍[1].宝宝列表[self.副召唤兽].染色组[4])
				self.副动:置方向(0)
			end
		end
	end
end

function 场景类_宠物炼妖栏:显示(dt,x,y)
	local bbs = tp.队伍[1].宝宝列表
	local bbsa = #bbs
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y)
	self.资源组[4]:更新(x,y)
	self.资源组[5]:更新(x,y)
	self.资源组[6]:更新(x,y)
	self.资源组[9]:更新(x,y)
	self.资源组[10]:更新(x,y)
	self.资源组[3]:更新(x,y,self.主召唤兽 ~= nil and self.副召唤兽 ~= nil)
	self.资源组[4]:更新(x,y,((self.主召唤兽 ~= nil and self.副召唤兽 == nil) or (self.副召唤兽 ~= nil and self.主召唤兽 == nil)))
	self.资源组[5]:更新(x,y,((self.主召唤兽 ~= nil and self.副召唤兽 == nil) or (self.副召唤兽 ~= nil and self.主召唤兽 == nil)))
	self.资源组[6]:更新(x,y,((self.主召唤兽 ~= nil and self.副召唤兽 == nil) or (self.副召唤兽 ~= nil and self.主召唤兽 == nil)))
	self.资源组[9]:更新(x,y,self.开始 ~= 1)
	self.资源组[10]:更新(x,y,self.结束 ~= 160)
	self.资源组[13]:更新(x,y,self.主召唤兽 ~= nil)
	if self.主动 ~= nil then
		self.主动:更新(dt)
	end
	if self.副动 ~= nil then
		self.副动:更新(dt)
	end
    if self.资源组[2]:事件判断() then
    	self:打开()
	elseif self.资源组[3]:事件判断() then
		发送数据(5009,{序列=self.主召唤兽,序列1=self.副召唤兽})
	elseif self.资源组[4]:事件判断() then
		if self.炼妖物品.物品~=nil and self.主召唤兽 ~= nil then
			发送数据(5008,{序列=self.炼妖物品.物品编号,序列1=self.主召唤兽})
		end
   	elseif self.资源组[5]:事件判断() then
		if self.炼妖物品.物品~=nil and self.主召唤兽 ~= nil then
			local 事件 = function()
			发送数据(5010,{序列=self.炼妖物品.物品编号,序列1=self.主召唤兽})
		end
			tp.窗口.文本栏:载入("如果无论炼化是否成功失败，你所选择的召唤兽都会消失。请确认是否进行炼化操作？",nil,true,事件)
		end
	elseif self.资源组[6]:事件判断() then
		if self.炼妖物品.物品~=nil and self.主召唤兽 ~= nil then
			-- local 事件 = function()
			发送数据(5011,{序列=self.炼妖物品.物品编号,序列1=self.主召唤兽})
		-- end
		-- 	tp.窗口.文本栏:载入("如果内丹已满会随机顶掉现有召唤兽内丹。请确认是否进行内丹操作？",nil,true,事件)
		end
	elseif(self.资源组[11]:是否选中(x,y) or  self.资源组[14]:是否选中(x,y)) and 引擎.取鼠标滚轮() ==1 and self.加入 > 0  then--鼠标上滚动
		self.资源组[14]:置起始点(self.资源组[14]:取百分比转换(self.加入-1,5,bbsa))
	elseif (self.资源组[11]:是否选中(x,y) or self.资源组[14]:是否选中(x,y)) and 引擎.取鼠标滚轮() ==-1 and self.加入 < bbsa - 5 then--鼠标下滚动
		self.资源组[14]:置起始点(self.资源组[14]:取百分比转换(self.加入+1,5,bbsa))
	elseif self.资源组[9]:事件判断() then

	elseif self.资源组[10]:事件判断() then

	elseif self.资源组[13]:事件判断() then
		if self.主召唤兽 ~= nil then
			引擎.场景.窗口.法术认证:打开(bbs[self.主召唤兽].技能,self.主召唤兽)
		else
			tp.常规提示:打开("#Y/请先选中召唤兽")
		end
	end
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-76+self.资源组[1].宽度/2,self.y)
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	if self.类型 == "炼妖" then
		引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"炼  妖")
		self.资源组[3]:显示(self.x + 165,self.y + 103)
		self.资源组[4]:显示(self.x + 224,self.y + 103)
		for i=1,2 do
			self.资源组[12]:显示(self.x+i*261-236,self.y+36)
		end
	elseif self.类型 == "炼化" then
		引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"炼  化")
		self.资源组[5]:显示(self.x + 195,self.y + 101)
		self.资源组[13]:显示(self.x + 195,self.y + 131)
		for i=1,2 do
			self.资源组[12]:显示(self.x+i*261-236,self.y+36)
		end
	elseif self.类型 == "内丹" then
		引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"内  丹")
		self.资源组[6]:显示(self.x + 195,self.y + 111)
		for i=1,1 do
			self.资源组[12]:显示(self.x+i*261-236,self.y+36)
		end
	end
	self.资源组[11]:显示(self.x+13,self.y+164)
	self.资源组[9]:显示(self.x + 173,self.y + 377)
	self.资源组[10]:显示(self.x + 204,self.y + 377)
	tp.物品界面背景_:显示(self.x+174,self.y+164)
	tp.横排花纹背景_:置区域(0,0,192,18)
	tp.横排花纹背景_:显示(self.x+237,self.y+376)
	tp.物品格子背景_:显示(self.x+196,self.y+39)
	if bbsa > 5 then
		self.资源组[14]:置高度(min(floor(227/(bbsa-5)),227-10))
		self.加入 = min(ceil((bbsa-5)*self.资源组[14]:取百分比()),bbsa-5)
	end
	if bbsa > 5 then
		self.资源组[14]:显示(self.x+154,self.y+165,x,y,self.鼠标)
	end
	local p = self.开始 - 1
	for h=1,4 do
		for l=1,5 do
			p = p + 1
			self.物品[p]:置坐标(l * 51 + self.x+124,h * 51+self.y+112)
			self.物品[p]:显示(dt,x,y,self.鼠标,self.物品限制)
			if self.物品[p].物品 ~= nil and self.物品[p].焦点 then
					if self.物品[p].物品 ~= nil then
					tp.提示:道具行囊(x,y,self.物品[p].物品)
					if self.物品[p].事件 and self.鼠标 then
				    	if self.炼妖物品.物品 == nil then
				    		self.炼妖物品:置物品(self.物品[p].物品)
				    		self.炼妖物品.物品编号=p
				    		self.物品[p]:置物品(nil)
				    	elseif self.炼妖物品.物品 ~= nil then
				    		local jy1 = self.炼妖物品.物品
				    		self.炼妖物品:置物品(self.物品[p].物品)
				    		self.炼妖物品.物品编号=p
				    		self.物品[p].物品 = jy1
				    		self.物品[p]:置物品(nil)
				    	end
				    	刷新道具逻辑(self.物品[p].物品,p,true)
				   	end
				end
			end
		end
	end
	if self.主动 ~= nil and self.主召唤兽 ~= nil then
		tp.影子:显示(self.x + 85,self.y + 130)
		self.主动:显示(self.x + 85,self.y + 130)
		if self.资源组[24] ~= nil then
			self.资源组[24]:更新(dt)
			self.资源组[24]:显示(self.x + 85,self.y + 130)
		end
	end
	if self.副动 ~= nil and self.副召唤兽 ~= nil then
		tp.影子:显示(self.x + 345,self.y + 130)
		self.副动:显示(self.x + 345,self.y + 130)
		if self.资源组[25] ~= nil then
			self.资源组[25]:更新(dt)
			self.资源组[25]:显示(self.x + 345,self.y + 130)
		end
	end
	self.炼妖物品:置坐标(self.x+199,self.y+40)
	self.炼妖物品:显示(dt,x,y,self.鼠标)
	if self.炼妖物品.物品 ~= nil and self.炼妖物品.焦点 then
		tp.提示:道具行囊(x,y,self.炼妖物品.物品)
		if mouseb(0) and self.鼠标 then
			tp.道具列表[self.炼妖物品.物品编号] = self.炼妖物品.物品
			刷新道具逻辑(tp.道具列表[self.炼妖物品.物品编号],self.炼妖物品.物品编号,true)
			self.炼妖物品:置物品(nil)
		end
	end
	for i=1,5 do
		if bbs[i+self.加入] ~= nil  then
			local jx = self.x+19
			local jy = self.y+(i*43)+129
			bw:置坐标(jx,jy+1)
			if self.头像组[i+self.加入] == nil or self.头像组[i+self.加入][1] ~= bbs[i+self.加入].模型 then
				self.头像组[i+self.加入] = {bbs[i+self.加入].模型}
				local n = tx(self.头像组[i+self.加入][1])
				self.头像组[i+self.加入][2] = tp.资源:载入(n[7],"网易WDF动画",n[1])
			end
			if bw:检查点(x,y) then
				if mouseb(0) and self.鼠标 and not tp.消息栏焦点 then
					if self.主召唤兽 ~= i + self.加入 and self.副召唤兽 ~= i + self.加入 then
						if self.主召唤兽 == nil then
							self.主召唤兽 = i + self.加入
							self:主置形象()
						elseif self.副召唤兽 == nil and self.类型 == "炼妖" then
							self.副召唤兽 = i + self.加入
							self:副置形象()
						elseif self.主召唤兽 ~= nil and self.副召唤兽 ~= nil then
							self.主召唤兽 = i + self.加入
							self:主置形象()
						end
					else
						if self.主召唤兽 == i + self.加入 then
							self.主召唤兽 = nil
							self:主置形象()
						elseif self.副召唤兽 == i + self.加入 and self.类型 == "炼妖" then
							self.副召唤兽 = nil
							self:副置形象()
						end
					end
				end
				self.焦点 = true
			end
			if self.主召唤兽 == i + self.加入 or self.副召唤兽 == i + self.加入 then
				box(jx-2,jy-3,jx+128,jy+40,-10790181)
			end
			tp.宠物头像背景_:显示(jx+1,jy)
			self.头像组[i+self.加入][2]:显示(jx+4,jy+4)
			if self.主召唤兽 == i + self.加入 or self.副召唤兽 == i + self.加入 then
				self.资源组[7]:显示(jx+26,jy+23)
			end
			if tp.队伍[1].宝宝列表[i+self.加入].参战信息 ~= nil then
				zts:置颜色(-65536)
			else
				zts:置颜色(-16777216)
			end
			zts:显示(jx+41,jy+4,bbs[i+self.加入].名称)
			zts:显示(jx+41,jy+21,bbs[i+self.加入].等级.."级")
		end
	end
end

function 场景类_宠物炼妖栏:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_宠物炼妖栏:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if  self.鼠标 and  not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_宠物炼妖栏:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_宠物炼妖栏