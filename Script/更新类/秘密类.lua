-- @Author: baidwwy
-- @Date:   2023-10-29 22:52:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-01 01:26:05
local 秘密类 = class()
local floor = math.floor
local ceil = math.ceil
local tp,zts,zts1
local insert = table.insert
local format = string.format
local 奖励物品 = {{名称="金砖",数量=1},{名称="特殊兽诀·碎片",数量=3},{名称="超级兽诀·碎片",数量=2},{名称="神兜兜",数量=10},{名称="修炼果",数量=10}}
local keyaz = 引擎.按键按住
local keyax = 引擎.按键按下

function 秘密类:初始化(根)
	self.ID = 690
	self.x = 170
	self.y = 97
	self.xx = 0
	self.yy = 0
	self.注释 = "秘密类"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 小型选项栏 = 根._小型选项栏
	local 滑块 = 根._滑块
	tp = 根
	self.资源组 = {
		[1] = 自适应.创建(0,1,627,465,3,9),
		[2] = 资源:载入("pic/回流3.png","图片"),
		[4] = 按钮.创建(自适应.创建(18,4,16,16,4,1),0,0,4,true,true),
		[5] = 按钮.创建(资源:载入('xsc1.wdf',"网易WDF动画",0x00000033),0,0,4,true,true,"加速服务"),
		[6] = 按钮.创建(资源:载入('xsc1.wdf',"网易WDF动画",0x00000033),0,0,4,true,true,"至尊月卡"),
		[7] = 按钮.创建(自适应.创建(12,4,108,22,1,3),0,0,4,true,true,"开通移动加速"),
		[8] = 按钮.创建(自适应.创建(12,4,108,22,1,3),0,0,4,true,true,"开启移动加速"),
		[9] = 按钮.创建(自适应.创建(12,4,108,22,1,3),0,0,4,true,true,"关闭移动加速"),
		--[10] = 按钮.创建(自适应.创建(12,4,108,22,1,3),0,0,4,true,true,"开通攻击加速"),
		--[11] = 按钮.创建(自适应.创建(12,4,108,22,1,3),0,0,4,true,true,"开启攻击加速"),
		--[12] = 按钮.创建(自适应.创建(12,4,108,22,1,3),0,0,4,true,true,"关闭攻击加速"),
		--[13] = 按钮.创建(自适应.创建(12,4,108,22,1,3),0,0,4,true,true,"开通施法加速"),
		--[14] = 按钮.创建(自适应.创建(12,4,108,22,1,3),0,0,4,true,true,"开启施法加速"),
		--[15] = 按钮.创建(自适应.创建(12,4,108,22,1,3),0,0,4,true,true,"关闭施法加速"),
		[16] = 按钮.创建(自适应.创建(12,4,102,22,1,3),0,0,4,true,true,"领取每日奖励"),
		[17] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"确定"),
		[18] =  自适应.创建(103,1,165,22,1,3,nil,18),
		[19] = 资源:载入("pic111/格子.png","图片"),
	}
	  self.资源组[6]:置偏移(28,4)
      self.资源组[5]:置偏移(28,4)
     for i=4,6 do
      self.资源组[i]:绑定窗口_(690)
     end
    self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('会员总控件')
	总控件:置可视(true,true)
	self.输入框 = 总控件:创建输入("卡号输入",0,0,200,14)
	self.输入框:置可视(false,false)
	self.输入框:置限制字数(20)
	self.输入框:置文本("")
	self.输入框:置光标颜色(0xFFFFFFFF)
	self.输入框:置文字颜色(0xFFFFFFFF)
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.普通字体
	self.窗口时间 = 0
	self.位置={}
	self.位置[1]={x=264-25,y=101-110+170}
	self.位置[2]={x=264-25+63,y=101-110+170}
	self.位置[3]={x=264-25+63*2,y=101-110+170}
	self.位置[4]={x=264-25+63*3,y=101-110+170}
	self.位置[5]={x=264-25+63*4,y=101-110+170}
	self.位置[6]={x=400-25,y=341-110}
end

function 秘密类:打开(数据)
	if self.可视 then
		self.分类 = nil
		self.可视 = false
		self.输入框:置焦点(false)
		self.输入框:置可视(false,false)
		self.分类 = 2

	else
		insert(tp.窗口_,self)
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
        self.分类 = 2
        self.数据=数据
        self.物品数据 = {}
      for n = 1, #奖励物品 do
	    local 物品资料数据=引擎.取物品(奖励物品[n].名称)
	    self.物品数据[n] = tp._物品格子.创建(0,0,i,"月卡系统")
	    self.物品数据[n]:置物品(奖励物品[n],"月卡系统")
	    self.物品数据[n].编号 = n
	    self.物品数据[n].名称=奖励物品[n].名称
	    self.物品数据[n].数量=奖励物品[n].数量
	    self.物品数据[n].大模型=tp.资源:载入(物品资料数据[11],"网易WDF动画",物品资料数据[13])
	    self.物品数据[n].介绍 = 物品资料数据[1]
	   end
end
end

function 秘密类:显示(dt,x,y)
	self.焦点 = false
	self.资源组[4]:更新(x,y)
	self.资源组[5]:更新(x,y,self.分类 ~= 1)
	self.资源组[6]:更新(x,y,self.分类 ~= 2)
    if self.资源组[4]:事件判断() then
		self:打开()
	elseif self.资源组[5]:事件判断() then
		self.分类 = 1
	elseif self.资源组[6]:事件判断() then
		self.分类 = 2
	end
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[4]:显示(self.x+607,self.y+4)
	self.资源组[2]:显示(self.x+6,self.y+53)
	self.资源组[5]:显示(self.x+1+6,self.y+23)
	self.资源组[6]:显示(self.x+125+7,self.y+23)
	tp.窗口标题背景_:显示(self.x-76+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2+10,self.y+3,"功能界面")
	if self.分类==1 then
		tp.字体表.通用字体14:置颜色(黑色):显示(self.x+228,self.y+104,"开通月卡可使用以下功能。")
		tp.字体表.通用字体14:置颜色(红色):显示(self.x+228,self.y+124+10,"(飞一般的速度，飒起来，超音速！！！)")
	--	tp.字体表.通用字体14:置颜色(红色):显示(self.x+228,self.y+222+30,"(由于超出负荷使武器过热，被禁止！！)")
	--	tp.字体表.通用字体14:置颜色(红色):显示(self.x+228,self.y+345+30,"(达咩，魔法打败魔法，违规被禁用！！)")
     --   tp.字体表.通用字体14:置颜色(黑色):显示(self.x+228,self.y+222,"开通月卡可使用以下功能。")
     --   tp.字体表.通用字体14:置颜色(黑色):显示(self.x+228,self.y+345,"开通月卡可使用以下功能。")
		self.资源组[7]:更新(x,y)
		self.资源组[8]:更新(x,y)
		self.资源组[9]:更新(x,y)
		-- self.资源组[10]:更新(x,y)
		-- self.资源组[11]:更新(x,y)
		-- self.资源组[12]:更新(x,y)
		 --self.资源组[13]:更新(x,y)
		-- self.资源组[14]:更新(x,y)
		 --self.资源组[15]:更新(x,y)
       --self.资源组[7]:显示(self.x+191,self.y+161)
        self.资源组[8]:显示(self.x+301-76,self.y+161)
        self.资源组[9]:显示(self.x+411-56,self.y+161)
		-- self.资源组[10]:更新(x,y)
		-- self.资源组[11]:更新(x,y)
		 --self.资源组[12]:更新(x,y)
       --self.资源组[10]:显示(self.x+191,self.y+291)
   --  self.资源组[11]:显示(self.x+301-76,self.y+291)
    -- self.资源组[12]:显示(self.x+411-56,self.y+291)
		-- self.资源组[13]:更新(x,y)
		-- self.资源组[14]:更新(x,y)
		-- self.资源组[15]:更新(x,y)
       --self.资源组[13]:显示(self.x+191,self.y+491-74)
     --self.资源组[14]:显示(self.x+301-76,self.y+491-74)
     --self.资源组[15]:显示(self.x+411-56,self.y+491-74)
    if self.资源组[7]:事件判断() then
		 发送数据()
	elseif self.资源组[8]:事件判断() then
		 发送数据(204)
	elseif self.资源组[9]:事件判断() then
		 发送数据(204.1)
	--elseif self.资源组[10]:事件判断() then
	--	 发送数据()
	--elseif self.资源组[11]:事件判断() then
	--	 发送数据(205)
	--elseif self.资源组[12]:事件判断() then
		-- 发送数据(205.1)
	--elseif self.资源组[13]:事件判断() then
		-- 发送数据()
	--elseif self.资源组[14]:事件判断() then
		-- 发送数据(206)
	--elseif self.资源组[15]:事件判断() then
		-- 发送数据(206.1)
	end
   elseif self.分类 == 2 then
          self.资源组[16]:更新(x,y,self.数据.生效 and os.time() - self.数据.到期时间 <= 10)
          self.资源组[16]:显示(self.x+365-25,self.y+393-110,true,true,nil)
	for i=1,5 do
	      self.资源组[19]:显示(self.x+200-25+i*63,self.y+270-110)
    end
    if self.数据.生效 and os.time() - self.数据.到期时间 <= 0 then
		tp.字体表.通用字体14:置颜色(绿色)
		tp.字体表.通用字体14:显示(self.x+225+162-25,self.y+170+163-110,"[生效中]")
	else
		tp.字体表.通用字体14:置颜色(红色)
		tp.字体表.通用字体14:显示(self.x+225+162-25,self.y+170+163-110,"[未生效]")
	end
	if self.数据.到期时间 ~= 0 then
		tp.字体表.通用字体14:置颜色(白色)
		tp.字体表.通用字体14:显示(self.x+322-25,self.y+215-110,"到期时间: ")
		tp.字体表.通用字体14:置颜色(红色)
		tp.字体表.通用字体14:显示(self.x+322+73-25,self.y+215-110,时间转换(self.数据.到期时间))
	end
        tp.字体表.通用字体14:置颜色(黑色):显示(self.x+284-25,self.y+240-110,"月卡特权: 购买月卡后每日可以领取奖励.")
	for n = 1, #self.物品数据, 1 do
		if self.物品数据[n] ~= nil then
			self.物品数据[n]:置坐标(self.x+self.位置[n].x,self.y+self.位置[n].y)
	        self.物品数据[n]:显示(dt,x,y,self.鼠标)
            tp.字体表.通用字体14:显示(self.x+self.位置[n].x+3,self.y+self.位置[n].y+3,self.物品数据[n].数量)
	        if self.物品数据[n].焦点 then
	        tp.提示:道具行囊(self.x+self.位置[n].x - 2, self.y+self.位置[n].y - 3,self.物品数据[n])
	        end
    	end
	       self.控件类:更新(dt,x,y)
	       self.控件类:显示(x,y)
	if (keyaz(KEY.CTRL) and keyax(KEY.V)) then
	       self.输入框:置文本(取剪贴板())
	end

		self.输入框:置可视(true,true)
		self.输入框:置坐标(self.x+225+111-25,self.y+170+188-110)
    if self.资源组[16]:事件判断() then
		 发送数据(208)
	end
end
end
end

function 秘密类:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 秘密类:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not 引擎.消息栏焦点 then
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
function 秘密类:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end
return 秘密类