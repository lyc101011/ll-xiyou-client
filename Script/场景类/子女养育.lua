--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2023-01-18 09:24:08
--======================================================================--
local 场景类_子女养育 = class()
local ceil = math.ceil
local insert = table.insert
local remove = table.remove
local floor = math.floor
local ceil = math.ceil
local min = math.min
local max = math.max
local bwh = require("gge包围盒")
local bw = bwh(0,0,50,108)
local tp,zts

function 场景类_子女养育:初始化(根)
	self.ID = 109
	self.x = 104
	self.y = 74
	self.xx = 0
	self.yy = 0
	self.注释 = "子女"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 滑块 = 根._滑块
	local 自适应 = 根._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,600,385,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮.创建(自适应.创建(12,4,80,22,1,3),0,0,4,true,true,"养育属性"),
		[4] = 按钮.创建(自适应.创建(12,4,80,22,1,3),0,0,4,true,true,"战斗属性"),
		[5] = 按钮.创建(根.资源:载入('wzife.wd1',"网易WDF动画",0x8561289c),0,0,1,true,true),
		[6] = 按钮.创建(根.资源:载入('wzife.wd1',"网易WDF动画",0x8561289c),0,0,1,true,true),
		[7] = 自适应.创建(2,1,564,331,3,9),
		[8] = 自适应.创建(34,1,307,68,3,9),
		[9] = 自适应.创建(78,1,330,183,3,9),
		[10] = 自适应.创建(3,1,60,19,1,3),
		[11] = 按钮.创建(自适应.创建(12,4,50,22,1,3),0,0,4,true,true,"工作"),
		[12] = 按钮.创建(自适应.创建(12,4,50,22,1,3),0,0,4,true,true,"学习"),
		[13] = 按钮.创建(自适应.创建(12,4,50,22,1,3),0,0,4,true,true,"生活"),
		[14] = 按钮.创建(自适应.创建(12,4,70,22,1,3),0,0,4,true,true,"纪念册"),
	}
	for i=2,6 do
		self.资源组[i]:绑定窗口_(self.ID)
	end
	for i=11,14 do
		self.资源组[i]:绑定窗口_(self.ID)
	end
	self.状态=1
	self.选中=1
	self.头像={}
	tp = 根
	zts = tp.字体表.普通字体
end
function 场景类_子女养育:打开(数据)
	if self.可视 then
		self.可视 = false
	else
		for i=1,#tp.队伍[1].子女列表 do
			local sj2 =引擎.取头像(tp.队伍[1].子女列表[i].模型)
			self.头像[i]= tp.资源:载入(sj2[8],"网易WDF动画",sj2[2])
		end
		insert(tp.窗口_,self)
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end

function 场景类_子女养育:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y,self.状态2~=1)
	self.资源组[4]:更新(x,y,self.状态2~=2)
	self.资源组[5]:更新(x,y,self.选中~=1)
	self.资源组[6]:更新(x,y,self.选中~=2 and tp.队伍[1].子女列表[2])
	self.资源组[11]:更新(x,y)
	self.资源组[12]:更新(x,y)
	self.资源组[13]:更新(x,y)
	self.资源组[14]:更新(x,y)
	if self.资源组[3]:事件判断() then
		self.状态 =1
	elseif self.资源组[4]:事件判断() then
		self.状态 =2
	elseif self.资源组[5]:事件判断() then
		self.选中 =1
	elseif self.资源组[6]:事件判断() then
		self.选中 =2
	end
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-76+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"子女养育")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	self.资源组[7]:显示(self.x+18,self.y+33)
	self.资源组[9]:显示(self.x+240,self.y+179-45)
	self.资源组[10]:显示(self.x+280,self.y+43)
	self.资源组[10]:显示(self.x+390,self.y+43)
	self.资源组[10]:显示(self.x+505,self.y+43)
	self.资源组[3]:显示(self.x+240,self.y+157-45,nil,nil,nil,self.状态== 1,2)
	self.资源组[4]:显示(self.x+353,self.y+157-45,nil,nil,nil,self.状态== 2,2)
	self.资源组[5]:显示(self.x-38,self.y+43,nil,nil,nil,self.选中== 1,1)
	self.资源组[6]:显示(self.x-38,self.y+102,nil,nil,nil,self.选中== 2,1)
	for i=1,#self.头像 do
		self.头像[i]:显示(self.x-38,self.y+43+((i-1)*59))
	end
	self.资源组[11]:显示(self.x+257,self.y+72)
	self.资源组[12]:显示(self.x+333,self.y+72)
	self.资源组[13]:显示(self.x+416,self.y+72)
	self.资源组[14]:显示(self.x+498,self.y+72)
	zts:置颜色(0xFF000000)
	zts:显示(self.x+251,self.y+47,"心情")
	zts:显示(self.x+359,self.y+47,"健康")
	zts:显示(self.x+471,self.y+47,"疲劳")
	zts:置样式(1)
	zts:显示(self.x+310,self.y+47,"0000")
	zts:显示(self.x+419,self.y+47,"0000")
	zts:显示(self.x+534,self.y+47,"000")
	zts:置样式(0)
	if self.状态 == 1 then
		zts:显示(self.x+255,self.y+153,"名字："..tp.队伍[1].子女列表[self.选中].名称)
		zts:显示(self.x+255,self.y+179,"年龄："..tp.队伍[1].子女列表[self.选中].年龄)
		zts:显示(self.x+255,self.y+206,"根骨："..tp.队伍[1].子女列表[self.选中].根骨)
		zts:显示(self.x+255,self.y+235,"智力："..tp.队伍[1].子女列表[self.选中].智力)
		zts:显示(self.x+255,self.y+264,"定力："..tp.队伍[1].子女列表[self.选中].定力)
		zts:显示(self.x+255,self.y+292,"结局："..tp.队伍[1].子女列表[self.选中].结局)
		zts:显示(self.x+416,self.y+179,"师门："..tp.队伍[1].子女列表[self.选中].师门)
		zts:显示(self.x+416,self.y+206,"念力："..tp.队伍[1].子女列表[self.选中].念力)
		zts:显示(self.x+416,self.y+235,"武力："..tp.队伍[1].子女列表[self.选中].武力)
		zts:显示(self.x+416,self.y+264,"灵敏："..tp.队伍[1].子女列表[self.选中].灵敏)
		zts:显示(self.x+416,self.y+292,"亲密："..tp.队伍[1].子女列表[self.选中].亲密)
	elseif self.状态 == 2 then
		zts:显示(self.x+255,self.y+153,"名字："..tp.队伍[1].子女列表[self.选中].名称)
		zts:显示(self.x+255,self.y+179,"等级："..tp.队伍[1].子女列表[self.选中].等级)
		zts:显示(self.x+255,self.y+206,"气血："..tp.队伍[1].子女列表[self.选中].最大气血)
		zts:显示(self.x+255,self.y+235,"攻击："..tp.队伍[1].子女列表[self.选中].伤害)
		zts:显示(self.x+255,self.y+264,"法伤："..tp.队伍[1].子女列表[self.选中].法伤)
		zts:显示(self.x+255,self.y+292,"速度："..tp.队伍[1].子女列表[self.选中].速度)
		zts:显示(self.x+416,self.y+179,"师门："..tp.队伍[1].子女列表[self.选中].师门)
		zts:显示(self.x+416,self.y+206,"魔法："..tp.队伍[1].子女列表[self.选中].最大魔法)
		zts:显示(self.x+416,self.y+235,"防御："..tp.队伍[1].子女列表[self.选中].防御)
		zts:显示(self.x+416,self.y+264,"法防："..tp.队伍[1].子女列表[self.选中].法防)
	end
	bw:置坐标(self.x-38,self.y+43)
end

function 场景类_子女养育:检查点(x,y)
	if self.资源组[1]:是否选中(x,y) or bw:检查点(x,y) then
		return true
	end
end

function 场景类_子女养育:初始移动(x,y)
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

function 场景类_子女养育:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_子女养育