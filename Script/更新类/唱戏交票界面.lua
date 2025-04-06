--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2024-04-08 23:31:05
--======================================================================--
local 交票界面 = class()

local floor = math.floor
local insert = table.insert
local random = 引擎.取随机整数
local mouseb = 引擎.鼠标弹起
local zts,tp,zts1
local tp
local remove = table.remove

function 交票界面:初始化(根)
	self.ID = 144
	self.x = 210
	self.y = 110
	self.xx = 0
	self.yy = 0
	self.注释 = "创建交票界面"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.数据 = nil
	self.窗口时间 = 0
	tp = 根
	zts = tp.字体表.普通字体
end

function 交票界面:打开(sj)
	if self.可视 then
		self.可视 = false
		self.数据 = {}
	else
		self.数据 = sj
		insert(tp.窗口_,self)
		self.选中 = "五更寒"
		self.状态=2
		if self.资源组==nil then
		    self:加载资源()
		end

		tp.运行时间 = tp.运行时间 + 1
    	self.窗口时间 = tp.运行时间
    	self.可视 = true
	end
end
function 交票界面:加载资源()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	-- local 小型选项栏 = tp._小型选项栏
	self.资源组 = {
		[1] = 自适应.创建(0,1,552,350,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),--关闭
		[3] = 按钮.创建(资源:载入('common/wzife.wdf',"网易WDF动画",0x89b1be35)),
		[4] = 按钮.创建(资源:载入('common/wzife.wdf',"网易WDF动画",0x89b1be35)),
		[5] = 自适应.创建(78,1,452,98,3,9),--大白背景 右侧带拉伸条
		[6] = 按钮.创建(资源:载入('common/wzife.wdf',"网易WDF动画",0x89b1be35)),--小白背景
		[7] = 按钮(自适应.创建(12,4,73,22,1,3),0,0,4,true,true,"开启任务"),
		[8] = 资源:载入('common/item.wdf',"网易WDF动画",0x117e34bd),  --一斛珠
		[9] = 资源:载入('common/item.wdf',"网易WDF动画",0xa59f38ee),    --五更寒
		[10] = 资源:载入('common/item.wdf',"网易WDF动画",0x99638335),  --双城记
		[11] = 按钮.创建(资源:载入('common/wzife.wdf',"网易WDF动画",0x89b1be35)),
		[12] = 资源:载入('common/item.wdf',"网易WDF动画",0xa59f38ee),--敬请关注 无相菩提
	}
	self.资源组[3]:绑定窗口_(self.ID)
	self.资源组[4]:绑定窗口_(self.ID)
	self.资源组[6]:绑定窗口_(self.ID)
	for i=7,7 do
		self.资源组[i]:绑定窗口_(self.ID)
	end
end

function 交票界面:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"癫散班主")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	for i=7,7 do
		self.资源组[i]:更新(x,y)
	end
	self.资源组[3]:更新(x,y)
	self.资源组[4]:更新(x,y)
	self.资源组[6]:更新(x,y)
	if self.资源组[2]:事件判断() then --关闭
		self:打开()
   	elseif self.资源组[3]:事件判断() then --一斛珠
        self.选中 = "一斛珠"
        self.状态=1
	elseif self.资源组[4]:事件判断() then
        self.选中 = "五更寒"
        self.状态=2
	elseif self.资源组[6]:事件判断() then
        self.选中 = "双城记"
        self.状态=3
	elseif self.资源组[7]:事件判断() then --[7]
		发送数据(99,{类型=self.选中})
		self:打开()
	end
    self.资源组[7]:显示(self.x+244,self.y+320) --按钮 --购买
	self.资源组[11].按钮.精灵:灰度级()
	self.资源组[12].精灵:灰度级()
    self.资源组[3]:显示(self.x+50,self.y+50,nil,nil,nil,self.选中 == "一斛珠",2)  --1号按钮
	self.资源组[4]:显示(self.x+170,self.y+50,nil,nil,nil,self.选中 == "五更寒",2)  --2号按钮
	self.资源组[6]:显示(self.x+290,self.y+50,nil,nil,nil,self.选中 == "双城记",2)--3号按钮
	--self.资源组[5]:置宽高(400,70)
	self.资源组[5]:显示(self.x+56,self.y+200)--白色背景
	self.资源组[8]:显示(self.x+70,self.y+70)
	self.资源组[9]:显示(self.x+190,self.y+70)
	self.资源组[10]:显示(self.x+310,self.y+70)
	self.资源组[11]:显示(self.x+410,self.y+50)
	self.资源组[12]:显示(self.x+430,self.y+70)
	zts:显示(self.x+73,self.y+145,"一斛珠")
	zts:显示(self.x+193,self.y+145,"五更寒")
	zts:显示(self.x+310,self.y+145,"双城记")
	zts:显示(self.x+430,self.y+145,"敬请期待")
	tp.物品格子背景_:显示(self.x+78,self.y+215)
	tp.物品格子背景_:显示(self.x+78+90*1,self.y+215)
	tp.物品格子背景_:显示(self.x+78+90*2,self.y+215)
	tp.物品格子背景_:显示(self.x+78+90*3,self.y+215)
	tp.物品格子背景_:显示(self.x+78+90*4,self.y+215)
	for i=1,#self.数据 do
		if self.数据[i].戏票[self.状态] == 1 then
			self.资源组[7+self.状态]:显示(self.x+78 + 90 * (i-1),self.y+215)
		end
		zts:置颜色(黑色)
		zts:显示(self.x+78 + 90 * (i-1),self.y+277,self.数据[i].名称)
	end
end

function 交票界面:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 交票界面:初始移动(x,y)
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

function 交票界面:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 交票界面