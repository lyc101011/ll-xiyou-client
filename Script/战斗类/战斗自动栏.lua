--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2022-10-27 10:07:32
--======================================================================--
local 场景类_战斗自动栏 = class()
local 状态 = "取消"
local 控制状态 = "关闭"
local 开启自动 = false
local format = string.format
local tp,zts

function 场景类_战斗自动栏:初始化(根)
	self.ID = 59
	self.x = 18
	self.y = 280
	self.xx = 0
	self.yy = 0
	self.注释 = "战斗"
	self.可视 = false
	self.可视化 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,201,110,3,9),
		-- [2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮.创建(自适应.创建(12,4,60,22,1,3),0,0,4,true,true," 暂离"),
		[4] = 按钮.创建(自适应.创建(12,4,60,22,1,3),0,0,4,true,true," 重置"),
		[5] = 按钮.创建(自适应.创建(12,4,60,22,1,3),0,0,4,true,true," 开启"),
	}
	for i=3,5 do
		self.资源组[i]:绑定窗口_(self.ID)
	end
	tp = 根
	zts = tp.字体表.猫猫字体1
	self.第一次 = false
end

function 场景类_战斗自动栏:打开(sf)
	if self.可视化 then
		self.可视化 = false
	else
		self.可视化 = true
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		if sf ~= false then
			状态 = " 取消"
		else
			状态 = " 开启"
		end
		self.资源组[5]:置文字(状态)
		self.状态=状态
	end
end

function 场景类_战斗自动栏:更新(dt,x,y)
end



function 场景类_战斗自动栏:取自动语句(类型)
 	if 类型==1 then --人物
	 	local 编号=0
	 	for n=1,#战斗类.战斗单位[ljcs] do
		 	if 战斗类.战斗单位[ljcs][n].数据.类型=="角色" and 战斗类.战斗单位[ljcs][n].数据.id==tp.队伍[1].数字id then
			 	编号=n
			end
		end
	  	local 语句="攻击"
	  	if 编号==0 then return 语句 end
 		if 战斗类.战斗单位[ljcs][编号].数据.自动指令~=nil then
	 		if 战斗类.战斗单位[ljcs][编号].数据.自动指令.类型=="法术" then
		 		语句=战斗类.战斗单位[ljcs][编号].数据.自动指令.参数
			else
				语句=战斗类.战斗单位[ljcs][编号].数据.自动指令.类型
		 	end
	 	end
	   	return 语句
   	elseif 类型==2 then --人物
	 	local 编号=0
	 	for n=1,#战斗类.战斗单位[ljcs] do
		 	if 战斗类.战斗单位[ljcs][n].数据.类型=="bb" and 战斗类.战斗单位[ljcs][n].数据.id==tp.队伍[1].数字id then
			 	编号=n
			end
		end
	  	if 编号==0 then return "无" end
	  	local 语句="攻击"
	 	if 战斗类.战斗单位[ljcs][编号].数据.自动指令~=nil then
		 	if 战斗类.战斗单位[ljcs][编号].数据.自动指令.类型=="法术" then
			 	语句=战斗类.战斗单位[ljcs][编号].数据.自动指令.参数
			else
			 	语句=战斗类.战斗单位[ljcs][编号].数据.自动指令.类型
			 end
		end
	   	return 语句
	end
end

function 场景类_战斗自动栏:取自动状态()
	状态=" 开启"
	 -- 控制状态 = "开启"
  	for n=1,#战斗类.战斗单位[ljcs] do
		if 战斗类.战斗单位[ljcs][n].数据.类型=="角色" and 战斗类.战斗单位[ljcs][n].数据.id==tp.队伍[1].数字id then
			if 战斗类.战斗单位[ljcs][n].数据.自动战斗 then
				状态=" 取消"
			end
			-- if 战斗类.战斗单位[ljcs][n].数据.队长控制 then
			-- 	控制状态 = "关闭"
			-- end
		end
	end
	if self.资源组[5].按钮文字~=状态 then
		self.资源组[5]:置文字(状态)
	end
	self.状态=状态
	-- if self.资源组[4].按钮文字~=控制状态 then
	-- 	  self.资源组[4]:置文字(控制状态)
	-- end
 end
function 场景类_战斗自动栏:显示(dt,x,y)
	--if not self.可视化 then
	--	return
	--end
	self:取自动状态()
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	zts:置颜色(白色)
	zts:显示(self.x + 66,self.y + 33,"剩余   回合")
	zts:显示(self.x + 11,self.y + 54,"人物：         召唤兽：")

	zts:置颜色(黄色)
	zts:显示(self.x + 92,self.y + 33,"∞")
	zts:显示(self.x + 46,self.y + 54,self:取自动语句(1))
	zts:显示(self.x + 147,self.y + 54,self:取自动语句(2))
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"自动战斗")
	-- zts:显示(self.x + 16,self.y + 92,"自动战斗：")
	-- zts:显示(self.x + 16,self.y + 119,"队长控制：")

	if self.鼠标 then
		if self.资源组[5]:事件判断() then
			发送数据(5507)
		-- elseif self.资源组[4]:事件判断() then --队长控制
		-- 	发送数据(5521)
		end
	end
	for i=3,5 do
		self.资源组[i]:更新1(x,y)
		self.资源组[i]:显示(self.x+6+65*(i-3),self.y+78)
	end

	if tp.按钮焦点 then
		self.焦点 = true
	end
	if 引擎.鼠标弹起(1) and not tp.禁止关闭 and self.鼠标 then
	 	if self.状态==" 取消" then --有自动战斗时候，直接取消自动战斗
	 		发送数据(5507)
	 		战斗类.自动开关=false
	 		return
	 	end
		战斗类.自动开关=false --没有的时候直接关闭
		return
	end
end

function 场景类_战斗自动栏:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
	 --local xy={x=x-self.x,y=y-self.y}
	--self.x,self.y=x,y
		return true
	end
	return false
end

function 场景类_战斗自动栏:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not self.第一次 then
		tp.运行时间 = tp.运行时间 + 2
		self.第一次 = true
	end
	if not 引擎.场景.消息栏焦点 then
		self.窗口时间 = tp.运行时间
	end
	if not self.焦点 then
		tp.场景.战斗.移动窗口 = true
	end
	if self.可视化 and self.鼠标 and not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_战斗自动栏:开始移动(x,y)
	if self.可视化 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_战斗自动栏