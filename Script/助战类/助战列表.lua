-- @Author: baidwwy
-- @Date:   2024-07-11 20:41:12
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-10-15 03:01:49
--======================================================================--
local 助战列表 = class()
local insert = table.insert
local remove = table.remove
local floor = math.floor
local tp,sadsad,zts
function 助战列表:初始化(根)
	self.ID = 165
	self.x = 112
	self.y = 169
	self.xx = 0
	self.yy = 0
	self.注释 = "队伍栏"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 资源=根.资源
	self.资源组 = {
		[1] = 自适应.创建(42,1,616,313+40,3,9), --资源:载入('common/wzife.wdf',"网易WDF动画",3628198473),--
		[2] = 按钮.创建(自适应.创建(45,4,16,16,4,3),0,0,4,true,true),
		[11] = 根.资源:载入("wdf/audio/jmk/无底洞/zhuzhan/213213.png","图片"),--自适应.创建(2,1,116,141,3,9),
		[12] = 自适应.创建(46,1,115,22,1,3),
	}
	self.设置按钮={
		[1] =按钮.创建(资源:载入('lg.rpk',"网易WDF动画",0x00010120,9393),0,0,3,true,true),
		[2] =按钮.创建(资源:载入('lg.rpk',"网易WDF动画",0x00010120,9393),0,0,3,true,true),
		[3] =按钮.创建(资源:载入('lg.rpk',"网易WDF动画",0x00010120,9393),0,0,3,true,true),
		[4] =按钮.创建(资源:载入('lg.rpk',"网易WDF动画",0x00010120,9393),0,0,3,true,true),
		[5] =按钮.创建(资源:载入('lg.rpk',"网易WDF动画",0x00010120,9393),0,0,3,true,true),
	}
	self.邀请组队={
		[1] =按钮.创建(自适应.创建(43,4,95,23,1,3),0,0,4,true,true,"邀请组队"),
		[2] =按钮.创建(自适应.创建(43,4,95,23,1,3),0,0,4,true,true,"邀请组队"),
		[3] =按钮.创建(自适应.创建(43,4,95,23,1,3),0,0,4,true,true,"邀请组队"),
		[4] =按钮.创建(自适应.创建(43,4,95,23,1,3),0,0,4,true,true,"邀请组队"),
		[5] =按钮.创建(自适应.创建(43,4,95,23,1,3),0,0,4,true,true,"邀请组队"),
	}
	self.切换角色={
		[1] =按钮.创建(自适应.创建(44,4,95,23,1,3),0,0,4,true,true,"切换为队长",nil,0xFF771111),
		[2] =按钮.创建(自适应.创建(44,4,95,23,1,3),0,0,4,true,true,"切换为队长",nil,0xFF771111),
		[3] =按钮.创建(自适应.创建(44,4,95,23,1,3),0,0,4,true,true,"切换为队长",nil,0xFF771111),
		[4] =按钮.创建(自适应.创建(44,4,95,23,1,3),0,0,4,true,true,"切换为队长",nil,0xFF771111),
		[5] =按钮.创建(自适应.创建(44,4,95,23,1,3),0,0,4,true,true,"切换为队长",nil,0xFF771111),
	}
	self.创建助战={
		[1] =按钮.创建(自适应.创建(44,4,95,23,1,3),0,0,4,true,true,"创建助战",nil,0xFF771111),
		[2] =按钮.创建(自适应.创建(44,4,95,23,1,3),0,0,4,true,true,"创建助战",nil,0xFF771111),
		[3] =按钮.创建(自适应.创建(44,4,95,23,1,3),0,0,4,true,true,"创建助战",nil,0xFF771111),
		[4] =按钮.创建(自适应.创建(44,4,95,23,1,3),0,0,4,true,true,"创建助战",nil,0xFF771111),
		[5] =按钮.创建(自适应.创建(44,4,95,23,1,3),0,0,4,true,true,"创建助战",nil,0xFF771111),
	}
	self.zaixian=根.资源:载入("wdf/audio/jmk/无底洞/zhuzhan/zaixian.png","图片")
	for i=1,5 do
		self.邀请组队[i]:置偏移(11,0)
		self.邀请组队[i]:绑定窗口_(self.ID)
		self.设置按钮[i]:绑定窗口_(self.ID)
		self.切换角色[i]:置偏移(6,0)
		self.切换角色[i]:绑定窗口_(self.ID)
		self.创建助战[i]:置偏移(11,0)
		self.创建助战[i]:绑定窗口_(self.ID)
	end
	--3607870878  更多信息
	self.助战格子 = {}
	local 格子 = require("script/系统类/助战格子")
	for i=1,5 do
		self.助战格子[i] = 格子.创建(0,0,i,根)
	end
	self.选中人物 = 0
	self.窗口时间 = 0
	tp = 根
	sadsad = tp.字体表.普通字体
	zts = tp.字体表.猫猫字体1
	self.坐标y偏移=-54
end

function 助战列表:打开(内容)
	if self.可视 then
		self.选中人物 = 0
		self.可视 = false
	else
		insert(tp.窗口_,self)
		self.列表=内容
		for i=1,5 do
			self.助战格子[i]:置人物(内容[i])
		end
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end

function 助战列表:重置()
	if not self.可视 then
		return false
	end
	for i=1,5 do
		self.助战格子[i]:置人物(self.列表[i])
	end
end

function 助战列表:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	if self.资源组[2]:事件判断() then
		self:打开()
		return false
	end
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景1_:显示(self.x-85+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体2:显示(self.x+self.资源组[1].宽度/2+7,self.y+3,"邀请小号")
	self.资源组[2]:显示(self.x-19+self.资源组[1].宽度,self.y+2)
	for i=1,5 do
		local jx = 11+(i-1)*120
		for n=0,3 do
			self.资源组[12]:显示(self.x+jx,self.y+211+n*24+20+self.坐标y偏移)
		end
		self.资源组[11]:显示(self.x+jx,self.y+63+20+self.坐标y偏移)
		self.助战格子[i]:置坐标(self.x + jx,self.y + 63+20+self.坐标y偏移)
		self.助战格子[i]:显示(dt,x,y+20,self.鼠标,tp.队伍数据)
		-- if self.助战格子[i].事件 then
		-- end
		sadsad:置颜色(黑色):显示(self.x+jx+88,self.y+182+20+self.坐标y偏移,i)
		if self.列表[i] and self.列表[i].名称 then
			sadsad:置颜色(0xFF770000):显示(self.x+jx+13,self.y+182+20+33+self.坐标y偏移,self.列表[i].名称)
			sadsad:置颜色(0xFF770000):显示(self.x+jx+13,self.y+182+20+33+1*24+self.坐标y偏移,self.列表[i].门派)
			sadsad:置颜色(0xFF770000):显示(self.x+jx+13,self.y+182+20+33+2*24+self.坐标y偏移,self.列表[i].等级.."级")
			sadsad:置颜色(0xFF770000):显示(self.x+jx+13,self.y+182+20+33+3*24+self.坐标y偏移,self.列表[i].id)
			if self.列表[i].在线 then
				self.zaixian:显示(self.x+jx+18,self.y+63+20+self.坐标y偏移)
				zts:置颜色(浅黑):显示(self.x+jx+18+21,self.y+63+20+2+self.坐标y偏移,self.列表[i].在线)
			end
			self.邀请组队[i]:更新(x,y,(not self.列表[i].在线 or self.列表[i].在线=="在  线") ,1)
			self.邀请组队[i]:显示(self.x +11+jx,self.y + 308+self.坐标y偏移+26)
			self.设置按钮[i]:更新(x,y)
			self.设置按钮[i]:显示(self.x +11+jx+70,self.y + 43+self.坐标y偏移+27*2)
			self.切换角色[i]:更新(x,y,(self.列表[i].在线=="队伍中") ,1)
			if self.列表[i].在线=="队伍中" then
				self.切换角色[i]:显示(self.x +11+jx,self.y + 308+self.坐标y偏移+26+32)
			end
			if self.邀请组队[i]:事件判断() then
				if self.列表[i].在线=="在  线" then
					local 事件 = function()
						发送数据(2002,{助战编号=i})
					end
					tp.窗口.文本栏:载入("确定将在线小号#R "..self.列表[i].名称.."#W 邀请进队伍吗？",nil,true,事件)
				else
					发送数据(2002,{助战编号=i})
				end
			elseif self.设置按钮[i]:事件判断() then
				发送数据(2004,{助战编号=i})
			elseif self.切换角色[i]:事件判断() then
				local 事件 = function()
					发送数据(2019,{助战编号=i})
					-- tp.窗口.助战仓库.可视=false
					tp.窗口.助战道具栏.可视=false
					tp.窗口.助战宝宝查看.可视=false
					tp.窗口.助战修炼学习.可视=false
					tp.窗口.助战技能学习.可视=false
					tp.窗口.经脉流派.可视=false
					tp.窗口.助战详情.可视=false
					self:打开()
				end
				tp.窗口.文本栏:载入("确定将小号#R "..self.列表[i].名称.."#W 切换为队长吗？                                                       #Y（右键正上方队伍头像，可快速切换队长）",nil,true,事件)

				-- 客户端:发送数据(4,  {id=self.juesexinxi[self.角色选中号码].id,账号=系统参数.账号,编号=self.角色选中号码,密码=系统参数.密码})
			end
		else
			self.创建助战[i]:更新(x,y)
			self.创建助战[i]:显示(self.x +11+jx,self.y + 308+self.坐标y偏移+26)
			if self.创建助战[i]:事件判断() then
				发送数据(2021)
				self:打开()
			end
		end
	end
end

function 助战列表:更新在线(内容)
	--self.列表=内容
	for i=1,5 do
		if 内容[i] then
			self.列表[i]=内容[i]
		end
	end
end

function 助战列表:刷新人物()
   for i=1,5 do
	self.助战格子[i]:置人物(nil)
	self.助战格子[i]:置人物(tp.队伍数据[i])
   end
end

function 助战列表:刷新(a,b,c)
	if a ~= nil then
		self.助战格子[a]:置人物(tp.队伍数据[a])
	end
	if b ~= nil then
		self.助战格子[b]:置人物(tp.队伍数据[b])
	end
	if c ~= nil then
		for i=1,5 do
			self.助战格子[i]:置人物(tp.队伍数据[i])
		end
	end
	self.选中人物=0
end

function 助战列表:踢出队伍()
	发送数据(4007,{序列=self.选中人物})
	self.选中人物=0
end

function 助战列表:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	else
		return false
	end
end

function 助战列表:初始移动(x,y)
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

function 助战列表:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 助战列表