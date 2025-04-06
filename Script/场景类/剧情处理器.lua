--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19//
-- @Last Modified time: 2019-09-03 19:35:31
--======================================================================--
local 场景类_剧情处理器 = class()

local floor = math.floor

function 场景类_剧情处理器:初始化(根)
	self.可视 = false
	self.音效组 = nil
	self.假人组 = nil
	self.行为组 = nil
	self.对话组 = nil
	self.音乐组 = nil
	self.事件组 = nil
	self.特效组 = {}
	self.显示方式 = 0 -- 电影式（主线）；默认式（副本或其他）
	self.缓冲时间 = 0 -- 到时间就跳过下一页
	local jl = require("gge精灵类")
	self.黑条 = jl(0,0,0,全局游戏宽度,80)
	self.黑条:置颜色(ARGB(255,0,0,0))
	self.黑条1 = jl(0,0,0,全局游戏宽度,165)
	self.黑条1:置颜色(ARGB(255,0,0,0))
	self.音乐 = nil
	self.对话 = 0
	self.中断 = 0
	self.中断时间 = 0
	self.黑屏渐变 = nil
	self.丰富文本 = 根._丰富文本(全局游戏宽度-80,187)
	self.头像组 = {}
	self.屏幕定位 = nil
	self.定位速度 = nil
end

function 场景类_剧情处理器:开始剧情(剧情方式,剧情章节,剧情ID,跳转) -- 副本(主线) 剧情的篇章 篇章中的ID
	if self.可视 then
		return false
	end
	local sj = nil
	self.对话 = 1 or 跳转
	self.缓冲时间 = 120
	if 剧情方式 == 1 then
		sj = 引擎.主线剧情解析(剧情章节,剧情ID)
	elseif 剧情方式 == 2 then
		sj = 引擎.副本剧情解析(剧情章节,剧情ID)
		self.缓冲时间 = 0
	end
	self.对话组 = sj[1]
	self.行为组 = sj[2]
	self.音乐组 = sj[3]
	self.音效组 = sj[4]
	self.假人组 = sj[5]
	self.事件组 = sj[6]
	self.剧情章节 = 剧情章节
	self.剧情ID = 剧情ID
	if self.假人组 ~= nil then
		local sj = require("script/场景类/事件")
		for n=1,#self.假人组 do
			self.假人组[n] = sj(self.假人组[n])
		end
	end
	self.显示方式 = 0
	引擎.场景.隐藏UI = true
	引擎.场景.剧情开始 = true
	self:执行事件()
	self.丰富文本:清空()
	if self.对话组 ~= nil and self.对话组[self.对话] ~= nil then
		self:加入头像(self.对话组[self.对话][1])
		self.丰富文本:添加文本(self.对话组[self.对话][4])
	end
	self.黑条显示方式 = 1 -- 1代表向下显示，2代表向上显示
	self.黑条1位置 = -80
	self.黑条2位置 = 620
	self.黑条中断 = 0
	self.剧情方式 = 剧情方式
	self.可视 = true
end

function 场景类_剧情处理器:结束剧情()
	self.可视 = false
	self.音效组 = nil
	self.假人组 = nil
	self.行为组 = nil
	self.对话组 = nil
	self.音乐组 = nil
	self.事件组 = nil
	self.特效组 = {}
	self.显示方式 = 0
	self.缓冲时间 = 0
	self.音乐 = nil
	self.对话 = 0
	self.中断 = 0
	self.中断时间 = 0
	self.黑屏渐变 = nil
	if self.音乐 ~= nil then
		引擎.场景.音乐:播放()
	end
	引擎.场景.隐藏UI = false
	引擎.场景.剧情开始 = false
	引擎.场景.场景.人物.隐藏 = false
	self.黑条显示方式 = nil
	self.黑条1位置 = nil
	self.黑条2位置 = nil
	self.黑条中断 = nil
	self.剧情方式 = nil
	self.丰富文本:清空()
	self.头像组 = nil
	--collectgarbage("collect")
end

function 场景类_剧情处理器:加入头像(头像,jh,hd)
	local 头像资源 = 引擎.取头像(头像)
	if 头像资源[10] == nil then
		头像资源[10] = 头像资源[7]
	end
	jh = jh or 1
	self.头像组[jh] = {}
	self.头像组[jh][1] = 引擎.场景.资源:载入(头像资源[10],"网易WDF动画",头像资源[4])
	local gd = self.头像组[jh][1].高度
	if 头像 == "杀破狼" then
		gd = gd + 35
	elseif 头像 == "巫蛮儿" then
		gd = gd + 19
	elseif 头像 == "羽灵神" then
		gd = gd + 25
	elseif 头像 == "吸血鬼" then
		gd = gd + 25
	elseif 头像 == "鬼潇潇" then
		gd = gd - 1
	elseif 头像 == "桃夭夭" then
		gd = gd + 58
	elseif 头像 == "偃无师" then
		gd = gd + 33
	elseif 头像 == "狂豹" then
		gd = gd + 303
	elseif 头像 == "鲛人" then
		gd = gd + 27
	elseif 头像 == "犀牛将军_人" then
		gd = gd + 32
	elseif 头像 == "野猪精" then
		gd = gd + 25
	elseif 头像 == "修罗傀儡妖" then
		gd = gd + 235
	elseif 头像 == "泡泡" then
		gd = gd + 20
	elseif 头像 == "福星" then
		gd = gd + 28
	end
	if jh == 1 then
		self.头像组[jh][2] = 40
	else
		self.头像组[jh][2] = 695
	end
	self.头像组[jh][3] = gd
	self.头像组[jh][4] = hd
	self.头像组[jh][5] = 头像
end

function 场景类_剧情处理器:播放视频(视频)

end

function 场景类_剧情处理器:播放音乐(音乐)
	引擎.场景.音乐:停止()
	self.音乐 = 引擎.场景.资源:载入("bgm/"..音乐..".mp3","音乐",nil,引擎.场景.音量)
	self.音乐:播放()
end

function 场景类_剧情处理器:结束播放视频()

end

function 场景类_剧情处理器:结束播放音乐()
	self.音乐 = nil
	引擎.场景.音乐:停止()
end

local function 音效类_(文件号,资源包,子类)
	if 文件号 ~= nil and 文件号 ~= 0 and 引擎.场景.音效开启 then
		local 音效 = require("Fmod类")(资源包,nil,引擎.场景.资源:取偏移(资源包,文件号),2765224)
		音效:播放()
	end
end

function 场景类_剧情处理器:设置特效(名称组,特效,中断时间,播放音效)
	for i=1,#名称组 do
		for n=1,#self.假人组 do
			if self.假人组[n].名称 == 名称组[i] then
				self.假人组[n].特效 = 引擎.场景:载入特效(特效)
				break
			end
		end
	end
	if 播放音效 then
		local mc = 取音效(特效)
		if mc ~= nil then
			音效类_(mc.文件,mc.资源)
		end
	end
	if 中断时间 then
		self.中断时间 = 中断时间
		self.中断 = true
	end
end

function 场景类_剧情处理器:加入假人(成员组,出现特效,中断时间,播放音效)
	local sj = require("script/场景类/事件")
	for n=1,#成员组 do
		table.insert(self.假人组,sj(成员组[n],出现特效,播放音效))
	end
	if 播放音效 then
		local mc = 取音效(出现特效)
		if mc ~= nil then
			音效类_(mc.文件,mc.资源)
		end
	end
	self.中断时间 = 中断时间
	self.中断 = true
end

function 场景类_剧情处理器:置随机方向组(成员组,方向组)
	for n=1,#成员组 do
		for i,v in pairs(self.假人组) do
			if v.编号 == 成员组[n] then
				v.方向组 = 方向组[1]
				v.间隔 = 方向组[2]
			end
		end
	end
end

function 场景类_剧情处理器:置目标(成员,目标组)
	for i,v in pairs(self.假人组) do
		if v.编号 == 成员 then
			local 临时目标 = 生成XY(目标组[1],目标组[2])
			local a = 生成XY(floor(v.坐标.x / 20),floor(v.坐标.y / 20))
			v.目标格子 = 引擎.场景.场景.地图.寻路:寻路(a,临时目标)
			v.移动 = true
		end
	end
end

function 场景类_剧情处理器:加入任务(名称,内容)
	引擎.场景.窗口.任务栏:删除(名称)
	引擎.场景.窗口.任务栏:添加(名称,内容)
end

function 场景类_剧情处理器:屏幕移动(x,y,d)
	self.屏幕定位 = 生成XY(floor(x*20),floor(y*20))
	self.定位速度 = d
end

function 场景类_剧情处理器:执行事件()
	if self.事件组 == nil then
		return false
	end
	for n=1,4 do
		if #self.事件组 > 0 and self.事件组[1][2] == self.对话 then
			loadstring(self.事件组[1][1])()
			table.remove(self.事件组,1)
			if #self.事件组 > 0 then
				if self.事件组[1][2] == self.对话 then
					loadstring(self.事件组[1][1])()
					table.remove(self.事件组,1)
				end
			end
		end
	end
end

function 场景类_剧情处理器:置中断时间(时间)
	self.中断 = 1
	self.中断时间 = 时间
end

function 场景类_剧情处理器:置剧情跳转(页数)
	self.对话 = self.对话 + 页数
	self.丰富文本:清空()
	local ids = nil
	if self.对话组[self.对话][3] ~= nil then
		ids = self.对话组[self.对话][3][2]
		if self.对话组[self.对话][3][1] ~= nil then
			local id = self.对话组[self.对话][3][1]
			self:加入头像(self.头像组[id][5],id,true)
		end
	end
	self:加入头像(self.对话组[self.对话][1],ids)
	self.丰富文本:添加文本(self.对话组[self.对话][4])
end

local function 场景排序Y(a,b)
 	return a.坐标.y < b.坐标.y
end

function 场景类_剧情处理器:更新(dt,x,y)
	if not self.可视 then
		return
	end
	-- 音乐处理
	if self.音乐 == nil and self.音乐组 ~= nil and #self.音乐组 > 0 then
		if self.音乐组[1][2] == self.对话 then
			self:播放音乐(self.音乐组[1][1])
			table.remove(self.音乐组,1)
		end
	end
	-- 音效处理
	if self.音效组 ~= nil and #self.音效组 > 0 then
		if self.音效组[1][2] == self.对话 then
			table.remove(self.音效组,1)
		end
	end
end

function 场景类_剧情处理器:显示(dt,x,y)
	if not self.可视 then
		return
	end
	-- 显示处理
	if self.显示方式 == 0 then
		if 引擎.场景.过度精灵 == nil or 引擎.场景.过度进度 <= 200 then
			if self.黑条中断 == 5 then
				if self.黑条显示方式 == 1  then
					if self.黑条1位置 <= -10 then
						self.黑条1位置 = self.黑条1位置 + 15
					else
						self.黑条1位置 = 0
					end
					if self.黑条2位置 > 475 then
						self.黑条2位置 = self.黑条2位置 - 30
					else
						self.黑条2位置 = 455
					end
					if self.黑条1位置 == 0 and self.黑条2位置 == 455 then
						self.黑条显示方式 = 0
						self.黑条中断 = 0
					end
				elseif self.黑条显示方式 == 2 then
					if self.黑条1位置 >= -70 then
						self.黑条1位置 = self.黑条1位置 - 15
					else
						self.黑条1位置 = -80
					end
					if self.黑条2位置 < 600 then
						self.黑条2位置 = self.黑条2位置 + 30
					else
						self.黑条2位置 = 620
					end
					if self.黑条1位置 == 0 and self.黑条2位置 == 455 then
						self.黑条显示方式 = 0
						self.黑条中断 = 0
					end
				end
				self.黑条中断 = 0
			else
				self.黑条中断 = self.黑条中断 + 1
			end
		end
		for n=1,#self.头像组 do
			if self.头像组[n][4] then
				self.头像组[n][1]:灰度级()
			end
			self.头像组[n][1]:显示(30+self.头像组[n][2],self.黑条2位置-self.头像组[n][3])
		end
		self.黑条:显示(0,self.黑条1位置)
		self.黑条1:显示(0,self.黑条2位置)
		if self.对话组[self.对话] == nil then
			self:执行事件()
		end
		if self.中断 == 0 then
			self.丰富文本:更新(dt,x,y)
			self.丰富文本:显示(30,self.黑条2位置+30)

		end
		if self.对话 >= #self.对话组 and (self.中断 == 0 or self.剧情方式 == 2) then
			if 引擎.鼠标弹起(0) then
				if self.事件组 ~= nil and #self.事件组 > 0 then
					self:执行事件()
				end
				self:结束剧情()
				return false
			end
		end
		if self.对话 < #self.对话组 and self.中断 == 0  then
			self.缓冲时间 = self.缓冲时间 - 1
			if (self.剧情方式 == 1 and self.缓冲时间 <= 0 and self.中断 == 0) or (self.剧情方式 == 2 and 引擎.鼠标弹起(0)) then
				-- 判断中断
				self:置剧情跳转(1)
				if self.剧情方式 == 1 then
					self.缓冲时间 = 120
					-- 事件处理
					self.中断时间 = 60
					self.中断 = 1
				end
				if self.事件组 ~= nil and #self.事件组 > 0 then
					self:执行事件()
				end
			end
		end
		if self.中断时间 > 0 then
			self.中断时间 = self.中断时间 - 1
			if self.中断时间 <= 0 then
				self.中断 = 0
			end
		end
		if self.屏幕定位 ~= nil then
			if 取两点距离(引擎.场景.角色坐标,self.屏幕定位) <= 4.2 then -- 小于可移动点直接到达位置
				self.屏幕定位 = nil
				self.定位速度 = nil
				return false
			end
			引擎.场景.角色坐标 = 取移动坐标(引擎.场景.角色坐标,self.屏幕定位,self.定位速度)
			引擎.场景.场景.滑屏 = 取移动坐标(引擎.场景.角色坐标,self.屏幕定位,self.定位速度)
		end
	end
end

return 场景类_剧情处理器