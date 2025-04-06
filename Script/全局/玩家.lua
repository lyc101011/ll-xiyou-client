-- @Author: baidwwy
-- @Date:   2024-10-15 01:51:34
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-12 11:11:49
-- @Author: baidwwy
-- @Date:   2024-08-21 11:43:24
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-10-16 18:46:31
local 场景类_玩家 = class()
local floor = math.floor
local random = 引擎.取随机整数
local xys = 生成XY
local qmxs = 引擎.取模型
local remove = table.remove
local insert = table.insert
local bfx = 取八方向
local jds = 取两点角度
local jls = 取两点距离
local yds = 取移动坐标
local szb = 取四至八方向
local ARGB = ARGB
local mouse = 引擎.鼠标弹起
local pairs = ipairs
local qyg = 引擎.取野怪
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

function 场景类_玩家:初始化(玩家)
	-- local 资源 = qmxs(玩家.模型)
	-- self.玩家 = {
	-- 	["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1]),
	-- }
	-- self.玩家.行走 = tp.资源:载入(资源[3],"网易WDF动画",资源[2])
	玩家.y = 玩家.y + (random(1,12) / 100)
	self.组队标志 = tp.资源:载入(引擎.取队标(玩家.队标特效)[2],"网易WDF动画",引擎.取队标(玩家.队标特效)[1])--tp.资源:载入('addon.wdf',"网易WDF动画",0x2231EBB4)
--	self.战斗动画=tp.资源:载入('addon.wdf',"网易WDF动画",0x97C79EDB)
	self.名称 = 玩家.名称
	self.坐标 = xys(floor(玩家.x),floor(玩家.y)+0.1)
	self.真实坐标 = xys(floor(玩家.x),floor(玩家.y)+0.1)
	self.编号 = 玩家.编号
	self.x=玩家.x
	self.y=玩家.y
	self.玩家 = {}
	self.玩家ID = 玩家.id
	self.飞行高度=0
	self.行为 = "静立"
	self.方向 = 玩家.方向
	self.真实编号 = 玩家.真实编号
	self.当前称谓=玩家.当前称谓
	self.执行事件 = nil
	self.初始坐标 = xys(floor(玩家.x),floor(玩家.y)+0.1)
	self.行走坐标 = xys(floor(玩家.x),floor(玩家.y)+0.1)
	self.事件ID = 玩家.事件ID
	self.武器 = 玩家.武器
	self.副武器 = 玩家.副武器
	self.模型 = 玩家.模型
	self.组合 = 玩家.组合
	self.行走开关 = false
	self.队长开关 = 玩家.队长
	self.队伍 = 玩家.队伍
	self.类型 = "玩家"
	self.所在地图 = nil
	self.组员数量 = 0
	self.队员编号 = 玩家.队员编号
	self.飞行中 = 玩家.飞行中
	self.坐骑 = 玩家.坐骑
	self.染色组 = 玩家.染色组
	self.装备 = 玩家.装备
	self.灵饰 = 玩家.灵饰
	self.法宝 = 玩家.法宝
	self.染色方案 = 玩家.染色方案
	self.炫彩组=玩家.炫彩组
	self.炫彩=玩家.炫彩
	self.等级 = 玩家.等级
	self.性别 = 玩家.性别
	self.种族 = 玩家.种族
	self.帮派 = 玩家.BPMC
	self.门派 = 玩家.门派
	self.锦衣 = 玩家.锦衣
	self.历劫 = 玩家.历劫
	self.战斗开关=玩家.战斗开关
	self.摊位名称=玩家.摊位名称
	self.变身数据=玩家.变身数据
	self.申请玩家 = nil
	self.特效组={}
	self.玩家类型 = 玩家.玩家类型
	-- self.素材编号 = nil
	self:夺旗判断(玩家.帮派夺旗)
	-- if self.玩家类型 == "玩家" then
	-- 	self.素材编号 = self.玩家ID
	-- end
	self.玩家数据 = 玩家

	self.目标格子 = {}
	self.方向开关 = 4--self.玩家.静立.方向数 == 8
	self.移动 = false
	self.触发事件 = 玩家.触发事件
	self.触发计次 = 0
	self.显示1 = false
	-- self:数据更新(self.玩家数据)
	self:数据更新(玩家)
	self.摆摊查看 = false
	self.移动距离 = 0
	self.名称颜色 =  取名称颜色(self.名称,self.历劫.化圣,"人物")
	self.称谓颜色 =  取称谓颜色(self.当前称谓,"人物")
	玩家=nil
end

function 场景类_玩家:夺旗判断(旗帜)
	if 旗帜~=nil then
	    self.红旗=tp.资源:载入('addon.wdf',"网易WDF动画",1162623483)
		self.蓝旗=tp.资源:载入('addon.wdf',"网易WDF动画",2455360340)
	end
	self.夺旗=旗帜
end
function 场景类_玩家:更改队标(队标)
	self.组队标志 = tp.资源:载入(引擎.取队标(队标)[2],"网易WDF动画",引擎.取队标(队标)[1])
	-- self.队伍令牌=tp.资源:载入(引擎.取队标(队标)[2],"网易WDF动画",引擎.取队标(队标)[1])
end
function 场景类_玩家:数据更新(玩家)
	self.喊话=require("script/显示类/喊话").创建(tp)
	self.名称偏移 = {x=0,y=-15}
	if 玩家.称谓 ~= "" and 玩家.称谓 ~= 0 and 玩家.称谓 ~= nil then
		self.称谓 = 玩家.当前称谓
		self.称谓偏移 = {x=0,y=-15}
		self.名称偏移.y = - 35
	elseif 玩家.当前称谓 ~= "" and 玩家.当前称谓 ~= 0 and 玩家.当前称谓 ~= nil then
		self.称谓 = 玩家.当前称谓
		self.称谓偏移 = {x=0,y=-15}
		self.名称偏移.y = - 35
	end
	local qcw = 取称谓名称(self.当前称谓)
	if qcw[1] ~= nil and qcw[2] ~= nil then
		self.特效称谓 = tp.资源:载入(qcw[2],"网易WDF动画",qcw[1])
	end
	if qcw[3] ~= nil  then
		self.特效称谓.高度=qcw[3]
		end
		if qcw[4] ~= nil  then
		self.沉默=qcw[4]
		else
		self.沉默=0
		end
	if self.特效称谓 ~= nil then
		self.名称偏移.y = 1- self.特效称谓.高度
	end
end

function 场景类_玩家:取目标()
	if self.目标格子[1] == nil then
		return
	end
	self.终点 =  xys(floor(self.目标格子[1].x*20),floor(self.目标格子[1].y*20))
end

function 场景类_玩家:更改称谓(内容)
	self.特效称谓 = nil
	if  内容.当前称谓 ~= 0 and 内容.当前称谓 ~= nil then
		if 内容.当前称谓 ~= "" then
			self.称谓 = 内容.当前称谓
			self.称谓偏移 = xys(tp.字体表.人物字体:取宽度(self.称谓) / 2,-15)
			self.名称偏移.y =  - 35
		elseif 内容.当前称谓 == "" and self.称谓 ~= "" then
			self.名称偏移.y = self.名称偏移.y + 35
			self.称谓 =""
		end
	elseif self.称谓 ~= "" then
		self.名称偏移.y = self.名称偏移.y + 35
		self.称谓 =""
	end
	local qcw = 取称谓名称(内容.当前称谓)
	if qcw[1] ~= nil and qcw[2] ~= nil then
		self.特效称谓 = tp.资源:载入(qcw[2],"网易WDF动画",qcw[1])
	end
	if qcw[3] ~= nil  then
		self.特效称谓.高度=qcw[3]
		end
		if qcw[4] ~= nil  then
		self.沉默=qcw[4]
		else
		self.沉默=0
		end
	if self.特效称谓 ~= nil then
		self.名称偏移.y = 1- self.特效称谓.高度
	end
end

function 场景类_玩家:开始移动()
	if self.目标格子[1] == nil then
		self:停止移动()
		return
	end
	self.行为 = "行走"
	local 方向 = bfx(jds(self.真实坐标,self.终点),not self.方向开关)
	if jls(self.真实坐标,{x=self.目标格子[#self.目标格子].x*20,y=self.目标格子[#self.目标格子].y*20})<=self.移动距离 then
		self:停止移动()
		return
	end
	if jls(self.真实坐标,self.终点) < 4 then -- 小于可移动点直接到达位置
		self.真实坐标 = self.终点
		remove(self.目标格子, 1)
		if #self.目标格子 <= 0 then
			self:停止移动()
		end
		self:取目标()
		return false
	end
	self.真实坐标 = yds(self.真实坐标,self.终点,2.6)

	self.x,self.y=self.真实坐标.x,self.真实坐标.y
	if self.显示1 then
		self:置方向(方向)
	end
end

function 场景类_玩家:停止移动()
	self.目标格子 = {}
	self.行为 = "静立"
	self.移动 = false
	self.行走开关 = false
	if self.记忆方向 ~= nil then
		self:置方向(self.记忆方向)
		self.记忆方向 = nil
	end
end

function 场景类_玩家:更新(dt,x,y)
	if self.行走开关 == true then
		self:取目标()
		self.移动 = true
	end
	if self.显示1 and self.玩家[self.行为] and not 玩家屏蔽 then
		local asa = 1
		if self.行为 == "行走" then
			asa = 1.65--2--2.5
		end
		self.玩家[self.行为]:更新(dt*asa)
		if self.光环~=nil then
		    self.光环:更新(dt)
		end
		if self.足迹~=nil then
		    self.足迹:更新(dt)
		end
		if self.玩家["身体_"..self.行为] ~= nil then
			self.玩家["身体_"..self.行为]:更新(dt*asa)
		end
		if self.玩家["武器_"..self.行为] ~= nil then
			self.玩家["武器_"..self.行为]:更新(dt*asa)
		end
		if self.玩家["坤斧_"..self.行为] ~= nil then
			self.玩家["坤斧_"..self.行为]:更新(dt*asa)
		end
     	if self.玩家["坐骑_"..self.行为] ~= nil then
			self.玩家["坐骑_"..self.行为]:更新(dt*asa)
			if self.玩家["坐骑饰品_"..self.行为] ~= nil then
				self.玩家["坐骑饰品_"..self.行为]:更新(dt*asa)
			end
		end
		if self.玩家[self.行为]:是否选中(x,y) and tp:可操作() and not tp.第一窗口移动中 then
			tp.选中玩家 = true

		end
	 	for i=1,#self.特效组 do
			if self.特效组[i] ~= nil then
				self.特效组[i]:更新(dt)
			end
     	end
	end
end



function 场景类_玩家:显示(dt,x,y,pys)
	if self.移动 then
		self:开始移动(dt)
	end
	local yx = false
	if jls(tp.角色坐标,self.真实坐标) < 全局游戏高度/2+100 or self.行走开关 == true then

		if self.显示1 == false then
			self.玩家 = {}
			self.显示1 = true
			self:置模型()
		end
		if self.显示1 == true and  self.玩家[self.行为] then
			self:更新(dt,x,y,pys)
			if self.摊位名称~=nil then
				if self.摆摊查看 == false then
					tp.字体表.摊位文字:置颜色(ARGB(255,8,108,240))
				else
					tp.字体表.摊位文字:置颜色(ARGB(255,66,65,81))
				end
				local 摊位xy=xys(floor(self.x),floor(self.y)) + pys
				local 摊位长度=string.len(self.摊位名称)
				if 摊位长度<=4 then
					小摊位:显示(摊位xy.x,摊位xy.y-100)
					tp.字体表.摊位文字:显示(摊位xy.x-13+(4-摊位长度)*1.8,摊位xy.y-114,self.摊位名称)
					if 小摊位:是否选中(x,y) and 引擎.鼠标弹起(右键) and tp:可通行() then
						发送数据(3725,{id=self.玩家ID})
						self.摆摊查看 = true
					end
				elseif 摊位长度<=4 then
					中摊位:显示(摊位xy.x,摊位xy.y-100)
					tp.字体表.摊位文字:显示(摊位xy.x-25+(8-摊位长度)*1.8,摊位xy.y-114,self.摊位名称)
					if 中摊位:是否选中(x,y) and 引擎.鼠标弹起(右键) and tp:可通行() then
						发送数据(3725,{id=self.玩家ID})
						self.摆摊查看 = true
					end
				else
					大摊位:显示(摊位xy.x,摊位xy.y-100)
					tp.字体表.摊位文字:显示(摊位xy.x-40+(12-摊位长度)*1.8,摊位xy.y-114,self.摊位名称)
					if 大摊位:是否选中(x,y) and 引擎.鼠标弹起(右键) and tp:可通行() then
						发送数据(3725,{id=self.玩家ID})
						self.摆摊查看 = true
					end
				end
			end
			if self.玩家[self.行为]:是否选中(x,y) and 引擎.鼠标弹起(右键) and tp:可通行() then
			   	if tp.窗口.玩家信息.可视 == false then
			   		tp.窗口.玩家信息:打开(self.名称,self.玩家ID,self.模型)
			   	else
			   		tp.窗口.玩家信息:刷新信息(self.名称,self.玩家ID,self.模型)
			   	end
			end
			local s = xys(floor(self.真实坐标.x),floor(self.真实坐标.y))
			tp.影子:显示(s + pys)
			if not 玩家屏蔽 then
				if self.飞行中 then
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

				if self.光环~=nil   then
				    self.光环:显示(s.x + pys.x,s.y + pys.y)
				end
				if self.足迹~=nil and self.行为=="行走" then
				    self.足迹:显示(s.x + pys.x,s.y + pys.y)
				end
				if self.玩家["坐骑_"..self.行为] ~= nil then
					self.玩家["坐骑_"..self.行为]:显示(s + pys)
					if self.玩家["坐骑饰品_"..self.行为] ~= nil then
						self.玩家["坐骑饰品_"..self.行为]:显示(s + pys)
					end
				end
				self.玩家[self.行为]:显示(s.x + pys.x,s.y + pys.y)
				if self.玩家["身体_"..self.行为] ~= nil then
					self.玩家["身体_"..self.行为]:显示(s + pys)
				end
				if self.玩家["武器_"..self.行为] ~= nil then
				   self.玩家["武器_"..self.行为]:显示(s + pys)
				end
				if self.玩家["坤斧_"..self.行为] ~= nil then
					self.玩家["坤斧_"..self.行为]:显示(s + pys)
				end
				if (self.玩家[self.行为]:是否选中(x,y) or (self.玩家["坐骑_"..self.行为]~=nil and self.玩家["坐骑_"..self.行为]:是否选中(x,y)) or (self.玩家["武器_"..self.行为]~=nil and self.玩家["武器_"..self.行为]:是否选中(x,y)) or yx)  and (tp.鼠标.取当前() == "组队" or tp.鼠标.取当前()=="给予" or tp.鼠标.取当前()=="交易" or tp.鼠标.取当前()=="平时攻击") then
					self.移动 = false
					if mouse(0) and tp.鼠标.取当前() == "组队" then
						if self.队长开关 then
							人物点击=true
							发送数据(4002,{id=self.玩家ID})
							tp.鼠标.还原鼠标()
						else
							tp.常规提示:打开("#Y/先看下他是不是队长吧")
						end
					elseif mouse(0) and tp.鼠标.取当前()=="给予" then
						人物点击=true
						发送数据(3716,{id=self.玩家ID})
						tp.鼠标.还原鼠标()
					elseif mouse(0) and tp.鼠标.取当前()=="拆分" then
						tp.拆分开关=false
						tp.鼠标.还原鼠标()
					elseif mouse(0) and tp.鼠标.取当前()=="平时攻击" then
						人物点击=true
						tp.鼠标.还原鼠标()
						if self.战斗开关 then --观战
							发送数据(6565,{序列=self.玩家ID})
						else

							if 可PK地图[tp.当前地图] then
										-- if (tp.当前地图==1001 and self.坐标.x>398*20 and self.坐标.x<439*20 and self.坐标.y>164*20 and self.坐标.y<183*20) or tp.当前地图 == 2009 then
										-- 	if not self.队长开关 then
										-- 	    PK选中玩家=self.玩家ID
										-- 		tp.窗口.对话栏:文本("","","少侠，你选择的对手刚好也是独自一人。你想向他发起切磋还是“单挑”呢",{"切磋","单挑"})
										-- 	else
										-- 		发送数据(6561,{序列=self.玩家ID})
										-- 	end
										---- elseif tp.当前地图 == 1197 then --比武场
									---- 	发送数据(6566,{序列=self.玩家ID})
									if tp.当前地图 == 1197 then --比武场
											tp.常规提示:打开("#Y/比武等待区不允许发生战斗！")
									elseif tp.当前地图==5136 or tp.当前地图==5137 or tp.当前地图==5138 or tp.当前地图==5139 then---精锐/神威/天科/天元
											发送数据(6566,{序列=self.玩家ID,PK地图=tp.当前地图})
									elseif tp.当前地图 == 2010 or tp.当前地图 == 2011 or tp.当前地图 == 2012 or tp.当前地图 == 1511 then
											发送数据(6552,{序列=self.玩家ID})--帮战
									else
											tp.常规提示:打开("#Y/这个场景不允许发生战斗！")
									end
							else

									if (tp.当前地图==1001 and self.坐标.x>398*20 and self.坐标.x<439*20 and self.坐标.y>164*20 and self.坐标.y<183*20) or tp.当前地图 == 2009 then
											if not self.队长开关 then
											    PK选中玩家=self.玩家ID
												tp.窗口.对话栏:文本("","","少侠，你选择的对手刚好也是独自一人。你想向他发起“切磋”还是“单挑”呢？#",{"切磋","\n","单挑"})
											else
												发送数据(6561,{序列=self.玩家ID})
											end
									elseif tp.当前地图==6227 then --武神坛
											-- if self.坐标.x>1*20 and self.坐标.x<67*20 and self.坐标.y>1*20 and self.坐标.y<=37*20 then
												发送数据(6588,{序列=self.玩家ID})
											-- else
												tp.常规提示:打开("#Y/这个位置不允许发生战斗！")
											-- end
									else --下面的用勾魂索PK
											tp.窗口.组合输入框:打开("勾魂索",{"请输入玩家ID："})---ALT+A直接打开
									end
							end

						end

					elseif mouse(0) and tp.鼠标.取当前()=="交易" then
						人物点击=true
						发送数据(3718,{id=self.玩家ID})
						tp.鼠标.还原鼠标()
					end
				end
			end
			self.名称颜色 =  取名称颜色(self.名称,self.历劫.化圣,"人物")
			self.称谓颜色 =  取称谓颜色(self.当前称谓,"人物")
			if not 玩家屏蔽 then
				if self.玩家[self.行为]:是否选中(x,y) and tp:可操作() and not tp.第一窗口移动中 then
					self.玩家[self.行为]:置高亮()

				    if self.玩家["身体_"..self.行为] ~= nil then
						self.玩家["身体_"..self.行为]:置高亮()
					end
					if self.玩家["武器_"..self.行为] ~= nil then
						self.玩家["武器_"..self.行为]:置高亮()
					end
					if self.玩家["坤斧_"..self.行为] ~= nil then
						self.玩家["坤斧_"..self.行为]:置高亮()
					end
					if self.玩家["坐骑_"..self.行为] ~= nil then
						self.玩家["坐骑_"..self.行为]:置高亮()
					end
					self.名称颜色 = -419495936
					self.称谓颜色 = -419495936
				else
					self.玩家[self.行为]:取消高亮()

					if self.玩家["武器_"..self.行为] ~= nil then
						self.玩家["武器_"..self.行为]:取消高亮()
					end
					if self.玩家["坤斧_"..self.行为] ~= nil then
						self.玩家["坤斧_"..self.行为]:取消高亮()
					end
					if self.玩家["坐骑_"..self.行为] ~= nil then
						self.玩家["坐骑_"..self.行为]:取消高亮()
					end
				end
			end

			if (self.称谓 == nil or self.称谓 == "") and  self.特效称谓 == nil then
				tp.字体表.人物字体:置颜色(self.名称颜色):置阴影颜色(ARGB(230,0,0,0)):显示x(s + pys - self.名称偏移,self.名称)
			elseif self.特效称谓 ~= nil then
				if self.沉默==nil then
				 self.沉默=0
				end
				self.特效称谓:更新(dt)
				self.特效称谓:显示(s.x + pys.x,s.y + pys.y+45+self.沉默)
				tp.字体表.人物字体:置颜色(self.名称颜色):置阴影颜色(ARGB(230,0,0,0)):显示x(s + pys - self.名称偏移,self.名称)
			else
				if Jingtaicw[self.称谓] then
					tp[self.称谓]:显示(s.x+pys.x+Jingtaicw[self.称谓].x  ,s.y+pys.y+Jingtaicw[self.称谓].y)
				else
				    tp.字体表.人物字体:置颜色(self.称谓颜色):显示x(s + pys - self.称谓偏移,self.称谓)
				end
				tp.字体表.人物字体:置颜色(self.名称颜色):置阴影颜色(ARGB(230,0,0,0)):显示x(s + pys - self.名称偏移,self.名称)
			end
            if not 玩家屏蔽 then

				for i=1,#self.特效组 do
					if self.特效组[i] ~= nil then
						self.特效组[i]:显示(xys(floor(self.x),floor(self.y)) + pys)
						if (self.特效组[i].已载入 >= self.特效组[i].帧数-2) then
							self.特效组[i] = nil
							remove(self.特效组,i)
						end
					end
				end
			end
			self.坐标.x = s.x
			self.坐标.y = s.y
			if self.队长开关 then
				self.组队标志:更新(dt)
				local Qs = 1
				if self.玩家["坐骑_"..self.行为]  ~= nil then
					Qs = 生成XY(floor(self.真实坐标.x),floor(self.真实坐标.y-130+self.飞行高度))
				else
					Qs = 生成XY(floor(self.真实坐标.x),floor(self.真实坐标.y-100+self.飞行高度))
				end
				self.组队标志:显示(Qs + pys)
			end
			if self.战斗开关 then
				self.显示坐标=xys(floor(self.x),floor(self.y)) + pys
				if self.玩家["坐骑_"..self.行为]  ~= nil then
					tp.战斗动画:显示(self.显示坐标.x,self.显示坐标.y-130+self.飞行高度)
				else
					tp.战斗动画:显示(self.显示坐标.x,self.显示坐标.y-100+self.飞行高度)
				end
			end
			if self.夺旗~=nil and self[self.夺旗] then
				self.dqzb=xys(floor(self.x),floor(self.y)) + pys
				self[self.夺旗]:更新()
				if self.玩家["坐骑_"..self.行为]  ~= nil then
					self[self.夺旗]:显示(self.dqzb.x,self.dqzb.y-155+self.飞行高度)
				else
					self[self.夺旗]:显示(self.dqzb.x,self.dqzb.y-145+self.飞行高度)
				end
			end
			self.喊话:显示()
		end
	else
		if self.显示1 == true then
			self.显示1 = false
			--self:释放()
			self.玩家 = nil
			self.光环=nil
			self.足迹=nil
		end
	end
end

function 场景类_玩家:释放()
	if next(self.玩家) ~= nil then
		if self.玩家["静立"] ~= nil then
		self.玩家["静立"]:释放()
		end
		if self.玩家["行走"] ~= nil then
			self.玩家["行走"]:释放()
		end
		if self.变身数据 ~= nil and  tp.显示变身卡造型  then return  end
		if self.玩家["武器_静立"] ~= nil then
			self.玩家["武器_静立"]:释放()
		end
		if self.玩家["武器_行走"] ~= nil then
			self.玩家["武器_行走"]:释放()
		end
		if self.玩家["坐骑_静立"] ~= nil then
			self.玩家["坐骑_静立"]:释放()
			if self.玩家["坐骑饰品_静立"] ~= nil then
				self.玩家["坐骑饰品_静立"]:释放()
			end
		end
		if self.玩家["坐骑_行走"] ~= nil then
			self.玩家["坐骑_行走"]:释放()
			if self.玩家["坐骑饰品_行走"] ~= nil then
				self.玩家["坐骑饰品_行走"]:释放()
			end
		end
		if self.光环~=nil then
		    self.光环:释放()
		end
		if self.足迹~=nil then
		    self.足迹:释放()
		end
	end
end

function 场景类_玩家:置方向(d)
	if self.玩家== nil then return end
	if self.变身数据 ~=nil and tp.显示变身卡造型 then
		d= 取四至八方向(d)
	end
	if self.足迹~=nil then
 		self.足迹:置方向(d,nil,1)
	end
	if self.玩家["静立"] ~= nil then
		self.玩家["静立"]:置方向(d)
		self.玩家["行走"]:置方向(d)
	end
	if self.玩家["身体_静立"] ~= nil and self.玩家["身体_行走"] ~= nil then
		self.玩家["身体_静立"]:置方向(d)
		self.玩家["身体_行走"]:置方向(d)
	end
	if self.玩家["武器_静立"] ~= nil and self.玩家["武器_行走"] ~= nil then
		self.玩家["武器_静立"]:置方向(d)
		self.玩家["武器_行走"]:置方向(d)
	end
	if self.玩家["坤斧_静立"] ~= nil and self.玩家["坤斧_行走"] ~= nil then
		self.玩家["坤斧_静立"]:置方向(d)
		self.玩家["坤斧_行走"]:置方向(d)
	end
	if self.玩家["坐骑_静立"] ~= nil and self.玩家["坐骑_行走"] ~= nil  then
		self.玩家["坐骑_静立"]:置方向(d)
		self.玩家["坐骑_行走"]:置方向(d)
		if self.玩家["坐骑饰品_静立"] ~= nil and self.玩家["坐骑饰品_行走"] ~= nil  then
			self.玩家["坐骑饰品_静立"]:置方向(d)
			self.玩家["坐骑饰品_行走"]:置方向(d)
		end
	end
	self.方向 = d
end

function 场景类_玩家:更改染色(数据)
	if self.锦衣[1] == nil and self.锦衣[2] == nil then
		self.玩家["静立"]:置染色(数据.染色方案,数据.染色组[1],数据.染色组[2],数据.染色组[3],0)
		self.玩家["行走"]:置染色(数据.染色方案,数据.染色组[1],数据.染色组[2],数据.染色组[3],0)
	end
end

function 场景类_玩家:设置动画(类型)
	insert(self.特效组,tp:载入特效(类型))
	引擎.场景:播放音效类(类型)
end

function 场景类_玩家:设置路径(格子)
   	self.移动距离=格子.距离
	local a = xys(floor(self.x / 20),floor(self.y / 20))
    	self.目标格子 = tp.场景.地图.寻路:寻路(a,格子)
    	self.行走开关 = true
	-- if self.目标格子 ~= nil and self.目标格子[1] ~= nil then
	-- 	self:取目标(self.目标格子[1],数据.id)
	-- 	self.移动=true
	-- else
	-- 	self.目标格子 = {}
	-- end
end

function 场景类_玩家:设置路径无障碍(格子)
   	self.移动距离=格子.距离
	local a = xys(floor(self.x / 20),floor(self.y / 20))
    	self.目标格子 = tp.场景.地图.寻路:寻路无障碍(a,格子)
    	self.行走开关 = true
	-- if self.目标格子 ~= nil and self.目标格子[1] ~= nil then
	-- 	self:取目标(self.目标格子[1],数据.id)
	-- 	self.移动=true
	-- else
	-- 	self.目标格子 = {}
	-- end
end

-- function 场景类_玩家:设置路径(路径)
-- 	local a = xys(floor(self.真实坐标.x / 20),floor(self.真实坐标.y / 20))
-- 	self.玩家[行走玩家ID].目标格子 = tp.场景.地图.寻路:寻路(a,路径)
-- 	self.玩家[行走玩家ID].行走开关 = true
-- end

function 场景类_玩家:设置坐标(内容)
	self.真实坐标.x,self.真实坐标.y=内容.x,内容.y
	self:置方向(内容.方向)
	self:停止移动()
end

function 场景类_玩家:置人物动画(名称,造型,武器,类型)
	local zy=引擎.取普通锦衣模型(名称,造型,武器,类型)
	self.玩家 = {["静立"] = tp.资源:载入(zy[3],"网易WDF动画",zy[1]),["行走"] = tp.资源:载入(zy[3],"网易WDF动画",zy[2])}
end
function 场景类_玩家:置人物动画1(名称,造型,武器,类型)
	local zy=引擎.取模型(名称)
	self.玩家 = {["静立"] = tp.资源:载入(zy[3],"网易WDF动画",zy[1]),["行走"] = tp.资源:载入(zy[3],"网易WDF动画",zy[2])}
end
function 场景类_玩家:穿戴光环()
	self.光环 = nil
	if self.摊位名称==nil then
		if self.锦衣[3] ~= nil then
			local zy = 引擎.取光环(self.锦衣[3])
	    	self.光环 = tp.资源:载入(zy[4],"网易WDF动画",zy[1])
	    end
	end
end

function 场景类_玩家:穿戴足迹()
	self.足迹 = nil
	if self.摊位名称==nil then
	    if self.锦衣[4] ~= nil then
	    	local zy = 引擎.取足迹(self.锦衣[4])
	    	self.足迹 = tp.资源:载入(zy[2],"网易WDF动画",zy[1])
	    end
	end
end



function 场景类_玩家:更换锦衣(名称,序列)
	self.锦衣[序列] = 名称
	self:置模型()
end

function 场景类_玩家:置模型()
	local mx = self.模型
	if self.变身数据 ~= nil and tp.显示变身卡造型  then
		mx = self.变身数据
	end
	self.光环 = nil
	self.足迹 = nil
	if self.锦衣[2] ~= nil and  (self.变身数据 == nil or tp.显示变身卡造型 == false) then
    	if self.锦衣[2] ~= nil then
    		self:置人物动画1(self.锦衣[2])
    	end
	elseif self.锦衣[1] ~= nil and self.锦衣[2] == nil and (self.变身数据 == nil or tp.显示变身卡造型 == false) then
    	if self.锦衣[1] ~= nil then
    		local wq = nil
    		if self.武器 ~= nil then
    			wq = self.武器.子类
    		end
    		self:置人物动画(self.锦衣[1],self.模型,nil,wq)
			if self.武器 ~= nil then
				self:穿戴装备(self.武器)
			end
    	end
	else
		if (self.变身数据 == nil or tp.显示变身卡造型 == false) then
			local 资源 = qmxs(mx)
			self.玩家 = {
			["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1],nil,nil,nil,nil,"jrhc"),
			}
			self.玩家.行走 = tp.资源:载入(资源[3],"网易WDF动画",资源[2],nil,nil,nil,nil,"jrhc")
			if self.武器 ~= nil then
				self:穿戴装备(self.武器)
			elseif self.玩家.显示饰品 then
				self:穿戴装备(self.武器)
			end
			if self.炫彩~=nil then
				self:炫彩染色(self.炫彩,self.炫彩组,"人物")
			else
				if self.染色方案 ~= nil and self.染色组 ~= nil then
					if next(self.染色组) ~= nil then
						self:置染色(self.染色方案,self.染色组[1],self.染色组[2],self.染色组[3])
					end
				end
			end
			if self.坐骑~=nil then--and 低配模式==false then
				self:坐骑改变()
			end
		else
			-- local 资源 = qmxs(mx)
			-- self.玩家["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1])--bujiaruhuancun
			-- self.玩家["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2])
			-- 资源 = qmxs(mx.."_身体")

			local 资源 = qmxs(mx)
			self.玩家= {
			["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1])}--bujiaruhuancun

			self.玩家.行走 = tp.资源:载入(资源[3],"网易WDF动画",资源[2])
			资源 = qmxs(mx.."_身体")


			if 资源[2]~= nil and 资源[1] ~= nil then
				self.玩家["身体_静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1])
				self.玩家["身体_行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2])
			end
			资源 = qmxs(mx.."_装饰")
			if 资源[2]~= nil and 资源[1] ~= nil then
				self.玩家["武器_静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1])
				self.玩家["武器_行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2])
				if not self.锦衣[1] then
					self.玩家["武器_静立"]:置差异(self.玩家["武器_静立"].帧数-self.玩家["静立"].帧数)
					self.玩家["武器_行走"]:置差异(self.玩家["武器_行走"].帧数-self.玩家["行走"].帧数)
				end
			end
			self:置方向(self.方向)
		end
	end
	if (self.变身数据 == nil or tp.显示变身卡造型 == false) and 低配模式==false then
		self:穿戴光环()
		self:穿戴足迹()
	end
end

function 场景类_玩家:坐骑改变()
	if (self.变身数据 ~= nil and tp.显示变身卡造型) or self.锦衣[1] ~= nil or self.锦衣[2] ~= nil or not 可骑乘坐骑(self.模型,self.坐骑.模型) or tp.显示坐骑==false then
	    return
	end
	local 模型=self.模型
	local 坐骑=self.坐骑.模型
	local 饰品=self.坐骑.饰品
	local 资源组 = 引擎.坐骑库(模型,坐骑,饰品 or "空")
	if 资源组==nil then
	   return
	end
	self.玩家 = {["静立"] = tp.资源:载入(资源组.人物资源,"网易WDF动画",资源组.人物站立,nil,nil,nil,nil,"jrhc"),["行走"] = tp.资源:载入(资源组.人物资源,"网易WDF动画",资源组.人物行走,nil,nil,nil,nil,"jrhc")}
	self.玩家["坐骑_静立"] = tp.资源:载入(资源组.坐骑资源,"网易WDF动画",资源组.坐骑站立)
	self.玩家["坐骑_行走"] = tp.资源:载入(资源组.坐骑资源,"网易WDF动画",资源组.坐骑行走)
	if 资源组.坐骑饰品站立 ~= nil then
		self.玩家["坐骑饰品_静立"] = tp.资源:载入(资源组.坐骑饰品资源,"网易WDF动画",资源组.坐骑饰品站立)
		self.玩家["坐骑饰品_行走"] = tp.资源:载入(资源组.坐骑饰品资源,"网易WDF动画",资源组.坐骑饰品行走)
	end
	self:清空武器()
	if self.炫彩~=nil then
		self:炫彩染色(self.炫彩,self.炫彩组,"人物")
	else
		if self.染色方案~=nil and #self.染色组~=0 then
	     		self:置染色(self.染色方案,self.染色组[1],self.染色组[2],self.染色组[3],0)
	    	end
	end
	if self.坐骑.炫彩 ~= nil then
		self:炫彩染色(self.坐骑.炫彩,self.坐骑.炫彩组,"坐骑")
	end
	self:置方向(self.方向)
end

function 场景类_玩家:卸下坐骑(id)
	if self.变身数据 ~= nil and tp.显示变身卡造型 then return  end
	if self.锦衣[1] ~= nil or self.锦衣[2] ~= nil then return  end
	if self.玩家 == nil then return  end
	self.玩家["坐骑_静立"] = nil
	self.玩家["坐骑_行走"] = nil
	self.玩家["坐骑饰品_静立"] = nil
	self.玩家["坐骑饰品_行走"] = nil
	self.坐骑 = nil
    	local 资源 = qmxs(self.模型)
	self.玩家={["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1],nil,nil,nil,nil,"jrhc"),["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2],nil,nil,nil,nil,"jrhc")}
	if self.炫彩~=nil then
		self:炫彩染色(self.染色方案,self.炫彩组,"人物")
	else
		if self.染色方案~=nil and #self.染色组~=0 then
	     		self:置染色(self.染色方案,self.染色组[1],self.染色组[2],self.染色组[3],0)
	    	end
	end
   	self:置方向(self.方向,id)
	if self.武器 ~= nil then
		self:穿戴装备(self.武器)
	else
		self:清空武器()
	end
end

function  场景类_玩家:清空武器()
	if self.玩家== nil then return end
	if self.玩家["武器_静立"]  ~= nil then
		self.玩家["武器_静立"] = nil
	end
	if self.玩家["坤斧_静立"]  ~= nil then
		self.玩家["坤斧_静立"] = nil
	end
	if self.玩家["武器_行走"]  ~= nil then
		self.玩家["武器_行走"] = nil
	end
end



function 场景类_玩家:重新加载动画()

	local 资源 = qmxs(self.模型)
	if self.武器 ~= nil then
		self:穿戴装备(self.武器)
	else
		资源 = qmxs(self.模型)
		if self.锦衣 ~= nil and self.锦衣[1] ~= nil and self.锦衣[1].名称 ~= nil and 屏蔽光环足迹==false and (self.变身 == nil or tp.显示变身卡造型 == false) then
		资源 = qmxs(self.锦衣[1].名称.."_"..self.模型)
		self.玩家 = {["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1]),["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2])}
		else
		self.玩家 = {["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1]),["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2])}
		if self.玩家ID<900000 then
		self:置染色(self.染色方案,self.染色组[1],self.染色组[2],self.染色组[3])
		end
	 end
	end
	if self.坐骑 == nil or self.坐骑.模型 == nil then
		self.坐骑 = nil
	end
	if self.坐骑~=nil then
		self:坐骑改变()
	end
	if self.锦衣 ~= nil and self.锦衣[2] ~= nil then
		self:穿戴光环(self.锦衣[2])
	end
	if self.锦衣 ~= nil and self.锦衣[3] ~= nil then
		self:穿戴足迹(self.锦衣[3])
	end
	if self.变身~=nil and tp.显示变身卡造型 then
	    资源=qmxs(self.变身)
	    self.玩家 = {["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1]),["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2])}
		if self.变异 and 染色信息[self.变身]~=nil then
		    self.染色方案2 = 染色信息[self.变身].id
			self.染色组2 = 染色信息[self.变身].方案
	    	self:置染色(self.染色方案2,self.染色组2[1],self.染色组2[2],self.染色组2[3])
			self:置方向(self.方向)
		end
	end
	if self.染色方案 ~= nil and self.染色组 ~= nil and self.锦衣[1] == nil and (self.变身==nil or tp.显示变身卡造型 == false) then
		if next(self.染色组) ~= nil then
			self.染色方案 = self.染色方案
			self.染色组 = self.染色组xi
			self:置染色(self.染色方案,self.染色组[1],self.染色组[2],self.染色组[3])
		end
	end

end

function 场景类_玩家:穿戴装备(武器,副武器)
	self.武器=武器
	if (self.变身数据 ~= nil and  tp.显示变身卡造型 )  or 武器==nil then
		self:清空武器()
		return false
	end
	--if self.锦衣[1] ~= nil and self.变身数据 == nil then
	--else
		if not self.显示1 then return end
		if self.玩家["坐骑_静立"] ~= nil then
			return false
		end
		local v = tp:取武器子类(武器.子类)
		if 武器.名称 == "龙鸣寒水" or 武器.名称 == "非攻" then
			v = "弓弩1"
		end
		local 资源 = qmxs(self.模型,v)

		if self.锦衣[1] ~= nil and self.锦衣[2] == nil then
			local wq = nil
			if 武器 ~= nil then
				wq = 武器.子类
			end
			资源=引擎.取普通锦衣模型(self.锦衣[1],self.模型,nil,wq)
		end
		--if self.锦衣[1] == nil then
			self.玩家["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1],nil,nil,nil,nil,"jrhc")
			self.玩家["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2],nil,nil,nil,nil,"jrhc")
		--end
		local m = tp:取武器附加名称(武器.子类,武器.级别限制,武器.名称)
		local n = qmxs(m.."_"..self.模型)
		 if self.锦衣[1]~=nil and self.锦衣[1].名称=="斗战胜佛" then
		 	self.玩家["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1],nil,nil,nil,nil,"jrhc")
		 	self.玩家["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2],nil,nil,nil,nil,"jrhc")

		 else
			self.玩家["武器_静立"] = tp.资源:载入(n[3],"网易WDF动画",n[1])
			self.玩家["武器_行走"] = tp.资源:载入(n[3],"网易WDF动画",n[2])
			if 副武器 or self.副武器 then
				if not self.副武器 then
				    self.副武器 = 副武器
				end

				local wq = tp:取武器附加名称(self.副武器.子类, self.副武器.级别限制, self.副武器.名称)
				local n = qmxs(wq.."_"..self.模型)
				self.玩家.坤斧_静立 = tp.资源:载入(n[3], "网易WDF动画", n[1])
		        self.玩家.坤斧_行走 = tp.资源:载入(n[3], "网易WDF动画", n[2])
		        资源 = qmxs(self.模型,'双巨斧')
			else
				self.玩家.坤斧_静立 = nil
		        self.玩家.坤斧_行走 = nil
			end
			if not self.锦衣[1] then
				self.玩家["武器_静立"]:置差异(self.玩家["武器_静立"].帧数-self.玩家["静立"].帧数)
				self.玩家["武器_行走"]:置差异(self.玩家["武器_行走"].帧数-self.玩家["行走"].帧数)
			end
		end

		if self.炫彩~=nil then
			self:炫彩染色(self.炫彩,self.炫彩组,"人物")
		else

			if self.武器.染色方案~=nil and #self.武器.染色组~=0 then
		     self:置武器染色(self.武器.染色方案,self.武器.染色组[1],self.武器.染色组[2],self.武器.染色组[3],0)
		    end

		end
	--end
	self:置方向(self.方向,id)
end
function 场景类_玩家:置武器染色(染色方案,a,b,c)
	if self.变身数据 ~= nil and tp.显示变身卡造型 then
		return false
	end
	if self.锦衣[1] == nil and self.锦衣[2] == nil then
		self.玩家["武器_静立"]:置染色(染色方案,a,b,c)
		if self.玩家["武器_行走"] ~= nil then
			self.玩家["武器_行走"]:置染色(染色方案,a,b,c)
		end
		self:置方向(self.方向)
	end
end
function 场景类_玩家:置染色(染色方案,a,b,c)
	if self.变身数据 ~= nil and tp.显示变身卡造型 then
		return false
	end
	if self.锦衣[1] == nil and self.锦衣[2] == nil then
		self.玩家["静立"]:置染色(染色方案,a,b,c)
		if self.玩家.行走 ~= nil then
			self.玩家.行走:置染色(染色方案,a,b,c)
		end
		self:置方向(self.方向)
	end
end

function 场景类_玩家:炫彩染色(染色方案,sj,类型)
	if self.变身数据 ~= nil and tp.显示变身卡造型 then
		return false
	end
	if 类型 == "人物" then
		if self.锦衣[1] == nil  and self.锦衣[2] == nil then
			self.玩家["静立"]:炫彩染色(染色方案,sj)
			if self.玩家.行走 ~= nil then
				self.玩家.行走:炫彩染色(染色方案,sj)
			end
			self:置方向(self.方向)
		end
	elseif 类型 == "坐骑" then
		self.玩家["坐骑_静立"]:炫彩染色(染色方案,sj)
		self.玩家["坐骑_行走"]:炫彩染色(染色方案,sj)
	end
end

function 场景类_玩家:事件方向(a,b)
	if self.方向开关 then
		self:置方向(bfx(floor(取两点角度(b,a))))
		tp.场景.人物:置方向(bfx(floor(取两点角度(a,b))))
	else
		self:置方向(szb(bfx(floor(取两点角度(b,a)))))
		tp.场景.人物:置方向(bfx(floor(取两点角度(a,b))))
	end
end

return 场景类_玩家
