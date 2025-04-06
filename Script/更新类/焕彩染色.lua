-- @Author: baidwwy
-- @Date:   2024-08-21 11:43:38
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-08-28 19:35:22
local 焕彩染色 = class()
local qmx = 引擎.取模型
local zqj = 引擎.坐骑库
local ani = 引擎.取战斗模型
local ceil = math.ceil
local tp,zts,zts1
local tos = 引擎.取摊位金钱颜色
local insert = table.insert
local 武器染色方案={
	[1]={方案={[1]=1,[2]=0},id=64},
	[2]={方案={[1]=1,[2]=0},id=0},
	[3]={方案={[1]=1,[2]=0},id=106},
	[4]={方案={[1]=1,[2]=0},id=77},
	[5]={方案={[1]=1,[2]=0},id=2051},
	[6]={方案={[1]=1,[2]=0},id=2065},
	[7]={方案={[1]=1,[2]=1},id=56},
	[9]={方案={[1]=1,[2]=0},id=67},
	[10]={方案={[1]=1,[2]=0},id=52},
	[11]={方案={[1]=1,[2]=1},id=107},
	[12]={方案={[1]=1,[2]=0},id=76},
	[13]={方案={[1]=1,[2]=0},id=2070},
	[14]={方案={[1]=0,[2]=1},id=2057},
	[16]={方案={[1]=2},id=119},
	[18]={方案={[1]=1,[2]=0},id=101},
	[20]={方案={[1]=2,[2]=0},id=2000},
	[21]={方案={[1]=5,[2]=0},id=2078},
	[22]={方案={[1]=5,[2]=0},id=2079},
	[23]={方案={[1]=1,[2]=0},id=2042},
	[24]={方案={[1]=1,[2]=1},id=90},
	[25]={方案={[1]=1,[2]=0},id=2071},

	[27]={方案={[1]=1,[2]=0},id=95},
	[28]={方案={[1]=1,[2]=1},id=55},
	[29]={方案={[1]=1,[2]=0},id=66},
	[30]={方案={[1]=4,[2]=0},id=20113},

	[33]={方案={[1]=1,[2]=0},id=98},
	[34]={方案={[1]=1,[2]=1},id=94},
	[35]={方案={[1]=1,[2]=1},id=59},
	[36]={方案={[1]=1,[2]=0},id=68},
	[37]={方案={[1]=1,[2]=0},id=78},
	[38]={方案={[1]=1,[2]=0},id=62},
	[39]={方案={[1]=1,[2]=0},id=103},
	[40]={方案={[1]=1,[2]=1},id=92},
	[41]={方案={[1]=0,[2]=3},id=20103},
	[42]={方案={[1]=1,[2]=0},id=65},
	[43]={方案={[1]=1,[2]=1},id=91},
	[44]={方案={[1]=1,[2]=0},id=97},
	[45]={方案={[1]=1,[2]=0},id=96},
	[46]={方案={[1]=1,[2]=1},id=88},
	[47]={方案={[1]=1,[2]=1},id=73},
	[48]={方案={[1]=3,[2]=0},id=20230},
	-- [49]={方案={[1]=0,[2]=0},id=152},
}

function 焕彩染色:初始化(根)
	self.ID = 120
	self.x = 183
	self.y = 125
	self.xx = 0
	self.yy = 0
	self.注释 = "焕彩染色"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 资源 = 根.资源
	tp = 根
	self.资源组 = {
		[1] = 自适应.创建(0,1,573,342,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),--关闭
		[3] = 按钮.创建(自适应.创建(12,4,75,22,1,3),0,0,4,true,true,"  还 原"),
		[4] = 按钮.创建(自适应.创建(12,4,118,22,1,3),0,0,4,true,true,"   确认修改"),
		[5] = 资源:载入('pic/huancai/bj.png',"图片"),
		[6] = 资源:载入('pic/huancai/kk.png',"图片"),
		[7] = 资源:载入('pic/huancai/发光.png',"图片"),
		[8] = 资源:载入('pic/huancai/RGB.png',"图片"),
		[9] = tp._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),1,171,33,1),
		[10] = tp._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),1,171,33,1),
		[11] = tp._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),1,171,33,1),
		[12] = 资源:载入('pic/huancai/R.png',"图片"),
		[13] = 资源:载入('pic/huancai/G.png',"图片"),
		[14] = 资源:载入('pic/huancai/B.png',"图片"),
		[15] = 按钮.创建(资源:载入('org3.rpk',"网易WDF动画",16777347),0,0,4,true,true),
		[16] = 按钮.创建(资源:载入('org3.rpk',"网易WDF动画",16777348),0,0,4,true,true),
		[17] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",3836804726),0,0,4,true,true),
		[18] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",723023243),0,0,4,true,true),

	}
	-- +723023243 3836804726
	-- +1615195723  1982884314
	--1  3258118059    4 3290175339  5 3234668119      按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",608120215),0,0,4,true) 转向
	for i=2,4 do
		self.资源组[i]:绑定窗口_(self.ID)
	end
	self.资源组[3]:置偏移(-3,0)
	for i=9,11 do
		self.资源组[i].滑块:置颜色(ARGB(150,255,255,255))
	end
	for i=15,18 do
		self.资源组[i]:绑定窗口_(self.ID)
	end

	self.窗口时间 = 0
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
	-- self.炫彩 = {}
	self.炫彩染色 = {}
	self.炫彩染色[1]={}
	self.炫彩染色[1][1]={R=0,G=0,B=0}
	self.炫彩染色[1][2]={R=0,G=0,B=0}
	self.炫彩染色[1][3]={R=0,G=0,B=0}
	self.炫彩染色[2]={}
	self.炫彩染色[2][1]={R=0,G=0,B=0}
	self.炫彩染色[2][2]={R=0,G=0,B=0}
	self.炫彩染色[2][3]={R=0,G=0,B=0}
	self.炫彩染色[3]={}
	self.炫彩染色[3][1]={R=0,G=0,B=0}
	self.炫彩染色[3][2]={R=0,G=0,B=0}
	self.炫彩染色[3][3]={R=0,G=0,B=0}
	self.位置=1
end

function 焕彩染色:打开(类型,认证码,模型,饰品,饰品颜色,bb) -- 服饰染色 召唤兽染色
	if self.可视 then
		self.彩果 = nil
		self.方向 = nil
		self.染色方案 = nil
		self.人物组 = nil
		self.染色组 = nil
		self.bb=nil
		self.模型 = nil
		self.认证 = nil
		self.饰品 = nil
		self.饰品颜色 = nil
		self.可视 = false
	else
		insert(tp.窗口_,self)
		self.方向 = 4
		self.类型=类型
		if self.类型=="角色焕彩" then
		    self:人物加载()
		elseif self.类型=="武器焕彩" then
		    self:人物武器加载()
		elseif self.类型=="坐骑焕彩" then
			self.模型 = 模型
			self.认证 = 认证码
			self.饰品 = 饰品
		    self:坐骑加载()
	    elseif self.类型=="召唤兽焕彩" then
	    	self.bb=bb
	    	self.模型 = bb.模型
		self.认证 = bb.认证码
		self.饰品 = bb.饰品
		self.饰品颜色 = bb.饰品颜色
		self.选中染色=0
		self.原来颜色=0
		self.染色组1=0
		self.染色组2=0
		 if bb.染色方案~=nil then
		        self.原来颜色=bb.染色方案
		    	self.染色组1=bb.染色组[1]
		    	self.染色组2=bb.染色组[2]
		end
		self:召唤兽加载()
	end
	tp.运行时间 = tp.运行时间 + 1
	self.窗口时间 = tp.运行时间
	self.可视 = true



	end
end

function 焕彩染色:人物加载()
	self.彩果 = 0
	self.人物组 = {}
	self.染色组 = {0,0,0}
	self.染色方案 = 0
	local 资源 = tp.资源
	local q = qmx(tp.队伍[1].模型)
	local 人物模型 = 资源:载入(q[3],"网易WDF动画",q[1])
	if tp.队伍[1].装备[3] ~= nil then
		local wq = nil
		local v = tp:取武器子类(tp.队伍[1].装备[3].子类)
		if tp.队伍[1].装备[3].名称 == "龙鸣寒水" or tp.队伍[1].装备[3].名称 == "非攻" then
			v = "弓弩1"
		end
		local q = qmx(tp.队伍[1].模型,v)
		人物模型 = 资源:载入(q[3],"网易WDF动画",q[1])
		local m = tp:取武器附加名称(tp.队伍[1].装备[3].子类,tp.队伍[1].装备[3].级别限制,tp.队伍[1].装备[3].名称)
		local x = qmx(m.."_"..tp.队伍[1].模型)
		local wq = 资源:载入(x[3],"网易WDF动画",x[1])
		wq:置差异(wq.帧数-人物模型.帧数)
		self.人物组[2] = wq
	end
	self.染色方案 = tp.队伍[1].染色方案
	self.染色组   = {0,0,0}
	self.初始染色组 = self.染色组
	self.人物组[1] = 人物模型
	--self:置角色染色()
	self:置方向()

	self.炫彩染色 = {}
	self.炫彩染色[1]={}
	self.炫彩染色[1][1]={R=0,G=0,B=0}
	self.炫彩染色[1][2]={R=0,G=0,B=0}
	self.炫彩染色[1][3]={R=0,G=0,B=0}
	self.炫彩染色[2]={}
	self.炫彩染色[2][1]={R=0,G=0,B=0}
	self.炫彩染色[2][2]={R=0,G=0,B=0}
	self.炫彩染色[2][3]={R=0,G=0,B=0}
	self.炫彩染色[3]={}
	self.炫彩染色[3][1]={R=0,G=0,B=0}
	self.炫彩染色[3][2]={R=0,G=0,B=0}
	self.炫彩染色[3][3]={R=0,G=0,B=0}
    self:置角色染色()
end

function 焕彩染色:人物武器加载()
    self.人物组 = {}
	local 资源 = tp.资源
	local q = qmx(tp.队伍[1].模型)
	local 人物模型 = 资源:载入(q[3],"网易WDF动画",q[1])
	if tp.队伍[1].装备[3] ~= nil then
		local wq = nil
		local v = tp:取武器子类(tp.队伍[1].装备[3].子类)
		if tp.队伍[1].装备[3].名称 == "龙鸣寒水" or tp.队伍[1].装备[3].名称 == "非攻" then
			v = "弓弩1"
		end
		local q = qmx(tp.队伍[1].模型,v)
		人物模型 = 资源:载入(q[3],"网易WDF动画",q[1])
		local m = tp:取武器附加名称(tp.队伍[1].装备[3].子类,tp.队伍[1].装备[3].级别限制,tp.队伍[1].装备[3].名称)
		local x = qmx(m.."_"..tp.队伍[1].模型)
		local wq = 资源:载入(x[3],"网易WDF动画",x[1])
		wq:置差异(wq.帧数-人物模型.帧数)
		self.人物组[2] = wq
	end

    	if tp.队伍[1].炫彩~=nil then
		if tp.队伍[1].染色方案 ~= nil and tp.队伍[1].炫彩组~=0 and tp.队伍[1].锦衣[1] == nil then
			人物模型:炫彩染色(tp.队伍[1].染色方案,tp.队伍[1].炫彩组)
		end
	else
		-- 人物模型:置角色染色(tp.队伍[1].染色方案,tp.队伍[1].染色组[1],tp.队伍[1].染色组[2],tp.队伍[1].染色组[3])
	end
	self.武器染色方案 = 3
	self.武器染色组 = {}
	self.人物组[1] = 人物模型
	self:置武器染色1()
	--self:置角色染色()
	self:置方向()

end

function 焕彩染色:坐骑加载()
	self.彩果 = 0
	self.人物组 = {}
	self.饰品组 = {}
	self.染色组 = {0,0,0}
	self.染色方案 = 0
	local 资源 = tp.资源
	local n = zqj(tp.队伍[1].模型,self.模型,self.饰品)

	self.人物组[1] = 资源:载入(n.坐骑资源,"网易WDF动画",n.坐骑站立)
	-- self.人物组[1]:置方向(0)
	if self.饰品 ~= nil then
		self.饰品组[1] = tp.资源:载入(n.坐骑饰品资源,"网易WDF动画",n.坐骑饰品站立)
		-- self.饰品组[1]:置方向(0)
	end
	self.炫彩染色 = {}
	self.炫彩染色[1]={}
	self.炫彩染色[1][1]={R=0,G=0,B=0}
	self.炫彩染色[1][2]={R=0,G=0,B=0}
	self.炫彩染色[1][3]={R=0,G=0,B=0}
	self.炫彩染色[2]={}
	self.炫彩染色[2][1]={R=0,G=0,B=0}
	self.炫彩染色[2][2]={R=0,G=0,B=0}
	self.炫彩染色[2][3]={R=0,G=0,B=0}
	self.炫彩染色[3]={}
	self.炫彩染色[3][1]={R=0,G=0,B=0}
	self.炫彩染色[3][2]={R=0,G=0,B=0}
	self.炫彩染色[3][3]={R=0,G=0,B=0}
	self.方向=0
	self:置方向()
	self:置坐骑染色()
end

function 焕彩染色:召唤兽加载()
	local 资源 = tp.资源

	self.动画 = {}
	local n = ani(self.模型)
	self.动画.主体 = tp.资源:载入(n[10],"网易WDF动画",n[6])
	self.动画.主体:置方向(0)
	n = ani(self.模型.."_身体")
	if n[6] ~= nil then
		self.动画.身体 = tp.资源:载入(n[10],"网易WDF动画",n[6])
		self.动画.身体:置方向(0)
	end
	if self.饰品 ~= nil then
		n = ani(self.模型.."_饰品")
		if n[6] ~= nil then
			self.动画.饰品 = tp.资源:载入(n[10],"网易WDF动画",n[6])
			if 饰品颜色~=nil then
			    self.动画.饰品:置颜色(饰品颜色,-1)
			end
			self.动画.饰品:置方向(0)
		end
	else
		n = ani(self.模型.."_装饰")
		if n[6] ~= nil then
			self.动画.饰品 = tp.资源:载入(n[10],"网易WDF动画",n[6])
			self.动画.饰品:置方向(0)
		end
	end



	-- if 染色信息[self.模型]~= nil then
	-- 	self.染色方案 = 染色信息[self.模型].id
	-- else
	--     	self.染色方案 = 702
	-- end
	-- self.染色组   = {0,0,0}
	-- self.炫彩染色 = {}
	-- self.炫彩染色[1]={}
	-- self.炫彩染色[1][1]={R=0,G=0,B=0}
	-- self.炫彩染色[1][2]={R=0,G=0,B=0}
	-- self.炫彩染色[1][3]={R=0,G=0,B=0}
	-- self.炫彩染色[2]={}
	-- self.炫彩染色[2][1]={R=0,G=0,B=0}
	-- self.炫彩染色[2][2]={R=0,G=0,B=0}
	-- self.炫彩染色[2][3]={R=0,G=0,B=0}
	-- self.炫彩染色[3]={}
	-- self.炫彩染色[3][1]={R=0,G=0,B=0}
	-- self.炫彩染色[3][2]={R=0,G=0,B=0}
	-- self.炫彩染色[3][3]={R=0,G=0,B=0}
	self:置宝宝染色()
end

function 焕彩染色:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y)
	self.资源组[4]:更新(x,y)
	self.资源组[15]:更新(x,y)
	self.资源组[16]:更新(x,y)
	if self.资源组[2]:事件判断() then
		self:打开()
		return false
	elseif self.资源组[4]:事件判断() then
		if self.类型=="角色焕彩" then
			发送数据(46,{炫彩=self.炫彩染色})
		elseif self.类型=="坐骑焕彩" then
			发送数据(67,{认证码=self.认证,染色id=self.染色方案,炫彩=self.炫彩染色})
		elseif self.类型=="召唤兽焕彩" then
			发送数据(5015,{序列=self.认证,序列1=self.bb.染色方案,序列2=self.bb.染色组[1],序列3=self.bb.染色组[2],序列4=self.bb.染色组[3]})
			-- 发送数据(47,{认证码=self.认证,染色id=self.染色方案,炫彩=self.炫彩染色})
		elseif self.类型=="武器焕彩" then
			if self.武器染色组[1]~=nil and self.人物组[2] then
				发送数据(3816,{序列=self.武器染色方案,序列1=self.武器染色组[1],序列2=self.武器染色组[2]})
			end
		end
	elseif self.资源组[3]:事件判断() then
		if self.类型=="角色焕彩" then
			local 事件 = function()
				发送数据(47,{shij="角色焕彩"})
			end
			tp.窗口.文本栏:载入("还原#R角色焕彩#W后将会清空你之前的焕彩方案，确定还原焕彩？",nil,true,事件)
		elseif self.类型=="坐骑焕彩" then
			local 事件 = function()
				发送数据(47,{shij="坐骑焕彩",认证码=self.认证})
			end
			tp.窗口.文本栏:载入("还原#R坐骑焕彩#W后将会清空你之前的焕彩方案，确定还原焕彩？",nil,true,事件)
			-- tp.窗口.对话栏:文本("","","还原#R坐骑焕彩#W后将会清空你之前的焕彩方案，确定还原焕彩？",{"确定还原坐骑焕彩","我点错了"})
		elseif self.类型=="召唤兽焕彩" then
			local 事件 = function()
				发送数据(47,{shij="召唤兽焕彩",认证码=self.认证})
			end
			tp.窗口.文本栏:载入("还原#R召唤兽焕彩#W后将会清空你之前的焕彩方案，确定还原焕彩？",nil,true,事件)
			-- tp.窗口.对话栏:文本("","","还原#R召唤兽焕彩#W后将会清空你之前的焕彩方案，确定还原焕彩？",{"确定还原召唤兽焕彩","我点错了"})
		-- elseif self.类型=="武器焕彩" then
		-- 	tp.窗口.对话栏:文本("","","还原#R武器焕彩#W后将会清空你之前的焕彩方案，确定还原焕彩？",{"确定还原武器焕彩","我点错了"})
		end
		-- self:打开()
		-- return false
		-- self.炫彩染色 = {}
		-- self.炫彩染色[1]={}
		-- self.炫彩染色[1][1]={R=0,G=0,B=0}
		-- self.炫彩染色[1][2]={R=0,G=0,B=0}
		-- self.炫彩染色[1][3]={R=0,G=0,B=0}
		-- self.炫彩染色[2]={}
		-- self.炫彩染色[2][1]={R=0,G=0,B=0}
		-- self.炫彩染色[2][2]={R=0,G=0,B=0}
		-- self.炫彩染色[2][3]={R=0,G=0,B=0}
		-- self.炫彩染色[3]={}
		-- self.炫彩染色[3][1]={R=0,G=0,B=0}
		-- self.炫彩染色[3][2]={R=0,G=0,B=0}
		-- self.炫彩染色[3][3]={R=0,G=0,B=0}
	 --    self:置角色染色()
	end
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
	self.资源组[5]:显示(self.x+11,self.y+29)
	self.资源组[3]:显示(self.x+306,self.y+297)
	self.资源组[4]:显示(self.x+397,self.y+297)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,self.类型)
	if self.类型=="角色焕彩" then
		self.人物组[1]:更新(dt)
		self.资源组[12]:显示(self.x+262,self.y+70)
		self.资源组[13]:显示(self.x+262,self.y+74+44)
		self.资源组[14]:显示(self.x+262,self.y+78+44+44)
		self.资源组[15]:显示(self.x+35+12,self.y+260)
		self.资源组[16]:显示(self.x+142+12,self.y+260)
		self.资源组[9]:显示(self.x + 331-8,self.y + 207+110-235-13-4,x,y,self.鼠标)
		self.资源组[10]:显示(self.x + 331-8,self.y + 207+110-235-13-4+48,x,y,self.鼠标)
		self.资源组[11]:显示(self.x + 331-8,self.y + 207+110-235-13-4+48+48,x,y,self.鼠标)
		if self.资源组[9].接触 then
			self.炫彩染色[self.位置][1].B = ceil(510*self.资源组[9]:取百分比())
			self:置角色染色()
			self.焦点 = true
		elseif self.资源组[10].接触 then
			self.炫彩染色[self.位置][2].R = ceil(510*self.资源组[10]:取百分比())
			self:置角色染色()
			self.焦点 = true
		elseif self.资源组[11].接触 then
			self.炫彩染色[self.位置][3].B = ceil(510*self.资源组[11]:取百分比())
			self:置角色染色()
			self.焦点 = true
		end
		zts:置颜色(tos(tp.金钱)):显示(self.x + 343,self.y + 232,tp.金钱)
		zts:置颜色(黑色)
		zts:显示(self.x + 343,self.y + 266,5000000)
		zts:显示(self.x+289,self.y+39,"角 色")
		zts:置颜色(红色):显示(self.x+307,self.y+82-4,"R")
		zts:置颜色(绿色):显示(self.x+307,self.y+82+44,"G")
		zts:置颜色(0xFF0066FF):显示(self.x+307,self.y+82+44+44+4,"B")
	    zts:置样式(1)
	    zts:置颜色(白色)
	    zts:显示(self.x+292,self.y+232,"我的银两")
	    zts:显示(self.x+292,self.y+266,"需要银两")
		zts:显示(self.x+529,self.y+82-4, ceil(self.炫彩染色[self.位置][1].B/2))
		zts:显示(self.x+529,self.y+82+44, ceil(self.炫彩染色[self.位置][2].R/2))
		zts:显示(self.x+529,self.y+82+44+44+4, ceil(self.炫彩染色[self.位置][3].B/2))
		zts:置样式(0)
	    tp.影子:显示(self.x+128-10,self.y+310-44)
		self.人物组[1]:显示(self.x+128-10,self.y+310-44)
		if self.人物组[2] ~= nil then
			self.人物组[2]:更新(dt)
			self.人物组[2]:显示(self.x+128-10,self.y+310-44)
		end
		if self.资源组[15]:事件判断() then
		    self.方向 = self.方向 + 1
			if self.方向 >7 then
				self.方向 = 0
			end
			self:置方向()
		elseif self.资源组[16]:事件判断() then
		    self.方向 = self.方向 - 1
			if self.方向 <0 then
				self.方向 = 7
			end
			self:置方向()
		end

	elseif self.类型=="武器焕彩" then
		self.人物组[1]:更新(dt)
		zts:显示(self.x+289,self.y+39,"武 器")
		self.资源组[6]:显示(self.x+262-212,self.y+74+12-33)
		self.资源组[8]:显示(self.x+262,self.y+74+12)
		self.资源组[15]:显示(self.x+35+12,self.y+260)
		self.资源组[16]:显示(self.x+142+12,self.y+260)
		self.资源组[9]:显示(self.x + 331-8,self.y + 207+110-235-13-4+15,x,y,self.鼠标)
		if self.资源组[9].接触 then
			local 百分百 = ceil(49*self.资源组[9]:取百分比())
			if 武器染色方案[百分百] then
			    self.武器染色方案=武器染色方案[百分百].id
			    self.武器染色组[1]=武器染色方案[百分百].方案[1]
			    self.武器染色组[2]=武器染色方案[百分百].方案[2]
			end
			self:置武器染色2()
			self.焦点 = true
		end
        zts:置颜色(tos(tp.金钱)):显示(self.x + 343,self.y + 232,tp.金钱)
		zts:置颜色(黑色)
		zts:显示(self.x + 343,self.y + 266,5000000)
		zts:置样式(1)
	    zts:置颜色(白色)
	    zts:显示(self.x+292,self.y+232,"我的银两")
	    zts:显示(self.x+292,self.y+266,"需要银两")
	    zts:显示(self.x+529,self.y+94, ceil(255*self.资源组[9]:取百分比()))
	    zts:置样式(0)
		tp.影子:显示(self.x+128-10,self.y+310-44)
		self.人物组[1]:显示(self.x+128-10,self.y+310-44)
		if self.人物组[2] ~= nil then
			self.人物组[2]:更新(dt)
			self.人物组[2]:显示(self.x+128-10,self.y+310-44)
		end
		if self.资源组[15]:事件判断() then
		    self.方向 = self.方向 + 1
			if self.方向 >7 then
				self.方向 = 0
			end
			self:置方向()
		elseif self.资源组[16]:事件判断() then
		    self.方向 = self.方向 - 1
			if self.方向 <0 then
				self.方向 = 7
			end
			self:置方向()
		end
	elseif self.类型=="坐骑焕彩" then
		self.人物组[1]:更新(dt)
		self.资源组[12]:显示(self.x+262,self.y+70)
		self.资源组[13]:显示(self.x+262,self.y+74+44)
		self.资源组[14]:显示(self.x+262,self.y+78+44+44)
		self.资源组[15]:显示(self.x+35+12,self.y+260)
		self.资源组[16]:显示(self.x+142+12,self.y+260)
		self.资源组[9]:显示(self.x + 331-8,self.y + 207+110-235-13-4,x,y,self.鼠标)
		self.资源组[10]:显示(self.x + 331-8,self.y + 207+110-235-13-4+48,x,y,self.鼠标)
		self.资源组[11]:显示(self.x + 331-8,self.y + 207+110-235-13-4+48+48,x,y,self.鼠标)
		if self.资源组[9].接触 then
			self.炫彩染色[self.位置][1].R = ceil(510*self.资源组[9]:取百分比())
			self:置角色染色()
			self.焦点 = true
		elseif self.资源组[10].接触 then
			self.炫彩染色[self.位置][2].B = ceil(510*self.资源组[10]:取百分比())
			self:置角色染色()
			self.焦点 = true
		elseif self.资源组[11].接触 then
			self.炫彩染色[self.位置][3].B = ceil(510*self.资源组[11]:取百分比())
			self:置角色染色()
			self.焦点 = true
		end
		zts:置颜色(tos(tp.金钱)):显示(self.x + 343,self.y + 232,tp.金钱)
		zts:置颜色(黑色)
		zts:显示(self.x + 343,self.y + 266,5000000)
		zts:显示(self.x+289,self.y+39,"坐 骑")
		zts:置颜色(红色):显示(self.x+307,self.y+82-4,"R")
		zts:置颜色(绿色):显示(self.x+307,self.y+82+44,"G")
		zts:置颜色(0xFF0066FF):显示(self.x+307,self.y+82+44+44+4,"B")
	    zts:置样式(1)
	    zts:置颜色(白色)
	    zts:显示(self.x+292,self.y+232,"我的银两")
	    zts:显示(self.x+292,self.y+266,"需要银两")
		zts:显示(self.x+529,self.y+82-4, ceil(self.炫彩染色[self.位置][1].R/2))
		zts:显示(self.x+529,self.y+82+44, ceil(self.炫彩染色[self.位置][2].B/2))
		zts:显示(self.x+529,self.y+82+44+44+4, ceil(self.炫彩染色[self.位置][3].B/2))
		zts:置样式(0)
		tp.影子:显示(self.x+128-10,self.y+310-44-15)
		self.人物组[1]:显示(self.x+128-10,self.y+310-44-15)
		if self.饰品 ~= nil then
			self.饰品组[1]:更新(dt)
			self.饰品组[1]:显示(self.x+128-10,self.y+310-44-15)
		end

		if self.资源组[15]:事件判断() then
		    self.方向 = self.方向 + 1
			if self.方向 >7 then
				self.方向 = 0
			end
			self:置坐骑方向()
		elseif self.资源组[16]:事件判断() then
		    self.方向 = self.方向 - 1
			if self.方向 <0 then
				self.方向 = 7
			end
			self:置坐骑方向()
		end
	elseif self.类型=="召唤兽焕彩" then
		self.资源组[17]:更新(x,y)
		self.资源组[18]:更新(x,y)
		self.资源组[12]:显示(self.x+262,self.y+70+44)
		-- self.资源组[13]:显示(self.x+262,self.y+74+44)
		-- self.资源组[14]:显示(self.x+262,self.y+78+44+44)
		-- self.资源组[15]:显示(self.x+35+12,self.y+260)
		-- self.资源组[16]:显示(self.x+142+12,self.y+260)
		self.资源组[9]:显示(self.x + 331-8,self.y + 207+110-235-13-4+44,x,y,self.鼠标)
		-- self.资源组[10]:显示(self.x + 331-8,self.y + 207+110-235-13-4+48,x,y,self.鼠标)
		-- self.资源组[11]:显示(self.x + 331-8,self.y + 207+110-235-13-4+48+48,x,y,self.鼠标)
		self.资源组[17]:显示(self.x+262+90,self.y+156)
		self.资源组[18]:显示(self.x+262+175,self.y+156)
		if self.资源组[9].接触 then
			local num=ceil(510*self.资源组[9]:取百分比())
			self.炫彩染色[self.位置][1].B = num
			self.选中染色=ceil(num/7)
			self:置宝宝染色()
			self.焦点 = true
		elseif  self.资源组[17]:事件判断() then ---
			self.选中染色=self.选中染色-1
			if self.选中染色<0 then
			    self.选中染色=0
			end
			-- local num =self.选中染色*7
			-- if num<0 then
			--     num=0
			-- end
			-- self.炫彩染色[self.位置][1].B = num
			self:置宝宝染色()
		elseif  self.资源组[18]:事件判断() then --- +
			self.选中染色=self.选中染色+1
			if self.选中染色>=77 then
			    self.选中染色=77
			end
			-- local num =self.选中染色*7
			-- if num>=255 then
			--     num=255
			-- end
			-- self.炫彩染色[self.位置][1].B = num
			self:置宝宝染色()
		-- elseif  self.资源组[3]:事件判断() then --- 还原
		-- 	self.选中染色=0
		-- 	self:置宝宝染色()

		end
		zts:置颜色(tos(tp.金钱)):显示(self.x + 343,self.y + 232,tp.金钱)
		zts:置颜色(黑色)
		zts:显示(self.x + 343,self.y + 266,5000000)
		zts:显示(self.x+289,self.y+39,"幻 兽")
		zts:置颜色(红色):显示(self.x+87+311,self.y+85-4,"R")
		zts:置颜色(绿色):显示(self.x+87+311+11,self.y+85-4,"G")
		zts:置颜色(0xFF0066FF):显示(self.x+87+311+11*2,self.y+85-4,"B")
		zts:置样式(1)
		zts:置颜色(白色)
		zts:显示(self.x+292,self.y+232,"我的银两")
		zts:显示(self.x+292,self.y+266,"需要银两")
		zts:显示(self.x+529,self.y+82+40, self.选中染色)
		zts:置样式(0)
		tp.影子:显示(self.x+118,self.y+266)
		if self.动画.主体 ~= nil then
			tp.影子:显示(self.x+118,self.y+266)
			self.动画.主体:更新(dt)
			self.动画.主体:显示(self.x+118,self.y+266)
			if self.动画.身体 ~= nil then
				self.动画.身体:更新(dt)
				self.动画.身体:显示(self.x+118,self.y+266)
			end
			if self.动画.饰品 ~= nil then
				self.动画.饰品:更新(dt)
				self.动画.饰品:显示(self.x+118,self.y+266)
			end
		end
		if self.资源组[15]:事件判断() then
		    self.方向 = self.方向 + 1
			if self.方向 >3 then
				self.方向 = 0
			end
			self:置宝宝方向()
		elseif self.资源组[16]:事件判断() then
			self.方向 = self.方向 - 1
			if self.方向 <0 then
				self.方向 = 3
			end
			self:置宝宝方向()
		end

	end
end


function 焕彩染色:置方向()
	self.人物组[1]:置方向(self.方向)
	if self.人物组[2] ~= nil then
		self.人物组[2]:置方向(self.方向)
	end
end
function 焕彩染色:置角色染色()
	self.人物组[1]:炫彩染色(self.染色方案,self.炫彩染色)
	self:置方向()
end

function 焕彩染色:置宝宝染色()
	if self.动画.主体 ~= nil then
		-- self.动画.主体:炫彩染色(self.染色方案,self.炫彩染色)
		-- self.动画.主体:置方向()
		-- if self.动画.身体 ~= nil then
		-- 	self.动画.身体:炫彩染色(self.染色方案,self.炫彩染色)
		-- 	self.动画.身体:置方向()
		-- end
		-- if self.动画.饰品 ~= nil then
		-- 	self.动画.饰品:置方向(self.方向)
		-- end
		-- self.动画.主体:置染色(self.bb.染色方案,self.bb.染色组[1],self.bb.染色组[2],self.bb.染色组[3],0)
		-- if self.动画.身体 ~= nil then
		-- 	self.动画.身体:置染色(self.bb.染色方案,self.bb.染色组[1],self.bb.染色组[2],self.bb.染色组[3],0)
		-- 	self.动画.身体:置方向()
		-- end
		-- if self.动画.饰品 ~= nil then
		-- 	self.动画.饰品:置方向(self.方向)
		-- end
		if self.bb.染色方案 ~= nil then
			if self.bb.染色方案 == "黑白" then
				self.动画.主体:置染色("黑白",ARGB(255,235,235,235))
				self.动画.主体:置方向(方向)
				if self.bb.饰品 ~= nil then
					self.动画.饰品:置染色("黑白",ARGB(255,185,185,185))
					self.动画.饰品:置方向(方向)
				end
			else
				if self.选中染色~=0 then
					    self.bb.染色方案=Rranse[self.选中染色].id
					    self.bb.染色组[1]=Rranse[self.选中染色].方案[1]
					    self.bb.染色组[2]=Rranse[self.选中染色].方案[2]
					    self.动画.主体:置染色(self.bb.染色方案,self.bb.染色组[1],self.bb.染色组[2],self.bb.染色组[3])
					 self.动画.主体:置方向(方向)
					-- tp.窗口.召唤兽属性栏:刷新1()
				else
					self.bb.染色方案=self.原来颜色
					self.bb.染色组[1]=self.bb.染色组1
					self.bb.染色组[2]=self.bb.染色组2
					self.动画.主体:置染色(self.bb.染色方案,self.bb.染色组[1],self.bb.染色组[2],self.bb.染色组[3])
					self.动画.主体:置方向(方向)
				end
			end
		else
			if self.bb.染色方案==nil then
				self.bb.染色组={}
				self.bb.染色方案=0
				self.bb.染色组[1]=0
				self.bb.染色组[2]=0
			end
			self.bb.染色方案=702 --0
			self.bb.染色组[1]=0
			self.bb.染色组[2]=0
			if self.选中染色~=0 then
				self.bb.染色方案=Rranse[self.选中染色].id
				self.bb.染色组[1]=Rranse[self.选中染色].方案[1]
				self.bb.染色组[2]=Rranse[self.选中染色].方案[2]
				self.动画.主体:置染色(self.bb.染色方案,self.bb.染色组[1],self.bb.染色组[2],self.bb.染色组[3])
				self.动画.主体:置方向(方向)
			end
		end
	end
end
function 焕彩染色:置宝宝方向()
	if self.动画.主体 ~= nil then
		self.动画.主体:置方向(self.方向)
		if self.动画.身体 ~= nil then
			self.动画.身体:置方向(self.方向)
		end
		if self.动画.饰品 ~= nil then
			self.动画.饰品:置方向(self.方向)
		end
	end
end
function 焕彩染色:置坐骑方向()
	self.人物组[1]:置方向(self.方向)
	if self.饰品组[1] ~= nil then
		self.饰品组[1]:置方向(self.方向)
	end
end
function 焕彩染色:置坐骑染色()
	self.人物组[1]:炫彩染色(self.染色方案,self.炫彩染色)
	self.人物组[1]:置方向()
	if self.饰品组[1] ~= nil then
		self.饰品组[1]:置方向(self.方向)
	end
end

function 焕彩染色:置武器染色1()
	if self.人物组[2] then
		self.人物组[2]:炫彩染色(self.染色方案,self.炫彩染色)
		self:置方向()
	end
end

function 焕彩染色:置武器染色2()
	if self.人物组[2] then
		self.人物组[2]:置染色(self.武器染色方案,self.武器染色组[1],self.武器染色组[2],0)
		self:置方向()
	end

end

function 焕彩染色:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 焕彩染色:初始移动(x,y)
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

function 焕彩染色:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 焕彩染色