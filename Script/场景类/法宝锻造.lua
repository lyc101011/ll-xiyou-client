--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2021-10-26 18:29:08
--======================================================================--
local 场景类_法宝锻造 = class()

local floor = math.floor
local insert = table.insert
local random = 引擎.取随机整数
local mouseb = 引擎.鼠标弹起
local zts,tp,zts1
local tp
local remove = table.remove

function 场景类_法宝锻造:初始化(根)
	self.ID = 106
	self.x = 210
	self.y = 110
	self.xx = 0
	self.yy = 0
	self.注释 = "幻化"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 小型选项栏 = 根._小型选项栏
	self.资源组 = {
		[0] = 自适应.创建(1,1,455,18,1,3,nil,18),
		[1] = 自适应.创建(0,1,485,297,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"开始"),
		[4] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"完成"),
		[5] = 自适应.创建(3,1,40,19,1,3,nil,18),
		[6] = 资源:载入('wzife.wdf',"网易WDF动画",0xff5ef52b),
		[7] = 资源:载入('wzife.wdf',"网易WDF动画",0xbb25066f),
	}
	local 格子 = 根._物品格子
	self.物品 = {}
	for i=1,20 do
		self.物品[i] = 格子(0,0,"法宝锻造")
	end
	self.材料 = {}
	for i=1,5 do
		self.材料[i] = 格子(0,0,"法宝锻造材料")
	end
	for n=2,4 do
		self.资源组[n]:绑定窗口_(self.ID )
	end
	self.材料坐标={{x=283,y=30},{x=283+130,y=30},{x=283,y=30+153},{x=283+130,y=30+153},{x=345,y=106}}
	self.物品限制={1003,1000,3}
	self.开始 = 1
	self.结束 = 20
	self.窗口时间 = 0
	tp = 根
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
	self.体活消耗 = 0
	self.金钱消耗 = 0
end

function 场景类_法宝锻造:打开()
	if self.可视 then
		self.可视 = false
	else
		insert(tp.窗口_,self)
		for i=1,20 do
			self.物品[i]:置物品(tp.道具列表[i])
		end
		for i=1,5 do
			self.材料[i]:置物品(nil)
		end
		self.体活消耗 = 0
		self.金钱消耗 = 0
		tp.运行时间 = tp.运行时间 + 1
	    	self.窗口时间 = tp.运行时间
	    	self.可视 = true
	end
end

function 场景类_法宝锻造:刷新道具(ss)
	self.开始 = 1
	self.结束 = 20
	for i=self.开始,self.结束 do
		self.物品[i]:置物品(ss[i])
	end
	for i=1,5 do
		self.材料[i] = 置物品(nil)
	end
end

function 场景类_法宝锻造:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y)
	self.资源组[4]:更新(x,y)
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[0]:显示(self.x+6,self.y+3)
	self.资源组[2]:显示(self.x + 485-26,self.y + 6,true)
	tp.窗口标题背景_:置区域(0,0,74,16)
	tp.窗口标题背景_:显示(self.x+235,self.y+3)
	zts1:显示(self.x+249,self.y+3,"法宝锻造")
	self.资源组[6]:显示(self.x+5+283+79,self.y+30+104)
	self.资源组[7]:显示(self.x+5+283+79,self.y+30+104)
	tp.物品界面背景_:显示(self.x+12,self.y+30)
	tp.物品格子背景_:显示(self.x+self.材料坐标[1].x,self.y+self.材料坐标[1].y)
	tp.物品格子背景_:显示(self.x+self.材料坐标[2].x,self.y+self.材料坐标[2].y)
	tp.物品格子背景_:显示(self.x+self.材料坐标[3].x,self.y+self.材料坐标[3].y)
	tp.物品格子背景_:显示(self.x+self.材料坐标[4].x,self.y+self.材料坐标[4].y)
	tp.物品格子背景_:显示(self.x+self.材料坐标[5].x,self.y+self.材料坐标[5].y)
	self.资源组[3]:显示(self.x+5+326,self.y+254)
	--self.资源组[4]:显示(self.x+5+326+70,self.y+254)
	zts1:显示(self.x+26,self.y+244,"所需体力")
	zts1:显示(self.x+144,self.y+244,"所需金钱")
	if self.资源组[3]:事件判断() then
		if self.材料[1].物品 == nil  or self.材料[2].物品 == nil or self.材料[3].物品 == nil  then return end
		local 临时格子 = {}
		for i=1,5 do
			if self.材料[i].物品 ~= nil then
				临时格子[i] =self.材料[i].物品.格子
			end
		end
		发送数据(3715,{格子=临时格子,类型="道具"})
		self:打开()
	elseif self.资源组[4]:事件判断() then

	end
	    --do
	local is = self.开始 - 1
	for h=1,4 do
		for l=1,5 do
			is = is + 1
			self.物品[is]:置坐标((l-1)* 51 + self.x+12,(h-1) * 51 + self.y + 28)
			self.物品[is]:显示(dt,x,y,self.鼠标,self.物品限制)
			if self.物品[is].物品 ~= nil and self.物品[is].焦点 then
				tp.提示:道具行囊(x,y,self.物品[is].物品)
				if self.物品[is].事件 and  self.鼠标 then
					if self.物品[is].物品.总类 == 1003 then
						if self.物品[is].物品.分类 == 5 then
							if self.材料[1].物品 == nil  then
								self.材料[1]:置物品(self.物品[is].物品)
								self.材料[1].物品.格子 = is
								self.物品[is]:置物品(nil)
							end
						else
						   	if self.材料[2].物品 == nil  then
						   		self.材料[2]:置物品(self.物品[is].物品)
								self.材料[2].物品.格子 = is
								self.物品[is]:置物品(nil)
						   	elseif self.材料[3].物品 == nil  then
						   		self.材料[3]:置物品(self.物品[is].物品)
								self.材料[3].物品.格子 = is
								self.物品[is]:置物品(nil)
						   	end
						end
					elseif self.物品[is].物品.总类 == 1000 then
						if self.材料[4].物品 == nil  then
							self.材料[4]:置物品(self.物品[is].物品)
							self.材料[4].物品.格子 = is
							self.物品[is]:置物品(nil)
						end
					elseif self.物品[is].物品.总类 == 3 and self.物品[is].物品.分类 == 11 then
						if self.材料[5].物品 == nil  then
							self.材料[5]:置物品(self.物品[is].物品)
							self.材料[5].物品.格子 = is
							self.物品[is]:置物品(nil)
						end
					end
					刷新道具逻辑(self.物品[is].物品,is,true)
				end
			end
			if self.物品[is].焦点 then
				self.焦点 = true
			end
		end
	end
	for i=1,5 do
		if self.材料[i].物品 ~= nil then
			self.材料[i]:置坐标(self.x+self.材料坐标[i].x ,self.y+self.材料坐标[i].y)
			self.材料[i]:显示(dt,x,y,self.鼠标,false)
			zts1:显示(self.x+26+80,self.y+244,self.体活消耗)
			zts1:显示(self.x+144+90,self.y+244,self.金钱消耗)
			if self.材料[i].焦点 then
				tp.提示:道具行囊(x,y,self.材料[i].物品)
				if mouseb(0) and self.鼠标 then
					tp.道具列表[self.材料[i].物品.格子] = self.材料[i].物品
					tp.窗口.道具行囊.物品[self.材料[i].物品.格子]:置物品(tp.道具列表[self.材料[i].物品.格子])
					刷新道具逻辑(tp.道具列表[self.材料[i].物品.格子],self.材料[i].物品.格子,true)
					self.材料[i]:置物品(nil)
				end
			end
		end
	end

end

function 场景类_法宝锻造:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_法宝锻造:初始移动(x,y)
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

function 场景类_法宝锻造:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_法宝锻造