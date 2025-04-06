--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2024-05-04 00:34:17
--======================================================================--
local 场景类_坐骑修炼 = class()
local tp,zts,zts1
local insert = table.insert
local xxx = 0
local yyy = 0
local mouseb = 引擎.鼠标弹起
function 场景类_坐骑修炼:初始化(根)
	self.ID = 79
	self.x = 364
	self.y = 100
	self.xx = 0
	self.yy = 0
	self.注释 = "坐骑修炼"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true

	self.介绍文本 = 根._丰富文本(260,200)
	local 格子 = 根._物品格子
	self.物品 = {}
	for i=1,180 do
		self.物品[i] = 格子(0,0,i,"坐骑修炼")
	end
	self.开始 = 1
	self.结束 = 20
	self.窗口时间 = 0
	self.选中编号=0

	tp = 根
	zts = 根.字体表.普通字体
	zts1 = 根.字体表.描边字体
end

function 场景类_坐骑修炼:打开(认证码,类型)
	if self.可视 then
		self.介绍文本:清空()
		self.选中编号=0
		for i=self.开始,self.结束 do
			self.物品[i]:置物品(nil)
		end
		self.可视 = false

	else

		insert(tp.窗口_,self)
		if self.资源组==nil then
		    local 资源 = tp.资源
			local 按钮 = tp._按钮
			local 自适应 = tp._自适应
			self.资源组 = {
				[1] = 自适应.创建(0,1,272,420,3,9),
				[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
				[3] = 按钮.创建(自适应.创建(12,4,80,22,1,3),0,0,4,true,true,"  修 炼"),
				[5] = 自适应.创建(7,1,113,22,1,3,nil,18),
			}
			for n=2,3 do
			   self.资源组[n]:绑定窗口_(79)
			end
		end
		self.类型=类型
		self.认证码=认证码
		if self.类型=="修炼" then
		    self.介绍文本:添加文本("通过修炼炼化#Y/60至80级#W/的人物武器装备以及#Y/0至125级#W/的召唤兽装备来提升#R坐骑#W的#Y/好感度#W/。")
			self.介绍文本:添加文本("根据召唤兽炼化的装备等级#Y/不同#W/所增加的好感度也#Y/不相同#W/。")
			self.介绍文本:添加文本("召唤兽属性对于骑乘的玩家角色属性按#Y/好感度百分比#W/起效。好感度上限为#Y200#W。加成最高为#Y100%#W。")
		else
			self.介绍文本:添加文本("通过修炼炼化#Y/60至80级#W/的人物武器装备以及#Y/0至125级#W/的召唤兽装备来提升#R召唤兽#W的#Y/忠诚度#W/。")
			self.介绍文本:添加文本("根据召唤兽炼化的装备等级#Y/不同#W/所增加的忠诚度也#Y/不相同#W/。")
			self.介绍文本:添加文本("召唤兽的忠诚上限最高为#Y1000#W。")
		end
		for i=self.开始,self.结束 do
			self.物品[i]:置物品(tp.道具列表[i])
		end
		self.选中编号=0

		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end


function 场景类_坐骑修炼:刷新道具()
	for i=self.开始,self.结束 do
		self.物品[i]:置物品(tp.道具列表[i])
	end
end

function 场景类_坐骑修炼:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y)
	if self.资源组[2]:事件判断() then
		self:打开()
	end

	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-88+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,self.类型)
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)

	tp.物品界面背景_:显示(self.x+9,self.y+28)
	self.资源组[3]:显示(self.x+95,self.y+390,true)
	self.介绍文本:显示(self.x+6,self.y+245+17)
	zts:置颜色(白色)
	zts:显示(self.x+7,self.y+245,"提示:")
	local is = self.开始 - 1
	for h=1,4 do
		for l=1,5 do
			is = is + 1
			self.物品[is]:置坐标(l * 51-41 + self.x,h * 51 + self.y - 26)
			self.物品[is]:显示(dt,x,y,self.鼠标,{2,2}) --{2,2} 总类 分类
			if self.物品[is].物品 ~= nil and self.物品[is].焦点 then
				tp.提示:道具行囊(x,y,self.物品[is].物品)
				if self.物品[is].事件 and  self.鼠标 then
					if self.物品[self.选中编号]~=nil then
					  	self.物品[self.选中编号].选中=nil
					end
					self.选中编号 = is
					self.物品[self.选中编号].选中=true
				end
			end
			if self.物品[is].焦点 then
				self.焦点 = true
			end
		end
	end
	if self.资源组[3]:事件判断() then
		if self.选中编号~=0 then
			发送数据(3784,{道具格子=self.选中编号,rzm=self.认证码,类型=self.类型})
		else
			tp.常规提示:打开("#Y/请选择一个道具")
		end
	end


end

function 场景类_坐骑修炼:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_坐骑修炼:初始移动(x,y)
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

function 场景类_坐骑修炼:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy

	end
end

return 场景类_坐骑修炼