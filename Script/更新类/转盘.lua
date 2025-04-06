--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2022-10-18 10:43:11
--======================================================================--
local 转盘 = class()
local bw = require("gge包围盒")(0,0,190,18)
local box = 引擎.画矩形
local format = string.format
local mouse = 引擎.鼠标弹起
local 字体
local tp,zts,zts1
local move = table.move
local insert = table.insert
local tos = 引擎.取金钱颜色
local mouseb = 引擎.鼠标弹起

local 物品位置 = {
	{x=160,y=12},
	{x=224,y=29},
	{x=275,y=70},
	{x=304,y=128},
	{x=304,y=192},
	{x=275,y=254},
	{x=224,y=296},
	{x=160,y=312},
	{x=96,y=296},
	{x=43,y=253},
	{x=16,y=192},
	{x=16,y=128},
	{x=40,y=70},
	{x=96,y=24}
}

function 转盘:初始化(根)
	self.ID = 135
	self.x = 0
	self.y = 0
	self.xx = 0
	self.yy = 0
	self.注释 = "转盘"
	self.窗口 = "转盘"
	self.点击类型 = "道具"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.当前窗口 = 1
	self.右键关闭 = 1
	self.运行状态 = 0
	self.最终位置 = 0
	self.结果 = 0;
	self.item = {}
	self.箭头控制 = 0
	self.箭头转动 = 0
	self.加入 = 0
	self.选中 = 0
	tp = 根
	字体 = tp.字体表.普通字体
	self.窗口时间 = 0
end

function 转盘:加载资源()
	local 资源 = tp.资源
	local 按钮 =  tp._按钮
	local 自适应 = tp._自适应
	self.资源组 = {
		[1] = 资源:载入('nice.wdf',"网易WDF动画",0x01BC5E01),
		[2] = 资源:载入('nice.wdf',"网易WDF动画",0x01BC5E04),
		[3] = 资源:载入('nice.wdf',"网易WDF动画",0x01BC5E05),
		[4] = 资源:载入('nice.wdf',"网易WDF动画",0x01BC5E06),
		[5] = 资源:载入('nice.wdf',"网易WDF动画",0x01BC5E07),
		[6] = 资源:载入('nice.wdf',"网易WDF动画",0x01BC5E08),
		[7] = 资源:载入('nice.wdf',"网易WDF动画",0x01BC5E09),
		[8] = 资源:载入('nice.wdf',"网易WDF动画",0x01BC5E10),
		[9] = 资源:载入('nice.wdf',"网易WDF动画",0x01BC5E11),
		[10] = 资源:载入('nice.wdf',"网易WDF动画",0x01BC5E12),
		[11] = 资源:载入('nice.wdf',"网易WDF动画",0x01BC5E13),
		[12] = 资源:载入('nice.wdf',"网易WDF动画",0x01BC5E14),
		[13] = 资源:载入('nice.wdf',"网易WDF动画",0x01BC5E15),
		[14] = 资源:载入('nice.wdf',"网易WDF动画",0x01BC5E16),
		[15] = 资源:载入('nice.wdf',"网易WDF动画",0x01BC5E17),
		[16] = 按钮.创建(自适应.创建(120,4,43,22,1,3),0,0,4,true,true,"开始"),--按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"开始"),
		[17] = 资源:载入('nice.wdf',"网易WDF动画",0x01BC5E02),
		[18] = 按钮.创建(自适应.创建(120,4,43,22,1,3),0,0,4,true,true,"停止"),--按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"停止"),
		[19] = 资源:载入('nice.wdf',"网易WDF动画",0x01BC5E03),--文字背景框
	}
end

function 转盘:打开(内容)
	if self.可视 then
		self.可视 = false
		self.资源组=nil
		return
	else
		insert(tp.窗口_,self)
		self:加载资源()
		self.x = (全局游戏宽度/2)-200
		self.y = (全局游戏高度/2)-240
		self.加入 = 0
		self.选中 = 0
		self.开始 = 1
		self.是否开始 = false
		self.是否结束 = false
		self.进程=0
	    self.位置=1
	    self.间隔=0
	    self.商品={}
	    self.起始=时间
	    self.速度=2
	    self.中奖=内容.道具.中奖
	    tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.秘宝宝箱 = 内容.秘宝宝箱 or nil
	    for n = 1, 14 do
			self.商品[n]={}
			local 资源=引擎.取物品(内容.道具[n].名称)
			self.商品[n].小动画=tp.资源:载入(资源[11],"网易WDF动画",资源[12])
			self.商品[n].大动画=tp.资源:载入(资源[11],"网易WDF动画",资源[13])
			self.商品[n].名称=内容.道具[n].名称
			self.商品[n].备注=内容.道具[n].备注
			self.商品[n].说明=内容.道具[n].说明
		end
	end
end




function 转盘:显示(dt,x,y)
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[19]:显示(self.x-50,self.y+368)
	self.资源组[16]:显示(self.x + 100,self.y + 425)
	self.资源组[16]:更新(x,y,self.是否开始==false)
	self.资源组[18]:显示(self.x + 210,self.y + 425)
	self.资源组[18]:更新(x,y,self.是否开始 and self.是否结束==false)
	for n=1,14 do
		self.商品[n].小动画:显示(self.x+物品位置[n].x,self.y+物品位置[n].y)
		if self.商品[n].小动画:是否选中(x,y) then
            tp.提示:商城提示(self.x + 物品位置[n].x ,self.y +物品位置[n].y,self.商品[n].名称,self.商品[n].说明,self.商品[n].大动画,self.商品[n].备注)
        end
	end

	字体:置颜色(白色)
	字体:显示(self.x-30, self.y+390,"点击")
	字体:置颜色(黄色)
	字体:显示(self.x, self.y+390,"“开始”")
	字体:置颜色(白色)
	字体:显示(self.x+55, self.y+390,"启动指针转动，点击")
	字体:置颜色(黄色)
	字体:显示(self.x+180, self.y+390,"“停止”")
	字体:置颜色(白色)
	字体:显示(self.x+235, self.y+390,"停止指针转动，")
	字体:置颜色(黄色)
	字体:显示(self.x+330, self.y+390,"指针所指")
	字体:置颜色(黄色)
	字体:显示(self.x-30, self.y+405,"就是亲爱的玩家朋友所获得的奖励哦。")
	字体:置颜色(白色)
	字体:显示(self.x+210, self.y+405,"快来试下运气吧！")
	if self.秘宝宝箱==nil then
	    字体:置颜色(红色)
	    字体:显示(self.x+320, self.y+405," (每次抽奖")
	    字体:显示(self.x-30, self.y+420,"消耗20点活跃积分)")
	    字体:置颜色(白色)
	end
	if self.资源组[16]:事件判断() and self.是否开始 == false then
		self.进程=1
		self.是否开始 = true
	end

	if self.进程==1 then
		self.间隔=self.间隔+1
		if self.间隔>=self.速度 then
			self.间隔=0
			self.位置=self.位置+1
			if self.位置==15 then self.位置=1 end
		end
		if self.资源组[18]:事件判断() and self.是否结束 == false then
			self.是否结束 = true
			self.进程=2
			self.起始=时间
		end
	elseif self.进程==2 then
		self.间隔=self.间隔+1
		if self.间隔>=self.速度 then
			self.间隔=0
			self.位置=self.位置+1
			if self.位置==15 then self.位置=1 end
		end
		if 时间>=self.起始+2 then
			self.进程=3
		end
	elseif self.进程==3 then
		local 距离=math.abs(self.位置-self.中奖)
		if 距离>=10 then
			self.速度=10
		elseif 距离>=6 then
			self.速度=20
		elseif 距离>=3 then
			self.速度=40
   		end
		self.间隔=self.间隔+1
		if self.间隔>=self.速度 then
			self.间隔=0
			self.位置=self.位置+1
			if self.位置==15 then self.位置=1 end
		end
		if self.位置==self.中奖 then
			self.进程=4
			self.起始=时间
			发送数据(95,{序号=self.中奖})
		end
   	elseif self.进程==4 and 时间>=self.起始+3 then
		self:打开()
		return
	end

	if self.位置 == 1 then
		self.资源组[2]:显示(self.x + 171,self.y + 75,true)
	elseif self.位置 == 2 then
	    self.资源组[3]:显示(self.x + 196,self.y + 85,true)
	elseif self.位置 == 3 then
	    self.资源组[4]:显示(self.x + 213,self.y + 113,true)
	elseif self.位置 == 4 then
	    self.资源组[5]:显示(self.x + 226,self.y + 150,true)
	elseif self.位置 == 5 then
	    self.资源组[6]:显示(self.x + 226,self.y + 185,true)
	elseif self.位置 == 6 then
	    self.资源组[7]:显示(self.x + 214,self.y + 205,true)
	elseif self.位置 == 7 then
	    self.资源组[8]:显示(self.x + 196,self.y + 220,true)
	elseif self.位置 == 8 then
	    self.资源组[9]:显示(self.x + 172,self.y + 228,true)
	elseif self.位置 == 9 then
	    self.资源组[10]:显示(self.x + 130,self.y + 219,true)
	elseif self.位置 == 10 then
	    self.资源组[11]:显示(self.x + 99,self.y + 204,true)
	elseif self.位置 == 11 then
	    self.资源组[12]:显示(self.x + 78,self.y + 186,true)
	elseif self.位置 == 12 then
	    self.资源组[13]:显示(self.x + 78,self.y + 151,true)
	elseif self.位置 == 13 then
	    self.资源组[14]:显示(self.x + 100,self.y + 112,true)
	elseif self.位置 == 14 then
	    self.资源组[15]:显示(self.x + 133,self.y + 86,true)
	end
end

function 转盘:检查点(x,y)
	if self.可视 and (self.资源组[1]:是否选中(x,y) or self.资源组[19]:是否选中(x,y))  then
		return true
	end
end

function 转盘:初始移动(x,y)

	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if self.鼠标 and not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end










function 转盘:开始移动(x,y)

	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 转盘