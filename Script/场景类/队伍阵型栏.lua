-- @Author: baidwwy
-- @Date:   2024-04-03 22:06:51
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-04-08 23:49:49
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2023-08-21 22:25:11
--======================================================================--
local 场景类_队伍阵型栏 = class()
local zts,zts1,tp
local insert = table.insert

function 场景类_队伍阵型栏:初始化(根)
	self.ID = 54
	self.x = 283
	self.y = 148
	self.xx = 0
	self.yy = 0
	self.注释 = "队伍阵型栏"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = false
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	self.阵法名称={
		[3]="普通",
		[4]="风扬阵",
		[5]="虎翼阵",
		[6]="天覆阵",
		[7]="云垂阵",
		[8]="鸟翔阵",
		[9]="地载阵",
		[10]="龙飞阵",
		[11]="蛇蟠阵",
		[12]="鹰啸阵",
		[13]="雷绝阵",
	}
	self.资源组 = {
		[1] = 自适应.创建(0,1,487,343,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[14] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"选定阵型"),
		[15] = 资源:载入('wzife.wdf',"网易WDF动画",0x0E43E0DF),
		[16] = 资源:载入('wzife.wd1',"网易WDF动画",0x57AD4C4E),
	}
	for n=3,13 do
      self.资源组[n]=按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,self.阵法名称[n])
      self.资源组[n]:置偏移(6,0)
	end
	for n=2,14 do
	   self.资源组[n]:绑定窗口_(self.ID)
	end
	self.阵型 = 3
	self.阵型偏移 = {}
	self.阵型偏移[self.阵型] = {}
	for n=1,5 do
		self.阵型偏移[self.阵型][n] = {0,0}
	end
	self.窗口时间 = 0
	tp = 根
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
	self.介绍文本 = 根._丰富文本(200,200,根.字体表.普通字体)
	self.阵型位置={}
	self.阵型位置.鸟翔阵={
		[1]={x=363,y=255},
		[2]={x=429,y=262},
		[3]={x=368,y=298},
		[4]={x=429,y=223},
		[5]={x=297,y=295},
		说明="全速型阵法，所有队员的速度大幅度提高。",
	}
	self.阵型位置.雷绝阵={
		[1]={x=429,y=312},
		[3]={x=433,y=264},
		[2]={x=365,y=299},
		[5]={x=404,y=246},
		[4]={x=333,y=284},
		说明="攻击型阵法，阵后三人固定攻击效果提升，阵前两人攻击效果提升，全队携带的召唤兽攻击效果提升。",
	}
	self.阵型位置.鹰啸阵={
		[4]={x=399,y=281},
		[5]={x=444,y=329},
		[3]={x=433,y=266},
		[2]={x=364,y=298},
		[1]={x=419,y=306},
		说明="攻击型阵法，两翼速度提高，阵前阵尾攻击效果提高，阵中物理防御效果提高。",
	}
	self.阵型位置.蛇蟠阵={
		[1]={x=400,y=287},
		[2]={x=367,y=302},
		[3]={x=430,y=274},
		[4]={x=331,y=276},
		[5]={x=433,y=317},
		说明="灵力型阵法，阵中及两侧抵御敌人法术的几率增加，阵前及阵尾攻击效果提高。",
	}
	self.阵型位置.龙飞阵={
		[1]={x=377,y=293},
		[2]={x=408,y=317},
		[3]={x=419,y=228},
		[4]={x=306,y=292},
		[5]={x=346,y=271},
		说明="全能型阵法，队长法术防御效果提高，阵尾物理防御效果提高，阵前中间队员攻击效果提高，左翼速度提高，右翼法术对敌伤害提高、速度降低。",
	}
	self.阵型位置.云垂阵={
		[1]={x=425,y=305},
		[2]={x=387,y=242},
		[3]={x=322,y=280},
		[4]={x=424,y=219},
		[5]={x=279,y=301},
		说明="防御型阵法，两翼队员速度提高，右肋防御效果提高，左肋攻击效果大幅度提高，阵尾防御效果大幅度提高，速度大幅度降低。",
	}
	self.阵型位置.风扬阵={
		[1]={x=399,y=282},
		[2]={x=433,y=264},
		[3]={x=365,y=299},
		[4]={x=404,y=246},
		[5]={x=333,y=284},
		说明="攻速型阵法，两翼速度效果提高，其余位置攻击效果提高。",
	}
	self.阵型位置.普通={
		[1]={x=357,y=255},
		[3]={x=324,y=273},
		[2]={x=389,y=240},
		[5]={x=291,y=292},
		[4]={x=422,y=226},
		说明="普通的一字阵形，没有特别的站位效果。",
	}
	self.阵型位置.天覆阵={
		[1]={x=379,y=278},
		[3]={x=324,y=273},
		[2]={x=389,y=240},
		[5]={x=291,y=292},
		[4]={x=422,y=226},
		说明="攻击型阵法，所有队员物理、法术攻击效果提高，速度下降。",
	}
	self.阵型位置.虎翼阵={
		[1]={x=426,y=299},
		[2]={x=429,y=262},
		[3]={x=368,y=298},
		[4]={x=429,y=223},
		[5]={x=297,y=295},
		说明="攻击型阵法，两翼攻击效果提高，中间防御效果提高，阵尾攻击效果大幅度提高。",
	}
	self.阵型位置.地载阵={
		[1]={x=399,y=281},
		[2]={x=373,y=256},
		[3]={x=433,y=266},
		[4]={x=364,y=298},
		[5]={x=419,y=306},
		说明="防御型阵法，阵中及两侧物理、法术防御效果提高，阵前攻击效果提高，阵后速度提高。",
	}
end

function 场景类_队伍阵型栏:打开(数据)
	if self.可视 then
		self.可视 = false
	else
		insert(tp.窗口_,self)
	    tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.阵型数据=数据
	end
end

function 场景类_队伍阵型栏:阵法偏移()
	if self.阵型 == 1 then
		self.阵型偏移 = {}
		self.阵型偏移[self.阵型] = {}
		for n=1,5 do
			self.阵型偏移[self.阵型][n] = {0,0}
		end
	elseif self.阵型 == 2 then
		self.阵型偏移 = {}
		self.阵型偏移[self.阵型] = {}
		for n=1,5 do
			self.阵型偏移[self.阵型][n] = {0,0}
		end
		self.阵型偏移[self.阵型][3] = {17,25}
	elseif self.阵型 == 5 then
		self.阵型偏移 = {}
		self.阵型偏移[self.阵型] = {}
		for n=1,5 do
			self.阵型偏移[self.阵型][n] = {0,0}
		end
		self.阵型偏移[self.阵型][3] = {52,48}
	elseif self.阵型 == 7 then
		self.阵型偏移 = {}
		self.阵型偏移[self.阵型] = {}
		for n=1,5 do
			self.阵型偏移[self.阵型][n] = {0,0}
		end
		self.阵型偏移[self.阵型][1] = {-18,0}
		self.阵型偏移[self.阵型][2] = {12,21}
		self.阵型偏移[self.阵型][3] = {44,42}
		self.阵型偏移[self.阵型][4] = {11,14}
		self.阵型偏移[self.阵型][5] = {-20,-16}
	end
end

function 场景类_队伍阵型栏:显示(dt,x,y)
	self.焦点 = false
	for n=2,14 do
		local w
		self.资源组[n]:更新(x,y,w)
	end
	if self.资源组[2]:事件判断() then
		self:打开()
		return false
	elseif self.资源组[14]:事件判断() then
	 --[[	if tp.阵型表[self.阵型][2] then
			tp.阵型 = self.阵型
		else
			tp.常规提示:打开("#Y/你还没有学会这个阵法")
		end --]]
	    if self.阵法名称[self.阵型]==nil then
	    	tp.常规提示:打开("#Y/请先选择一个阵法")
	    else
          发送数据(4009,{名称=self.阵法名称[self.阵型]})
	     end
	end
	for n=3,13 do
        if self.资源组[n]:事件判断() then
		    self.阵型 = n
		    self.介绍文本:清空()
            if self.阵型数据[self.阵法名称[n]]==nil then
              self.介绍文本:添加文本("#G/"..self.阵型位置[self.阵法名称[self.阵型]].说明.."#R/(你还不会这个阵法)")
            else
             self.介绍文本:添加文本("#G/"..self.阵型位置[self.阵法名称[self.阵型]].说明)
          	end
	    end
	end
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-76+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"阵型选择")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	self.资源组[16]:显示(self.x + 15,self.y + 85)
    	self.介绍文本:显示(556,180)
	self.资源组[3]:显示(self.x + 25,self.y + 37)
	self.资源组[4]:显示(self.x + 105,self.y + 37)
	self.资源组[5]:显示(self.x + 185,self.y + 37)
	self.资源组[6]:显示(self.x + 25,self.y + 68)
	self.资源组[7]:显示(self.x + 105,self.y + 68)
	self.资源组[8]:显示(self.x + 185,self.y + 68)
	self.资源组[9]:显示(self.x + 25,self.y + 99)
	self.资源组[10]:显示(self.x + 105,self.y + 99)
	self.资源组[11]:显示(self.x + 185,self.y + 99)
	self.资源组[12]:显示(self.x + 25,self.y + 130)
	self.资源组[13]:显示(self.x + 105,self.y + 130)
	self.资源组[14]:显示(self.x + 30,self.y + 288)
	for n=1,5 do
		--self.资源组[15]:显示(self.x + 159 + ((n-1)*33) + self.阵型偏移[self.阵型][n][1],self.y + 208 - ((n-1)*19) + self.阵型偏移[self.阵型][n][2])
		self.资源组[15]:显示(self.阵型位置[self.阵法名称[self.阵型]][n].x+133,self.阵型位置[self.阵法名称[self.阵型]][n].y+48)
		zts1:显示(self.阵型位置[self.阵法名称[self.阵型]][n].x+133,self.阵型位置[self.阵法名称[self.阵型]][n].y+48,n)
	end
	--if not tp.阵型表[self.阵型][2] then
	--	zts:置颜色(-65536)
	--	zts:显示(self.x + 300,self.y + 40,"你还没有学会这个阵法")
	--end
end

function 场景类_队伍阵型栏:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_队伍阵型栏:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if self.可视 and self.鼠标 and  not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_队伍阵型栏:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end
return 场景类_队伍阵型栏