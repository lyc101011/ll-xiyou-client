-- @Author: baidwwy
-- @Date:   2024-09-08 18:20:46
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-10-29 04:36:16
local 场景类_人物 = class()
local pi = math.pi/8
local floor = math.floor
local ceil  = math.ceil
local insert = table.insert
local remove = table.remove
local min = math.min
local random = 引擎.取随机整数
local xys = 生成XY
local mtb = 取八方向
local jlb = 取两点距离
local yds = 取移动坐标
local jdb = 取两点角度
local tpc = 引擎.场景.场景
local hds = 取两点孤度
local ARGB = ARGB
local qmxs = 引擎.取模型
local mouses = 引擎.鼠标按住
local mousea = 引擎.鼠标弹起
local mousax = 引擎.鼠标按下
local jcs = 0
local emj = 引擎.取等级怪
local zqj = 引擎.坐骑库
local bzs = 取四至八方向

function 场景类_人物:初始化()
	self.人物模型=tp.队伍[1].模型
	self.历劫=tp.队伍[1].历劫
	local 资源 = qmxs(tp.队伍[1].模型)
	资源 = qmxs("大海龟")
	self.人物 = {["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1]),["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2])}
	self.id=tp.队伍[1].数字id
	self.特效组 = {}
	self.队伍令牌=false
	self.行为 = "静立"
	self.方向 = tp.队伍[1].地图数据.方向
	self.移动 = false
	self.目标格子 = {}
	self.名称偏移 = {x=0,y=-15}
	self.称谓偏移 = {x=0,y=-15}
	self.称谓宽度 = 0
	self:置模型()
	self.鼠标点击动画组 = {}
	self.标识 = true
	self.坐标 = xys()
	self.移动速度 = 0
	self.类型 = "主角"
	self.飞行高度=0
	self.x,self.y=tp.角色坐标.x,tp.角色坐标.y
	self.增加 = {x=0,y=0}
	self.延时 = 0
	self.标识 = true
	self.移动计时=os.time()
	self.队伍令牌=tp.资源:载入(引擎.取队标(tp.队伍[1].队标特效)[2],"网易WDF动画",引擎.取队标(tp.队伍[1].队标特效)[1])
	tp.坐骑列表=tp.队伍[1].坐骑列表
	local qcw = 取称谓名称(tp.当前称谓)
	if qcw[1] ~= nil and qcw[2] ~= nil then
		self.特效称谓 = tp.资源:载入(qcw[2],"网易WDF动画",qcw[1])
		if qcw[3] ~= nil  then
		self.特效称谓.高度=qcw[3]
		end
		if qcw[4] ~= nil  then
		self.沉默=qcw[4]
		else
		self.沉默=0
		end
	end
	tp.坐骑=table.loadstring(table.tostring(tp.队伍[1].坐骑))
	if tp.坐骑~=nil then
       self:坐骑改变(tp.队伍[1].模型,tp.队伍[1].坐骑[1],tp.队伍[1].坐骑[2])
	end
	self.名称颜色 =  取名称颜色(tp.队伍[1].名称,tp.队伍[1].历劫.化圣,"人物")
	self.称谓颜色 =  取称谓颜色(tp.当前称谓,"人物")
	self.记录坐标点={}
end

function 场景类_人物:夺旗判断(旗帜)
	if 旗帜~=nil then
	    self.红旗=tp.资源:载入('addon.wdf',"网易WDF动画",1162623483)
		self.蓝旗=tp.资源:载入('addon.wdf',"网易WDF动画",2455360340)
	end
	self.夺旗=旗帜
end

function 场景类_人物:更改队标(队标)
	self.队伍令牌=tp.资源:载入(引擎.取队标(队标)[2],"网易WDF动画",引擎.取队标(队标)[1])
end

function 场景类_人物:取目标(xy)
	if self.目标格子[1] == nil then
		return
	end
	tp.场景.地图.增加.z = 2.5
	self.终点 =  xys(floor(self.目标格子[1].x*20),floor(self.目标格子[1].y*20))
end

function 场景类_人物:取跟随坐标(i)
	return xys(floor(tp.角色坐标.x),floor(tp.角色坐标.y)-i-1)
end

function 场景类_人物:开始移动(pys)
	if self.目标格子==nil or self.目标格子[1] == nil then
		self:停止移动(1)
		return
	end
	-- if 玩家屏蔽 then
	-- 	玩家屏蔽 = false
	-- end
	-- if tp.当前地图 == 1050 then
	--     self:停止移动(1)
	-- 	return
	-- end
	self.行为 = "行走"
	local dsa = mtb(jdb(tp.角色坐标,self.终点))
	if tp.队伍[1].变身[1] then
		dsa = bzs(dsa)
	end
	if tonumber(self.移动距离)~=nil and jlb(tp.角色坐标,{x=self.目标格子[#self.目标格子].x*20,y=self.目标格子[#self.目标格子].y*20})<=self.移动距离 then
		self:停止移动(2)
		return
	end

	if jlb(tp.角色坐标,self.终点) <= 4  then -- 小于可移动点直接到达位置
		tp.角色坐标 = self.终点
		-- remove(self.目标格子, 1)
		if #self.目标格子 <= 0 then
		   	self:停止移动(3)
		end
		客户端:发送数据(1002,{x=math.floor(tp.角色坐标.x),y=math.floor(tp.角色坐标.y),方向=dsa,类型="行走"},1)
		self.目标格子 = tp.场景.地图.寻路:寻路1(self.目标格子)
		tp.场景.跟随坐标 = {self.目标格子}
		if self.目标格子==nil or self.目标格子[1]==nil then return  end
			self:取目标(self.目标格子[1])
		return
	end
	tp.角色坐标 = yds(tp.角色坐标,self.终点,2.7+(2.7*(tp.移动速度1/100))) --移动速度 --测试模式 2.7self.角色坐标
	self.x,self.y=tp.角色坐标.x,tp.角色坐标.y
	if 系统参数.时间-self.移动计时>=1 then
		self.移动计时=os.time()
		客户端:发送数据(1002,{x=math.floor(tp.角色坐标.x),y=math.floor(tp.角色坐标.y),方向=dsa,类型="行走"},1)
	end
	if tp.如意符 then
		tp.如意符 = false
	end
	self:置方向(dsa)
end

function 场景类_人物:停止移动(原因)
	self.目标格子 = {}
	self.行为 = "静立"
	self.移动 = false
	tpc.地图.增加.z = 1
	self.终点 = nil
	tp.窗口.小地图:清空()
	客户端:发送数据(1002,{x=math.floor(tp.角色坐标.x),y=math.floor(tp.角色坐标.y),方向=self.方向,类型="停止"},1)
end
function 场景类_人物:更新(dt,x,y) end
function 场景类_人物:更改称谓(dt)
	self.特效称谓 = nil
	local qcw = 取称谓名称(tp.当前称谓)
	if qcw[1] ~= nil and qcw[2] ~= nil then
		self.特效称谓 = tp.资源:载入(qcw[2],"网易WDF动画",qcw[1])
		if qcw[3] ~= nil  then
		self.特效称谓.高度=qcw[3]
		end
		if qcw[4] ~= nil  then
		self.沉默=qcw[4]
		else
		self.沉默=0
		end
	else
		self.称谓偏移 = {x=0,y=-15}
	end
end
function 场景类_人物:显示(dt,x,y,pys)

	self:更新(dt,x,y,pys)
	人物点击=false
	if self.隐藏 then
		return
	end
	self.队伍令牌:更新()

	local asa = 1
	if self.行为 == "行走" then
		asa = 1.65 -- 2 --1.5
	end

	self.人物[self.行为]:更新(dt*asa)

	if self.光环~=nil then
		self.光环:更新(dt)
	end
	if self.足迹~=nil then
		self.足迹:更新(dt)
	end

	if self.人物["身体_"..self.行为] ~= nil then
		self.人物["身体_"..self.行为]:更新(dt*asa)
	end
	if self.人物["武器_"..self.行为] ~= nil then
		self.人物["武器_"..self.行为]:更新(dt*asa)
	end
	if self.人物["坤斧_" .. self.行为] ~= nil then
		self.人物["坤斧_" .. self.行为]:更新(dt * asa)
	end
	if self.人物["坐骑_"..self.行为] ~= nil then
		self.人物["坐骑_"..self.行为]:更新(dt*asa)
		if self.人物["坐骑饰品_"..self.行为] ~= nil then
			self.人物["坐骑饰品_"..self.行为]:更新(dt*asa)
		end
	end

	self.名称颜色 =  取名称颜色(tp.队伍[1].名称,tp.队伍[1].历劫.化圣,"人物")
	self.称谓颜色 =  取称谓颜色(tp.当前称谓,"人物")
	local yx = false
	if self.人物["武器_"..self.行为] ~= nil and self.人物["武器_"..self.行为]:是否选中(x,y) then
		yx = true
	elseif self.人物["坤斧_" .. self.行为] ~= nil and self.人物["坤斧_" .. self.行为]:是否选中(x, y) then
		yx = true
	elseif self.人物["坐骑_"..self.行为] ~= nil and self.人物["坐骑_"..self.行为]:是否选中(x,y) then
		yx = true
	elseif self.人物["坐骑饰品_"..self.行为] ~= nil and self.人物["坐骑饰品_"..self.行为]:是否选中(x,y) then
		yx = true
	end
	if (self.人物[self.行为]:是否选中(x,y) or yx) and tp:可操作() and not tp.第一窗口移动中 then
		if self.人物["武器_"..self.行为] ~= nil then
			self.人物["武器_"..self.行为]:置高亮()
		elseif self.人物["坤斧_" .. self.行为] ~= nil then
			self.人物["坤斧_" .. self.行为]:置高亮()
		elseif self.人物["坐骑_"..self.行为] ~= nil then
			self.人物["坐骑_"..self.行为]:置高亮()
			if self.人物["坐骑饰品_"..self.行为] ~= nil then
				self.人物["坐骑饰品_"..self.行为]:置高亮()
			end
		end
		self.人物[self.行为]:置高亮()
		-- if self.光环~=nil then
		--    self.光环:置高亮()
		-- end
		-- if self.足迹~=nil then
		--    self.足迹:置高亮()
		-- end
		self.名称颜色 = -419495936
		self.称谓颜色 = -419495936
	else
		if self.人物["武器_"..self.行为] ~= nil then
			self.人物["武器_"..self.行为]:取消高亮()
		elseif self.人物["坤斧_" .. self.行为] ~= nil then
			self.人物["坤斧_" .. self.行为]:取消高亮()
		elseif self.人物["坐骑_"..self.行为] ~= nil then
			self.人物["坐骑_"..self.行为]:取消高亮()
			if self.人物["坐骑饰品_"..self.行为] ~= nil then
				self.人物["坐骑饰品_"..self.行为]:取消高亮()
			end
		end
		self.人物[self.行为]:取消高亮()
		-- if self.光环~=nil then
		-- 	self.光环:取消高亮()
		-- end
		-- if self.足迹~=nil then
		-- 	self.足迹:取消高亮()
		-- end
	end
	if tp.当前称谓 ~= "" and tp.当前称谓 ~= "无称谓" and tp.当前称谓 ~= nil and self.特效称谓 == nil then
		if self.名称偏移.y ~= - 35 then
			self.名称偏移.y = -35
		end
	elseif self.特效称谓 ~= nil then
		self.名称偏移.y = 1- self.特效称谓.高度
	else
		if self.名称偏移.y ~= - 15 then
			self.名称偏移.y = -15
		end
	end
	if mouses(0) and (self.队长开关==nil and #tp.队伍数据 >= 1) then

	else
		if self.队长开关 or #tp.队伍数据==0 and 摊位名称==nil and 引擎.场景.场景.过度精灵 == nil then
			if mouses(0) and not tp.选中假人  then
				if self.延时 <= 0 and tp:可通行() then
					if tp.鼠标.取当前()=="组队" and (self.人物[self.行为]:是否选中(x,y) or yx) then
						人物点击=true
						客户端:发送数据(4002,{id=tp.队伍[1].数字id},1)
						tp.鼠标.还原鼠标()
					elseif tp.鼠标.取当前()=="拆分" then
						tp.拆分开关=false
						tp.鼠标.还原鼠标()
					elseif tp.鼠标.取当前()=="普通" then
						if self.延时 <= 0 then
							tp.窗口.小地图:清空()
							local 格子 = xys(floor(x / 20 - pys.x / 20),floor(y / 20 - pys.y / 20))
							--local a = xys(floor(tp.角色坐标.x / 20),floor(tp.角色坐标.y / 20))
							local v = {
								x = floor(x - pys.x),
								y = floor(y - pys.y),
								ani = tp.资源:载入('addon.wdf',"网易WDF动画",0x0D98AC0A)
							}
							insert(self.鼠标点击动画组,v)
							if 全局禁止走路==false then
								local 内容={x=格子.x,y=格子.y,距离=0}
								if 引擎.场景.飞行 then
									self:设置路径无障碍(内容)
								else
									self:设置路径(内容)
								end
								客户端:发送数据(1001,格子,1)
							end
						end
					end
				end
				鼠标延时2=鼠标延时2+1
			end
			-- if mousax(1) then
			-- 	insert(self.记录坐标点,xys(floor(x / 20 - pys.x / 20),floor(y / 20 - pys.y / 20)))
			-- end
			if mousax(0) or mouses(1) or mouses(2) then
				鼠标延时2=0
			end
			if 鼠标延时2 >=175 and not tp.选中假人  then
				if self.延时 <= 0 and tp:可通行() then
					tp.窗口.小地图:清空()
					local 格子 = xys(floor(x / 20 - pys.x / 20),floor(y / 20 - pys.y / 20))
					self.延时 = 10
					self.移动 = true
					local v = {
						x = floor(x - pys.x),
						y = floor(y - pys.y),
						ani = tp.资源:载入('addon.wdf',"网易WDF动画",0x0D98AC0A)--鼠标点击特效
					}
					insert(self.鼠标点击动画组,v)
					if 全局禁止走路==false then
						local 内容={x=格子.x,y=格子.y,距离=0}
						if 引擎.场景.飞行 then
							self:设置路径无障碍(内容)
						else
							self:设置路径(内容)
						end
						客户端:发送数据(1001,格子,1)
					end
				end
			end
		end
	end
	if self.延时 > 0 then
		self.延时 = self.延时 - 1
	end
	if not self.行走 and not self.移动 and self.行为 ~= "静立" then
		self.行为 = "静立"
	end
	if not self.移动 and (mouses(1) or mouses(2)) then
		if mouses(1) and not tp.选中假人 and tp:可通行() then
			self.移动 = false
			if self.行为 ~= "静立" then
				self.行为 = "静立"
			end
			--======
			local Qzd =  xys(floor(x  - pys.x),floor(y  - pys.y))
			local dsaQ = mtb(jdb(tp.角色坐标,Qzd))
			self:置方向(dsaQ)

			-- 客户端:发送数据(1008,{x=math.floor(tp.角色坐标.x),y=math.floor(tp.角色坐标.y),方向=self.方向},1)
			if tp.窗口.玩家信息.可视 then
				tp.窗口.玩家信息:打开()
			end
		end
	end
	for i=1,#self.鼠标点击动画组 do
		if self.鼠标点击动画组[i] ~= nil then
			self.鼠标点击动画组[i].ani:更新(dt)
			self.鼠标点击动画组[i].ani:显示(self.鼠标点击动画组[i] + pys)
			if (self.鼠标点击动画组[i].ani.已载入 == 5) then
				self.鼠标点击动画组[i].ani = nil
				remove(self.鼠标点击动画组,i)
			end
		end
	end
	local s = xys(floor(tp.角色坐标.x),floor(tp.角色坐标.y))
	if 引擎.场景.飞行 then
		tp.影子:显示(s + pys)
	end
	-- local 坐骑补差x,坐骑补差y=0,0
	-- if self.人物["坐骑_"..self.行为] ~= nil then
		-- 坐骑补差x,坐骑补差y=0,0--引擎.补差(tp.队伍[1].坐骑,self.人物模型) --,self.方向
	-- end
	if 引擎.场景.飞行 then
	    if self.飞行高度>-110 then
	        self.飞行高度=self.飞行高度-1.5
	    end
	else
		if self.飞行高度~=0 then
		   self.飞行高度=self.飞行高度+1.5
		end
	    if self.飞行高度>0 then
	       self.飞行高度=0
	    end
	end
	s.y=s.y+self.飞行高度

	if self.光环~=nil  then
		self.光环:显示(s.x + pys.x,s.y + pys.y)
	end
	if self.足迹~=nil and self.行为=="行走" then
		self.足迹:显示(s.x + pys.x,s.y + pys.y)
	end
	if  not 引擎.场景.飞行 then
		tp.影子:显示(s + pys)
	end
	if self.人物["坐骑_"..self.行为] ~= nil then
		self.人物["坐骑_"..self.行为]:显示((s + pys).x,(s + pys).y)
		if self.人物["坐骑饰品_"..self.行为] ~= nil then
			self.人物["坐骑饰品_"..self.行为]:显示((s + pys).x,(s + pys).y)
		end
	end
	-- self.人物[self.行为]:显示(s.x+pys.x+坐骑补差x ,s.y+pys.y+坐骑补差y)
	self.人物[self.行为]:显示(s.x+pys.x,s.y+pys.y)
	if self.人物["身体_"..self.行为] ~= nil then
		self.人物["身体_"..self.行为]:显示(s + pys)
	end
	if self.人物["武器_"..self.行为] ~= nil then
			self.人物["武器_"..self.行为]:显示(s + pys)
	end
	if self.人物["坤斧_" .. self.行为] ~= nil then
		self.人物["坤斧_" .. self.行为]:显示(s + pys)
	end
	if tp.当前称谓 ~= "无称谓" and self.特效称谓 == nil then
		if Jingtaicw[tp.当前称谓] then
            tp[tp.当前称谓]:显示(s.x+pys.x+Jingtaicw[tp.当前称谓].x  ,s.y+pys.y+Jingtaicw[tp.当前称谓].y)
		else
			tp.字体表.人物字体:置颜色(self.称谓颜色):显示x(s + pys - self.称谓偏移,tp.当前称谓)
		end
		tp.字体表.人物字体:置颜色(self.名称颜色):置阴影颜色(ARGB(230,0,0,0)):显示x(s + pys - self.名称偏移,tp.队伍[1].名称)
	elseif self.特效称谓 ~= nil then

		if self.沉默==nil then
				 self.沉默=0
				end
		self.特效称谓:更新(	dt)
		self.特效称谓:显示(s.x + pys.x,s.y + pys.y+45+self.沉默)
		tp.字体表.人物字体:置颜色(self.名称颜色):置阴影颜色(ARGB(230,0,0,0)):显示x(s + pys - self.名称偏移,tp.队伍[1].名称)
	else
		tp.字体表.人物字体:置颜色(self.名称颜色):置阴影颜色(ARGB(230,0,0,0)):显示x(s + pys - self.名称偏移,tp.队伍[1].名称)
	end

	--显示摊位
	if 摊位名称~=nil then
		local 摊位xy=s + pys
		local 摊位长度=string.len(摊位名称)
		if 摊位长度<=4 then
			小摊位:显示(摊位xy.x,摊位xy.y-100)
			tp.字体表.摊位文字:显示(摊位xy.x-13+(4-摊位长度)*1.8,摊位xy.y-114,摊位名称)
			if 小摊位:是否选中(x,y) and 引擎.鼠标弹起(右键) then
				发送数据(3720)
			end
		elseif 摊位长度<=4 then
			中摊位:显示(摊位xy.x,摊位xy.y-100)
			tp.字体表.摊位文字:显示(摊位xy.x-25+(8-摊位长度)*1.8,摊位xy.y-114,摊位名称)
			if 中摊位:是否选中(x,y) and 引擎.鼠标弹起(右键) then
				发送数据(3720)
			end
		else
			大摊位:显示(摊位xy.x,摊位xy.y-100)
			tp.字体表.摊位文字:显示(摊位xy.x-40+(12-摊位长度)*1.8,摊位xy.y-114,摊位名称)
			if 大摊位:是否选中(x,y) and 引擎.鼠标弹起(右键) then
				发送数据(3720)
			end
		end
	end
	for i=1,#self.特效组 do
		if self.特效组[i] ~= nil then
			self.特效组[i]:更新(dt)
			self.特效组[i]:显示(s + pys)
			if (self.特效组[i].已载入 >= self.特效组[i].帧数-2) then
				self.特效组[i] = nil
				remove(self.特效组,i)
			end
		end
	end
	if self.队长开关 then
		self.显示坐标=s + pys
		if self.人物["坐骑_"..self.行为] ~= nil then
			self.队伍令牌:显示(self.显示坐标.x,self.显示坐标.y-120)
		else
			self.队伍令牌:显示(self.显示坐标.x,self.显示坐标.y-90)
		end
	end
	if self.夺旗~=nil and self[self.夺旗] then
		self.qzzb=s + pys
		self[self.夺旗]:更新()
		if self.人物["坐骑_"..self.行为] ~= nil then
			self[self.夺旗]:显示(self.qzzb.x,self.qzzb.y-150)
		else
			self[self.夺旗]:显示(self.qzzb.x,self.qzzb.y-140)
		end
	end
	if self.移动 then
		self:开始移动(pys)
	end
	self.坐标.x = floor(tp.角色坐标.x)
	self.坐标.y = floor(tp.角色坐标.y)
end

function 场景类_人物:设置坐标(格子)
	tp.角色坐标.x,tp.角色坐标.y=格子.x,格子.y
	tp.场景.滑屏.x,tp.场景.滑屏.y = tp.角色坐标.x,tp.角色坐标.y
	--tp.场景.屏幕坐标 = 取画面坐标(tp.角色坐标.x,tp.角色坐标.y,tp.场景.地图.宽度,tp.场景.地图.高度)
	self:停止移动()
end

function 场景类_人物:设置路径(格子)
	self.移动计时=os.time()
	tp.窗口.小地图:清空()
	self.移动距离=格子.距离
	local a = xys(floor(tp.角色坐标.x / 20),floor(tp.角色坐标.y / 20))
	self.目标格子 = tp.场景.地图.寻路:寻路(a,格子)
	if self.目标格子 ~= nil and self.目标格子[1] ~= nil then
		tp.场景.跟随坐标 = {self.目标格子}
		self.延时 = 10
		self.移动 = true
		self:取目标(self.目标格子[1])
	else
		self.目标格子 = {}
	end
end
function 场景类_人物:设置路径无障碍(格子)

	self.移动计时=os.time()
	tp.窗口.小地图:清空()
	self.移动距离=格子.距离
	local a = xys(floor(tp.角色坐标.x / 20),floor(tp.角色坐标.y / 20))
	self.目标格子 = tp.场景.地图.寻路:寻路无障碍(a,格子)
	if self.目标格子 ~= nil and self.目标格子[1] ~= nil then
		tp.场景.跟随坐标 = {self.目标格子}
		self.延时 = 10
		self.移动 = true
		self:取目标(self.目标格子[1])
	else
		self.目标格子 = {}
	end
end

function 场景类_人物:置方向(d)
	if tp.队伍[1].变身数据~=nil and tp.显示变身卡造型 then
		d= 取四至八方向(d)
	end
	if self.足迹~=nil then
	 self.足迹:置方向(d,nil,1)
	end

	self.人物["静立"]:置方向(d)
	self.人物["行走"]:置方向(d)
	if self.人物["身体_静立"] ~= nil and self.人物["身体_行走"] ~= nil then
		self.人物["身体_静立"]:置方向(d)
		self.人物["身体_行走"]:置方向(d)
	end
	if self.人物["武器_静立"] ~= nil and self.人物["武器_行走"] ~= nil then
		self.人物["武器_静立"]:置方向(d)
		self.人物["武器_行走"]:置方向(d)
	end
	if self.人物.坤斧_静立 ~= nil and self.人物.坤斧_行走 ~= nil then
		self.人物.坤斧_静立:置方向(d)
		self.人物.坤斧_行走:置方向(d)
	end
	if self.人物["坐骑_静立"] ~= nil and self.人物["坐骑_行走"] ~= nil then
		self.人物["坐骑_静立"]:置方向(d)
		self.人物["坐骑_行走"]:置方向(d)
		if self.人物["坐骑饰品_静立"] ~= nil and self.人物["坐骑饰品_行走"] then
			self.人物["坐骑饰品_静立"]:置方向(d)
			self.人物["坐骑饰品_行走"]:置方向(d)
		end
	end
	self.方向 = d
end

function 场景类_人物:置染色(染色方案,a,b,c,d)
	if tp.队伍[1].变身数据 ~= nil and tp.显示变身卡造型 then
		return false
	end
	if 染色方案 ~= nil and 染色方案~=0 and tp.队伍[1].锦衣[1] == nil and tp.队伍[1].锦衣[2] == nil then
		self.人物["静立"]:置染色(染色方案,a,b,c,0)
		self.人物["行走"]:置染色(染色方案,a,b,c,0)
		self:置方向(self.方向)
	end
end

function 场景类_人物:炫彩染色(染色方案,sj,类型)
	if tp.队伍[1].变身数据 ~= nil and  tp.显示变身卡造型 then
		return false
	end
	if 类型 == "人物" then
		if 染色方案 ~= nil and 染色方案~=0 and tp.队伍[1].锦衣[1] == nil and tp.队伍[1].锦衣[2] == nil then
			self.人物["静立"]:炫彩染色(染色方案,sj)
			self.人物["行走"]:炫彩染色(染色方案,sj)
			self:置方向(self.方向)
		end
	elseif 类型 == "坐骑" then
		self.人物["坐骑_静立"]:炫彩染色(染色方案,sj)
		self.人物["坐骑_行走"]:炫彩染色(染色方案,sj)
	end
end

function 场景类_人物:置人物动画(名称,造型,武器,类型)
  local 资源=引擎.取普通锦衣模型(名称,造型,武器,类型)
  self.人物 = {["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1],nil,nil,nil,nil,"jrhc"),["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2],nil,nil,nil,nil,"jrhc")}
end
function 场景类_人物:置人物动画1(名称)
  local 资源=引擎.取模型(名称)
  self.人物 = {["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1],nil,nil,nil,nil,"jrhc"),["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2],nil,nil,nil,nil,"jrhc")}
end
function 场景类_人物:穿戴光环()
	self.光环 = nil
	if tp.队伍[1].锦衣[3] ~= nil then
		local 资源 = 引擎.取光环(tp.队伍[1].锦衣[3].名称)
		self.光环 = tp.资源:载入(资源[4],"网易WDF动画",资源[1])
	end
end

function 场景类_人物:穿戴足迹()
	self.足迹 = nil
	if tp.队伍[1].锦衣[4] ~= nil then
		local 资源 = 引擎.取足迹(tp.队伍[1].锦衣[4].名称)
		self.足迹 = tp.资源:载入(资源[2],"网易WDF动画",资源[1])
	end
end

function 场景类_人物:置模型()
	local mx = tp.队伍[1].模型
	if tp.队伍[1].变身数据 ~= nil  and tp.显示变身卡造型 then
		mx = tp.队伍[1].变身数据
	end
	--mx = "大海龟"
	self.光环 = nil
	self.足迹 = nil
	if tp.队伍[1].锦衣[2] ~= nil and (tp.队伍[1].变身数据 == nil or tp.显示变身卡造型 == false)  then
		if tp.队伍[1].锦衣[2] ~= nil then
			self:置人物动画1(tp.队伍[1].锦衣[2].名称)
			tp.队伍[1]:刷新信息()
		end
	elseif tp.队伍[1].锦衣[1] ~= nil and tp.队伍[1].锦衣[2] == nil and (tp.队伍[1].变身数据 == nil or tp.显示变身卡造型 == false) then
		if tp.队伍[1].锦衣[1] ~= nil then
			local wq = nil
			if tp.队伍[1].装备[3] ~= nil then
				wq = tp.队伍[1].装备[3].子类
			end
			self:置人物动画(tp.队伍[1].锦衣[1].名称,tp.队伍[1].模型,nil,wq)
			tp.队伍[1]:刷新信息()
			if tp.队伍[1].装备[3] ~= nil then
				self:穿戴装备()
			end
		end
	else
		if tp.队伍[1].变身数据 == nil or tp.显示变身卡造型 == false then
			local 资源 = qmxs(mx)
			self.人物 = {["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1],nil,nil,nil,nil,"jrhc"),["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2],nil,nil,nil,nil,"jrhc")}
			tp.队伍[1]:刷新信息()
			if tp.队伍[1].装备[3] ~= nil and (tp.队伍[1].变身数据 == nil or tp.显示变身卡造型 == false) then
				self:穿戴装备()
			else
				if tp.队伍[1].炫彩~=nil then
					self:炫彩染色(tp.队伍[1].染色方案,tp.队伍[1].炫彩组,"人物")
				else
					self:置染色(tp.队伍[1].染色方案,tp.队伍[1].染色组[1],tp.队伍[1].染色组[2],tp.队伍[1].染色组[3])
				end
				self:置方向(self.方向)
			end
			if tp.队伍[1].坐骑 ~= nil and (tp.队伍[1].变身数据 == nil or tp.显示变身卡造型 == false) then
				self:坐骑改变(mx,tp.队伍[1].坐骑)
			end
		else
			local 资源 = qmxs(mx)
			self.人物 = {["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1]),["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2])} --bujiaruhuancun
			资源 = qmxs(mx.."_身体")
			if 资源[2]~= nil and 资源[1] ~= nil then
				self.人物["身体_静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1])
				self.人物["身体_行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2])
			end
			资源 = qmxs(mx.."_装饰")
			if 资源[2] ~= nil and 资源[1] ~= nil then
				self.人物["武器_静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1])
				self.人物["武器_行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2])
				self.人物["武器_静立"]:置差异(self.人物["武器_静立"].帧数-self.人物["静立"].帧数)
				self.人物["武器_行走"]:置差异(self.人物["武器_行走"].帧数-self.人物["行走"].帧数)
			end
		end
	end
	if tp.队伍[1].变身数据 == nil or tp.显示变身卡造型 == false then
		self:穿戴光环()
		self:穿戴足迹()
	end
	self:置方向(self.方向)
end

function 场景类_人物:锦衣更换()
	local mx = tp.队伍[1].模型
	if tp.队伍[1].变身数据 ~= nil and tp.显示变身卡造型 then
		mx = tp.队伍[1].变身数据
	end
	if tp.队伍[1].锦衣[2] ~= nil and (tp.队伍[1].变身数据 == nil or tp.显示变身卡造型 == false) then
		if tp.队伍[1].锦衣[2] ~= nil then
			self.飞行高度 = 0
			self:置人物动画1(tp.队伍[1].锦衣[2].名称)
			tp.队伍[1]:刷新信息()
		end
	elseif tp.队伍[1].锦衣[1] ~= nil and tp.队伍[1].锦衣[2] == nil and (tp.队伍[1].变身数据 == nil or tp.显示变身卡造型 == false) then
		if tp.队伍[1].锦衣[1] ~= nil then
			local wq = nil
			if tp.队伍[1].装备[3] ~= nil then
				wq = tp.队伍[1].装备[3].子类
			end
			self.飞行高度 = 0
			self:置人物动画(tp.队伍[1].锦衣[1].名称,tp.队伍[1].模型,nil,wq)
			tp.队伍[1]:刷新信息()
			if tp.队伍[1].装备[3] ~= nil then
				self:穿戴装备()
			end
		end
	else
		local 资源 = qmxs(mx)
		self.人物 = {["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1],nil,nil,nil,nil,"jrhc"),["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2],nil,nil,nil,nil,"jrhc")}
		tp.队伍[1]:刷新信息()
		if tp.队伍[1].装备[3] ~= nil and (tp.队伍[1].变身数据 == nil or tp.显示变身卡造型 == false) then
			self:穿戴装备()
		else
			if tp.队伍[1].炫彩~=nil then
				self:炫彩染色(tp.队伍[1].染色方案,tp.队伍[1].炫彩组,"人物")
			else
				self:置染色(tp.队伍[1].染色方案,tp.队伍[1].染色组[1],tp.队伍[1].染色组[2],tp.队伍[1].染色组[3])
			end
			self:置方向(self.方向)
		end
		if tp.队伍[1].坐骑 ~= nil  and (tp.队伍[1].变身数据 == nil or tp.显示变身卡造型 == false) then
			self:坐骑改变(mx,tp.队伍[1].坐骑)
		end
	end
	if tp.队伍[1].变身数据 == nil or tp.显示变身卡造型 == false then
		self:穿戴光环()
		self:穿戴足迹()
	end
	self:置方向(self.方向)
end

function 场景类_人物:坐骑改变(模型,坐骑,饰品)
	if tp.队伍[1].变身数据 ~= nil and tp.显示变身卡造型  then
		tp.常规提示:打开("#Y/当前正处于变身状态中，无法显示坐骑效果")
		return false
	elseif tp.显示坐骑==false then
		return false
	end

	if tp.队伍[1].锦衣[1] ~= nil then return  end
	if 坐骑==nil or 坐骑.模型==nil then
	   return
	end
	if not 可骑乘坐骑(模型,坐骑.模型) then
		tp.常规提示:打开("#Y/你的当前模型与坐骑不匹配，无法显示坐骑")
		return false
	end
	local 资源组 = zqj(模型,坐骑.模型,坐骑.饰品 or "空")
	if 资源组==nil then
	   return
	end
	self.人物 = {["静立"] = tp.资源:载入(资源组.人物资源,"网易WDF动画",资源组.人物站立,nil,nil,nil,nil,"jrhc"),["行走"] = tp.资源:载入(资源组.人物资源,"网易WDF动画",资源组.人物行走,nil,nil,nil,nil,"jrhc")}
	self.人物["坐骑_静立"] = tp.资源:载入(资源组.坐骑资源,"网易WDF动画",资源组.坐骑站立)
	self.人物["坐骑_行走"] = tp.资源:载入(资源组.坐骑资源,"网易WDF动画",资源组.坐骑行走)
	if 资源组.坐骑饰品站立 ~= nil then
		self.人物["坐骑饰品_静立"] = tp.资源:载入(资源组.坐骑饰品资源,"网易WDF动画",资源组.坐骑饰品站立)
		self.人物["坐骑饰品_行走"] = tp.资源:载入(资源组.坐骑饰品资源,"网易WDF动画",资源组.坐骑饰品行走)
	end
	self.人物["武器_静立"] = nil
	self.人物["武器_行走"] = nil
	if tp.队伍[1].炫彩~=nil then
		self:炫彩染色(tp.队伍[1].染色方案,tp.队伍[1].炫彩组,"人物")
	else
		self:置染色(tp.队伍[1].染色方案,tp.队伍[1].染色组[1],tp.队伍[1].染色组[2],tp.队伍[1].染色组[3])
	end
	if 坐骑.炫彩 ~= nil then
		self:炫彩染色(坐骑.炫彩,坐骑.炫彩组,"坐骑")
	end
	self:置方向(self.方向)
	self.飞行高度 = 0
	--tp.队伍[1].坐骑 = {坐骑,饰品}
end

function 场景类_人物:卸下坐骑()
	if tp.队伍[1].变身数据 ~= nil and tp.显示变身卡造型  then
		tp.常规提示:打开("#Y/当前正处于变身状态中，无法显示坐骑效果")
		return false
	end
	if tp.队伍[1].锦衣[1] ~= nil then return  end
	self.人物["坐骑_静立"] = nil
	self.人物["坐骑_行走"] = nil
	self.人物["坐骑饰品_静立"] = nil
	self.人物["坐骑饰品_行走"] = nil
	tp.队伍[1].坐骑 = nil
	self:置模型()
	if tp.队伍[1].装备[3] ~= nil then
		self:穿戴装备()
	end
	self.飞行高度 = 0
end

function 场景类_人物:穿戴装备()
	if tp.队伍[1].变身[1] ~= nil and  tp.显示变身卡造型  then
		tp.常规提示:打开("#Y/当前正处于变身状态中，无法取消")
		return false
	end
	if self.人物["坐骑_静立"] ~= nil or tp.队伍[1].变身数据~=nil and  tp.显示变身卡造型 then
		return false
	end
	--if tp.队伍[1].锦衣[1] ~= nil then
	--else
		if tp.队伍[1].装备[3] then
			local v = tp:取武器子类(tp.队伍[1].装备[3].子类)
			if tp.队伍[1].装备[3].名称 == "龙鸣寒水" or tp.队伍[1].装备[3].名称 == "非攻" then
				v = "弓弩1"
			end
			local 资源 = qmxs(tp.队伍[1].模型,v)
			if tp.队伍[1].锦衣[1] ~= nil and tp.队伍[1].锦衣[2] == nil then
				local wq = nil
				if tp.队伍[1].装备[3] ~= nil then
					wq = tp.队伍[1].装备[3].子类
				end
				资源=引擎.取普通锦衣模型(tp.队伍[1].锦衣[1].名称,tp.队伍[1].模型,nil,wq)
			end
			--if tp.队伍[1].锦衣[1] == nil then
				self.人物["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1],nil,nil,nil,nil,"jrhc")
				self.人物["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2],nil,nil,nil,nil,"jrhc")
			--end
			local m = tp:取武器附加名称(tp.队伍[1].装备[3].子类,tp.队伍[1].装备[3].级别限制,tp.队伍[1].装备[3].名称)
			local n = qmxs(m.."_"..tp.队伍[1].模型)
			if tp.队伍[1].锦衣[1]~=nil and tp.队伍[1].锦衣[1].名称=="斗战胜佛" then
				self.人物["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1],nil,nil,nil,nil,"jrhc")
				self.人物["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2],nil,nil,nil,nil,"jrhc")
			else
			self.人物["武器_静立"] = tp.资源:载入(n[3],"网易WDF动画",n[1])
			self.人物["武器_行走"] = tp.资源:载入(n[3],"网易WDF动画",n[2])
			end
		end
		if tp.队伍[1].装备[4] ~= nil and tp.队伍[1].模型 == "影精灵" and tp.队伍[1].装备[4].子类 == 911 then
	    local wq = tp:取武器附加名称(tp.队伍[1].装备[4].子类, tp.队伍[1].装备[4].级别限制, tp.队伍[1].装备[4].名称)
			local n = qmxs(wq.."_"..tp.队伍[1].模型)
			self.人物.坤斧_静立 = tp.资源:载入(n[3], "网易WDF动画", n[1])
			self.人物.坤斧_行走 = tp.资源:载入(n[3], "网易WDF动画", n[2])
			if tp.队伍[1].装备[4].染色方案 ~= 0 and tp.队伍[1].装备[4].染色组 ~= 0 and tp.队伍[1].装备[4].染色组 ~= nil and #tp.队伍[1].装备[4].染色组 > 0 then
				self.人物.坤斧_静立:置染色(tp.队伍[1].装备[4].染色方案, tp.队伍[1].装备[4].染色组[1], tp.队伍[1].装备[4].染色组[2], tp.队伍[1].装备[4].染色组[3])
				self.人物.坤斧_行走:置染色(tp.队伍[1].装备[4].染色方案, tp.队伍[1].装备[4].染色组[1], tp.队伍[1].装备[4].染色组[2], tp.队伍[1].装备[4].染色组[3])
			end
			资源 = qmxs(tp.队伍[1].模型,'双巨斧')
		end
		self:置武器染色()
		-- if tp.队伍[1].锦衣[1] == nil then
			-- self.人物["武器_静立"]:置差异(self.人物["武器_静立"].帧数-self.人物["静立"].帧数)
			-- self.人物["武器_行走"]:置差异(self.人物["武器_行走"].帧数-self.人物["行走"].帧数)
		-- end
		if tp.队伍[1].炫彩~=nil then
			self:炫彩染色(tp.队伍[1].染色方案,tp.队伍[1].炫彩组,"人物")
		else
			self:置染色(tp.队伍[1].染色方案,tp.队伍[1].染色组[1],tp.队伍[1].染色组[2],tp.队伍[1].染色组[3])
		end

	self:置方向(self.方向)

end

function 场景类_人物:置武器染色()
		if self.人物["武器_静立"]~=nil and tp.队伍[1].装备[3] ~=nil and tp.队伍[1].装备[3].染色方案 ~=nil then
			self.人物["武器_静立"]:置染色(tp.队伍[1].装备[3].染色方案,tp.队伍[1].装备[3].染色组[1],tp.队伍[1].装备[3].染色组[2],0)
	    self.人物["武器_行走"]:置染色(tp.队伍[1].装备[3].染色方案,tp.队伍[1].装备[3].染色组[1],tp.队伍[1].装备[3].染色组[2],0)
	  end
end

function 场景类_人物:卸下装备()
	if self.人物["坐骑_静立"] ~= nil or tp.队伍[1].变身数据~=nil and  tp.显示变身卡造型 then
		return false
	end
	if tp.队伍[1].锦衣[1] ~= nil then
		if tp.队伍[1].锦衣[1] ~= nil then
			local wq = nil
			if tp.队伍[1].装备[3] ~= nil then
				wq = tp.队伍[1].装备[3].子类
			end
			self:置人物动画(tp.队伍[1].锦衣[1].名称,tp.队伍[1].模型,nil,wq)
		end
	else
		local 资源 = qmxs(tp.队伍[1].模型)
		self.人物["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1],nil,nil,nil,nil,"jrhc")
		self.人物["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2],nil,nil,nil,nil,"jrhc")
	end
	self.人物["武器_静立"] = nil
	self.人物["武器_行走"] = nil

	self.人物.坤斧_静立 = nil
	self.人物.坤斧_行走 = nil

	if tp.队伍[1].炫彩~=nil then
		self:炫彩染色(tp.队伍[1].染色方案,tp.队伍[1].炫彩组,"人物")
	else
		self:置染色(tp.队伍[1].染色方案,tp.队伍[1].染色组[1],tp.队伍[1].染色组[2],tp.队伍[1].染色组[3])
	end
	self:置方向(self.方向)
end

function 场景类_人物:加入动画(动画)
	insert(self.特效组,tp:载入特效(动画))
end

return 场景类_人物
