-- @Author: baidwwy
-- @Date:   2024-08-04 20:56:39
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-13 07:53:11
-- @Author: baidwwy
-- @Date:   2023-11-10 07:50:39
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-08-19 10:24:43
local GM功能 = class()
local tp,zt,zt1,zt2,sssss
local 发送信息 = {}
local 充值类型 = ""
local format = string.format
local floor = math.floor
local min = math.min
local max = math.max
local mousea = 引擎.鼠标按住
local mouseb = 引擎.鼠标弹起
local insert = table.insert
local insert = table.insert
local mouseb = 引擎.鼠标弹起
local keyaz = 引擎.按键按住
local keyax = 引擎.按键按下
local tp,zts,zts1
function GM功能:初始化(根)
	tp = 根
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 滑块 = 根._滑块
	local wz = require("gge文字类")
	--[[self.x = 全局游戏宽度/2-400
	self.y = 全局游戏高度/2-270--]]
	self.x = 20
	self.y = 40
	self.xx = 0
	self.yy = 0
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.注释 = "GM功能"
	self.窗口时间 = 0
	self.充值记录=""
	self.丰富文本说明 = 根._丰富文本(410,280)
	self.丰富文本说明:置默认颜色(黑色)
	self.丰富文本说明:添加文本()
	self.丰富文本说明.滚动值 = self.丰富文本说明.行数量
	self.丰富文本说明:滚动(self.丰富文本说明.滚动值)
	self.丰富文本说明:滚动(-18)
	self.介绍加入 = 0
	self.玩家信息={}
	self.玩家信息开关 = false
	self.充值信息开关 = false
	self.召唤兽数据={}
	self.召唤兽信息={}
	self.提取信息=0
	local wz = require("gge文字类")
	zt = tp.字体表.普通字体
	zt1 = tp.字体表.普通字体
	zt2 = tp.字体表.普通字体
	zt3 = tp.字体表.普通字体
	zt3:置颜色(黄色)
	zt4 = tp.字体表.普通字体
	zt4:置颜色(黑色)

end
function GM功能:打开()
	if self.可视 then
		self.可视 = false
	else
		insert(tp.窗口_,self)
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.可移动 = true
	end
	local 资源 = tp.资源
	local 自适应 = tp._自适应
	local 按钮 = tp._按钮
	local 滑块 = tp._滑块
	local 小型选项栏 = tp._小型选项栏
	self.进程 = 1
	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('序号控件')
	总控件:置可视(true,true)
	self.资源={

		[1]= 自适应.创建(0,1,800,530,3,9),
		[3]= 按钮.创建(自适应.创建(12,4,75,22,1,3),0,0,4,true,true,"充值系统"),
		[4]= 按钮.创建(自适应.创建(12,4,75,22,1,3),0,0,4,true,true,"角色系统"),
		[5]= 按钮.创建(自适应.创建(12,4,75,22,1,3),0,0,4,true,true,"物品系统"),
		[6]= 按钮.创建(自适应.创建(12,4,75,22,1,3),0,0,4,true,true,"装备系统"),
		[7]= 按钮.创建(自适应.创建(12,4,75,22,1,3),0,0,4,true,true,"宠物系统"),
		[8]= 按钮.创建(自适应.创建(12,4,75,22,1,3),0,0,4,true,true,"其他系统"),

		[8.1]= 按钮.创建(自适应.创建(12,4,75,22,1,3),0,0,4,true,true,"另个工具"),

		--[9]= 自适应.创建(3,1,80,19,1,3),
        [9]= 自适应.创建(3,1,40,19,1,3),
		[10]=按钮.创建(自适应.创建(12,4,75,22,1,3),0,0,4,true,true,"锁定信息"),
		[11]=按钮.创建(自适应.创建(12,4,75,22,1,3),0,0,4,true,true,"确定充值"),
		[12]=自适应.创建(2,1,430,320,3,3),
		[13]=滑块.创建(自适应.创建(11,4,15,40,2,3,nil),4,14,213,2),
		[14] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true), --子类下拉按钮
		[15] = 小型选项栏.创建(自适应.创建(6,1,80,140,3,9),""), --分类选项
		[16] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true), --子类下拉按钮
		[17] = 小型选项栏.创建(自适应.创建(6,1,80,110,3,9),""), --分类选项

	}
	self.灵饰分类 = {"戒指","手镯","佩饰","耳饰"}
	--self.灵饰分类 = {"戒指","手镯","佩饰","耳饰","勋章","宝石"}
	self.角色id = 总控件:创建输入("角色的ID",0,0,180,14)
	self.角色id:置可视(false,false)
	self.角色id:置限制字数(12)
	self.角色id:置光标颜色(-16777216)
	self.角色id:置文字颜色(-16777216)
	self.输入信息={}
	self.输入信息={[1]={"点卡数额","银子数额","储备数额","门贡数额","经验数额","抽奖积分","充值等级","副本积分"}}
	self.输入信息[2]={"玩家名称","攻击修炼","法术修炼","防御修炼","抗法修炼","法术控制","防御控制","攻击控制","抗法控制","强身等级","冥想等级"}
	self.输入信息[3]={"道具名称","道具数量","道具参数","道具附加","是否专用","坐骑名称","称谓名称","宝石名称","等级下限","等级上限","装备位置","物品等级","装备属性1","属性数值1","装备属性2","属性数值2","附加属性1","附加数值1","附加属性2","附加数值2"}
	self.输入信息[4]={"装备等级","附加特技","附加特效1","附加特效2","双加属性1","双加数值1","双加属性2","双加数值2","上限/下限","点化效果","是否专用","灵饰位置",
	                 "灵饰等级","主属类型","主属数值","附加类型1","附加数额1","附加类型2","附加数额2","附加类型3","附加数额3","附加类型4","附加数额4","灵饰专用"}
	self.输入信息[5]={"召唤兽[1]","召唤兽[2]","召唤兽[3]","召唤兽[4]","召唤兽[5]","召唤兽[6]","召唤兽[7]","宠物等级","宠物成长","宠物寿命","宠物种类","内丹上限","宠物造型","攻击资质","防御资质","体力资质","法力资质","速度资质","躲闪资质"}
	self.输入信息[6]={"经验倍数","银子倍数","发送公告"}
	--self.资源[13]:置起始点(0)
	for i=1,24 do
		if i < 10 then
			self.输入信息[5][#self.输入信息[5]+1] = "技能[0"..i.."]"
		else
			self.输入信息[5][#self.输入信息[5]+1] = "技能["..i.."]"
		end
	end
	self.输入资源={}
	for i=1,#self.输入信息 do
		self.输入资源[i]={}
		for n=1,#self.输入信息[i] do
			local 名称 = self.输入信息[i][n]
			if 名称 == "发送公告" then
				self.输入资源[i][名称] = 总控件:创建输入(名称,0,0,580,14)
				self.输入资源[i][名称]:置限制字数(100)
				self.输入资源[i][名称]:置光标颜色(-16777216)
	            self.输入资源[i][名称]:置文字颜色(-16777216)
				self.输入资源[i][名称]:置文本("输入您要发送的游戏公告！")
				self.输入资源[i][名称]:置可视(false,false)
				self.输入资源[i][名称]:屏蔽快捷键(false)
			else
				self.输入资源[i][名称] = 总控件:创建输入(名称,0,0,100,14)
				self.输入资源[i][名称]:置限制字数(14)
				self.输入资源[i][名称]:置光标颜色(-16777216)
	            self.输入资源[i][名称]:置文字颜色(-16777216)
				self.输入资源[i][名称]:置可视(false,false)
				self.输入资源[i][名称]:屏蔽快捷键(false)
			end
		end
	end
end

function GM功能:显示(dt,x,y)
	self.资源[1]:显示(self.x,self.y)
	self.资源[9]:置宽高1(100,19)
	self.资源[8.1]:更新(x,y)
	self.资源[8.1]:显示(self.x+20+(8-3)*130,self.y+28+27)
	if self.资源[8.1]:事件判断() then
		发送数据(677)
	end
	local jj=130
	 for i=3,8 do
	    self.资源[i]:更新(x,y)
	   	self.资源[i]:显示(self.x+20+(i-3)*130,self.y+28)
	   	if self.资源[i]:事件判断() then
	   		if self.输入资源[self.进程] ~= nil then
		   		for n,v in pairs(self.输入资源[self.进程]) do
		   			self.输入资源[self.进程][n]:置可视(false,false)
		   			self.输入资源[self.进程][n]:置文本("")
		   			if n == "发送公告" then
		   				self.输入资源[self.进程][n]:置文本("输入您要发送的游戏公告！")
		   			end
		   		end
		   	end
		   	self.角色id:置文本("")
	   		self.进程 = i-2
	   		self.丰富文本说明:清空()
	   		self.充值信息开关=false
	   		self.灵饰分类选中=nil
	   		self.玩家造型=nil
	   		self.分类选中=nil
	   		发送信息 ={}
			self.召唤兽数据={}
			self.召唤兽信息={}
			self.提取信息=0
			if i == 8 then
				self.角色id:置可视(false,false)
			else
				self.角色id:置可视(true,true)
			end
	   		if self.玩家信息开关 then
			   	for i,v in pairs(self.玩家信息.人物修炼) do
					self.输入资源[2][i]:置文本(v)
				end
				local 关键字=""
				for i,v in pairs(self.玩家信息.召唤兽修炼) do
					关键字=string.sub(i,1,8)
					self.输入资源[2][关键字]:置文本(v)
				end
				self.输入资源[2]["强身等级"]:置文本(self.玩家信息.强身等级)
				self.输入资源[2]["冥想等级"]:置文本(self.玩家信息.冥想等级)
			   	self.玩家信息开关 = false
			 end
        self.集合按钮 = {}
			if self.进程 == 2 then
				self:集合分类(8, {
						"玩家信息",
						"充值记录",
						"封禁账号",
						"封禁ip",
						"解封账号",
						"解封ip",
						"踢出战斗",
						"强制下线"
					})
			elseif self.进程 == 3 then
				sssss = 6
				self:集合分类(21, {
						"给予道具",
						"给予坐骑",
						"给予称谓",
						"给予宝石",
						"宝宝装备"
					})
			elseif self.进程 == 4 then
					self:集合分类(4, {
						"获取造型",
						"给予装备",
						"给予灵饰",
						"开启狂暴"
					})
			elseif self.进程 == 5 then
					self:集合分类(11, {
						"获取信息",
						"[1]号数据",
						"[2]号数据",
						"[3]号数据",
						"[4]号数据",
						"[5]号数据",
						"[6]号数据",
						"[7]号数据",
						"修改资质",
						"重置属性",
						"修改技能"
					})
			elseif self.进程 == 6 then
					self:集合分类(20, {
						"修改经验",
						"修改银子",
						"天罡",
						"地煞",
						"知了统领",
						"天界叛逆",
						"知了先锋",
						"封妖",
						"妖王",
						"裂风兽",
						"剑会天下",
						"沉默分身",
						"龙族",
						"千年知了王",
						"知了小王",
						"新手活动怪",
						"清空排行",
						"发送公告",
						"知了大王",
						"黑神话",
					})
			end
	   	end
	end
---------------------------------------------------------------------------------------------------------------------
	if self.进程 == 1 then --充值系统
		local ss = 0
		local sss = 0
		local ssss = 0
		self.资源[12]:显示(self.x+65,self.y+120)
		self.角色id:置坐标(self.x+156,self.y+83)
		self.资源[9]:显示(self.x+150,self.y+80)
		zt:显示(self.x+70,self.y+82,"玩家的ID:")

		for i=1,#self.输入信息[1] do
			if ss >= 2 then
				sss = sss +1
			end
			if ss <=1 then
				ss = ss +1
			end
			ssss = ssss +1
			self.输入资源[1][self.输入信息[1][i]]:置可视(true,true)
			self.输入资源[1][self.输入信息[1][i]]:置坐标(self.x+156+ss*230,self.y+83+sss*30)---光标显示
			zt:显示(self.x+70+ss*230,self.y+82+sss*30,self.输入信息[1][ssss]..":")---类型名称显示
			self.资源[9]:显示(self.x+150+ss*230,self.y+80+sss*30)--类型文本输入位置显示
		end

		for i=10,11 do
			self.资源[i]:更新(x,y)
			if i==11 then
				self.资源[i]:置文字("确认充值")
			end
			self.资源[i]:显示(self.x+528+(i-10)*100,self.y+420)
			if self.资源[i]:事件判断() then
				self:事件判断(self.资源[i].按钮文字)
			end
		end
        self.丰富文本说明:更新(dt,x,y)
		self.丰富文本说明:显示(self.x+70,self.y+150)
		zt3:显示(self.x+72,self.y+130,"充值记录:")
		if self.资源[12]:是否选中(x,y) and 引擎.取鼠标滚轮() >0 then--鼠标上滚动
			if self.丰富文本说明.滚动值 <= #self.丰富文本说明.显示表 -18 then
				self.丰富文本说明:滚动(1)
			end
		elseif self.资源[12]:是否选中(x,y) and 引擎.取鼠标滚轮() <0  then--鼠标下滚动
			if self.丰富文本说明.滚动值 > 0 then
				self.丰富文本说明:滚动(-1)
			end
		end
---------------------------------------------------------------------------------------------------------------------
	elseif self.进程 == 2 then
		local ss = 0
		local sss = 0
		local ssss = 0
		self.资源[12]:显示(self.x+65,self.y+120)
		self.角色id:置坐标(self.x+156,self.y+83)
		self.资源[9]:显示(self.x+150,self.y+80)
		zt:显示(self.x+70,self.y+82,"玩家的ID:")
		for i=1,#self.输入信息[2] do
			if ss >= 1 then
				self.资源[9]:置宽高1(90,19)
			end
			self.输入资源[2][self.输入信息[2][i]]:置可视(true,true)
			self.输入资源[2][self.输入信息[2][i]]:置坐标(462+ss*300,125+sss*35)
			zt:显示(self.x+300+ss*300,self.y+82+sss*35,self.输入信息[2][ssss+1]..":")
			self.资源[9]:显示(self.x+380+ss*300,self.y+80+sss*35)
			if ss >= 1 then
				sss = sss +1
			end
			if ss <=0 then
				ss = ss +1
			end
			ssss = ssss +1
		end
		for i=10,11 do
			self.资源[i]:更新(x,y)
			if i==11 then
				self.资源[i]:置文字("确认修改")
			end
			self.资源[i]:显示(self.x+600+(i-10)*90,self.y+438)
			if self.资源[i]:事件判断() then
				self:事件判断(self.资源[i].按钮文字)
			end
		end
		for i=1,#self.集合按钮 do
			self.集合按钮[i]:更新(x,y)
			self.集合按钮[i]:显示(self.x+505,self.y+30+i*51)
			if self.集合按钮[i]:事件判断() then
				self:事件判断(self.集合按钮[i].按钮文字)
			end
		end
		if self.玩家信息开关 then
			local as=0
			local ass=0
			zt3:置颜色(蓝色)
			zt3:显示(self.x+75,self.y+130,"玩家信息:")
			local 关键字 = {"账号","名称","ID","等级","造型","点卡","银子","储备","存银","连接IP","抽奖积分","副本积分","经验","武器","门派","帮派"}
			for i=1,#关键字 do
				if self.玩家信息[关键字[i]] ~= nil then
					zt3:显示(self.x+75+as*190,self.y+155+ass*25,关键字[i]..":"..self.玩家信息[关键字[i]])
				else
					zt3:显示(self.x+75+as*190,self.y+155+ass*25,关键字[i]..":")
				end
				if as>=1 then
					as=-1
					ass=ass+1
				end
				as=as+1
			end
		elseif self.充值信息开关 then
			self.丰富文本说明:更新(dt,x,y)
			self.丰富文本说明:显示(self.x+70,self.y+150)
			zt3:显示(self.x+72,self.y+130,"充值记录:")
			if self.资源[12]:是否选中(x,y) and 引擎.取鼠标滚轮() >0 then--鼠标上滚动
				if self.丰富文本说明.滚动值 <= #self.丰富文本说明.显示表 -18 then
					self.丰富文本说明:滚动(1)
				end
			elseif self.资源[12]:是否选中(x,y) and 引擎.取鼠标滚轮() <0  then--鼠标下滚动
				if self.丰富文本说明.滚动值 > 0 then
					self.丰富文本说明:滚动(-1)
				end
			end
		end
---------------------------------------------------------------------------------------------------------------------
	elseif self.进程 == 3 then
		local ss = 0
		local sss = 0
		local ssss = 0
		local xx = 0
		local xxx = 0
		self.角色id:置坐标(self.x+101,self.y+83)
		self.资源[9]:显示(self.x+85,self.y+80)
		zt:显示(self.x+15,self.y+82,"玩家的ID:")
		zt3:显示(self.x+150,self.y+350,"以下为自定义制作召唤兽装备,请正确填写物品位置(铠甲、项圈、护腕)")
		for i=1,#self.输入信息[3] do
			self.资源[9]:置宽高1(90,19)
			self.输入资源[3][self.输入信息[3][i]]:置可视(true,true)
			--self.输入资源[3]["金丹数量"]:置可视(false,false)
			if ssss < 5 then
				self.输入资源[3][self.输入信息[3][i]]:置坐标(self.x+93+ss*200,self.y+113+sss*35)
				zt:显示(self.x+17+ss*200,self.y+112+sss*35,self.输入信息[3][ssss+1]..":")
				self.资源[9]:显示(self.x+87+ss*200,self.y+110+sss*35)
				if ssss <= 5 then
					if ss >= 1 then
						ss = -1
						sss = sss +1
					end
					if ss <=0 then
						ss = ss +1
					end
				else
					if ss >= 1 then
						ss = -2
						sss = sss +1
					end
					if ss <=0 then
						ss = ss +1
					end
				end
			elseif ssss < 6 then
					if ssss == 5 then
					ss = 0
					sss = 2
				end
				self.输入资源[3][self.输入信息[3][i]]:置坐标(self.x+93+ss*260,self.y+148+sss*35)
				zt:显示(self.x+17+ss*260,self.y+147+sss*35,self.输入信息[3][ssss+1]..":")
				self.资源[9]:显示(self.x+87+ss*260,self.y+145+sss*35)
					if ss >= 2 then
					ss = -1
					sss = sss +1
				end
				if ss <=1 then
					ss = ss +1
				end
			elseif ssss < 7 then
					if ssss == 6 then
					ss = 0
					sss = 3
				end
				self.输入资源[3][self.输入信息[3][i]]:置坐标(self.x+93+ss*260,self.y+148+sss*35)
				zt:显示(self.x+17+ss*260,self.y+147+sss*35,self.输入信息[3][ssss+1]..":")
				self.资源[9]:显示(self.x+87+ss*260,self.y+145+sss*35)
					if ss >= 2 then
					ss = -1
					sss = sss +1
				end
				if ss <=1 then
					ss = ss +1
				end
			elseif ssss < 10 then
					if ssss == 7 then
					ss = 0
					sss = 4
				end
				self.输入资源[3][self.输入信息[3][i]]:置坐标(self.x+93+ss*200,self.y+148+sss*35)
				zt:显示(self.x+17+ss*200,self.y+147+sss*35,self.输入信息[3][ssss+1]..":")
				self.资源[9]:显示(self.x+87+ss*200,self.y+145+sss*35)
					if ss >= 1 then
					ss = -1
					sss = sss +1
				end
				if ss <=1 then
					ss = ss +1
				end
			else
				if ssss == 10 then
					ss = -1
					sss = 9
				end
				self.输入资源[3][self.输入信息[3][i]]:置坐标(self.x+306+ss*195,self.y+73+sss*35)
				zt:显示(self.x+210+ss*195,self.y+72+sss*35,self.输入信息[3][ssss+1]..":")
				self.资源[9]:显示(self.x+300+ss*195,self.y+70+sss*35)
				if ss >= 2 then
					ss = -2
					sss = sss +1
				end
				if ss <=1 then
					ss = ss +1
				end
			end
			ssss = ssss +1
		end
		for i=1,#self.集合按钮 do
			self.集合按钮[i]:更新(x,y)
			if self.集合按钮[i]:事件判断() then
				self:事件判断(self.集合按钮[i].按钮文字)
			end
			if i <= 3 then
				self.集合按钮[i]:显示(self.x+295,self.y+145+i*35)
				if i == 1 then
					xx =1
				end
			elseif i <= 4 then
				self.集合按钮[i]:显示(self.x+295,self.y+180+i*35)
				xx = xx +1
			elseif i <= 5 then
				self.集合按钮[i]:显示(self.x+425,self.y+280+i*35)
				xx = xx +1
			end
		end
---------------------------------------------------------------------------------------------------------------------
	elseif self.进程 == 4 then
		local ss = 0
		local sss = 0
		local ssss = 0
		zt3:显示(self.x+150,self.y+82,"以下为自定义制作人物装备,请先获取人物信息！上/下限格式例如: 2/3 即可")
		zt3:显示(self.x+150,self.y+262,"以下为自定义制作人物灵饰,请正确填写位置(手镯、戒指、饰品、耳饰)！")
		zt:显示(self.x+430,self.y+112,"装备类型:")
		self.资源[9]:显示(self.x+510,self.y+110)
		zt:显示(self.x+50,self.y+112,"玩家的ID:")
		self.角色id:置坐标(self.x+136,self.y+113)
		self.资源[9]:置宽高1(70,19)
		self.资源[9]:显示(self.x+130,self.y+110)
		zt:显示(self.x+240,self.y+112,"角色造型:")
		self.资源[9]:显示(self.x+320,self.y+110)
		for i=1,#self.输入信息[4] do
			self.输入资源[4][self.输入信息[4][i]]:置可视(true,true)
			self.输入资源[4]["灵饰位置"]:置可视(false,false)
			if ssss <= 10 then
				self.输入资源[4][self.输入信息[4][i]]:置坐标(self.x+136+ss*190,self.y+148+sss*35)
				zt:显示(self.x+50+ss*190,self.y+147+sss*35,self.输入信息[4][ssss+1]..":")
				self.资源[9]:显示(self.x+130+ss*190,self.y+145+sss*35)
				if ss >= 3 then
					sss = sss +1
					ss = -1
				end
				if ss <=2 then
					ss = ss +1
				end
			else
				if ssss == 11 then
					ss = 0
					sss = sss +1
				end
				self.输入资源[4][self.输入信息[4][i]]:置坐标(self.x+136+ss*190,self.y+188+sss*35)
				zt:显示(self.x+50+ss*190,self.y+187+sss*35,self.输入信息[4][ssss+1]..":")
				self.资源[9]:显示(self.x+130+ss*190,self.y+185+sss*35)
				if ss >= 3 then
					sss = sss +1
					ss = -1
				end
				if ss <=2 then
					ss = ss +1
				end
			end
			ssss = ssss +1
		end
		for i=1,#self.集合按钮 do
			self.集合按钮[i]:更新(x,y)
			if i == 1 then
				self.集合按钮[i]:显示(self.x+620,self.y+109)
			elseif i == 2 then
				self.集合按钮[i]:显示(self.y+620,self.y+215)
			elseif i == 3 then
				self.集合按钮[i]:显示(self.x+620,self.y+395)
			end
			if self.集合按钮[i]:事件判断() then
				self:事件判断(self.集合按钮[i].按钮文字)
			end
		end
		if self.玩家造型 ~= nil then
			zt4:置颜色(蓝色)
			zt4:显示(self.x+328,self.y+114,self.玩家造型)
			self.资源[14]:更新(x,y)
			self.资源[14]:显示(self.x+595,self.y+110)
			self.资源[15]:显示(self.x+515,self.y+130,x,y,true)
			if self.资源[14]:事件判断() then --分类下拉
				self.资源[15]:打开(self.分类)
			end
			if self.资源[15]:事件判断() then
				self.分类选中=self.资源[15].弹出事件
				self.资源[15].弹出事件=nil
			end
			if self.分类选中 ~= nil then
				zt4:显示(self.x+515,self.y+113,self.分类选中)
			end
		end
		self.资源[16]:更新(x,y)
		self.资源[16]:显示(self.x+195,self.y+291)
		self.资源[17]:显示(self.x+130,self.y+308,x,y,true)
		if self.资源[16]:事件判断() then --分类下拉
			self.资源[17]:打开(self.灵饰分类)
		end
		if self.资源[17]:事件判断() then
			self.灵饰分类选中=self.资源[17].弹出事件
			self.资源[17].弹出事件=nil
		end
		if self.灵饰分类选中 ~= nil then
			zt4:显示(self.x+135,self.y+293,self.灵饰分类选中)
		end
---------------------------------------------------------------------------------------------------------------------
	elseif self.进程 == 5 then
		local ss = 0
		local sss = 0
		zt3:显示(self.x+420,self.y+290,"以下为该召唤兽技能信息,请按照顺序修改")
		self.资源[9]:显示(self.x+125,self.y+72)
		zt:显示(self.x+45,self.y+75,"玩家的ID:")
		self.角色id:置坐标(self.x+130,self.y+75)
		for i=1,#self.输入信息[5] do

			self.输入资源[5][self.输入信息[5][i]]:置可视(true,true)
			if i <= 7 then
				self.输入资源[5][self.输入信息[5][i]]:置可视(false,false)
				zt:显示(self.x+45,self.y+75+i*30,self.输入信息[5][i]..":")
				self.资源[9]:显示(self.x+125,self.y+72+i*30)
			elseif i <= 13 then
				zt:显示(self.x+390,self.y+45+(i-7)*30,self.输入信息[5][i]..":")
				self.资源[9]:显示(self.x+470,self.y+42+(i-7)*30)
				self.输入资源[5][self.输入信息[5][i]]:置坐标(self.x+475,self.y+45+(i-7)*30)
			elseif i <= 19 then
				zt:显示(self.x+580,self.y+45+(i-13)*30,self.输入信息[5][i]..":")
				self.资源[9]:显示(self.x+660,self.y+42+(i-13)*30)
				self.输入资源[5][self.输入信息[5][i]]:置坐标(self.x+665,self.y+45+(i-13)*30)
			else
				zt:显示(self.x+45+ss*190,self.y+330+sss*30,self.输入信息[5][i]..":")
				self.资源[9]:显示(self.x+125+ss*190,self.y+328+sss*30)
				self.输入资源[5][self.输入信息[5][i]]:置坐标(self.x+130+ss*190,self.y+330+sss*30)
				ss = ss +1
				if ss >= 4 then
					ss = 0
					sss = sss +1
				end
			end
		end
		for i=1,7 do
			zt4:置颜色(蓝色)
			if self.召唤兽数据[i] ~= nil then
				zt4:显示(self.x+135,self.y+75+i*30,self.召唤兽数据[i].名称)
			end
		end
		for i=1,#self.集合按钮 do
			if i <= 8 and i ~= 1 then
				self.集合按钮[i]:更新(x,y,self.召唤兽数据[i-1]~=nil)
			elseif i == 1 then
				self.集合按钮[i]:更新(x,y)
			else
				self.集合按钮[i]:更新(x,y,self.提取信息~=0)
			end
			if i <= 8 then
				self.集合按钮[i]:显示(self.x+235,self.y+i*30+42)
			else
				self.集合按钮[i]:显示(self.x+300+(i-8)*120,self.y+255)
			end
			if self.集合按钮[i]:事件判断() then
				self:事件判断(self.集合按钮[i].按钮文字)
			end
		end
---------------------------------------------------------------------------------------------------------------------
	elseif self.进程 == 6 then
		for i=1,#self.输入信息[6] do
			self.输入资源[6][self.输入信息[6][i]]:置可视(true,true)
			self.资源[9]:置宽高1(60,19)
			if i == 1 then
				zt:显示(self.x+20,self.y+107,"经验倍数:")
				self.资源[9]:显示(self.x+90,self.y+105)
				self.输入资源[6][self.输入信息[6][i]]:置坐标(self.x+106,self.y+108)
			elseif i == 2 then
				zt:显示(self.x+280,self.y+107,"银子倍数:")
				self.资源[9]:显示(self.x+350,self.y+105)
				self.输入资源[6][self.输入信息[6][i]]:置坐标(self.x+366,self.y+108)
			elseif i == 3 then
				self.资源[9]:置宽高1(600,19)
				self.资源[9]:显示(self.x+90,self.y+400)
				self.输入资源[6][self.输入信息[6][i]]:置坐标(self.x+106,self.y+403)
			end
		end
		for i=1,#self.集合按钮 do
			self.集合按钮[i]:更新(x,y)
            if i <= 1 then
				self.集合按钮[i]:显示(self.x+20+i*160,self.y+105)
			elseif i <= 2 then
				self.集合按钮[i]:显示(self.x+20+i*210,self.y+105)
			elseif i<=10 then
				self.集合按钮[i]:显示(self.x+10+(i-3)*90,self.y+145)

			elseif i<=13 then
				self.集合按钮[i]:显示(self.x+10+(i-11)*90,self.y+185)
			elseif i<=16 then
				self.集合按钮[i]:显示(self.x+100+(i-10)*90,self.y+185)
			elseif i<=17 then
				self.集合按钮[i]:显示(self.x+10,self.y+225)
			elseif i <=18 then
				self.集合按钮[i]:显示(self.x+665,self.y+430)
			elseif i==19 then
				self.集合按钮[i]:显示(self.x+280,self.y+185)
			elseif i==20 then
				self.集合按钮[i]:显示(self.x+375,self.y+185)

			end
			if self.集合按钮[i]:事件判断() then
				self:事件判断(self.集合按钮[i].按钮文字)
			end
		end
	end
	self.控件类:更新(dt,x,y)
  	self.控件类:显示(x,y)
end
function GM功能:事件判断(按钮)
	local 验证通过 = false
	if self.进程 == 1 then
		if 按钮 == "锁定信息" then
			if self.角色id:取文本() == "" or tonumber(self.角色id:取文本()) == nil then
			    tp.提示:写入("#Y/请输入正确的充值的id,id为纯数字")
			    return 0
			else
				for i,v in pairs(self.输入资源[1]) do
					if self.输入资源[1][i]:取文本() ~= "" and tonumber(self.输入资源[1][i]:取文本()) ~= nil then
						发送信息.id = self.角色id:取文本()
						发送信息.类型 = i
						发送信息.数值 = tonumber(self.输入资源[1][i]:取文本())
						tp.提示:写入("#Y/锁定信息成功,如修改需要重新锁定。")
						验证通过 = true
						break
					end
				end
				if 验证通过 == false then
				    tp.提示:写入("#Y/请输入正确的充值的信息,信息为纯数字")
				    return
				end
			end
		elseif 按钮 == "确认充值" then
			if 发送信息.类型 == nil then
				tp.提示:写入("#Y/请先锁定信息后再点击充值。")
				return
			end
			if 发送信息.类型 == "点卡数额" then
				充值类型 = "点卡"
			elseif 发送信息.类型 == "银子数额" then
				充值类型 = "银子"
			elseif 发送信息.类型 == "储备数额" then
				充值类型 = "储备"
			elseif 发送信息.类型 == "门贡数额" then
				充值类型 = "门贡"
			elseif 发送信息.类型 == "经验数额" then
				充值类型 = "经验"
			elseif 发送信息.类型 == "抽奖积分" then
				充值类型 = "抽奖积分"
			elseif 发送信息.类型 == "充值等级" then
				充值类型 = "等级"
			elseif 发送信息.类型 == "副本积分" then
				充值类型 = "副本积分"
			end
			if 发送信息.类型 ~= "充值等级" then
			   客户端:发送数据(7201,table.tostring(发送信息))
			end
		end
	elseif self.进程 == 2 then
		if 按钮 == "玩家信息" then
			if (self.角色id:取文本() ~= "" and tonumber(self.角色id:取文本()) ~= nil) then
				发送信息.id = self.角色id:取文本()
				发送信息.数值 = tonumber(self.角色id:取文本())
				验证通过 = true
			elseif self.输入资源[2]["玩家名称"]:取文本() ~= "" then
				发送信息.id = 0
				发送信息.名称 = self.输入资源[2]["玩家名称"]:取文本()
				验证通过 = true
			else
				tp.提示:写入("#Y/请输入正确的ID或者玩家名称")
				return
			end
			if 验证通过 then
				客户端:发送数据(7202,table.tostring(发送信息))
			end
		elseif 按钮 == "充值记录" then
			if (self.角色id:取文本() ~= "" and tonumber(self.角色id:取文本()) ~= nil) then
				发送信息.id = self.角色id:取文本()
				发送信息.数值 = tonumber(self.角色id:取文本())
				验证通过 = true
			elseif self.输入资源[2]["玩家名称"]:取文本() ~= "" then
				发送信息.id = 0
				发送信息.名称 = self.输入资源[2]["玩家名称"]:取文本()
				验证通过 = true
			else
				tp.提示:写入("#Y/请输入正确的ID或者玩家名称")
				return
			end
			if 验证通过 then
				客户端:发送数据(7203,table.tostring(发送信息))
			end
		elseif 按钮 == "封禁账号" or 按钮 == "封禁ip" or 按钮 == "解封账号" or 按钮 == "解封ip" or 按钮 == "踢出战斗" or 按钮 == "强制下线" then
			if (self.角色id:取文本() ~= "" and tonumber(self.角色id:取文本()) ~= nil) then
				发送信息.id = self.角色id:取文本()
				发送信息.数值 = tonumber(self.角色id:取文本())
				验证通过 = true
			elseif self.输入资源[2]["玩家名称"]:取文本() ~= "" then
				发送信息.id = 0
				发送信息.名称 = self.输入资源[2]["玩家名称"]:取文本()
				验证通过 = true
			else
				tp.提示:写入("#Y/请输入正确的ID或者玩家名称")
				return
			end
			if 验证通过 then
				发送信息.类型 = 按钮
				客户端:发送数据(7204,table.tostring(发送信息))
			end
		elseif 按钮 == "锁定信息" then
			if self.角色id:取文本() == "" and self.输入资源[2]["玩家名称"]:取文本() == "" or tonumber(self.角色id:取文本()) == nil then
				tp.提示:写入("#Y/请输入正确的ID或者玩家名称")
				return
			elseif self.玩家信息.人物修炼 == nil or self.玩家信息.召唤兽修炼 == nil then
				tp.提示:写入("#Y/请点击玩家信息获取玩家当前信息")
				return
			else
				if (self.角色id:取文本() ~= "" and tonumber(self.角色id:取文本()) ~= nil) then
					发送信息.id = self.角色id:取文本()
					验证通过 = true
				elseif self.输入资源[2]["玩家名称"]:取文本() ~= "" then
					发送信息.id = 0
					发送信息.名称 = self.输入资源[2]["玩家名称"]:取文本()
					验证通过 = true
				end
				if 验证通过 then
					for i=1,#self.输入信息[2] do
						if self.输入信息[2][i]~= "玩家名称" then
							if tonumber(self.输入资源[2][self.输入信息[2][i]]:取文本()) == nil then
								tp.提示:写入("#Y/请正确输入您要修改的玩家信息,必须为数字")
								return
							else
								发送信息[self.输入信息[2][i]] = self.输入资源[2][self.输入信息[2][i]]:取文本()
							end
						end
					end
					tp.提示:写入("#Y/锁定信息成功,如有修改需要重新锁定。")
				end
			end
		elseif 按钮 == "确认修改" then
			if 发送信息.id == nil then
				tp.提示:写入("#Y/请锁定信息后,再点击确认修改。")
				return
			end
			客户端:发送数据(7205,table.tostring(发送信息))
		end
	elseif self.进程 == 3 then
		if self.角色id:取文本() == "" or tonumber(self.角色id:取文本()) == nil then
		    tp.提示:写入("#Y/请输入正确的玩家id,id为纯数字")
		    return 0
		else
			发送信息.id = self.角色id:取文本()
			if 按钮 == "宝宝装备" then
				if self.输入资源[3]["装备位置"]:取文本() == "" then
				    tp.提示:写入("#Y/请正确输入要给予的物品信息")
				    return 0
				end
				for i=12,#self.输入信息[3] do
					if self.输入信息[3][i] ~= "装备属性1" and self.输入信息[3][i] ~= "属性数值1"and self.输入信息[3][i] ~= "装备属性2" and self.输入信息[3][i] ~= "属性数值2"and self.输入信息[3][i] ~= "附加属性1" and self.输入信息[3][i] ~= "附加数值1" and self.输入信息[3][i] ~= "附加属性2" and self.输入信息[3][i] ~= "附加数值2"and   tonumber(self.输入资源[3][self.输入信息[3][i]]:取文本())==nil then
					    tp.提示:写入("#Y/请正确输入要给予的物品信息")
					    return 0
					end
				end
				发送信息.类型 = 按钮
				发送信息.内容 = self.输入资源[3]["装备位置"]:取文本()
				for i=12,#self.输入信息[3] do
					发送信息["内容"..(i-11)]= self.输入资源[3][self.输入信息[3][i]]:取文本()
				end
				    客户端:发送数据(7206,table.tostring(发送信息))
			elseif 按钮 == "给予宝石" then
				if self.输入资源[3]["宝石名称"]:取文本() == "" or tonumber(self.输入资源[3]["等级下限"]:取文本())==nil or tonumber(self.输入资源[3]["等级上限"]:取文本())==nil  then
				    tp.提示:写入("#Y/请正确输入要给予的物品信息")
				    return 0
				else
					发送信息.类型 = 按钮
					发送信息.内容 = self.输入资源[3]["宝石名称"]:取文本()
					发送信息.内容1 = tonumber(self.输入资源[3]["等级下限"]:取文本())
					发送信息.内容2 = tonumber(self.输入资源[3]["等级上限"]:取文本())
					客户端:发送数据(7206,table.tostring(发送信息))
				end
				elseif 按钮 == '给予道具' then
					if self.输入资源[3]["道具名称"]:取文本() == "" or self.输入资源[3]["道具数量"]:取文本() == "" or tonumber(self.输入资源[3]["道具数量"]:取文本())==nil then
					    tp.提示:写入("#Y/请正确输入要给予的物品信息")
					    return 0
					else
						发送信息.类型 = 按钮
						发送信息.内容 = self.输入资源[3]["道具名称"]:取文本()
						发送信息.内容1 = tonumber(self.输入资源[3]["道具数量"]:取文本())
						发送信息.内容2 = self.输入资源[3]["道具参数"]:取文本()
						发送信息.内容3 = self.输入资源[3]["道具附加"]:取文本()
						发送信息.内容4 = tonumber(self.输入资源[3]["是否专用"]:取文本())
						客户端:发送数据(7206,table.tostring(发送信息))
					end
			else
				local 关键字=""
			    if 按钮 == '给予坐骑' then 关键字="坐骑名称"
			    elseif 按钮 == '给予称谓' then 关键字="称谓名称"
			    end
				if self.输入资源[3][关键字]:取文本() == "" then
				    tp.提示:写入("#Y/请输入要给予的物品信息")
				    return 0
				else
					发送信息.类型 = 按钮
					发送信息.内容 = self.输入资源[3][关键字]:取文本()
					客户端:发送数据(7206,table.tostring(发送信息))
				end
			end
		end
	elseif self.进程 == 4 then
		发送信息={}
		if self.角色id:取文本() == "" or tonumber(self.角色id:取文本()) == nil then
		    tp.提示:写入("#Y/请输入正确的玩家id,id为纯数字")
		    return 0
		else
		    发送信息.id = self.角色id:取文本()
		    if 按钮 == "获取造型" then
		    	客户端:发送数据(7208,table.tostring(发送信息))
		    elseif 按钮 == "给予装备" then
		    	if self.玩家造型 == nil then
		    		tp.提示:写入("#Y/请先获取玩家的造型")
		    		return 0
		    	elseif self.分类选中 == nil then
		    		tp.提示:写入("#Y/请选择发放装备的类型")
		    		return 0
		    	else
					if self.输入资源[4]["装备等级"]:取文本() == "" or tonumber(self.输入资源[4]["装备等级"]:取文本()) == nil then
		    			tp.提示:写入("#Y/请检查装备等级信息是否正确")
		    		end
					for i=1,11 do
						if i == 9 then
							发送信息["上下限"]=self.输入资源[4][self.输入信息[4][i]]:取文本()
						else
							发送信息[self.输入信息[4][i]] = self.输入资源[4][self.输入信息[4][i]]:取文本()
						end
					end
					发送信息.类型 = self.分类选中
				    客户端:发送数据(7209,table.tostring(发送信息))
				end
		    elseif 按钮 == "给予灵饰" then
					if self.输入资源[4][self.输入信息[4][14]]:取文本()==nil or self.输入资源[4][self.输入信息[4][14]]:取文本() == "" then
			    		tp.提示:写入("#Y/请检查输入的信息是否完整")
			    		return 0
					end

					if tonumber(self.输入资源[4][self.输入信息[4][15]]:取文本()) == nil then
				        tp.提示:写入("#Y/请检查输入的附加属性数值是否正确")
				        return 0
					end
					for i=17,#self.输入信息[4] do
						if  (i == 17 or i == 19 or i == 21 or i == 23) and self.输入资源[4][self.输入信息[4][i]]:取文本()~=nil and self.输入资源[4][self.输入信息[4][i]]:取文本() ~= "" then
				    		if tonumber(self.输入资源[4][self.输入信息[4][i]]:取文本()) == nil then
					    		tp.提示:写入("#Y/请检查输入的附加属性数值是否正确")
					    		return 0
						    end
						end
					end
				for i=13,#self.输入信息[4] do
					发送信息[self.输入信息[4][i]] = self.输入资源[4][self.输入信息[4][i]]:取文本()
				end
				发送信息.类型 = self.灵饰分类选中
				客户端:发送数据(7210,table.tostring(发送信息))
		    end
		end
	elseif self.进程 == 5 then
		if self.角色id:取文本() == "" or tonumber(self.角色id:取文本()) == nil then
		    tp.提示:写入("#Y/请输入正确的玩家id,id为纯数字")
		    return 0
		else
			发送信息={}
			发送信息.id = self.角色id:取文本()
			if 按钮 == "获取信息" then
				客户端:发送数据(7211,table.tostring(发送信息))
			elseif 按钮 == "[1]号数据" then
				self.召唤兽信息 =self.召唤兽数据[1]
				self.提取信息=1
				if self.召唤兽信息.等级 ~= nil then
					self.输入资源[5]["宠物等级"]:置文本(self.召唤兽信息.等级)
					self.输入资源[5]["宠物成长"]:置文本(self.召唤兽信息.成长)
					self.输入资源[5]["宠物寿命"]:置文本(self.召唤兽信息.寿命)
					self.输入资源[5]["宠物种类"]:置文本(self.召唤兽信息.种类)
					self.输入资源[5]["内丹上限"]:置文本(self.召唤兽信息.内丹.内丹上限)
					self.输入资源[5]["宠物造型"]:置文本(self.召唤兽信息.模型)
					self.输入资源[5]["攻击资质"]:置文本(self.召唤兽信息.攻击资质)
					self.输入资源[5]["防御资质"]:置文本(self.召唤兽信息.防御资质)
					self.输入资源[5]["体力资质"]:置文本(self.召唤兽信息.体力资质)
					self.输入资源[5]["法力资质"]:置文本(self.召唤兽信息.法力资质)
					self.输入资源[5]["速度资质"]:置文本(self.召唤兽信息.速度资质)
					self.输入资源[5]["躲闪资质"]:置文本(self.召唤兽信息.躲闪资质)
				   	for i=1,#self.召唤兽信息.技能 do
				   		self.输入资源[5][self.输入信息[5][i+19]]:置文本(self.召唤兽信息.技能[i])
				    end
				end
			elseif 按钮 == "[2]号数据" then
				self.召唤兽信息 =self.召唤兽数据[2]
				self.提取信息=2
				if self.召唤兽信息.等级 ~= nil then
					self.输入资源[5]["宠物等级"]:置文本(self.召唤兽信息.等级)
					self.输入资源[5]["宠物成长"]:置文本(self.召唤兽信息.成长)
					self.输入资源[5]["宠物寿命"]:置文本(self.召唤兽信息.寿命)
					self.输入资源[5]["宠物种类"]:置文本(self.召唤兽信息.种类)
					self.输入资源[5]["内丹上限"]:置文本(self.召唤兽信息.内丹.内丹上限)
					self.输入资源[5]["宠物造型"]:置文本(self.召唤兽信息.模型)
					self.输入资源[5]["攻击资质"]:置文本(self.召唤兽信息.攻击资质)
					self.输入资源[5]["防御资质"]:置文本(self.召唤兽信息.防御资质)
					self.输入资源[5]["体力资质"]:置文本(self.召唤兽信息.体力资质)
					self.输入资源[5]["法力资质"]:置文本(self.召唤兽信息.法力资质)
					self.输入资源[5]["速度资质"]:置文本(self.召唤兽信息.速度资质)
					self.输入资源[5]["躲闪资质"]:置文本(self.召唤兽信息.躲闪资质)
				   	for i=1,#self.召唤兽信息.技能 do
				   		self.输入资源[5][self.输入信息[5][i+19]]:置文本(self.召唤兽信息.技能[i])
				    end
				end
			elseif 按钮 == "[3]号数据" then
				self.召唤兽信息 =self.召唤兽数据[3]
				self.提取信息=3
				if self.召唤兽信息.等级 ~= nil then
					self.输入资源[5]["宠物等级"]:置文本(self.召唤兽信息.等级)
					self.输入资源[5]["宠物成长"]:置文本(self.召唤兽信息.成长)
					self.输入资源[5]["宠物寿命"]:置文本(self.召唤兽信息.寿命)
					self.输入资源[5]["宠物种类"]:置文本(self.召唤兽信息.种类)
					self.输入资源[5]["内丹上限"]:置文本(self.召唤兽信息.内丹.内丹上限)
					self.输入资源[5]["宠物造型"]:置文本(self.召唤兽信息.模型)
					self.输入资源[5]["攻击资质"]:置文本(self.召唤兽信息.攻击资质)
					self.输入资源[5]["防御资质"]:置文本(self.召唤兽信息.防御资质)
					self.输入资源[5]["体力资质"]:置文本(self.召唤兽信息.体力资质)
					self.输入资源[5]["法力资质"]:置文本(self.召唤兽信息.法力资质)
					self.输入资源[5]["速度资质"]:置文本(self.召唤兽信息.速度资质)
					self.输入资源[5]["躲闪资质"]:置文本(self.召唤兽信息.躲闪资质)
				   	for i=1,#self.召唤兽信息.技能 do
				   		self.输入资源[5][self.输入信息[5][i+19]]:置文本(self.召唤兽信息.技能[i])
				    end
				end
			elseif 按钮 == "[4]号数据" then
				self.召唤兽信息 =self.召唤兽数据[4]
				self.提取信息=4
				if self.召唤兽信息.等级 ~= nil then
					self.输入资源[5]["宠物等级"]:置文本(self.召唤兽信息.等级)
					self.输入资源[5]["宠物成长"]:置文本(self.召唤兽信息.成长)
					self.输入资源[5]["宠物寿命"]:置文本(self.召唤兽信息.寿命)
					self.输入资源[5]["宠物种类"]:置文本(self.召唤兽信息.种类)
					self.输入资源[5]["内丹上限"]:置文本(self.召唤兽信息.内丹.内丹上限)
					self.输入资源[5]["宠物造型"]:置文本(self.召唤兽信息.模型)
					self.输入资源[5]["攻击资质"]:置文本(self.召唤兽信息.攻击资质)
					self.输入资源[5]["防御资质"]:置文本(self.召唤兽信息.防御资质)
					self.输入资源[5]["体力资质"]:置文本(self.召唤兽信息.体力资质)
					self.输入资源[5]["法力资质"]:置文本(self.召唤兽信息.法力资质)
					self.输入资源[5]["速度资质"]:置文本(self.召唤兽信息.速度资质)
					self.输入资源[5]["躲闪资质"]:置文本(self.召唤兽信息.躲闪资质)
				   	for i=1,#self.召唤兽信息.技能 do
				   		self.输入资源[5][self.输入信息[5][i+19]]:置文本(self.召唤兽信息.技能[i])
				    end
				end
			elseif 按钮 == "[5]号数据" then
				self.召唤兽信息 =self.召唤兽数据[5]
				self.提取信息=5
				if self.召唤兽信息.等级 ~= nil then
					self.输入资源[5]["宠物等级"]:置文本(self.召唤兽信息.等级)
					self.输入资源[5]["宠物成长"]:置文本(self.召唤兽信息.成长)
					self.输入资源[5]["宠物寿命"]:置文本(self.召唤兽信息.寿命)
					self.输入资源[5]["宠物种类"]:置文本(self.召唤兽信息.种类)
					self.输入资源[5]["内丹上限"]:置文本(self.召唤兽信息.内丹.内丹上限)
					self.输入资源[5]["宠物造型"]:置文本(self.召唤兽信息.模型)
					self.输入资源[5]["攻击资质"]:置文本(self.召唤兽信息.攻击资质)
					self.输入资源[5]["防御资质"]:置文本(self.召唤兽信息.防御资质)
					self.输入资源[5]["体力资质"]:置文本(self.召唤兽信息.体力资质)
					self.输入资源[5]["法力资质"]:置文本(self.召唤兽信息.法力资质)
					self.输入资源[5]["速度资质"]:置文本(self.召唤兽信息.速度资质)
					self.输入资源[5]["躲闪资质"]:置文本(self.召唤兽信息.躲闪资质)
				   	for i=1,#self.召唤兽信息.技能 do
				   		self.输入资源[5][self.输入信息[5][i+19]]:置文本(self.召唤兽信息.技能[i])
				    end
				end
			elseif 按钮 == "[6]号数据" then
				self.召唤兽信息 =self.召唤兽数据[6]
				self.提取信息=6
				if self.召唤兽信息.等级 ~= nil then
					self.输入资源[5]["宠物等级"]:置文本(self.召唤兽信息.等级)
					self.输入资源[5]["宠物成长"]:置文本(self.召唤兽信息.成长)
					self.输入资源[5]["宠物寿命"]:置文本(self.召唤兽信息.寿命)
					self.输入资源[5]["宠物种类"]:置文本(self.召唤兽信息.种类)
					self.输入资源[5]["内丹上限"]:置文本(self.召唤兽信息.内丹.内丹上限)
					self.输入资源[5]["宠物造型"]:置文本(self.召唤兽信息.模型)
					self.输入资源[5]["攻击资质"]:置文本(self.召唤兽信息.攻击资质)
					self.输入资源[5]["防御资质"]:置文本(self.召唤兽信息.防御资质)
					self.输入资源[5]["体力资质"]:置文本(self.召唤兽信息.体力资质)
					self.输入资源[5]["法力资质"]:置文本(self.召唤兽信息.法力资质)
					self.输入资源[5]["速度资质"]:置文本(self.召唤兽信息.速度资质)
					self.输入资源[5]["躲闪资质"]:置文本(self.召唤兽信息.躲闪资质)
				   	for i=1,#self.召唤兽信息.技能 do
				   		self.输入资源[5][self.输入信息[5][i+19]]:置文本(self.召唤兽信息.技能[i])
				    end
				end
			elseif 按钮 == "[7]号数据" then
				self.召唤兽信息 =self.召唤兽数据[7]
				self.提取信息=7
				if self.召唤兽信息.等级 ~= nil then
					self.输入资源[5]["宠物等级"]:置文本(self.召唤兽信息.等级)
					self.输入资源[5]["宠物成长"]:置文本(self.召唤兽信息.成长)
					self.输入资源[5]["宠物寿命"]:置文本(self.召唤兽信息.寿命)
					self.输入资源[5]["宠物种类"]:置文本(self.召唤兽信息.种类)
					self.输入资源[5]["内丹上限"]:置文本(self.召唤兽信息.内丹.内丹上限)
					self.输入资源[5]["宠物造型"]:置文本(self.召唤兽信息.模型)
					self.输入资源[5]["攻击资质"]:置文本(self.召唤兽信息.攻击资质)
					self.输入资源[5]["防御资质"]:置文本(self.召唤兽信息.防御资质)
					self.输入资源[5]["体力资质"]:置文本(self.召唤兽信息.体力资质)
					self.输入资源[5]["法力资质"]:置文本(self.召唤兽信息.法力资质)
					self.输入资源[5]["速度资质"]:置文本(self.召唤兽信息.速度资质)
					self.输入资源[5]["躲闪资质"]:置文本(self.召唤兽信息.躲闪资质)
				   	for i=1,#self.召唤兽信息.技能 do
				   		self.输入资源[5][self.输入信息[5][i+19]]:置文本(self.召唤兽信息.技能[i])
				    end
				end
			elseif 按钮 == "修改资质" then
				发送信息.编号=self.提取信息
				for i=8,19 do
					发送信息[self.输入信息[5][i]] = self.输入资源[5][self.输入信息[5][i]]:取文本()
				end
				客户端:发送数据(7212,table.tostring(发送信息))
			elseif 按钮 == "重置属性" then
				发送信息.编号=self.提取信息
				客户端:发送数据(7213,table.tostring(发送信息))
			elseif 按钮 == "修改技能" then
				发送信息.编号=self.提取信息
				发送信息.技能={}
			   	for i=20,#self.输入信息[5] do
			   		if self.输入资源[5][self.输入信息[5][i]]:取文本() ~= "" then
			   			发送信息.技能[#发送信息.技能+1]=self.输入资源[5][self.输入信息[5][i]]:取文本()
			   		end
			    end
				客户端:发送数据(7214,table.tostring(发送信息))
			end
		end
	elseif self.进程 == 6 then
		if 按钮 == "修改经验" then
			if tonumber(self.输入资源[6]["经验倍数"]:取文本()) == nil then
				return
			end
			发送信息.内容 = self.输入资源[6]["经验倍数"]:取文本()+0
		elseif 按钮 == "修改银子" then
			if tonumber(self.输入资源[6]["银子倍数"]:取文本()) == nil then
				return
			end
			发送信息.内容 = self.输入资源[6]["银子倍数"]:取文本()+0
		elseif 按钮 == "发送公告" then
			if self.输入资源[6]["发送公告"]:取文本() == "" then
				return
			end
			发送信息.内容 = self.输入资源[6]["发送公告"]:取文本()
		elseif 按钮 == "修改爆率" then
			if self.输入资源[6]["爆率系数"]:取文本() == "" then
				return
			end
			发送信息.内容 = self.输入资源[6]["爆率系数"]:取文本()
		end
		发送信息.id = 1
		发送信息.类型 = 按钮
	    客户端:发送数据(7215,table.tostring(发送信息))
	end
end

function GM功能:刷新(序号,内容)
	if 内容 == nil then
		self.丰富文本说明:清空()
		self.充值记录 = self.充值记录..string.format("%s：为[%s]充值%s点%s",时间转换(os.time()),发送信息.id,发送信息.数值,充值类型).."\n"
		self.丰富文本说明:添加文本(self.充值记录)
		充值类型=""
	elseif 序号 == 208.1 then
		if self.充值信息开关 then
			self.充值信息开关 = false
		end
		self.玩家信息开关 = true
		self.玩家信息=内容
		for i,v in pairs(self.玩家信息.人物修炼) do
			self.输入资源[2][i]:置文本(v)
		end
		local 关键字=""
		for i,v in pairs(self.玩家信息.召唤兽修炼) do
			关键字=string.sub(i,1,8)
			self.输入资源[2][关键字]:置文本(v)
		end
		self.输入资源[2]["强身等级"]:置文本(self.玩家信息.强身等级)
		self.输入资源[2]["冥想等级"]:置文本(self.玩家信息.冥想等级)
	elseif 序号 == 209.1 then
		if self.玩家信息开关 then
			self.玩家信息开关 = false
		end
		self.充值信息开关 = true
		self.丰富文本说明:清空()
		self.丰富文本说明:添加文本(内容)
	elseif 序号 == 210.1 then
	    self.玩家造型 = 内容
	    if self.玩家造型 == "逍遥生" or self.玩家造型 == "剑侠客" or self.玩家造型 == "偃无师" or self.玩家造型 == "龙太子" or self.玩家造型 == "神天兵" or self.玩家造型 == "羽灵神" or self.玩家造型 == "杀破狼" or self.玩家造型 == "虎头怪" or self.玩家造型 == "巨魔王" then
	    	self.分类 = {"武器","衣服","头盔","项链","腰带","鞋子"}
	    else
	    	self.分类 = {"武器","衣服","头盔","项链","腰带","鞋子"}
	    end
	elseif 序号 == 211.1 then
		self.召唤兽数据 = 内容
	end
end

function GM功能:集合分类(数量, 内容)
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	for n = 1, 数量, 1 do
		self.集合按钮[n] = 按钮.创建(自适应.创建(12,4,80,20,1,3),0,0,3,true,true,内容[n])
		self.集合按钮[n].字段 = 内容[n]
	end
	资源, 按钮, 自适应 = nil
	return
end
function GM功能:检查点(x,y)
	if self.资源 ~= nil and self.资源[1]:是否选中(x,y)  then
		return true
	end
end



function GM功能:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if self.鼠标 and  not self.焦点  then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function GM功能:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return GM功能