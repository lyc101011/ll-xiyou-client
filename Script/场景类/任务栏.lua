-- @Author: baidwwy
-- @Date:   2024-06-13 16:59:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-05 18:42:42
local 场景类_任务栏 = class()
local ceil = math.ceil
local bw = require("gge包围盒")(0,0,148,18)
local box = 引擎.画矩形
local insert = table.insert
local remove = table.remove
local tp,task,font
local floor = math.floor
local ceil = math.ceil
local min = math.min
local max = math.max
local mouseb = 引擎.鼠标弹起
local fb = {{"乌鸡国","#R/副本难度：低\n#L/找长安国子监吴举人进入副本\n#L/参加级别：≥50级"},
{"车迟斗法","#R/副本难度：低\n#L/找长寿村慧觉和尚进入副本\n#L/参加级别：≥60级"},
{"水陆大会","#R/副本难度：低\n#L/找化生寺疥癞和尚进入副本\n#L/参加级别：≥60级"},
{"通天河","#R/副本难度：高\n#L/找长寿村的蝴蝶女进入副本\n#L/参加级别：≥60级"},
-- {"一斛珠","#R/副本难度：高\n#L/找建邺城梨园小贩购票，建业癫散班主进入副本\n#L/消耗：癫散戏票·一斛珠\n#L/参加级别：≥60级"},
{"五更寒","#R/副本难度：高\n#L/找建邺城梨园小贩购票，建业癫散班主进入副本\n#L/消耗：癫散戏票·五更寒\n#L/参加级别：≥60级"},
{"双城记","#R/副本难度：高\n#L/找建邺城梨园小贩购票，建业癫散班主进入副本\n#L/消耗：癫散戏票·双城记\n#L/参加级别：≥60级"},
-- {"黑风山","#R/副本难度：高\n#L/找小二（大唐国境64,67）进入副本\n#L/参加级别：≥60级"},
{"红孩儿","#R/副本难度：高\n#L/找红孩儿麒麟山177，36进入副本\n#L/参加级别：≥60级"},
{"泾河龙王","#R/副本难度：高\n#L/找魏征（长安城皇宫-金銮殿70，52）进入副本\n#L/参加级别：≥60级"},
{"大闹天宫","#R/副本难度：高\n#L/找长寿村太白金星进入副本\n#N/参加级别：≥60级"},
{"秘境降妖","#R/副本难度：高\n#L/找长安城的御林军左统领进入副本\n#N/参加级别：≥60级"},
{"七绝山","#R/副本难度：高\n#L/找大唐境外牛将军进入副本\n#N/参加级别：≥60级"},
-- {"无底洞","#R/副本难度：高\n#L/找西凉女国慕容婆婆进入副本\n#N/参加级别：≥60级"},
-- {"天火之殇上","#R/副本难度：高\n#L/找傲来国民居的文老伯进入副本\n#N/参加级别：≥60级"},
{"天火之殇","#R/副本难度：高\n#L/找傲来国民居的文老伯进入副本\n#N/参加级别：≥60级"},
{"齐天大圣","#R/副本难度：高\n#L/找傲来国金毛猿进入副本\n#N/参加级别：≥60级"},
}

function 取剧情是否追踪(主线)
	local JQsj={0,0,25,55,75,80,85,135,155}
	if JQsj[主线] and tp.队伍[1].等级>=JQsj[主线] then
	    return true
	end
	return false
end
function 场景类_任务栏:初始化(根)
	self.ID = 4
	self.x = 313
	self.y = 125
	self.xx = 0
	self.yy = 0
	self.注释 = "任务栏"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 滑块 = 根._滑块
	local 自适应 = 根._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,420,362,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		-- [3] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),
		-- [4] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),
		-- [5] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),
		-- [6] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),
		[7] =  滑块.创建(自适应.创建(11,4,15,40,2,3,nil),1,14,237,2),
		[10] = 滑块.创建(自适应.创建(11,4,15,40,2,3,nil),1,14,237,2),
		[11] = 按钮.创建(自适应.创建(12,4,90,22,1,3),0,0,4,true,true," 已接任务"),
		[12] = 按钮.创建(自适应.创建(12,4,90,22,1,3),0,0,4,true,true," 副本介绍"),
		[13] = 按钮.创建(自适应.创建(12,4,90,22,1,3),0,0,4,true,true," 创建副本"),
		-- [14] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"取消创建"),
		[14] = 自适应.创建(37,1,1,1,3,nil),
		[15] = 自适应.创建(37,1,1,1,3,nil),
		[17] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true),--打勾框
	}
	self.资源组[2]:绑定窗口_(4)
	self.资源组[7]:绑定窗口_(4)
	self.资源组[10]:绑定窗口_(4)
	for n=11,13 do
		self.资源组[n]:绑定窗口_(4)
	end
	self.介绍文本 = 根._丰富文本(180,215)
	self.介绍文本:添加元素("ms",根.包子表情动画[85])
	self.介绍文本:置默认颜色(0xFF222222)
	self.选中 = 0
	self.加入 = 0
	self.介绍加入 = 0
	self.窗口时间 = 0
	self.状态 = 1
	task = 根.任务列表
	font = 根.字体表.普通字体
	tp = 根
end

function 场景类_任务栏:打开(数据)
	if self.可视 then
		self.选中 = 0
		self.副本加入=0
		self.加入 = 0
		self.介绍加入 = 0
		self.介绍文本:清空()
		self.可视 = false
	else
		self.副本加入=0
		insert(tp.窗口_,self)
		self.状态 = 1
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
		task={}
		if tp.剧情开关.任务追踪 then
			tp.窗口.任务追踪栏.task={}
		end
		if tp.队伍[1].剧情 ~= nil and 取剧情是否追踪(tp.队伍[1].剧情.主线) then--and tp.队伍[1].剧情.暂停==nil then
			数据[#数据+1] =tp:取剧情描述(tp.队伍[1].剧情.主线,tp.队伍[1].剧情.进度)
		end
		if tp.剧情开关.任务追踪 then
			tp.窗口.任务追踪栏.数据记录={}
			tp.窗口.任务追踪栏.介绍文本:清空()
		end
		-- if tp.队伍[1].国庆活动 ~= 0 or tp.队伍[1].国庆活动 ~= 18 then
		--   数据[#数据+1] =tp:取活动描述(1,tp.队伍[1].国庆活动)
		-- end
		-- if tp.队伍[1].中秋活动 ~= 0 or tp.队伍[1].中秋活动 ~= 18 then
		--  	数据[#数据+1] =tp:取活动描述(2,tp.队伍[1].中秋活动)
		-- end
		for n=1,#数据 do
			self:添加(数据[n][1],数据[n][2],数据[n][3],数据[n][4])
		end
	end
end

function 场景类_任务栏:添加(名称_,介绍_,描述_,取中间数据_)
	insert(task,{名称=名称_,介绍=介绍_,描述=描述_,取中间数据=取中间数据_})
	if self.选中 ~= 0 and task[self.选中] ~= nil and task[self.选中].名称 == 名称_ then
		self.介绍文本:清空()
		self.介绍文本:添加文本("#L/"..task[self.选中].介绍)
		if 描述_ ~= nil then
			self.介绍文本:添加文本("")
			self.介绍文本:添加文本("")
			self.介绍文本:添加文本("#ms")
			self.介绍文本:添加文本("#L/"..描述_)
		end
		for i=1,#self.介绍文本.显示表 - 13 do
			self.介绍文本:滚动(1)
		end
	end
	if #task > 11 and self.加入 ~= 0 then
		self.资源组[7]:置起始点(self.资源组[7]:取百分比转换(self.加入+1,11,#task))
		self.加入 = min(ceil((#task-11)*self.资源组[7]:取百分比()),#task-11)
	end
	if tp.剧情开关.任务追踪 then
		tp.窗口.任务追踪栏:刷新(名称_,介绍_,描述_,取中间数据_)
	end
end

function 场景类_任务栏:是否有该任务(名称)
	for i=1,#task do
		if task[i].名称 == 名称 then
			return true
		end
	end
	return false
end

function 场景类_任务栏:删除(名称)
	for i=1,#task do
		if task[i].名称 == 名称 then
			if #task > 12 then
				self.资源组[7]:置起始点(self.资源组[7]:取百分比转换(self.加入-1,11,#task))
				self.选中 = self.选中 - 1
			else
				self.选中 = max(self.选中 - 1,0)
				self.加入 = 0
			end
			if self.状态 == 1 and self.选中 ~= 0 and 名称 == task[self.选中].名称 then
				self.介绍文本:清空()
			end
			remove(task,i)
			break
		end
	end
	if tp.剧情开关.任务追踪 then
		tp.窗口.任务追踪栏:删除(名称)
	end
end

function 场景类_任务栏:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[11]:更新(x,y,self.状态~=1)
	self.资源组[12]:更新(x,y,self.状态~=2)
	if self.资源组[2]:事件判断() then
		self:打开()
		return false
	elseif self.资源组[11]:事件判断() or self.资源组[12]:事件判断()  then
		if self.状态 == 2 then
			self.状态 = 1
			bw:置宽高(148,18)
			self.介绍文本.宽度,self.介绍文本.默认宽度,self.介绍文本.高度 = 187,187,215
		else
			self.状态 = 2
			bw:置宽高(108,18)
			self.介绍文本.宽度,self.介绍文本.默认宽度,self.介绍文本.高度 = 205,205,215
		end
		self.选中 = 0
		self.加入 = 0
		self.介绍加入 = 0
		self.介绍文本:清空()
		self.资源组[10]:置起始点(0)
	end
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"任务提示")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	self.资源组[11]:显示(self.x + 13,self.y + 30,nil,nil,nil,self.状态==1,2)
	self.资源组[12]:显示(self.x + 110,self.y + 30,nil,nil,nil,self.状态==2,2)
	if self.状态 == 1 then
		self.资源组[15]:置宽高(175,263)
		self.资源组[15]:显示(self.x+13,self.y+63)
		self.资源组[15]:置宽高(212,263)
		self.资源组[15]:显示(self.x+195,self.y+63)
		font:置字间距(10)
		font:置颜色(白色)
		font:显示(self.x+52,self.y+68,"任务列表")
		font:显示(self.x+259,self.y+68,"任务详细")
		font:置字间距(0)
		font:显示(self.x+40,self.y+336,"开启任务追踪面板")
		if #task > 11 then
			self.资源组[7]:置高度(min(floor(199/(#task-11)),199-10))
			self.加入 = min(ceil((#task-11)*self.资源组[7]:取百分比()),#task-11)
			self.资源组[7]:显示(self.x + 163,self.y + 105,x,y,self.鼠标)
		end
		if #self.介绍文本.显示表 > 13 then
			self.资源组[10]:置高度(min(floor(199/(#self.介绍文本.显示表-13)),199-10))
			self.介绍加入 = min(ceil((#self.介绍文本.显示表-13)*self.资源组[10]:取百分比()),#self.介绍文本.显示表-13)
			self.介绍文本.加入 = self.介绍加入
			self.资源组[10]:显示(self.x + 383,self.y + 105,x,y,self.鼠标)
		end
		font:置颜色(0xFF222222)

		local wzzb = 0
		for n=1,11 do
			if((n + self.加入) <= (11 + self.加入)) and task[n + self.加入]~=nil and task[n + self.加入].名称~="摄妖香"then
				wzzb=wzzb+1
				bw:置坐标(self.x + 17,self.y + 89 + (wzzb-1)*19.5)
				if self.选中 ~= self.加入 + n then
					if bw:检查点(x,y) then
						box(self.x + 13,self.y + 93 + (wzzb-1)*19.5,self.x + 175,self.y + 93 + (wzzb-1)*19.5+18,-3551379)
						if mouseb(0) and self.鼠标 and not tp.消息栏焦点 then
							self.选中 = n + self.加入
							self.介绍文本:清空()
							self.介绍文本:添加文本("#L/"..task[self.选中].介绍)
							if task[self.选中].描述 ~= nil then
								self.介绍文本:添加文本("")
								self.介绍文本:添加文本("")
								self.介绍文本:添加文本("#ms")
								self.介绍文本:添加文本("#L/"..task[self.选中].描述)
							end
							for i=1,#self.介绍文本.显示表 - 13 do
								self.介绍文本:滚动(1)
							end
							self.资源组[10]:置起始点(0)
							self.介绍加入 = 0
						end
						self.焦点 = true
					end
				else
					local ys = -10790181
					if bw:检查点(x,y) then
						ys = -9670988
						self.焦点 = true
					end
					box(self.x + 13,self.y + 93 + (wzzb-1)*19.5,self.x + 175,self.y + 93 + (wzzb-1)*19.5+18,ys)
				end
				font:显示(self.x+30,self.y+95+(wzzb-1)*19.5,task[n + self.加入].名称)
			end
		end
		self.介绍文本:显示(self.x + 200,self.y + 95)
		self.资源组[17]:更新(x,y)
		if self.资源组[17]:事件判断() then
			tp.剧情开关.任务追踪 = not tp.剧情开关.任务追踪
		end
		self.资源组[17]:显示(self.x+13,self.y+332,true,nil,nil,tp.剧情开关.任务追踪,2)
	elseif self.状态 == 2 then
		self.资源组[14]:置宽高(175,263)
		self.资源组[14]:显示(self.x+13,self.y+63)
		self.资源组[15]:置宽高(212,263)
		self.资源组[15]:显示(self.x+195,self.y+63)
		font:置字间距(10)
		font:置颜色(白色)
		font:显示(self.x+52,self.y+68,"副本列表")
		font:显示(self.x+259,self.y+68,"副本详细")
		if #self.介绍文本.显示表 > 13 then
			self.资源组[10]:置高度(min(floor(237/(#self.介绍文本.显示表-13)),200))
			self.介绍加入 = min(ceil((#self.介绍文本.显示表-13)*self.资源组[10]:取百分比()),#self.介绍文本.显示表-13)
			self.介绍文本.加入 = self.介绍加入
			self.资源组[10]:显示(self.x + 396,self.y + 89,x,y,self.鼠标)
		end
		self.资源组[13]:更新(x,y,self.选中 ~= 0)
		-- self.资源组[14]:更新(x,y,tp.剧情开关.进入副本 ~= false)
		if self.资源组[13]:事件判断() then --创建副本
			tp.窗口.副本界面:打开()
			--self:副本解析(fb[self.选中][1])
		-- elseif self.资源组[14]:事件判断() then
			--tp.剧情开关.进入副本 = false
			--tp.常规提示:打开("#Y/你取消了副本任务")
			--tp.窗口.任务栏:删除("副本任务")
		elseif self.资源组[14]:是否选中(x,y)  then
		    if 引擎.取鼠标滚轮() ==1 and self.副本加入 > 0 and fb[self.副本加入+11-1]~=nil then--鼠标上滚动
			    self.副本加入 = self.副本加入 - 1
			elseif 引擎.取鼠标滚轮() ==-1 and fb[self.副本加入+11+1]~=nil then--鼠标下滚动
				self.副本加入 = self.副本加入 + 1
			end
		elseif self.资源组[15]:是否选中(x,y)  then
			if 引擎.取鼠标滚轮() ==1 and self.介绍加入 > 0 then--鼠标上滚动
			    self.资源组[10]:置起始点(self.资源组[10]:取百分比转换(self.介绍加入-1,13,#self.介绍文本.显示表))
			elseif 引擎.取鼠标滚轮() ==-1 and self.介绍加入 < #self.介绍文本.显示表 - 13 then--鼠标下滚动
				self.资源组[10]:置起始点(self.资源组[10]:取百分比转换(self.介绍加入+1,13,#self.介绍文本.显示表))
			end
		end
		font:置字间距(0)
		self.资源组[13]:显示(self.x+13,self.y+332)
		font:置颜色(0xFF222222)
		font:置字间距(1)
		for n=1,11 do   --这里是当前页面显示的行数
			bw:置坐标(self.x + 14,self.y + 91 + (n-1)*19.5)
			if self.选中 ~= self.加入 + n then
			if bw:检查点(x,y) then
					box(self.x + 13,self.y + 95 + (n-1)*19.5,self.x + 175,self.y + 95 + (n-1)*19.5+18,-3551379)
					if mouseb(0) and self.鼠标 and not tp.消息栏焦点 then
						self.选中 = n
						self.介绍文本:清空()
						self.介绍文本:添加文本(fb[self.选中+self.副本加入][2])
						for i=1,#self.介绍文本.显示表 - 13 do
							self.介绍文本:滚动(1)
						end
						self.资源组[10]:置起始点(0)
						self.介绍加入 = 0
					end
					self.焦点 = true
				end
			else
				local ys = -10790181
				if bw:检查点(x,y) then
					ys = -9670988
					self.焦点 = true
				end
				box(self.x + 13,self.y + 95 + (n-1)*19.5,self.x + 175,self.y + 95 + (n-1)*19.5+18,ys)
			end
			font:显示(self.x+30,self.y+97+(n-1)*19.5,fb[n+self.副本加入][1])
		end
		self.介绍文本:显示(self.x + 194,self.y + 98)
	end
	font:置字间距(0)
	if self.资源组[7].接触 or self.资源组[10].接触 then
		self.焦点 = true
	end
end

function 场景类_任务栏:副本解析(副本)
	if tp.剧情开关.进入副本 ~= false or tp.剧情开关.副本 ~= false then
		tp.常规提示:打开("#Y/你已经创建了一个副本了")
		return false
	end
	if 副本 == "乌鸡国" then
		tp.剧情开关.进入副本 = {"乌鸡国",100000,50,3}
		tp.常规提示:打开("#Y/你已经开启了乌鸡国副本任务，前往长安国子监书库吴举人处进入副本")
		tp.窗口.任务栏:添加("副本任务","你已经开启了乌鸡国副本任务，前往长安国子监书库吴举人处进入副本")
	elseif 副本 == "车迟斗法" then
		tp.剧情开关.进入副本 = {"车迟斗法",100000,50,3}
		tp.常规提示:打开("#Y/你已经开启了车迟斗法副本任务，前往长寿村慧觉和尚处进入副本")
		tp.窗口.任务栏:添加("副本任务","你已经开启了车迟斗法副本任务，前往长寿村慧觉和尚处进入副本")
	elseif 副本 == "水陆大会" then
		tp.剧情开关.进入副本 = {"水陆大会",100000,50,3}
		tp.常规提示:打开("#Y/你已经开启了水陆大会副本任务，前往化生寺疥癞和尚处进入副本")
		tp.窗口.任务栏:添加("副本任务","你已经开启了水陆大会副本任务，前往化生寺疥癞和尚处进入副本")
	elseif 副本 == "通天河" then
		tp.剧情开关.进入副本 = {"通天河",300000,60,3}
		tp.常规提示:打开("#Y/你已经开启了通天河副本任务，前往长寿村蝴蝶女处进入副本")
		tp.窗口.任务栏:添加("副本任务","你已经开启了通天河副本任务，前往长寿村蝴蝶女处进入副本")
	elseif 副本 == "黑风山" then
		tp.剧情开关.进入副本 = {"黑风山",300000,60,3}
		tp.常规提示:打开("#Y/你已经开启了黑风山副本任务，前往大唐国境小二处进入副本")
		tp.窗口.任务栏:添加("副本任务","你已经开启了通天河副本任务，前往大唐国境小二处进入副本")
	elseif 副本 == "黑风山" then
		tp.剧情开关.进入副本 = {"黑风山",300000,60,3}
		tp.常规提示:打开("#Y/你已经开启了黑风山副本任务，前往大唐国境小二处进入副本")
		tp.窗口.任务栏:添加("副本任务","你已经开启了通天河副本任务，前往大唐国境小二处进入副本")
	elseif 副本 == "大闹天宫" then
		tp.剧情开关.进入副本 = {"大闹天宫",300000,60,3}
		tp.常规提示:打开("#Y/你已经开启了大闹天宫副本任务，前往长寿村太白金星处进入副本")
		tp.窗口.任务栏:添加("副本任务","你已经开启了大闹天宫副本任务，前往长寿村太白金星处进入副本")
	elseif 副本 == "秘境降妖" then
		tp.剧情开关.进入副本 = {"秘境降妖",300000,60,3}
		tp.常规提示:打开("#Y/你已经开启了秘境降妖副本任务，前往长安城御林军左统领处进入副本")
		tp.窗口.任务栏:添加("副本任务","你已经开启了秘境降妖副本任务，前往长安城御林军左统领处进入副本")
	elseif 副本 == "大闹天宫" then
		tp.剧情开关.进入副本 = {"大闹天宫",300000,60,3}
		tp.常规提示:打开("#Y/你已经开启了大闹天宫副本任务，前往长寿村太白金星处进入副本")
		tp.窗口.任务栏:添加("副本任务","你已经开启了大闹天宫副本任务，前往长寿村太白金星处进入副本")
	elseif 副本 == "秘境降妖" then
		tp.剧情开关.进入副本 = {"秘境降妖",300000,60,3}
		tp.常规提示:打开("#Y/你已经开启了秘境降妖副本任务，前往长安城御林军左统领处进入副本")
		tp.窗口.任务栏:添加("副本任务","你已经开启了秘境降妖副本任务，前往长安城御林军左统领处进入副本")
	end
end

function 场景类_任务栏:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_任务栏:初始移动(x,y)
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

function 场景类_任务栏:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_任务栏