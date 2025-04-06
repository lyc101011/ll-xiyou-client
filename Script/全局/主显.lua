-- @Author: baidwwy
-- @Date:   2024-08-04 20:56:39
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-08-11 16:17:05
-- @Author: baidwwy
-- @Date:   2024-04-14 22:22:14
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-07-24 22:56:04
-- @Author: baidwwy
-- @Date:   2023-10-20 23:05:33
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-05-04 00:34:16
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2023-06-22 23:46:58
--======================================================================--
local collectgarbage = collectgarbage
local xys = 生成XY
local jr = require("script/全局/假人")
local wjtp = require("script/全局/玩家")
local cs = require("script/场景类/传送点")
local jl = require("gge精灵类")
local floor = math.floor
local lsph = nil
local insert = table.insert
local ygs = 引擎.取野怪
local mls = 引擎.取明雷
local zt,lsph
local BGM = 取Bgm
local cjs = 引擎.取场景等级
local jtus = 引擎.截图到纹理
local hmzb = 取画面坐标
local wj = 引擎.文件是否存在
local 场景类_地图 = class()

function 场景类_地图:初始化(根)
	tp = 根
	zt = tp.字体表.描边字体
	self.战斗 ={}
	self.地图 = require("script/资源类/地图类")(tp,self)
	self.选中窗口 = 0
	self.移动窗口 = false
	self.抓取物品 = nil
	self.抓取物品ID = nil
	self.抓取物品注释 = nil
	self.战斗提示 = ""
	self.战斗提示时间 = 0
	self.过度纹理 = require("gge纹理类")():渲染目标(全局游戏宽度,全局游戏高度)-- 创建一个截图的背景，实现官网的过度功能
	self.过度进度 = 255
	self.过度时间 = 3
	self.过度减少 = 5
	self.翻转基数 = 1
	self.开启场景加载 = false
	self.屏幕坐标 = xys()
	self.滑屏 = xys()
	self.传送区 = nil
	self.传送时间 = 0
	self.当前刷新 = nil
	self.场景最低等级 = nil
	self.场景最高等级  = nil
end

function 场景类_地图:转移(地图,X,Y) --进入游戏
	-- tp.标题 = nil
	-- tp.读取 = nil
	-- tp.创建 = nil
	tp.进程 = 4
	tp.角色坐标.x,tp.角色坐标.y = floor(X),floor(Y)
	self.滑屏.x,self.滑屏.y = floor(X),floor(Y)
	tp.当前地图 = tonumber(地图)
	--local res = tonumber(string.sub(tp.当前地图,-1))
	if tp.窗口.小地图.可视 then
	    tp.窗口.小地图:打开(9999999999999999999999)
	end
	self.地图:加载(wdf配置.."/scene/"..取地图id(tp.当前地图)..".map")
	--end
	--self.地图:加载(wdf配置.."/scene/"..地图..".map")
	self.人物 = require("script/全局/人物")(tp)
	local yu = BGM(tp.当前地图)
	tp:场景音乐类(wdf配置.."/Audio/"..yu..".mp3")
 	-- tp:场景音乐类(wdf配置.."/Audio/"..取地图id(tp.当前地图)..".mp3")
	self.假人 = {}
	self.玩家 = {}
	self.传送 = {}
	self.场景人物 = {}
	insert(self.场景人物, self.人物)
	tp.窗口.时辰:刷新()
	jtus(self.过度纹理)
	self.过度精灵 = jl(self.过度纹理)
	self.过度进度 = 255
	self.过度时间 = 3
	self.过度减少 = 5
	tp.隐藏UI = true
	tp.恢复UI = true
	self.人物:停止移动()
end

function 场景类_地图:添加玩家(sj)
	-- for i=1,5 do
	-- 	self.玩家[sj.id]=wjtp(sj)
	-- 	insert(self.场景人物, self.玩家[sj.id])
	-- end
   	self.玩家[sj.id]=wjtp(sj)
	insert(self.场景人物, self.玩家[sj.id])
end

function 场景类_地图:删除玩家(角色ID)
	table.remove(self.玩家,角色ID)
	for i=1,#self.场景人物 do
		if self.场景人物[i]~=nil and self.场景人物[i].类型=="玩家" and self.场景人物[i].玩家ID~=nil and self.场景人物[i].玩家ID == 角色ID then
			table.remove(self.场景人物, i)
		end
	end
end

function 场景类_地图:玩家队长(角色ID,是否)
	self.玩家[角色ID].队长开关=是否
end

function 场景类_地图:玩家战斗(角色ID,是否)
	self.玩家[角色ID].战斗开关=是否
end

function 场景类_地图:更新行走(路径,行走玩家ID)
	if self.玩家[行走玩家ID]~=nil and self.玩家[行走玩家ID].玩家ID~=nil and self.玩家[行走玩家ID].玩家ID == 行走玩家ID then
		local a = xys(floor(self.玩家[行走玩家ID].真实坐标.x / 20),floor(self.玩家[行走玩家ID].真实坐标.y / 20))
		self.玩家[行走玩家ID].目标格子 = tp.场景.地图.寻路:寻路(a,路径)
		self.玩家[行走玩家ID].行走开关 = true
	end
end

function 场景类_地图:设置传送(内容)
	local qcs = 场景取传送表
	local c = qcs(tp.当前地图)--内容
	-- if tp.当前地图 > 40000000 then
	-- 	if tp.房屋数据.庭院ID == tp.当前地图 then
	-- 		c = qcs(tp.房屋数据.庭院地图)
	-- 	elseif tp.房屋数据.房屋ID == tp.当前地图 then
	-- 		c = qcs(tp.房屋数据.房屋地图)
	-- 	elseif tp.房屋数据.阁楼ID == tp.当前地图 then
	-- 		c = qcs(tp.房屋数据.阁楼地图)
	-- 	elseif tp.房屋数据.牧场ID == tp.当前地图 then
	-- 		c = qcs(tp.房屋数据.牧场地图)
	-- 	end
	-- end
	if #c > 0 then
		for n=1,#c do
		 	self.传送[n] = cs(c[n].x,c[n].y,c[n].切换,n)
		 	q = nil
		end
	end
end

function 场景类_地图:设置NPC()
	local qjr = 场景取假人表
	-- local lsb = tp.临时Npc
	local dqNPC = qjr(tp.当前地图,nil,1)--内容
	local b = mls(tp.当前地图)
	for k,v in pairs(dqNPC) do
		dqNPC[k].编号 = k
		insert(self.假人,jr(dqNPC[k]))
	end
	b=nil
end

function 场景类_地图:设置假人(内容)
	self.假人 = {}
	self.玩家 = {}
	self.传送 = {}
	self:设置NPC()
	self.场景人物 = {}
	insert(self.场景人物, self.人物) --主角
	for i=1,#self.假人 do
		insert(self.场景人物, self.假人[i]) --假人显示
	end
	-- for i=1,#lsb do
	-- 	if lsb[i].地图 == 地图 then
	-- 		local npc = jr(lsb[i])
	-- 		insert(self.假人,npc)
	-- 		insert(self.场景人物, npc)
	-- 	end
	-- end
end

function 场景类_地图:删除单位(编号)
	local 删除序列=0
	for n, v in pairs(tp.场景.场景人物) do
		if tp.场景.场景人物[n].真实编号==编号 then
			删除序列=编号
		end
	end
	if 删除序列~=0 then
		table.remove(tp.场景.场景人物,删除序列)
	end
	local 删除序列=0
	for n, v in pairs(self.假人) do
		if self.假人[n].真实编号==编号 then
			删除序列=编号
		end
	end
	if 删除序列~=0 then
		table.remove(self.假人,删除序列)
	end
end

function 场景类_地图:传送至(地图,坐标x,坐标y,fc)--跳转
	if fc ~= nil then
		jtus(self.过度纹理)
		self.过度精灵 = jl(self.过度纹理)
		self.过度进度 = 255
		self.过度时间 = 3
		self.过度减少 = 5
		tp.角色坐标.x,tp.角色坐标.y = floor(坐标x*20),floor(坐标y*20)
		self.地图.移动xy.x,self.地图.移动xy.y = tp.角色坐标.x,tp.角色坐标.y
		self.滑屏.x,self.滑屏.y = tp.角色坐标.x,tp.角色坐标.y
		tp.当前地图 = tonumber(地图)
		--local res = tonumber(string.sub(tp.当前地图,-1))
		if tp.窗口.小地图.可视 then
		    tp.窗口.小地图:打开(9999999999999999999999)
		end
		self.屏幕坐标 = hmzb(self.滑屏.x,self.滑屏.y,self.地图.宽度,self.地图.高度)
		self.场景人物 = nil
		self.假人 = nil
		self.传送 = nil
		self.玩家 = nil
		-- 资源缓存:清空缓存()
		self.地图:加载(wdf配置.."/scene/"..取地图id(tp.当前地图)..".map")
		--end
		self:传送指定()
		local 地图等级={}
		地图等级[1],地图等级[2]=cjs(tp.当前地图)
		if 地图等级[1]~=nil then
			tp.场景.场景最低等级=地图等级[1]
			tp.场景.场景最高等级=地图等级[2]
			tp.窗口.消息框:添加文本("#Y/本场景等级为"..地图等级[1].."-"..地图等级[2].."级\n#R/请注意，您已进入战斗区域！此区域允许玩家相互之间发起战斗！","xt")
			-- tp.窗口.消息框:添加文本("#R/请注意，您已进入战斗区域！此区域允许玩家相互之间发起战斗！")
		else
			tp.场景.场景最低等级=nil
			tp.场景.场景最高等级=nil
		end
		-- if tp.窗口.道具行囊.可视 then
		--     tp.窗口.道具行囊:打开()
		-- end
		return
	end
	self.传送区 = {地图,坐标x,坐标y,fc}
end

function 场景类_地图:传送指定()
	local yu = BGM(引擎.场景.当前地图)
	tp:场景音乐类(wdf配置.."/Audio/"..yu..".mp3")
	self.人物:停止移动()
	self.场景人物 = {}
	self.假人 = {}
	self.传送 = {}
	self.玩家 = {}
	self.地图.移动xy.x,self.地图.移动xy.y = 引擎.场景.角色坐标.x,引擎.场景.角色坐标.y
	insert(self.场景人物, self.人物)
	引擎.场景.窗口.时辰:刷新()
end

function 场景类_地图:显示(dt,x,y)
	self.地图:显示(引擎.场景.角色坐标,self.屏幕坐标,x,y,dt)
	-- 全局时辰刷新()
	if 引擎.场景.战斗中 then
		战斗类:更新(dt,x,y)
		战斗类:显示(dt,x,y)
	else
		-- if self.战斗.跳转事件 ~= nil then
		-- 	if self.战斗.跳转事件 == "贼王" then
		-- 		引擎.强盗战斗(true,"贼王",引擎.场景.当前地图,0)
		-- 	end
		-- 	self.战斗.跳转事件 = nil
		-- end
		if self.传送~=nil and #self.传送~=nil then
			for n=1,#self.传送 do
				if self.传送[n] ~= nil then
					self.传送[n]:更新(dt,xx,yy,偏移)
				end
			end
		end
	end

end

function 刷新道具逻辑(物品,指定ID,及时刷新) -- 及时刷新物品逻辑
	if tp.消息栏焦点 then
		return
	end
	-- 及时刷新有关道具的数据
	if 物品 ~= nil or 及时刷新 ~= nil then
		tp.道具列表[指定ID] = 物品
	end
	if tp.窗口.道具行囊.可视 then
		tp.窗口.道具行囊.物品[指定ID]:置物品(tp.道具列表[指定ID])
	end
	if tp.窗口.宠物炼妖栏.可视 then
		tp.窗口.宠物炼妖栏.物品[指定ID]:置物品(tp.道具列表[指定ID])
	end
	if tp.窗口.打造.可视 then
		tp.窗口.打造.物品[指定ID]:置物品(tp.道具列表[指定ID])
	end
	-- if tp.窗口.摊位打造.可视 then
	-- 	tp.窗口.摊位打造.物品[指定ID]:置物品(tp.道具列表[指定ID])
	-- end
	if tp.窗口.装备开运.可视 then
		tp.窗口.装备开运.物品[指定ID]:置物品(tp.道具列表[指定ID])
	end
	if tp.窗口.幻化.可视 then
		tp.窗口.幻化.物品[指定ID]:置物品(tp.道具列表[指定ID])
	end
	if tp.窗口.出售.可视 then
		tp.窗口.出售.物品[指定ID]:置物品(tp.道具列表[指定ID])
	end
	if tp.窗口.仓库类.可视 then
		tp.窗口.仓库类.物品[指定ID]:置物品(tp.道具列表[指定ID])
	end
	if tp.窗口.法宝锻造.可视 then
		tp.窗口.法宝锻造.物品[指定ID]:置物品(tp.道具列表[指定ID])
	end
	if tp.窗口.合成.可视 then
		tp.窗口.合成.物品[指定ID]:置物品(tp.道具列表[指定ID])
	end
end

function 刷新道具行囊(内容,类型)
	if 内容.银子 ~= nil then
		引擎.场景.金钱=内容.银子
	end
	if 内容.仙玉 ~= nil then
		引擎.场景.仙玉=内容.仙玉
	end
	if 内容.储备 ~= nil then
		引擎.场景.储备=内容.储备
	end
	if 内容.存银 ~= nil then
		引擎.场景.存银=内容.存银
	end
	if 内容.装备 ~= nil then
		引擎.场景.队伍[1].装备=内容.装备
	end
	if 内容.灵饰 ~= nil then
		引擎.场景.队伍[1].灵饰=内容.灵饰
	end
	if 内容.套装激活 ~= nil then
	tp.窗口.道具行囊.套装激活=内容.套装激活
	end
	if 内容.套装名称 ~= nil then
	tp.窗口.道具行囊.套装名称=内容.套装名称
   else
	tp.窗口.道具行囊.套装名称=nil
	end


	if 类型 == "行囊" then
		for i=21,40 do
			引擎.场景.道具列表[i] = 内容.道具[i-20]
		end
		if tp.窗口.道具行囊.可视 then
			tp.窗口.道具行囊:刷新道具(引擎.场景.道具列表)
		end
	elseif 类型 == "任务包裹" then
		for i=41,60 do
			引擎.场景.道具列表[i] = 内容.道具[i-40]
		end
		if tp.窗口.道具行囊.可视 then
			tp.窗口.道具行囊:刷新道具(引擎.场景.道具列表)
		end
		if tp.窗口.给予NPC.可视 then
			tp.窗口.给予NPC:刷新道具(引擎.场景.道具列表)
		end
	else
		for i=1,80 do
			引擎.场景.道具列表[i] = 内容.道具[i]
		end
		if tp.窗口.道具行囊.可视 then
			tp.窗口.道具行囊:刷新道具(引擎.场景.道具列表)
		end
		if tp.窗口.宠物炼妖栏.可视 then
			tp.窗口.宠物炼妖栏:刷新道具(引擎.场景.道具列表)
		end
		if tp.窗口.打造.可视 then
			tp.窗口.打造:刷新道具(引擎.场景.道具列表)
		end
		-- if tp.窗口.摊位打造.可视 then
		-- 	tp.窗口.摊位打造:刷新道具(引擎.场景.道具列表)
		-- end
		if tp.窗口.装备开运.可视 then
			tp.窗口.装备开运:刷新道具(引擎.场景.道具列表)
		end
		if tp.窗口.幻化.可视 then
			tp.窗口.幻化:刷新道具(引擎.场景.道具列表)
		end
		if tp.窗口.给予NPC.可视 then
			tp.窗口.给予NPC:刷新道具(引擎.场景.道具列表)
		end
		if tp.窗口.合成.可视 then
			tp.窗口.合成:刷新()
		end
		if tp.窗口.坐骑修炼.可视 then
			tp.窗口.坐骑修炼:刷新道具()
		end
		-- if tp.窗口.仓库类.可视 then
		-- 	tp.窗口.仓库类.物品[指定ID]:置物品(tp.道具列表[指定ID])
		-- end
	end
end
function 取背包物品数量(名称)
	local 数量 = 0
	for i=1,20 do
		if 引擎.场景.道具列表[i]~= nil and 引擎.场景.道具列表[i].名称 == 名称 then
			if 引擎.场景.道具列表[i].数量 == nil then
				数量 = 数量 + 1
			else
				数量 = 数量+引擎.场景.道具列表[i].数量
			end
		end
	end
	return 数量
	-- body
end

function 刷新宝宝列表(内容)
	引擎.场景.队伍[1].宝宝列表=内容
	引擎.场景.队伍[1]:刷新宝宝技能()
	if 引擎.场景.窗口.宠物炼妖栏.可视 then
		引擎.场景.窗口.宠物炼妖栏:清除()
	end
end

return 场景类_地图