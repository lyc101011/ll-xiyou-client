local 场景类_锦衣 = class()

local floor = math.floor
local tp,zts1
local insert = table.insert

function 场景类_锦衣:初始化(根)
	self.ID = 49
	self.xx = 0
	self.yy = 0
	self.注释 = "锦衣"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,129,260,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[4] = 资源:载入('wzife.wdf',"网易WDF动画",0x9CC4F242),
		[5] = 资源:载入('wzife.wdf',"网易WDF动画",0xC0520208),
		[6] = 资源:载入('wzife.wdf',"网易WDF动画",0xCF39217A),
		[7] = 资源:载入('wzife.wdf',"网易WDF动画",0xFE7DE843),
		[8] = 资源:载入('wzife.wdf',"网易WDF动画",0xFE7DE843),
		[9] = 资源:载入('wzife.wdf',"网易WDF动画",0xFE7DE843),
		[10] = 资源:载入('wzife.wdf',"网易WDF动画",0xFE7DE843),
		[11] = 资源:载入('wzife.wdf',"网易WDF动画",0xFE7DE843),
	}
	self.资源组[2]:绑定窗口_(self.ID)
	local 底图 =资源:载入('wzife.wdf',"网易WDF动画",0xA393A808)
	self.物品 = {}
	local 格子 = 根._物品格子
	for i=1,8 do
		self.物品[i] = 格子(0,0,i,"道具行囊_锦衣",底图)
	end
	tp = 根
	zts1 = tp.字体表.描边字体
	self.窗口时间 = 0
end

function 场景类_锦衣:打开(x,y)
	if self.可视 then
		for i=1,8 do
			self.物品[i]:置物品(nil)
		end
		self.可视 = false
	else
		insert(tp.窗口_,self)
		for i=1,8 do
			if tp.队伍[1] ~= nil and tp.队伍[1].锦衣 ~= nil and tp.队伍[1].锦衣[i] ~= nil and tp.队伍[1].锦衣[i].名称 ~= nil then
				self.物品[i]:置物品(tp.队伍[1].锦衣[i])
			end
		end
		self.x = x
		self.y = y
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 场景类_锦衣:刷新()
	for i=1,8 do
		self.物品[i]:置物品(nil)
		if tp.队伍[1] ~= nil and tp.队伍[1].锦衣 ~= nil and tp.队伍[1].锦衣[i] ~= nil and  tp.队伍[1].锦衣[i].名称 ~= nil then
			self.物品[i]:置物品(tp.队伍[1].锦衣[i])
		end
	end
end

function 场景类_锦衣:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	if self.资源组[2]:事件判断() then
		self:打开()
		return false
	end
	self.资源组[1]:显示(self.x,self.y)

	-- tp.窗口标题背景_:显示(self.x-76+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"锦衣")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	local xx = 0
	local yy = 1

	for i=1,8 do

		xx = xx + 1
		self.资源组[3+i]:显示(self.x + xx * 58-49,self.y + yy * 57-31)
		self.物品[i]:置坐标(self.x + xx * 58-46,self.y + yy * 57-30)
		self.物品[i]:显示(dt,x,y,self.鼠标,nil,0.7)
		if self.物品[i].物品 ~= nil and self.物品[i].焦点 then
			tp.提示:道具行囊(x,y,self.物品[i].物品,true)
		end
		if xx >= 2 then
			xx = 0
			yy = yy + 1
		end
		if self.物品[i].事件 then
			if tp.场景.抓取物品 ~= nil and self.物品[i].物品 == nil and self.物品[i].焦点 then

			elseif tp.场景.抓取物品 ~= nil and self.物品[i].物品 ~= nil and self.物品[i].焦点 then

			elseif tp.场景.抓取物品 == nil and self.物品[i].物品 ~= nil and self.物品[i].焦点 then
				发送数据(3704,{类型=tp.窗口.道具行囊.点击类型,角色="主角",锦衣=true,道具=i})
			end
		elseif self.物品[i].右键 then
			if  self.物品[i].物品 ~= nil then
			    发送数据(3704,{类型=tp.窗口.道具行囊.点击类型,角色="主角",锦衣=true,道具=i})
			end
		end
	end
end

function 场景类_锦衣:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_锦衣:初始移动(x,y)
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

function 场景类_锦衣:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_锦衣