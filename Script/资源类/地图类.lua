-- @Author: baidwwy
-- @Date:   2024-06-13 16:59:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-12-27 22:23:22
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2024-06-06 05:03:15
-- 梦幻西游游戏资源破解 baidwwy@vip.qq.com(313738139) 老毕   和 C++PrimerPlus 717535046 这俩位大神破解所以资源
--======================================================================--
local 地图类 = class()
local ceil = math.ceil
local floor = math.floor
local abs = math.abs
local sort = table.sort
local tp,tps,hc
local hm = 取画面坐标
local insert = table.insert
local remove = table.remove
local pair = pairs
local fgjl = require("script/资源类/gge精灵类")()
local _lj = require("script/资源类/路径类")
local map = require("script/资源类/MAP")
local dtx = require("script/数据中心/特效")
-- local tytx = require("script/数据中心/庭院特效")
local h,l
-- local 测试 = false
local maps
local function 排序(a,b)
	if a.坐标.y==b.坐标.y then
		if a.类型=="玩家" and b.类型=="玩家" then
			return a.玩家ID>b.玩家ID
		elseif a.类型=="假人" and b.类型=="假人" then
			return a.编号>b.编号
		end
		return (a.类型=="假人" and b.类型=="主角") or (a.类型=="玩家" and b.类型=="主角") or (a.类型=="假人" and b.类型=="玩家")
	end
	return a.坐标.y < b.坐标.y
end

function 地图类:初始化(根,根1)
	tp = 根
	tps = 根1
	self.移动xy={}
	self.移动xy.x,self.移动xy.y=tp.角色坐标.x,tp.角色坐标.y
	self.云 = 引擎.场景.资源:载入('mapani.wdf',"网易WDF动画",4046268095)
	self.云1 = 引擎.场景.资源:载入('mapani.wdf',"网易WDF动画",3362353993)
	-- self.云2 = 引擎.场景.资源:载入('mapani.wdf',"网易WDF动画",2206051174)
	-- self.云2 = 引擎.场景.资源:载入('mapani.wdf',"网易WDF动画",0x1d61bb5b)
end

function 地图类:加载(文件)
	test1()
	if 文件==wdf配置.."/"..[[scene/5135.map]] or 文件==wdf配置.."/"..[[scene/5136.map]] or 文件==wdf配置.."/"..[[scene/5137.map]] or 文件==wdf配置.."/"..[[scene/5138.map]] or 文件==wdf配置.."/"..[[scene/5139.map]] then
        文件=wdf配置.."/"..[[scene/1197.map]]
    elseif 文件==wdf配置.."/"..[[scene/6227.map]] then --武神坛
		文件=wdf配置.."/"..[[scene/2000.map]]
	-- elseif 文件==wdf配置.."/"..[[scene/101.map]] then --助战黑屏处理
	--     文件=wdf配置.."/"..[[scene/1001.map]]
    elseif 文件==wdf配置.."/"..[[scene/6135.map]] then
		文件=wdf配置.."/"..[[scene/1001.map]]
	elseif 文件==wdf配置.."/"..[[scene/6136.map]] then
		文件=wdf配置.."/"..[[scene/1526.map]]
	elseif 文件==wdf配置.."/"..[[scene/6228.map]] then --修业所
		文件=wdf配置.."/"..[[scene/1343.map]]
    end
	if hc ~= tp.当前地图 then
		hc = tp.当前地图
		maps = nil
		self.mapzz = {}
		self.增加 = {x=0,y=0,z=0}
		self.db = {}
		self.fjzz = {}
		self.map = map(文件)
		self.宽度,self.高度,self.行数,self.列数 = self.map.Width,self.map.Height,self.map.MapRowNum,self.map.MapColNum
		self.寻路 = _lj.创建(hc,self.列数*16,self.行数*12,self.map:取障碍())
		self.移动xy.x,self.移动xy.y=tp.角色坐标.x,tp.角色坐标.y
		self.传送tx = {}
		self.房屋tx = {}
		self.主角 = nil
		-- self.云雾 = 引擎.场景.资源:载入('mapani.wdf',"网易WDF动画",0x1d61bb5b)
		-- if tp.当前地图 > 40000000 then
		--      if tp.房屋数据.庭院ID == tp.当前地图 then
		--           local ty = tp.房屋数据.庭院装饰
		--           if #ty > 0 then
		--                for nw=1,#ty do
		--                     if ty[nw]~=nil then
		--                         self.房屋tx[nw] = tytx(ty[nw].x,ty[nw].y,ty[nw].名称,ty[nw].方向,"庭院")
		--                         self.房屋tx[nw].编号 = nw
		--                     end
		--                end
		--           end
		--      elseif tp.房屋数据.房屋ID == tp.当前地图 then
		--           local ty = tp.房屋数据.室内装饰
		--           if #ty > 0 then
		--                for nw=1,#ty do
		--                     if ty[nw]~=nil then
		--                         self.房屋tx[nw] = tytx(ty[nw].x,ty[nw].y,ty[nw].名称,ty[nw].方向,"室内")
		--                         self.房屋tx[nw].编号 = nw
		--                     end
		--                end
		--           end
		--      elseif tp.房屋数据.阁楼ID == tp.当前地图 then
		--           local ty = tp.房屋数据.阁楼装饰
		--           if #ty > 0 then
		--                for nw=1,#ty do
		--                     if ty[nw]~=nil then
		--                         self.房屋tx[nw] = tytx(ty[nw].x,ty[nw].y,ty[nw].名称,ty[nw].方向,"室内")
		--                         self.房屋tx[nw].编号 = nw
		--                     end
		--                end
		--           end
		--      elseif tp.房屋数据.牧场ID == tp.当前地图 then
		--           local ty = tp.房屋数据.牧场装饰
		--           if #ty > 0 then
		--                for nw=1,#ty do
		--                     if ty[nw]~=nil then
		--                         self.房屋tx[nw] = tytx(ty[nw].x,ty[nw].y,ty[nw].名称,ty[nw].方向,"牧场")
		--                         self.房屋tx[nw].编号 = nw
		--                     end
		--                end
		--           end
		--      end
		-- else
			-- if tp.地图特效 then
			--      self.特效cw = 取传特效表(tp.当前地图)
			--      if #self.特效cw > 0 then
			--           for nw=1,#self.特效cw do
			--                if self.特效cw[nw]~=nil then
			--                    self.传送tx[nw] = dtx(self.特效cw[nw].x,self.特效cw[nw].y,self.特效cw[nw].切换,self.特效cw[nw].资源)
			--                end
			--           end
			--      end
			-- end
		-- end
		  if tp.当前地图==1003 then
		    self.特效cw = 取传特效表(tp.当前地图)
		    if #self.特效cw > 0 then
				for a=1,#self.特效cw do
					if self.特效cw[a]~=nil then
					    self.传送tx[a] = dtx(self.特效cw[a].x,self.特效cw[a].y,self.特效cw[a].切换,self.特效cw[a].资源)
					end
				end
			end
	end
		全局临时路径=文件
	end
end

function 地图类:重新加载(文件)
	if 文件==wdf配置.."/"..[[scene/6001.map]] then
		文件=wdf配置.."/"..[[scene/1131.map]]
	elseif 文件==wdf配置.."/"..[[scene/6002.map]] then
		文件=wdf配置.."/"..[[scene/1209.map]]
	elseif 文件==wdf配置.."/"..[[scene/6003.map]] then
		文件=wdf配置.."/"..[[scene/1110.map]]
	elseif 文件==wdf配置.."/"..[[scene/6004.map]] then
		文件=wdf配置.."/"..[[scene/1002.map]]
	elseif 文件==wdf配置.."/"..[[scene/5135.map]] or 文件==wdf配置.."/"..[[scene/5136.map]] or 文件==wdf配置.."/"..[[scene/5137.map]] or 文件==wdf配置.."/"..[[scene/5138.map]] or 文件==wdf配置.."/"..[[scene/5139.map]] then
        文件=wdf配置.."/"..[[scene/1197.map]]
    elseif 文件==wdf配置.."/"..[[scene/6227.map]] then --武神坛
		文件=wdf配置.."/"..[[scene/2000.map]]
  elseif 文件==wdf配置.."/"..[[scene/6054.map]] then
   文件=wdf配置.."/"..[[scene/1092.map]]
  elseif 文件==wdf配置.."/"..[[scene/6055.map]] then
   文件=wdf配置.."/"..[[scene/1501.map]]
  elseif 文件==wdf配置.."/"..[[scene/6056.map]] then
   文件=wdf配置.."/"..[[scene/1044.map]]
  elseif 文件==wdf配置.."/"..[[scene/6057.map]] then
   文件=wdf配置.."/"..[[scene/1056.map]]
   ------------------------------------------------剑会天下
	elseif 文件==wdf配置.."/"..[[scene/6135.map]] then
		文件=wdf配置.."/"..[[scene/1001.map]]
	elseif 文件==wdf配置.."/"..[[scene/6136.map]] then
		文件=wdf配置.."/"..[[scene/1526.map]]
	end
	hc = tp.当前地图
	maps = nil
	self.mapzz = {}
	self.增加 = {x=0,y=0,z=0}
	self.fjzz = {}
	self.db = {}
	self.map = map(文件)
	self.宽度,self.高度,self.行数,self.列数 = self.map.Width,self.map.Height,self.map.MapRowNum,self.map.MapColNum
	self.寻路 = _lj.创建(hc,self.列数*16,self.行数*12,self.map:取障碍())
	self.移动xy.x,self.移动xy.y=tp.角色坐标.x,tp.角色坐标.y
	self.传送tx = {}
	-- if tp.当前地图 > 40000000 then
	--      if tp.房屋数据.庭院ID == tp.当前地图 then
	--           local ty = tp.房屋数据.庭院装饰
	--           if #ty > 0 then
	--                for nw=1,#ty do
	--                     if ty[nw]~=nil then
	--                         self.房屋tx[nw] = tytx(ty[nw].x,ty[nw].y,ty[nw].名称,ty[nw].方向,"庭院")
	--                         self.房屋tx[nw].编号 = nw
	--                     end
	--                end
	--           end
	--      elseif tp.房屋数据.房屋ID == tp.当前地图 then
	--           local ty = tp.房屋数据.室内装饰
	--           if #ty > 0 then
	--                for nw=1,#ty do
	--                     if ty[nw]~=nil then
	--                         self.房屋tx[nw] = tytx(ty[nw].x,ty[nw].y,ty[nw].名称,ty[nw].方向,"室内")
	--                         self.房屋tx[nw].编号 = nw
	--                     end
	--                end
	--           end
	--      elseif tp.房屋数据.阁楼ID == tp.当前地图 then
	--           local ty = tp.房屋数据.阁楼装饰
	--           if #ty > 0 then
	--                for nw=1,#ty do
	--                     if ty[nw]~=nil then
	--                         self.房屋tx[nw] = tytx(ty[nw].x,ty[nw].y,ty[nw].名称,ty[nw].方向,"室内")
	--                         self.房屋tx[nw].编号 = nw
	--                     end
	--                end
	--           end
	--      elseif tp.房屋数据.牧场ID == tp.当前地图 then
	--           local ty = tp.房屋数据.牧场装饰
	--           if #ty > 0 then
	--                for nw=1,#ty do
	--                     if ty[nw]~=nil then
	--                         self.房屋tx[nw] = tytx(ty[nw].x,ty[nw].y,ty[nw].名称,ty[nw].方向,"牧场")
	--                         self.房屋tx[nw].编号 = nw
	--                     end
	--                end
	--           end
	--      end
	-- else
		-- if tp.地图特效  then
		--      self.特效cw = 取传特效表(tp.当前地图)
		--      if #self.特效cw > 0 then
		--           for nw=1,#self.特效cw do
		--                if self.特效cw[nw]~=nil then
		--                    self.传送tx[nw] = dtx(self.特效cw[nw].x,self.特效cw[nw].y,self.特效cw[nw].切换,self.特效cw[nw].资源)
		--                end
		--           end
		--      end
		-- end
	-- end
	if tp.当前地图==1003 then
		    self.特效cw = 取传特效表(tp.当前地图)
		    if #self.特效cw > 0 then
				for a=1,#self.特效cw do
					if self.特效cw[a]~=nil then
					    self.传送tx[a] = dtx(self.特效cw[a].x,self.特效cw[a].y,self.特效cw[a].切换,self.特效cw[a].资源)
					end
				end
			end
	end
	全局临时路径=文件
end
function 地图类:房屋特效(sj)
	if tp.当前地图 > 40000000 then
		if tp.房屋数据.庭院ID == tp.当前地图 then
			table.insert(tp.房屋数据.庭院装饰,sj)
			self.房屋tx[#self.房屋tx +1] = tytx(sj.x,sj.y,sj.名称,sj.方向,"庭院")
			self.房屋tx[#self.房屋tx].编号 = #self.房屋tx
			self.房屋tx[#self.房屋tx].可移动 = true
		elseif tp.房屋数据.房屋ID == tp.当前地图 then
			table.insert(tp.房屋数据.室内装饰,sj)
			self.房屋tx[#self.房屋tx +1] = tytx(sj.x,sj.y,sj.名称,sj.方向,"室内")
			self.房屋tx[#self.房屋tx].编号 = #self.房屋tx
			self.房屋tx[#self.房屋tx].可移动 = true
		elseif tp.房屋数据.阁楼ID == tp.当前地图 then
			table.insert(tp.房屋数据.阁楼装饰,sj)
			self.房屋tx[#self.房屋tx +1] = tytx(sj.x,sj.y,sj.名称,sj.方向,"室内")
			self.房屋tx[#self.房屋tx].编号 = #self.房屋tx
			self.房屋tx[#self.房屋tx].可移动 = true
		elseif tp.房屋数据.牧场ID == tp.当前地图 then
			table.insert(tp.房屋数据.牧场装饰,sj)
			self.房屋tx[#self.房屋tx +1] = tytx(sj.x,sj.y,sj.名称,sj.方向,"牧场")
			self.房屋tx[#self.房屋tx].编号 = #self.房屋tx
			self.房屋tx[#self.房屋tx].可移动 = true
		end
	end
end

function 地图类:房屋特效2()
	if tp.当前地图 > 40000000 then
		if tp.房屋数据.庭院ID == tp.当前地图 then
			local ty = tp.房屋数据.庭院装饰
			if #ty > 0 then
				for nw=1,#ty do
					if ty[nw]~=nil then
					    self.房屋tx[nw] = tytx(ty[nw].x,ty[nw].y,ty[nw].名称,ty[nw].方向,"庭院")
					    self.房屋tx[nw].编号 = nw
					end
				end
			end
		elseif tp.房屋数据.房屋ID == tp.当前地图 then
			local ty = tp.房屋数据.室内装饰
			if #ty > 0 then
				for nw=1,#ty do
					if ty[nw]~=nil then
					    self.房屋tx[nw] = tytx(ty[nw].x,ty[nw].y,ty[nw].名称,ty[nw].方向,"室内")
					    self.房屋tx[nw].编号 = nw
					end
				end
			end
		elseif tp.房屋数据.阁楼ID == tp.当前地图 then
			local ty = tp.房屋数据.阁楼装饰
			if #ty > 0 then
				for nw=1,#ty do
					if ty[nw]~=nil then
					    self.房屋tx[nw] = tytx(ty[nw].x,ty[nw].y,ty[nw].名称,ty[nw].方向,"室内")
					    self.房屋tx[nw].编号 = nw
					end
				end
			end
		elseif tp.房屋数据.牧场ID == tp.当前地图 then
			local ty = tp.房屋数据.牧场装饰
			if #ty > 0 then
				for nw=1,#ty do
					if ty[nw]~=nil then
					    self.房屋tx[nw] = tytx(ty[nw].x,ty[nw].y,ty[nw].名称,ty[nw].方向,"室内")
					    self.房屋tx[nw].编号 = nw
					end
				end
			end
		end
	end
end

function 地图类:显示(pos,偏移,xx,yy,dt,pys1)
	local mp = {}
	if maps == nil then
		maps = self.map
	end
	local 主角位置1 = ceil(pos.x/320)
	local 主角位置2 = ceil(pos.y/240)
	local 开始位置1 = 主角位置1 - 3
	local 结束位置1 = 主角位置1 + 3
	local 开始位置2 = 主角位置2 - 3
	local 结束位置2 = 主角位置2 + 3
	if self.列数==nil then
		if 全局临时路径~=nil then
		    self:重新加载(全局临时路径)
		end
		return
	end
	if 结束位置1 > self.列数 then
		结束位置1 = self.列数
	end
	if 开始位置1 < 1 then
		开始位置1 = 1
		结束位置1 = 结束位置1 + 1
	end
	if 结束位置2 > self.行数 then
		结束位置2 = self.行数
	end
	if 开始位置2 < 1 then
		开始位置2 = 1
	end
	local id
	local zz
	for h = 开始位置2, 结束位置2 do --地宫可以这样设置。。黑新地图，
		for  l = 开始位置1, 结束位置1 do
			id = ((h-1)*self.列数+l)-1
			if self.db[id] == nil then
				self.db[id] = {{}}
				zz = maps:取附近遮罩(id)
				self.fjzz[id] = zz
				for i=1,#zz do
					if self.mapzz[zz[i]] == nil then
						self.mapzz[zz[i]] = 1
						insert(self.db[id][1],{maps:取遮罩(zz[i])})
					end
				end
				self.db[id][2] = {(l-1)*320,(h-1)*240}
				self.db[id][3] = #self.db[id][1]
				self.db[id][4] = {h,l}
				maps:取纹理(id)
				break
			end
		end
	end
	for h = 开始位置2, 结束位置2 do
		for  l = 开始位置1, 结束位置1 do
			id = ((h-1)*self.列数+l)-1
			if self.db[id] ~= nil and self.db[id][2] then
				-- for i=1,#self.db[id][1] do
				--   insert(mp,self.db[id][1][i])
				-- end
				fgjl:置纹理(maps.缓存[id])
				fgjl:显示(self.db[id][2][1]+偏移.x,self.db[id][2][2]+偏移.y)
			end
		end
	end

	if not tp.战斗中 then
		local cs
		-- local zdc = {}
		if tp.第二场景开启 == false then
			tp.选中假人 = false
			if tp.窗口.快捷技能栏:检查点(xx,yy) or tp.窗口.底图框:检查点(xx,yy) or tp.窗口.人物框:检查点(xx,yy) or tp.窗口.时辰:检查点(xx,yy) or tp.窗口.任务追踪栏:检查点(xx,yy)  then
				tp.禁止通行 = true
			end
			-- if self.房屋tx~=nil then
			--      sort(self.房屋tx,排序)
			--      for n=1,#self.房屋tx do
			--           if self.房屋tx[n]~=nil and self.房屋tx[n].资源是否最上面 ~= 1 then
			--               self.房屋tx[n]:显示(dt,xx,yy,偏移)
			--           end
			--      end
			-- end
			if tps.传送~=nil and #tps.传送~=nil then
				for n=1,#tps.传送 do
					tps.传送[n]:显示(dt,xx,yy,偏移)
				end
			end
			if self.传送tx~=nil then
				for n=1,#self.传送tx do
					if self.特效cw[n]~=nil and self.特效cw[n].资源是否最上面 ~= 1 then
					    self.传送tx[n]:显示(dt,xx,yy,偏移)
					end
				end
			end
			-- tp.黑色背景:显示(0,0)
			if tp.夜间显示 then
				tp.黑色背景:显示(0,0)
			elseif _Dgmap[tp.当前地图] then
					tp.dgbj:显示(0,0)
			end
			local rw = tps.场景人物
			sort(rw,排序)
			for n=1,#rw do
				rw[n]:显示(dt,xx,yy,偏移)
			end
			if 引擎.场景.飞行 then
				self.云:更新()
				self.云1:更新()
				-- self.云2:更新()
				self.云:显示(10,全局游戏高度/3+150)
				self.云1:显示(全局游戏宽度/2+300,全局游戏高度/3+150)--(全局游戏宽度/2+300,全局游戏高度/3-50)
				-- self.云:显示(全局游戏宽度/2+50,全局游戏高度/3+250)
				-- self.云2:显示(全局游戏宽度/2+300,全局游戏高度/3-50)
				-- for n=1,#飞行玩家 do
				--      飞行玩家[n]:显示(dt,xx,yy,偏移)
				-- end
				-- 主角组[1]:显示(dt,xx,yy,偏移)
			end
		else
			--if tp.剧情处理.可视 and tp.剧情处理.显示方式 == 0 then
			if tp.第二场景.人物组 ~= nil then
				--sort(tp.第二场景.人物组,排序)
				for i=1,#tp.第二场景.人物组 do
					local v = tp.第二场景.人物组[i]
					if v.出现特效 == nil then
						tp.影子:显示(v.坐标 + tps.屏幕坐标)
					end
					v:显示(dt,xx,yy,tps.屏幕坐标)
				end
			end
			if self.传送tx~=nil then
				for n=1,#self.传送tx do
					if self.特效cw[n]~=nil and self.特效cw[n].资源是否最上面 ~= 1 then
					    self.传送tx[n]:显示(dt,xx,yy,偏移)
					end
				end
			end
			--end
		end
		if not 引擎.场景.飞行 and tp.夜间显示==false then --遮罩
			for h = 开始位置2, 结束位置2 do
				for  l = 开始位置1, 结束位置1 do
					id = ((h-1)*self.列数+l)-1
					if self.db[id] ~= nil then
						for i=1,#self.db[id][1] do
							--insert(mp,self.db[id][1][i])
							-- for n=1,#tps.场景人物 do
							--      if tps.场景人物[n].类型=="玩家" then
							--      end
							-- end
							fgjl:置纹理(self.db[id][1][i][1])
							fgjl:显示(self.db[id][1][i][2]+偏移.x,self.db[id][1][i][3]+偏移.y)
						end
					end
				end
			end
		end
		-- for n=1,#zdc do
		--      zdc[n]:显示(dt,xx,yy,偏移)
		-- end
		if tp.第二场景.人物组 ~= nil then
			for i=1,#tp.第二场景.人物组 do
				local v = tp.第二场景.人物组[i]
				v.喊话:显示(v.坐标.x + tps.屏幕坐标.x,v.坐标.y + tps.屏幕坐标.y)
			end
		end
		if self.传送tx~=nil then
			for n=1,#self.传送tx do
				if self.特效cw[n]~=nil and self.特效cw[n].资源是否最上面 == 1 then
				    self.传送tx[n]:显示(dt,xx,yy,偏移)
				end
			end
		end
		for k,v in pairs(self.db) do
			if self.db[k][4] and self.db[k][4][1] >= 开始位置2  and  self.db[k][4][1] <= 结束位置2  and self.db[k][4][2] >= 开始位置1  and self.db[k][4][2] <= 结束位置1 then

			else
				-- for i=1,#self.db[k][1] do
				--   if self.db[k][1][i][1]._isok then
				--        self.db[k][1][i][1]._obj:Release()
				--   end
				-- end
				-- for i=1,#self.fjzz[k] do
				--   self.mapzz[self.fjzz[k][i]] = nil
				-- end
				self.db[k] = nil
				-- if maps.缓存[k] ~= nil and maps.缓存[k]._isok ~= nil then
				--   maps.缓存[k]._obj:Release()
				-- end
				for i=1,#self.fjzz[k] do
					self.mapzz[self.fjzz[k][i]] = nil
				end
				maps.缓存[k] = nil
			end
		end
		local xyx = ceil(tp.角色坐标.x - tps.滑屏.x)
		local xyy = ceil(tp.角色坐标.y - tps.滑屏.y)
		local xx = 1
		local yy = 1
		local pz = 110
		local mfx = abs(xyx)
		local mfy = abs(xyy)
		if xyx <= -pz or xyx >= pz and self.增加.x <= 0 then
			self.增加.x = mfx + 170
		end
		if xyy <= -pz or xyy >= pz and self.增加.y <= 0 then
			self.增加.y = mfy + 170
		end
		if self.增加.x ~= 0 then
			xx = self.增加.z
			self.增加.x = self.增加.x - 1
			if self.增加.x <= 0 then
				self.增加.x = 0
			end
		end
		if self.增加.y ~= 0 then
			yy = self.增加.z
			self.增加.y = self.增加.y - 1
			if self.增加.y <= 0 then
				self.增加.y = 0
			end
		end
		if xyx < 0 then
			xx = -xx
		end
		if xyy < 0 then
			yy = -yy
		end
		if (xyx < 0 and xyx > xx) or (xyx > 0 and xyx < xx) then
			xx = xyx
		end
		if (xyy < 0 and xyy > yy) or (xyy > 0 and xyy < yy) then
			yy = xyy
		end
		if xyx ~= 0 then
			tps.滑屏.x = floor(tps.滑屏.x + xx)
		end
		if xyy ~= 0 then
			tps.滑屏.y = floor(tps.滑屏.y + yy)
		end
		local 移动距离=0
		if 取两点距离(self.移动xy,tp.角色坐标)<=50 then
			self.移动速度=0.25
		elseif 取两点距离(self.移动xy,tp.角色坐标)<=100 and 取两点距离(self.移动xy,tp.角色坐标)>50 then
			self.移动速度=1.25
		elseif 取两点距离(self.移动xy,tp.角色坐标)>100 and 取两点距离(self.移动xy,tp.角色坐标)<=200  then
			self.移动速度=3
			self.移动xy=取移动坐标 (self.移动xy,tp.角色坐标,self.移动速度)
		elseif 取两点距离(self.移动xy,tp.角色坐标)>200 and 取两点距离(self.移动xy,tp.角色坐标)<=400  then
			self.移动速度=5
			self.移动xy=取移动坐标 (self.移动xy,tp.角色坐标,self.移动速度)
		else
			self.移动速度=7.5
			self.移动xy=取移动坐标 (self.移动xy,tp.角色坐标,self.移动速度)
		end
		tps.屏幕坐标 = hm(self.移动xy.x,self.移动xy.y,self.宽度,self.高度)
		-- tps.屏幕坐标 = hm(tps.滑屏.x,tps.滑屏.y,self.宽度,self.高度)
		-- tps.屏幕坐标 = hm(tp.角色坐标.x,tp.角色坐标.y,self.宽度,self.高度)
	end
end

return 地图类;