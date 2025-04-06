-- @Author: baidwwy
-- @Date:   2024-04-03 22:06:51
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-04-08 23:49:50

--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2022-11-26 18:41:32
--======================================================================--
local 场景类_第二场景 = class()
local tp
local sj = require("script/场景类/事件")
local insert = table.insert
local remove = table.remove
local floor =  math.floor
local tx = 引擎.取头像
local mousea = 引擎.鼠标按下
local mouseb = 引擎.鼠标弹起
local xys = 生成XY

function 场景类_第二场景:初始化(根)
	tp = 根
	self.黑条=require("gge精灵类")(0,0,0,0,0)
	self.黑条:置颜色(ARGB(255,0,0,0))
end

function 场景类_第二场景:载入显示(人物组,事件组,任务,编号,回调发送)
	tp.第二场景开启 = true
	self.显示方式 = 0
	self.可显示对话 = false
	self.电影式界面加入方式 = 1
	self.电影式界面坐标 = {-70,全局游戏高度}
	--
	local x,y
	self.人物组 = {}
	self.总人物 = 人物组
	self.退出 = false
	for i=1,#人物组 do
	   	-- 是否存在主角
	   	if 人物组[i].不允许加入 == nil then
		   	if 人物组[i].主角 then
		   		local zj = {主角=true,名称=tp.队伍[1].名称,模型=人物组[i].模型 or tp.队伍[1].模型,X=人物组[i].X,Y=人物组[i].Y,方向=人物组[i].方向,编号=人物组[i].编号,武器=(tp.队伍[1].装备[3] or {}).名称,染色方案=tp.队伍[1].染色方案,染色组=tp.队伍[1].染色组,最后帧方式=人物组[i].最后帧方式}
		   		if 任务 == 1 and 编号 == 12 then
		   			zj = {主角=true,名称=tp.队伍[1].名称,模型=人物组[i].模型 or tp.队伍[1].模型,X=人物组[i].X,Y=人物组[i].Y,方向=人物组[i].方向,编号=人物组[i].编号,武器=({}).名称,染色方案=tp.队伍[1].染色方案,染色组=tp.队伍[1].染色组,最后帧方式=人物组[i].最后帧方式}
		   		end
		   		self:加入人物(zj)
		   		x,y = floor(zj.X*20),floor(zj.Y*20)
		   	else
		   	    self:加入人物(人物组[i])
		   	end
	    end
	end
	self.事件组 = 事件组
	self.文本组 = {}
	self.文本 = tp._丰富文本(960,287)
	self.头像显示方式 = 1
	self.回调 = 回调发送 or nil
	--
	self.事件进度 = 1
	self.延迟事件 = {}
	self.天气={}
	self.延迟加入进度 = {}
	self.对话延迟 = 0
	self.关闭事件 = {}
	self:解析事件()
	tp.场景.地图.增加.z = 4
	引擎.截图到纹理(tp.场景.过度纹理)
	tp.场景.过度精灵 = require("gge精灵类")(tp.场景.过度纹理)
	tp.场景.过度进度 = 155
	tp.场景.过度时间 = 3
	tp.场景.过度减少 = 7
	tp.喊话.对话 = {}
	tp.场景.滑屏.x,tp.场景.滑屏.y = x,y
	tp.角色坐标.x,tp.角色坐标.y = x,y
end

function 场景类_第二场景:电影片头(延迟帧数)
	self.显示方式 = 3
end
function 场景类_第二场景:结束剧情(延迟帧数)
	if 延迟帧数 > 0 then
		insert(self.延迟事件,{延迟帧数,"结束剧情"})
	else
		if self.回调~=nil then
		    发送数据(98,{类型=self.回调})
		end
		self.天气=nil
		self.退出 = true
		self.退出步骤 = 0
	end
end
function 场景类_第二场景:加入人物(人物)
	local rw = sj(tp,人物)
	insert(self.人物组,rw)
end

function 场景类_第二场景:解析事件()
	local sjz = self.事件组[self.事件进度]
	if sjz == nil then
		return
	end
	for i=1,#sjz do
		loadstring(sjz[i])()
	end
end

function 场景类_第二场景:置入人物(延迟帧数,人物编号组,人物特效组,单独特效组)
	if 延迟帧数 > 0 then
		insert(self.延迟事件,{延迟帧数,"置入人物",人物编号组,人物特效组,单独特效组})
	else
		for i=1,#人物编号组 do
			local 编号 = 人物编号组[i]
			self.总人物[编号].不允许加入 = nil
			self:加入人物(self.总人物[编号])
			if 人物特效组[i] ~= nil then
				for n=1,#self.人物组 do
					if self.人物组[n].编号 == 人物编号组[i] then
						self.人物组[n].特效 = tp:载入特效(人物特效组[i])
						break
					end
				end
			end
		end
	end
end

function 场景类_第二场景:加入喊话(延迟帧数,人物编号,文本,时间)
	if 延迟帧数 > 0 then
		insert(self.延迟事件,{延迟帧数,"加入喊话",人物编号,文本,时间})
	else
		for i=1,#self.人物组 do
			if self.人物组[i].编号 == 人物编号 then
				self.人物组[i].喊话:写入(self.人物组[i],self.人物组[i].假人,文本,时间)
				break
			end
		end
	end
end

function 场景类_第二场景:删除喊话()
	for i=1,#self.人物组 do
		self.人物组[i].喊话.对话 = {}
	end
end

function 场景类_第二场景:置人物移动(延迟帧数,人物编号,x,y)
	if 延迟帧数 > 0 then
		insert(self.延迟事件,{延迟帧数,"移动",人物编号,x,y})
	else
		for i=1,#self.人物组 do
			if self.人物组[i].编号 == 人物编号 then
				local a = xys(floor(self.人物组[i].坐标.x / 20),floor(self.人物组[i].坐标.y / 20))
				local b = xys(floor(x),floor(y))
				self.人物组[i].目标格子 = tp.场景.地图.寻路:寻路(a,b)
				self.人物组[i].移动 = true
				self.人物组[i]:开始移动()
				break
			end
		end
	end
end

function 场景类_第二场景:置人物方向(延迟帧数,人物编号,方向)
	if 延迟帧数 > 0 then
		insert(self.延迟事件,{延迟帧数,"置方向",人物编号,方向})
	else
		for i=1,#self.人物组 do
			if self.人物组[i].编号 == 人物编号 then
				self.人物组[i]:置方向(方向)
				break
			end
		end
	end
end

function 场景类_第二场景:置人物模型(延迟帧数,人物编号,模型,武器)
	if 延迟帧数 > 0 then
		insert(self.延迟事件,{延迟帧数,"置模型",人物编号,模型,武器})
	else
		for i=1,#self.人物组 do
			if self.人物组[i].编号 == 人物编号 then
				self.人物组[i]:置模型(模型,武器)
				break
			end
		end
	end
end

function 场景类_第二场景:置人物帧行为(延迟帧数,人物编号,帧行为)
	if 延迟帧数 > 0 then
		insert(self.延迟事件,{延迟帧数,"置帧行为",人物编号,帧行为})
	else
		for i=1,#self.人物组 do
			if self.人物组[i].编号 == 人物编号 then
				self.人物组[i].最后帧方式 = 帧行为
				if self.人物组[i].最后帧方式 == 1 then
					self.人物组[i].假人.静立.当前帧 = self.人物组[i].假人.静立.结束帧
					self.人物组[i].假人.静立:更新纹理()
				end
				break
			end
		end
	end
end

function 场景类_第二场景:置人物名称(延迟帧数,人物编号,名称)
	if 延迟帧数 > 0 then
		insert(self.延迟事件,{延迟帧数,"置名称",人物编号,名称})
	else
		for i=1,#self.人物组 do
			if self.人物组[i].编号 == 人物编号 then
				self.人物组[i].名称 = 名称
				self.人物组[i].名称偏移 = xys(tp.字体表.人物字体:取宽度(名称) / 2,-15)
				break
			end
		end
	end
end

function 场景类_第二场景:加进度(延迟帧数,进度)
	if 延迟帧数 > 0 then
		self.延迟加入进度[1] = 延迟帧数
		self.延迟加入进度[2] = 进度
	else
		self.事件进度 = self.事件进度 + 进度
	end
end

function 场景类_第二场景:加入特效(延迟帧数,编号,特效)
	if 延迟帧数 > 0 then
		insert(self.延迟事件,{延迟帧数,"加入特效",编号,特效})
	else
		if 特效=="下雨" or 特效=="打雷" then --天气
        	self.天气[#self.天气+1]=tp:载入特效(特效)
        else
        	for i=1,#self.人物组 do
				if self.人物组[i].编号 == 编号 then
					self.人物组[i].特效 = tp:载入特效(特效)
					break
				end
			end
        end
	end
end


function 场景类_第二场景:加入文本(延迟帧数,头像,文本,点击事件组)
	if 延迟帧数 > 0 then
		insert(self.延迟事件,{延迟帧数,"加入文本",头像,文本,点击事件组})
	else
		insert(self.文本组,{头像,文本,点击事件组})
		if self.显示方式 ~= 2 then
			self.显示方式 = 2
			self:文本解析()
		end
	end
end


function 场景类_第二场景:下一页(延迟帧数)
	if 延迟帧数 > 0 then
		insert(self.延迟事件,{延迟帧数,"下一页"})
	else
		if #self.文本组 == 1 then
			self.天气=nil
			self:关闭(0)
			return
		end
		remove(self.文本组,1)
		self:文本解析()
	end
end

function 场景类_第二场景:关闭(延迟帧数)
	if 延迟帧数 > 0 then
		insert(self.关闭事件,{延迟帧数})
	else
		self.退出 = true
		self.退出步骤 = 0
	end
end

function 场景类_第二场景:文本解析()
	self.文本:清空()
	self.文本:添加文本(self.文本组[1][2])
	if self.文本组[1][1] == nil then
		local 头像资源 = tx(tp.队伍[1].模型)
		self.头像 = tp.资源:载入(头像资源[10] or 头像资源[7],"网易WDF动画",头像资源[4])
		self.头像高度 = self.头像.高度 + tp:取y偏移(头像)
	else
		local 头像资源 = tx(self.文本组[1][1])
		self.头像 = tp.资源:载入(头像资源[10] or 头像资源[7],"网易WDF动画",头像资源[4])
		self.头像高度 = self.头像.高度 + tp:取y偏移(头像)
	end
	self.文本事件 = self.文本组[1][3]
end

function 场景类_第二场景:显示(dt,x,y)
	if tp.场景.过度精灵 == nil then
		if self.天气~=nil and #self.天气>0 then
			self.黑条:置区域(0,0,全局游戏宽度,全局游戏高度)
			self.黑条:置颜色(ARGB(150,0,0,0))
			self.黑条:显示(0,0)
			for i=1,#self.天气 do
				self.天气[i]:更新()
			    self.天气[i]:显示(258,280)
			end
		end
		if self.显示方式 == 2 then -- 电影式
			if self.电影式界面加入方式 == 1 then
				local wb = 0
				self.电影式界面坐标[1] = self.电影式界面坐标[1] + 2
				self.电影式界面坐标[2] = self.电影式界面坐标[2] - 4
				if self.电影式界面坐标[1] >= 0 then
					self.电影式界面坐标[1] = 0
					wb = wb + 1
				end
				if self.电影式界面坐标[2] <= 全局游戏高度-137 then
					self.电影式界面坐标[2] = 全局游戏高度-137
					wb = wb + 1
				end
				if wb == 2 then
					self.电影式界面加入方式 = 3
				end
			end
			self.黑条:置区域(0,0,全局游戏宽度,70)
			self.黑条:显示(0,self.电影式界面坐标[1])
			self.黑条:置区域(0,0,全局游戏宽度,140)
			self.黑条:显示(0,self.电影式界面坐标[2])
			if self.电影式界面加入方式 == 3 then
				self.对话延迟 = self.对话延迟 + 1
				self.文本:显示(16,498)
				self.头像:显示(10,480-self.头像高度)
				if mouseb(0) and self.对话延迟 >= 30 then
					if self.文本事件 == nil then
						self:下一页(0)
					else
						for i=1,#self.文本事件 do
							loadstring(self.文本事件[i])()
						end
					end
					self.对话延迟 = 0
				end
			end
		elseif self.显示方式 == 3 then
			if self.电影式界面加入方式 == 1 then
				local wb = 0
				self.电影式界面坐标[1] = self.电影式界面坐标[1] + 2
				self.电影式界面坐标[2] = self.电影式界面坐标[2] - 4
				if self.电影式界面坐标[1] >= 0 then
					self.电影式界面坐标[1] = 0
					wb = wb + 1
				end
				if self.电影式界面坐标[2] <= 全局游戏高度-137 then
					self.电影式界面坐标[2] = 全局游戏高度-137
					wb = wb + 1
				end
				if wb == 2 then
					self.电影式界面加入方式 = 3
				end
			end
			self.黑条:置区域(0,0,全局游戏宽度,70)
			self.黑条:显示(0,self.电影式界面坐标[1])
			self.黑条:置区域(0,0,全局游戏宽度,140)
			self.黑条:显示(0,self.电影式界面坐标[2])
		end
		-- 延迟事件
		for i=1,#self.延迟事件 do
			if self.延迟事件[i] ~= nil then
				self.延迟事件[i][1] = self.延迟事件[i][1] - 1
				if self.延迟事件[i][1] <= 0 then
					if self.延迟事件[i][2] == "置入人物" then
						self:置入人物(0,self.延迟事件[i][3],self.延迟事件[i][4],self.延迟事件[i][5])
					elseif self.延迟事件[i][2] == "加入喊话" then
						self:加入喊话(0,self.延迟事件[i][3],self.延迟事件[i][4],self.延迟事件[i][5])
					elseif self.延迟事件[i][2] == "移动" then
						self:置人物移动(0,self.延迟事件[i][3],self.延迟事件[i][4],self.延迟事件[i][4])
					elseif self.延迟事件[i][2] == "置方向" then
						self:置人物方向(0,self.延迟事件[i][3],self.延迟事件[i][4])
					elseif self.延迟事件[i][2] == "置模型" then
						self:置人物模型(0,self.延迟事件[i][3],self.延迟事件[i][4],self.延迟事件[i][5])
					elseif self.延迟事件[i][2] == "置帧行为" then
						self:置人物帧行为(0,self.延迟事件[i][3],self.延迟事件[i][4])
					elseif self.延迟事件[i][2] == "置名称" then
						self:置人物名称(0,self.延迟事件[i][3],self.延迟事件[i][4])
					elseif self.延迟事件[i][2] == "加入文本" then
						self:加入文本(0,self.延迟事件[i][3],self.延迟事件[i][4],self.延迟事件[i][5])
					elseif self.延迟事件[i][2] == "加入特效" then
						self:加入特效(0,self.延迟事件[i][3],self.延迟事件[i][4])
					elseif self.延迟事件[i][2] == "结束剧情" then
						self:结束剧情(0)
					elseif self.延迟事件[i][2] == "电影片头" then
						self:电影片头(0)
					end
					self.延迟事件[i] = nil
	 			end
	 		end
		end
		local sl = #self.延迟事件
		for n=1,sl do
			for i=1,#self.延迟事件 do
				if self.延迟事件[i] == nil then
					remove(self.延迟事件,i)
		 		end
			end
		end
		-- 延迟加入进度
		if sl == 0 and self.延迟加入进度[1] ~= nil then
			self.延迟加入进度[1] = self.延迟加入进度[1] - 1
			if self.延迟加入进度[1] <= 0 then
				self:加进度(0,self.延迟加入进度[2])
				self:解析事件()
				self.延迟加入进度 = {}
			end
		end
		-- 延迟关闭进度
		if sl == 0 and self.关闭事件[1] ~= nil then
			self.关闭事件[1] = self.关闭事件[1] - 1
			if self.关闭事件[1] <= 0 then
				self:关闭(0)
				self.关闭事件 = {}
			end
		end
	end
	if self.退出 then
		if self.退出步骤 == 0 then
			self:删除喊话()
			self.显示方式 = 0
		elseif self.退出步骤 == 1 then
		    引擎.截图到纹理(tp.场景.过度纹理)
			tp.场景.过度精灵 = require("gge精灵类")(tp.场景.过度纹理)
			tp.场景.过度进度 = 255
			tp.场景.过度时间 = 3
		elseif self.退出步骤 == 2 then
			self.人物组 = nil
			self.事件组 = nil
			self.文本组 = nil
			self.文本 = nil
			tp.第二场景开启 = false
			self.显示方式 = nil
			self.可显示对话 = nil
			self.电影式界面加入方式 = nil
			self.电影式界面坐标 = nil
			self.总人物 = nil
			self.头像 = nil
			self.头像显示方式 = nil
			self.天气=nil
			--
			self.事件进度 = nil
			self.延迟事件 = nil
			self.延迟加入进度 = nil
			self.对话延迟 = nil
			self.关闭事件 = nil
			tp.角色坐标.x,tp.角色坐标.y = tp.场景.人物.坐标.x,tp.场景.人物.坐标.y
			tp.场景.滑屏.x,tp.场景.滑屏.y = tp.角色坐标.x,tp.角色坐标.y
			tp.隐藏UI = false
			collectgarbage("collect")
			return
		end
		self.退出步骤 = self.退出步骤 + 1
	end
end


return 场景类_第二场景