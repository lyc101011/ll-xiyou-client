-- @Author: baidwwy
-- @Date:   2024-04-03 22:06:51
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2025-04-09 21:59:34
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2023-07-03 22:42:41
-- 梦幻西游游戏资源破解 baidwwy@vip.qq.com(313738139) 老毕   和 C++PrimerPlus 717535046 这俩位大神破解所以资源
--======================================================================--
local 场景类_假人 = class()

local floor = math.floor
local random = 引擎.取随机整数
local xys = 生成XY
local qmxs = 引擎.取模型
local remove = table.remove
local bfx = 取八方向
local jds = 取两点角度
local jls = 取两点距离
local yds = 取移动坐标
local szb = 取四至八方向
local ARGB = ARGB
local mouse = 引擎.鼠标弹起
local pairs = ipairs
local qyg = 引擎.取野怪

function 场景类_假人:初始化(假人)
	self.假人 ={}
	if 假人.模型 == nil then
		for k,v in pairs(假人) do
			log_error(tostring(k)..",模型出错啦,"..tostring(v))
		end
		return
	end
	if 假人.锦衣 then
		 local 资源=引擎.取普通锦衣模型(假人.锦衣,假人.模型,nil,假人.武器子类)
		 self.假人 = {["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1]),["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2])}
	else
		local 资源 = qmxs(假人.模型)
		self.假人 = {
			["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1]),
		}
		if 资源[2]~=nil then
			self.假人["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2])--如果副本错误 就屏蔽这  然后开启下面那个  if 资源[2] ~= nil then 的解除屏蔽
		else
			self.假人["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1])
		end
		local 身体资源 = qmxs(假人.模型.."_身体")
		if 身体资源[1] ~= nil then
			self.假人["身体_静立"] = tp.资源:载入(身体资源[3],"网易WDF动画",身体资源[1])
			if 身体资源[2]~=nil then
				self.假人["身体_行走"] = tp.资源:载入(身体资源[3],"网易WDF动画",身体资源[2])--如果副本错误 就屏蔽这  然后开启下面那个  if 资源[2] ~= nil then 的解除屏蔽
			else
				self.假人["身体_行走"] = tp.资源:载入(身体资源[3],"网易WDF动画",身体资源[1])
			end
		end
	end
	if 假人.方向1~=nil then 假人.方向=假人.方向1 end
	--if 假人.武器~=nil then 假人.武器=假人.武器.名称 end
	假人.Y = 假人.Y + (random(1,12) / 100)
	self.名称 = 假人.名称
	self.标识=假人.id
	self.序列=假人.编号
	self.坐标 = xys(floor(假人.X*20),floor(假人.Y*20)+0.1)
	self.真实坐标 = xys(floor(假人.X*20),floor(假人.Y*20)+0.1)
	self.编号 = 假人.编号
	self.行为 = "静立"
	self.类型 = "假人"
	self.需求 = {}
	if 假人.模型=="宝箱" then 假人.方向=0 end
	self.方向 = 假人.方向
	self.记忆方向 = self.方向
	self.假人队标=false
	self.真实编号 = 假人.真实编号
	self.执行事件 = 假人.执行事件
	self.初始坐标 = self.坐标
	self.事件ID = 假人.事件ID
	self.武器 = 假人.武器
	self.武器子类 = 假人.武器子类
	self.模型 = 假人.模型
	self.特殊BOSS = 假人.特殊BOSS
	self.组合 = 假人.组合
	self.行走开关 = 假人.行走开关
	self.小地图名称颜色 = 假人.小地图名称颜色
	self.触碰延时=时间
	self.队伍组 = 假人.队伍组
	self.任务显示 = 假人.任务显示
	self.战斗显示 = 假人.战斗显示
	self.锦衣 = 假人.锦衣
	self.领取人id = 假人.领取人id
	self.炫彩组=假人.炫彩组
	self.炫彩=假人.炫彩
	self.显示饰品 = 假人.显示饰品
	self.置顶层 = 假人.置顶层
	if 假人.武器 ~= nil then
		self:置武器(假人)
	elseif 假人.显示饰品 then
		self:置武器(假人,true)
	end
	if not self.锦衣 then
		if self.炫彩~=nil then
			self:炫彩染色(self.炫彩,self.炫彩组,"人物")
		else
			if 假人.染色方案 ~= nil and 假人.染色组 ~= nil then
				self.染色方案 = 假人.染色方案
				self.染色组 = 假人.染色组
				self:置染色(假人.染色方案,假人.染色组[1],假人.染色组[2],假人.染色组[3])
				self.方向=取随机数(2,3)
			end
		end
	end
	self.名称偏移 = {x=0,y=-15}
	if 假人.称谓 ~= "" and 假人.称谓 ~= 0 and 假人.称谓 ~= nil then
		self.称谓 = 假人.称谓
		if string.find(假人.称谓,"大赛成员") then
			self.假人队标=tp.资源:载入('addon.wdf',"网易WDF动画",0x2231EBB4)
		end
		self.称谓偏移 = {x=0,y=-15}
		self.名称偏移.y = - 35
	end
	self.目标格子 = {}
	self.任务开关 = {}
	self.方向开关 = self.假人.静立.方向数
	self.移动 = false
	-- if self.执行事件 == "明雷" or self.行走开关 then
	-- 	self.行走时间 = 20+random(-10,10)
	-- end
	if  self.执行事件 ~= "不执行"  then
		self.喊话=require("script/显示类/喊话").创建(tp)
	end
	self.静止转移 = self.假人.静立.帧数 <= 4 or (self.执行事件 == "明雷怪" or self.行走开关)
	if self.执行事件=="可点击对话" or 假人.模型=="宝箱" or 假人.模型=="木桩" or 假人.模型=="灵木宝树" or 假人.模型=="灵木宝树树根" or 假人.模型=="帮派机关人" then
		self.静止转移=nil
	end
	self.触发事件 = 假人.触发事件
	self.自动对话=false
	self.触发计次 = 0
	self:置方向(self.方向)
	self.显示1 = true
	self.名称颜色 =  取名称颜色(self.名称,nil,"假人")
	self.称谓颜色 =  取称谓颜色(self.称谓,"假人")
end

function 场景类_假人:下一点(xy)
	if xy then
		if #self.目标格子 > 1 then
			local 位置 = #self.目标格子
			local 最后 = self.目标格子[位置]
			for n=1,#self.目标格子 do
				if tp.场景.地图.寻路:判断直线障碍(xy,self.目标格子[n]) then
					位置 = n
					break
				end
			end
			for i=1,位置 do
				remove(self.目标格子, 1)
			end
			if #self.目标格子 == 0 then
				self.目标格子 = 最后
			end
		end
	end
end

function 场景类_假人:取目标()
	if self.目标格子[1] == nil then
		return
	end
	self.终点 =  xys(floor(self.目标格子[1].x*20),floor(self.目标格子[1].y*20))
end

function 场景类_假人:开始移动()
	if self.目标格子[1] == nil then
		self:停止移动()
		return
	end
	self.行为 = "行走"
	local 方向 = 取八方向(jds(self.真实坐标,self.终点),not self.方向开关)
	if jls(self.真实坐标,self.终点) < 2 then -- 小于可移动点直接到达位置
		self.真实坐标 = self.终点
		remove(self.目标格子, 1)
		self:下一点(self.目标格子[1])
		if #self.目标格子 <= 0 then
			self:停止移动()
		end
		self:取目标()
		return false
	end
	self.真实坐标 = yds(self.真实坐标,self.终点,1)
	self:置方向(方向)
end

function 场景类_假人:停止移动()
	self.目标格子 = {}
	self.行为 = "静立"
	self.移动 = false
end

function 场景类_假人:对话开始()
	if tp.鼠标.取当前()=="给予" then
		客户端:发送数据(3748,{地图=tp.当前地图,编号=self.编号,序列=self.序列,标识=self.标识,名称=self.名称,模型=self.模型},1)
		tp.鼠标.还原鼠标()
	elseif tp.鼠标.取当前()=="事件" or tp.鼠标.取当前()=="平时攻击" then
		self.自动对话=false
		客户端:发送数据(1501,{地图=tp.当前地图,编号=self.编号,序列=self.序列,标识=self.标识},1)
	elseif tp.鼠标.取当前()=="铁锤点击" and tp.当前地图==1511 and (self.名称=="帮派师爷紅" or self.名称=="帮派师爷藍") then
		客户端:发送数据(6553,{名称=self.名称},1)
		tp.鼠标.还原鼠标()
	elseif self.自动对话 then
		self.自动对话=false
		客户端:发送数据(1501,{地图=tp.当前地图,编号=self.编号,序列=self.序列,标识=self.标识},1)
	end
	if tp.音乐开启 then
		tp:NPC说话(self.名称..".mp3")
	end
end

function 场景类_假人:更新(dt,x,y)
	if self.显示1 then
		self.假人[self.行为]:更新(dt)
		if self.假人["身体_"..self.行为] ~= nil then
			self.假人["身体_"..self.行为]:更新(dt)
		end
		if self.假人["武器_"..self.行为] ~= nil then
			self.假人["武器_"..self.行为]:更新(dt)
		end
		if self.假人[self.行为]:是否选中(x,y) then
			tp.选中假人 = true
		end
		if self.假人[self.行为]:是否选中(x,y) and tp:可操作() and not tp.第一窗口移动中 then
			tp.选中假人 = true
			if mouse(0) and jls(tp.角色坐标,self.坐标) < 250 and self.执行事件 ~= "摆摊" and self.特效 == nil then
				if not self.静止转移 or self.执行事件 == "明雷" or self.执行事件 == "明雷活动" or self.执行事件 == "物件_打铁炉" or self.执行事件 == "打铁炉" then
					-- if self.执行事件 == "明雷" then
					-- 	self:对话开始()
					-- elseif self.执行事件 == "明雷活动" then
					-- 	self:对话开始()
					-- else
						self:对话开始()
					elseif not self.静止转移 or (self.模型=="桃树" or  self.模型=="银子" or self.名称=="摇钱树") then
					self:对话开始()
					-- end
					--if tp.窗口.对话栏.可视 then
						--self:事件方向(tp.角色坐标,self.坐标)
					--end
				end
			end
		end
		if self.执行事件 == "明雷" then
			if jls(tp.角色坐标,self.坐标) < 25 and 时间-触碰延时>=3 then
				触碰延时=时间
				客户端:发送数据(1004,{地图=tp.当前地图,编号=self.编号,序列=self.序列,标识=self.标识},1)
			end
		elseif self.触发事件 then
			if jls(tp.角色坐标,self.坐标) < 35 then
				if self.触发计次 <= 0 then
					self:对话开始()
					self.触发计次 = 25
				else
					self.触发计次 = self.触发计次 - 1
				end
			end
		elseif self.自动对话 then
			if jls(tp.角色坐标,self.坐标) < 35 then
				self:对话开始()
			end
		end
	end
end

function 场景类_假人:显示(dt,x,y,pys)
	-- if self.显示缓冲 then
	--     self.显示缓冲=self.显示缓冲-1
	--     if self.显示缓冲<=0 then
	--         self.显示缓冲=nil
	--     end
	--     return
	-- end
	if jls(tp.角色坐标,self.坐标) < 全局游戏高度/2+100 then--or self.执行事件 == "小龟赛跑" or self.执行事件 == "明雷" then
		self:更新(dt*0.7,x,y,pys)  --*0.5
		if self.显示1 == false then
			self.假人 = {}
			self:置模型()
			self.显示1 = true
		end
		if not self.显示1 then
			return 0
		end
		if tp.窗口.对话栏.可视 == false and self.方向 ~= self.记忆方向 and (self.执行事件 ~= "明雷" and self.执行事件 == "小龟赛跑" and not self.行走开关) then
			self:置方向(self.记忆方向)
		end
		local s = xys(floor(self.真实坐标.x),floor(self.真实坐标.y))
		tp.影子:显示(s + pys)
		if tp.队伍[1].剧情 ~= nil and tp.当前地图 == tp.队伍[1].剧情.地图 and tp.队伍[1].剧情.编号 == self.编号 and tp.队伍[1].剧情.附加.战斗 == nil then
			local py2 = xys(0,self.假人[self.行为].高度)
			tp.任务图标:显示(s + pys-py2)
		elseif tp.队伍[1].剧情 ~= nil and tp.当前地图 == tp.队伍[1].剧情.地图 and tp.队伍[1].剧情.编号 == self.编号 and tp.队伍[1].剧情.附加.战斗 ~= nil then
			local py2 = xys(0,self.假人[self.行为].高度)
			tp.战斗图标:显示(s + pys-py2)
		end
		if self.任务显示 then
			local py2 = xys(0,self.假人[self.行为].高度)
			tp.任务图标:显示(s.x+pys.x-10,s.y+pys.y-80)
		elseif self.战斗显示 then
			local py2 = xys(0,self.假人[self.行为].高度)
			tp.战斗图标:显示(s + pys-py2)
		end
		if self.队伍组 ~=nil then
			if self.标识~=nil and not 判断是否为空表(self.队伍组) then
				for k,v in pairs(self.队伍组) do
					if v==tp.队伍[1].数字id then
						local py2 = xys(0,self.假人[self.行为].高度)
						tp.战斗图标:显示(s + pys-py2)
					end
				end
			end
		end
		if self.假人队标 then
		   self.假人队标:更新(dt)
		   self.假人队标:显示(s.x+pys.x,s.y+pys.y-94)
		end
		self.假人[self.行为]:显示(s +  pys)
		if self.假人["身体_"..self.行为] ~= nil then
			self.假人["身体_"..self.行为]:显示(s + pys)
		end
		if self.假人["武器_"..self.行为] ~= nil then
			self.假人["武器_"..self.行为]:显示(s + pys)
		end
		if self.武器显示 then
			self.武器[self.行为]:显示(s + pys)
		end
		self.名称颜色 =  取名称颜色(self.名称,nil,"假人")
		self.称谓颜色 =  取称谓颜色(self.称谓,"假人")
		if self.假人[self.行为]:是否选中(x,y) and tp:可操作() and not tp.第一窗口移动中 then
			self.假人[self.行为]:置高亮()
			if self.假人["身体_"..self.行为] ~= nil then
				self.假人["身体_"..self.行为]:置高亮()
			end
			if self.假人["武器_"..self.行为] ~= nil then
				self.假人["武器_"..self.行为]:置高亮()
			end
			self.名称颜色 = -419495936
			self.称谓颜色 = -419495936
		else
			self.假人[self.行为]:取消高亮()
			if self.假人["身体_"..self.行为] ~= nil then
				self.假人["身体_"..self.行为]:取消高亮()
			end
			if self.假人["武器_"..self.行为] ~= nil then
				self.假人["武器_"..self.行为]:取消高亮()
			end
		end
		if self.称谓 == nil then
			tp.字体表.人物字体:置颜色(self.名称颜色):置阴影颜色(ARGB(255,0,0,0)):显示x(s + pys - self.名称偏移,self.名称)
		else
			tp.字体表.人物字体:置颜色(self.称谓颜色):置阴影颜色(ARGB(255,0,0,0)):显示x(s + pys - self.称谓偏移,self.称谓)
			tp.字体表.人物字体:置颜色(self.名称颜色):置阴影颜色(ARGB(255,0,0,0)):显示x(s + pys - self.名称偏移,self.名称)
		end
		if self.移动 then
			self:开始移动(dt)
		end
		-- if self.特效 ~= nil then
		-- 	self.特效:更新(dt*self.帧率)
		-- 	if (self.特效.已载入 >= self.特效.结束帧) then
		-- 		self.特效 = nil
		-- 		return false
		-- 	end
		-- 	self.特效:显示(s + pys)
		-- end
		self.坐标.x = s.x
		self.坐标.y = s.y
		self.显示1 = true
		if self.执行事件 == "小龟赛跑"  then
			self.喊话:显示(s.x + pys.x,s.y + pys.y)
		end
	else
		self.显示1 = false
		--self:释放()
		self.假人 = nil
	end
end
function 场景类_假人:释放()
	if next(self.假人) ~= nil then
		self.假人["行走"]:释放()
		self.假人["静立"]:释放()
		if self.武器 ~= nil then
			self.假人["武器_静立"]:释放()
			self.假人["武器_行走"]:释放()
		end
	end
end
function 场景类_假人:置方向(d)
	if self.假人["静立"].方向数 < 4 then
		return false
	end
	if self.假人.静立.方向数 == 4 then
		d= 取四至八方向(d)
	end
	self.假人["静立"]:置方向(d)
	if self.假人["行走"] ~= nil then
		self.假人["行走"]:置方向(d)
	end
	if self.假人["身体_静立"] ~= nil then
		self.假人["身体_静立"]:置方向(d)
		self.假人["身体_行走"]:置方向(d)
	end
	if self.假人["武器_静立"] ~= nil then
		self.假人["武器_静立"]:置方向(d)
		self.假人["武器_行走"]:置方向(d)
	end
	self.方向 = d
end

function 场景类_假人:置模型()
	self.假人 ={}
	if self.锦衣 then
		local 资源=引擎.取普通锦衣模型(self.锦衣,self.模型,nil,self.武器子类)
		self.假人 = {["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1]),["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2])}
	else
		local 资源 = qmxs(self.模型)
		self.假人 = {
			["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1]),
		}
		if 资源[2]~=nil then
		   self.假人["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2])--如果副本错误 就屏蔽这  然后开启下面那个  if 资源[2] ~= nil then 的解除屏蔽
		else
			self.假人["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1])
		end
		local 身体资源 = qmxs(self.模型.."_身体")
		if 身体资源[1] ~= nil then
			self.假人["身体_静立"] = tp.资源:载入(身体资源[3],"网易WDF动画",身体资源[1])
			if 身体资源[2]~=nil then
			   self.假人["身体_行走"] = tp.资源:载入(身体资源[3],"网易WDF动画",身体资源[2])--如果副本错误 就屏蔽这  然后开启下面那个  if 资源[2] ~= nil then 的解除屏蔽
			else
				self.假人["身体_行走"] = tp.资源:载入(身体资源[3],"网易WDF动画",身体资源[1])
			end
		end
	end
	local n
	if self.武器 ~= nil then
		local 资源 = qmxs(self.模型,tp:取武器子类(self.武器子类))
		if self.锦衣 then
			local wq = nil
			if self.武器 ~= nil then
				wq = self.武器子类
			end
			资源=引擎.取普通锦衣模型(self.锦衣,self.模型,nil,wq)
		end
		self.假人["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1])
		self.假人["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2])
		n  = qmxs(self.武器.."_"..self.模型)
	else
		if self.显示饰品 then
			n  = qmxs(self.模型.."_装饰")
		end
	end
	-- if self.显示饰品 then
	-- 	if self.武器 ~= nil then
	-- 		local 资源 = qmxs(self.模型,tp:取武器子类(self.武器子类))
	-- 		self.假人["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1])
	-- 		self.假人["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2])
	-- 		n  = qmxs(self.武器.."_"..self.模型)
	-- 	else
	-- 		n  = qmxs(self.模型.."_装饰")
	-- 	end
	-- else
	-- 	n  = qmxs(self.模型.."_饰品")
	-- end
	if n~=nil and n[1]~=nil and n[2]~=nil and n[3]~=nil then
		self.假人["武器_静立"] = tp.资源:载入(n[3],"网易WDF动画",n[1])
		self.假人["武器_行走"] = tp.资源:载入(n[3],"网易WDF动画",n[2])
		if not self.锦衣 then
			self.假人["武器_静立"]:置差异(self.假人["武器_静立"].帧数-self.假人["静立"].帧数)
		end
	end
	if self.假人["行走"] ~= nil and self.假人["武器_行走"]~=nil then
		if not self.锦衣 then
			self.假人["武器_行走"]:置差异(self.假人["武器_行走"].帧数-self.假人["行走"].帧数)
		end
	end
	if not self.锦衣 then
		if self.炫彩~=nil then
			self:炫彩染色(self.炫彩,self.炫彩组,"人物")
		else
			if self.染色方案 ~= nil and self.染色组 ~= nil then
				self:置染色(self.染色方案,self.染色组[1],self.染色组[2],self.染色组[3])
			end
		end
	end
	self:置方向(self.方向)
end

function 场景类_假人:置武器(假人,饰品)
	if 饰品 == nil then
		local 资源 = qmxs(假人.模型,tp:取武器子类(假人.武器子类))
		if 假人.锦衣 then
			local wq = nil
			if 假人.武器 ~= nil then
				wq = 假人.武器子类
			end
			资源=引擎.取普通锦衣模型(假人.锦衣,假人.模型,nil,wq)
		end
		self.假人["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1])
		self.假人["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2])
	end
	local n
	if 饰品 then
		n = qmxs(假人.模型.."_饰品")
	else
		if self.武器 ~= nil then
			n = qmxs(假人.武器.."_"..假人.模型)
		else
			n = qmxs(假人.模型.."_装饰")
		end
	end
	if n~=nil and n[3]~=nil then
		self.假人["武器_静立"] = tp.资源:载入(n[3],"网易WDF动画",n[1])
		self.假人["武器_行走"] = tp.资源:载入(n[3],"网易WDF动画",n[2])
		if not self.锦衣 then
			self.假人["武器_静立"]:置差异(self.假人["武器_静立"].帧数-self.假人["静立"].帧数)
		end
	end
	if self.假人["行走"] ~= nil and self.假人["武器_行走"]~=nil then
		if not self.锦衣 then
			self.假人["武器_行走"]:置差异(self.假人["武器_行走"].帧数-self.假人["行走"].帧数)
		end
	end
	self:置方向(self.方向)
end

function 场景类_假人:炫彩染色(染色方案,sj,类型)
	if 类型 == "人物" then
		self.假人["静立"]:炫彩染色(染色方案,sj)
		if self.假人.行走 ~= nil then
			self.假人.行走:炫彩染色(染色方案,sj)
		end
		if self.假人.身体_静立 ~= nil then
			self.假人.身体_静立:炫彩染色(染色方案,sj)
		end
		if self.假人.身体_行走 ~= nil then
			self.假人.身体_行走:炫彩染色(染色方案,sj)
		end
		self:置方向(self.方向)
	end
end

function 场景类_假人:置染色(染色方案,a,b,c)
	self.假人["静立"]:置染色(染色方案,a,b,c)
	if self.假人.行走 ~= nil then
		self.假人.行走:置染色(染色方案,a,b,c)
	end
	if self.假人.身体_静立 ~= nil then
		self.假人.身体_静立:置染色(染色方案,a,b,c)
	end
	if self.假人.身体_行走 ~= nil then
		self.假人.身体_行走:置染色(染色方案,a,b,c)
	end
	self:置方向(self.方向)
end

function 场景类_假人:事件方向(a,b)
	if self.方向开关 then
		self:置方向(取八方向(floor(取两点角度(b,a))))
		tp.场景.人物:置方向(取八方向(floor(取两点角度(a,b))))
	else
		self:置方向(szb(取八方向(floor(取两点角度(b,a)))))
		tp.场景.人物:置方向(取八方向(floor(取两点角度(a,b))))
	end
end

return 场景类_假人