-- @Author: baidwwy
-- @Date:   2024-10-15 01:51:34
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-10-31 01:09:43
local 场景类_玩家信息 = class()
local floor = math.floor
local zts,tp
local insert = table.insert
local tx = 引擎.取头像
local 可PK地图={}

-- 可PK地图[1001]=1
-- 可PK地图[1070]=1
-- 可PK地图[1092]=1
-- 可PK地图[1040]=1
可PK地图[1197]=1   ----比武场(等待区?)
可PK地图[2009]=1
可PK地图[2010]=1
可PK地图[2011]=1
可PK地图[2012]=1
可PK地图[1511]=1---帮战
可PK地图[5136]=1
可PK地图[5137]=1
可PK地图[5138]=1
可PK地图[5139]=1
-- 可PK地图[6227]=1 --武神坛

function 场景类_玩家信息:初始化(根)
	self.ID = 96
	self.x = 全局游戏宽度/2-280
	self.y = 156
	self.xx = 0
	self.yy = 0
	self.注释 = "玩家信息"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 资源 = 根.资源
	tp = 根
	self.资源组 = {
		[1] = 资源:载入('wzife.wdf',"网易WDF动画",0x360b8373),
		[2] = 资源:载入('wzife.wdf',"网易WDF动画",0x770f5f96),
		[3] = 资源:载入('wzife.wdf',"网易WDF动画",0xa0d00989),
		[4] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x91d4e204),0,0,4,true,true,"给予"),
		[5] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x91d4e204),0,0,4,true,true,"交易"),
		[6] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x91d4e204),0,0,4,true,true,"组队"),
		[7] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x91d4e204),0,0,4,true,true,"团队"),
		[8] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x91d4e204),0,0,4,true,true,"好友"),
		[9] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x91d4e204),0,0,4,true,true,"临时"),
		[10] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x91d4e204),0,0,4,true,true,"观察"),
		[11] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x91d4e204),0,0,4,true,true,"攻击"),
		[12] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x91d4e204),0,0,4,true,true,"成就"),
		[13] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x91d4e204),0,0,4,true,true,"信息"),
	}
	for i=4,13 do
	    --self.资源组[i]:绑定窗口_(self.ID)
	    self.资源组[i]:置偏移(-2,-2)
	end
	self.名称 = nil
	self.ID = nil
	self.模型 = nil
	self.窗口时间 = 0
	zts = tp.字体表.普通字体
end

function 场景类_玩家信息:打开(mc,id,mx)
	if self.可视 then
		self.可视 = false
	else
		self.名称 = mc
		self.ID = id
		self.模型 = mx
	    local x = tx(mx)
		self.资源组[14] = tp.资源:载入(x[7],"网易WDF动画",x[2])
		insert(tp.窗口_,self)
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 场景类_玩家信息:刷新信息(mc,id,mx)
	self.名称 = mc
	self.ID = id
	self.模型 = mx
	local x = tx(mx)
	self.资源组[14] = tp.资源:载入(x[7],"网易WDF动画",x[2])
end

function 场景类_玩家信息:显示(dt,x,y)
	self.焦点 = false
	for i=4,13 do
	    self.资源组[i]:更新(x,y)
	end
	if self.ID ~= nil and tp.场景.玩家[self.ID] ~= nil then
		if self.资源组[4]:事件判断() then
			发送数据(3716,{id=self.ID})
		elseif self.资源组[5]:事件判断() then
			发送数据(3718,{id=self.ID})
		elseif self.资源组[6]:事件判断() then --组队
			if tp.场景.玩家[self.ID].队长开关 then --有队伍的情况
				发送数据(4002,{id=self.ID})
			else
				发送数据(4014,{id=self.ID})
			end
		elseif self.资源组[7]:事件判断() then
		elseif self.资源组[8]:事件判断() then
			-- 发送数据(18,{名称=self.名称,id=self.ID,类型=1})
			发送数据(6958,{名称=self.名称,id=self.ID,类型=1})
		elseif self.资源组[9]:事件判断() then
			-- 发送数据(18,{名称=self.名称,id=self.ID,类型=2})
			发送数据(6958,{名称=self.名称,id=self.ID,类型=2})
		elseif self.资源组[10]:事件判断() or self.资源组[13]:事件判断()  then
			发送数据(6587,{序列=self.ID})
		elseif self.资源组[11]:事件判断() then

			if tp.当前地图 == 1197 then
				tp.常规提示:打开("#Y/比武等待区不允许发生战斗！")
			elseif tp.当前地图==5136 or tp.当前地图==5137 or tp.当前地图==5138 or tp.当前地图==5139 then---精锐/神威/天科/天元
				发送数据(6566,{序列=self.ID,PK地图=tp.当前地图})
			elseif tp.当前地图 == 2010 or tp.当前地图 == 2011 or tp.当前地图 == 2012 or tp.当前地图 == 1511 then
				发送数据(6552,{序列=self.玩家ID})--帮战
			elseif tp.当前地图==6227 then --武神坛
				发送数据(6588,{序列=self.玩家ID})
			elseif tp.当前地图==2009 or ( tp.当前地图==1001 and tp.场景.玩家[self.ID].坐标.x>398*20 and tp.场景.玩家[self.ID].坐标.x<439*20 and tp.场景.玩家[self.ID].坐标.y>164*20 and tp.场景.玩家[self.ID].坐标.y<183*20) then
				if not tp.场景.玩家[self.ID].队长开关 then
				    PK选中玩家=self.ID
					tp.窗口.对话栏:文本("","","少侠，你选择的对手刚好也是独自一人。你想向他发起“切磋”还是“单挑”呢？？",{"切磋","\n","单挑"})
				else
					发送数据(6561,{序列=self.ID})
					tp.常规提示:打开("#Y你发起了对"..tp.场景.玩家[self.ID].名称.." #RPK #Y请稍后.....")
				end
			else
				tp.窗口.组合输入框:打开("勾魂索",{"请输入玩家ID："})---ALT+A直接打开
				-- if 全局小分区 == "武神坛" then
				-- 	tp.常规提示:打开("#Y你发起了对"..tp.场景.玩家[self.ID].名称.." #RPK #Y请稍后.....")
				-- 	发送数据(33,{序列=self.ID})
				-- else
				-- 	tp.常规提示:打开("#Y玩家#R"..tp.场景.玩家[self.ID].名称.."#Y不在允许PK的范围")
				-- end
			end


			---============================================
-------------============================================================
		elseif self.资源组[12]:事件判断() then
		end
	end
	self.资源组[1]:显示(self.x+全局游戏宽度-800,self.y)
	self.资源组[14]:显示(self.x+全局游戏宽度-800+3,self.y+3)
	self.资源组[2]:显示(self.x+全局游戏宽度-800+51,self.y)
	self.资源组[3]:显示(self.x+全局游戏宽度-800+51,self.y+51)
	self.资源组[4]:显示(self.x+全局游戏宽度-800+57,self.y+57,nil,"普通黑色")
	self.资源组[5]:显示(self.x+全局游戏宽度-800+106,self.y+57,nil,"普通黑色")
	self.资源组[6]:显示(self.x+全局游戏宽度-800+57,self.y+57+(25*1),nil,"普通黑色")
	self.资源组[7]:显示(self.x+全局游戏宽度-800+106,self.y+57+(25*1),nil,"普通黑色")
	self.资源组[8]:显示(self.x+全局游戏宽度-800+57,self.y+57+(25*2),nil,"普通黑色")
	self.资源组[9]:显示(self.x+全局游戏宽度-800+106,self.y+57+(25*2),nil,"普通黑色")
	self.资源组[10]:显示(self.x+全局游戏宽度-800+57,self.y+57+(25*3),nil,"普通黑色")
	self.资源组[11]:显示(self.x+全局游戏宽度-800+106,self.y+57+(25*3),nil,"普通黑色")
	self.资源组[12]:显示(self.x+全局游戏宽度-800+57,self.y+57+(25*4),nil,"普通黑色")
	self.资源组[13]:显示(self.x+全局游戏宽度-800+106,self.y+57+(25*4),nil,"普通黑色")
	zts:置颜色(0xFFFFFF00)
	zts:显示(self.x+全局游戏宽度-800+53,self.y,self.名称)
	zts:显示(self.x+全局游戏宽度-800+53,self.y+19,self.ID)
	zts:显示(self.x+全局游戏宽度-800+53,self.y+36,"陌生人")
end

function 场景类_玩家信息:检查点(x,y)
	return self.可视 and self.资源组[3]:是否选中(x,y)
end

function 场景类_玩家信息:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.移动窗口 = false
	end
	if self.可视 and self.鼠标 and  not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_玩家信息:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_玩家信息